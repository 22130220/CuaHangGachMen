package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

@WebServlet("/facebooklogin")
public class FacebookLoginServlet extends HttpServlet {
    private static final String APP_ID = "1294677724960043";
    private static final String APP_SECRET = "f6384e2655c9ada72158424340512e76";
    private static final String REDIRECT_URI = "http://localhost:8080/facebooklogin";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            return;
        }

        // Lấy Access Token
        String accessTokenUrl = "https://graph.facebook.com/v20.0/oauth/access_token?" +
                "client_id=" + APP_ID +
                "&redirect_uri=" + REDIRECT_URI +
                "&client_secret=" + APP_SECRET +
                "&code=" + code;
        String accessToken = getAccessToken(accessTokenUrl);

        // Lấy thông tin người dùng
        String userInfoUrl = "https://graph.facebook.com/me?fields=id,name,email,picture&access_token=" + accessToken;
        String userInfo = getUserInfo(userInfoUrl);

        // Parse thông tin người dùng
        ObjectMapper mapper = new ObjectMapper();
        JsonNode userData = mapper.readTree(userInfo);

        String fbId = userData.get("id").asText(); // Facebook ID
        String name = userData.get("name").asText();
        String email = userData.has("email") ? userData.get("email").asText() : null;
        String picture = userData.get("picture").get("data").get("url").asText();

        UserDao userDao = new UserDao(DBConect.get().open());
        User existingUser = userDao.findByFacebookId(fbId);

        HttpSession session = request.getSession();
        if (existingUser != null) {
            session.setAttribute("auth", existingUser);

            // Kiểm tra nếu email đã có -> Không cần nhập lại form
            if (existingUser.getEmail() != null && !existingUser.getEmail().isEmpty()) {
                session.setAttribute("profileCompleted", true);
                response.sendRedirect("/");
                return;
            }

            response.sendRedirect("/complete-profile");
        }


        if (existingUser == null) {
            // Người dùng mới: Lưu tạm vào session
            User newUser = new User();
            newUser.setFbid(fbId);
            newUser.setFullname(name);
            newUser.setEmail(email);
            newUser.setAvatar(picture);
            newUser.setStatus(true);
            session.setAttribute("tempUser", newUser); // Lưu tạm
            response.sendRedirect("/complete-profile");
        } else {
            // Người dùng cũ: Cập nhật thông tin cơ bản và kiểm tra
            existingUser.setFullname(name);
            existingUser.setEmail(email);
            existingUser.setAvatar(picture);
            session.setAttribute("auth", existingUser);
            if (existingUser.getEmail() == null || existingUser.getPhone() == null) {
                response.sendRedirect("/complete-profile");
            } else {
                userDao.updateUserFaceBook(existingUser); // Cập nhật ngay nếu đã đủ thông tin
                response.sendRedirect("/");
            }
        }
    }

    private String getAccessToken(String urlString) throws IOException {
        URL url = new URL(urlString);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        InputStream inputStream = conn.getInputStream();
        try (Scanner scanner = new Scanner(inputStream)) {
            String response = scanner.useDelimiter("\\A").next();
            ObjectMapper mapper = new ObjectMapper();
            JsonNode jsonNode = mapper.readTree(response);
            return jsonNode.get("access_token").asText();
        }
    }

    private String getUserInfo(String urlString) throws IOException {
        URL url = new URL(urlString);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        InputStream inputStream = conn.getInputStream();
        try (Scanner scanner = new Scanner(inputStream)) {
            return scanner.useDelimiter("\\A").next();
        }
    }
}