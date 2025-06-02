package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.cuahanggachmen.PermissionCheck;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet("/zalologin")
public class ZaloLoginServlet extends HttpServlet {
    private static final String APP_ID = "3385901349907197462";
    private static final String APP_SECRET = "REnhg8thdt1411CxOcHL";
//    private static final String REDIRECT_URI = "http://localhost:8080/zalologin";
    private static final String REDIRECT_URI = "https://webtmdt.site/zalologin";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "GET"), request, response)) return;
        HttpSession session = request.getSession();
        String expectedState = (String) session.getAttribute("zaloState");
        String receivedState = request.getParameter("state");

        // Kiểm tra state
        if (expectedState == null || receivedState == null || !expectedState.equals(receivedState)) {
            request.setAttribute("error", "Xác thực Zalo thất bại: State không khớp.");
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            return;
        }

        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            request.setAttribute("error", "Không nhận được mã code từ Zalo.");
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            return;
        }

        // Lấy Access Token
        String accessToken = getAccessToken(code);
        if (accessToken == null) {
            request.setAttribute("error", "Không thể lấy access token từ Zalo. Vui lòng thử lại.");
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            return;
        }

        // Lấy thông tin người dùng
        String userInfoUrl = "https://graph.zalo.me/v2.0/me?fields=id,name,picture&access_token=" + accessToken;
        String userInfo = getUserInfo(userInfoUrl);

        if (userInfo == null) {
            request.setAttribute("error", "Không thể lấy thông tin người dùng từ Zalo.");
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            return;
        }

        // Parse thông tin người dùng
        ObjectMapper mapper = new ObjectMapper();
        JsonNode userData = mapper.readTree(userInfo);

        // Kiểm tra dữ liệu người dùng
        if (!userData.has("id") || !userData.has("name")) {
            request.setAttribute("error", "Dữ liệu người dùng từ Zalo không đầy đủ.");
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            return;
        }

        String zaloId = userData.get("id").asText();
        String name = userData.get("name").asText();
        String picture = userData.has("picture") && userData.get("picture").has("data") ? userData.get("picture").get("data").get("url").asText() : null;
        String email = null; // Zalo không trả về email

        UserDao userDao = new UserDao(DBConect.get().open());
        User existingUser = userDao.findByZaloId(zaloId);

        if (existingUser != null) {
            session.setAttribute("auth", existingUser);
            if (existingUser.getEmail() != null && !existingUser.getEmail().isEmpty()) {
                session.setAttribute("profileCompleted", true);
                response.sendRedirect("/");
            } else {
                response.sendRedirect("/complete-profile");
            }
        } else {
            User newUser = new User();
            newUser.setZaloId(zaloId);
            newUser.setFullname(name);
            newUser.setAvatar(picture);
            newUser.setStatus(true);
            session.setAttribute("tempUser", newUser); // Lưu tạm vào session
            response.sendRedirect("/complete-profile");
        }
    }

    private String getAccessToken(String code) throws IOException {
        String url = "https://oauth.zaloapp.com/v4/access_token";
        String params = "code=" + URLEncoder.encode(code, StandardCharsets.UTF_8) +
                "&app_id=" + URLEncoder.encode(APP_ID, StandardCharsets.UTF_8) +
                "&app_secret=" + URLEncoder.encode(APP_SECRET, StandardCharsets.UTF_8) +
                "&grant_type=authorization_code";

        HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        conn.setRequestProperty("secret_key", APP_SECRET); // Thêm secret_key theo yêu cầu của Zalo
        conn.setDoOutput(true);

        // Gửi dữ liệu trong body
        try (DataOutputStream wr = new DataOutputStream(conn.getOutputStream())) {
            wr.write(params.getBytes(StandardCharsets.UTF_8));
            wr.flush();
        }

        // Đọc phản hồi
        int responseCode = conn.getResponseCode();
        StringBuilder response = new StringBuilder();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            try (BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
                String line;
                while ((line = in.readLine()) != null) {
                    response.append(line);
                }
            }
        } else {
            try (BufferedReader in = new BufferedReader(new InputStreamReader(conn.getErrorStream()))) {
                String line;
                while ((line = in.readLine()) != null) {
                    response.append(line);
                }
            }
            System.out.println("Zalo Access Token Error Response: " + response.toString());
            return null;
        }

        // Parse phản hồi JSON
        ObjectMapper mapper = new ObjectMapper();
        JsonNode jsonNode = mapper.readTree(response.toString());

        // Kiểm tra nếu có lỗi
        if (jsonNode.has("error")) {
            System.out.println("Zalo Access Token Error: " + jsonNode.get("error").asText() + " - " +
                    (jsonNode.has("error_description") ? jsonNode.get("error_description").asText() : "No description"));
            return null;
        }

        // Lấy access token
        if (jsonNode.has("access_token")) {
            String accessToken = jsonNode.get("access_token").asText();
            System.out.println("Access Token: " + accessToken); // In access token để kiểm tra
            return accessToken;
        } else {
            System.out.println("Zalo Access Token Response does not contain access_token: " + response.toString());
            return null;
        }
    }

    private String getUserInfo(String urlString) throws IOException {
        HttpURLConnection conn = (HttpURLConnection) new URL(urlString).openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("access_token", urlString.split("access_token=")[1]);

        int responseCode = conn.getResponseCode();
        StringBuilder response = new StringBuilder();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            try (BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
                String line;
                while ((line = in.readLine()) != null) {
                    response.append(line);
                }
                return response.toString();
            }
        } else {
            try (BufferedReader in = new BufferedReader(new InputStreamReader(conn.getErrorStream()))) {
                String line;
                while ((line = in.readLine()) != null) {
                    response.append(line);
                }
                System.out.println("Zalo User Info Error Response: " + response.toString());
            }
            return null;
        }
    }
}