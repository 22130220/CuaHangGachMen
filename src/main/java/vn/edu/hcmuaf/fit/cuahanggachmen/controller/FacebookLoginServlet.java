package vn.edu.hcmuaf.fit.cuahanggachmen.controller;


import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

@WebServlet("/facebooklogin")
public class FacebookLoginServlet extends HttpServlet {
    private static final String APP_ID = "1294677724960043"; // Thay bằng App ID
    private static final String APP_SECRET = "f6384e2655c9ada72158424340512e76"; // Thay bằng App Secret
    private static final String REDIRECT_URI = "http://localhost:8080/facebooklogin";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code"); // Lấy code từ Facebook
        if (code == null || code.isEmpty()) {
            response.sendRedirect("login.jsp"); // Quay lại trang đăng nhập nếu không có code
            return;
        }

        // Bước 1: Lấy Access Token từ Facebook
        String accessTokenUrl = "https://graph.facebook.com/v20.0/oauth/access_token?" +
                "client_id=" + APP_ID +
                "&redirect_uri=" + REDIRECT_URI +
                "&client_secret=" + APP_SECRET +
                "&code=" + code;

        String accessToken = getAccessToken(accessTokenUrl);

        // Bước 2: Lấy thông tin người dùng từ Access Token
        String userInfoUrl = "https://graph.facebook.com/me?fields=id,name,email,picture&access_token=" + accessToken;
        String userInfo = getUserInfo(userInfoUrl);

        // Bước 3: Parse thông tin người dùng
        ObjectMapper mapper = new ObjectMapper();
        JsonNode userData = mapper.readTree(userInfo);

        String id = userData.get("id").asText();
        String name = userData.get("name").asText();
        String email = userData.has("email") ? userData.get("email").asText() : "Không có email";
        String picture = userData.get("picture").get("data").get("url").asText();

        // Lưu thông tin vào session (không lưu database)
        HttpSession session = request.getSession();
        session.setAttribute("auth", new User(id, name, email, picture));

        // Chuyển hướng về trang chính
        response.sendRedirect("/"); // Hoặc trang bạn muốn sau khi đăng nhập
    }

    // Hàm gọi API để lấy Access Token
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

    // Hàm gọi API để lấy thông tin người dùng
    private String getUserInfo(String urlString) throws IOException {
        URL url = new URL(urlString);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        InputStream inputStream = conn.getInputStream();
        try (Scanner scanner = new Scanner(inputStream)) {
            return scanner.useDelimiter("\\A").next();
        }
    }

    // Class User để lưu thông tin tạm thời
    public static class User {
        private String id;
        private String fullname;
        private String email;
        private String avatar;

        public User(String id, String fullname, String email, String avatar) {
            this.id = id;
            this.fullname = fullname;
            this.email = email;
            this.avatar = avatar;
        }

        // Getter
        public String getId() { return id; }
        public String getFullname() { return fullname; }
        public String getEmail() { return email; }
        public String getAvatar() { return avatar; }
    }
}