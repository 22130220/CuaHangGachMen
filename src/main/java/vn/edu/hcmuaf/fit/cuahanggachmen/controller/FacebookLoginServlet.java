package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.builder.LogBuilder;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.log_config.LogLevel;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.log_config.LogType;

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
        Handle handle = DBConect.get().open();


        String fbId = userData.get("id").asText(); // Facebook ID
        String name = userData.get("name").asText();
        String email = userData.has("email") ? userData.get("email").asText() : null;
        String picture = userData.get("picture").get("data").get("url").asText();

        UserDao userDao = new UserDao(DBConect.get().open());
        User existingUser = userDao.findByFacebookId(fbId);

        int userId;
        if (existingUser == null) {
            User newUser = new User();
            newUser.setPassword(fbId); // Lưu Facebook ID vào password
            newUser.setFullname(name);
            newUser.setEmail(email);
            newUser.setAvatar(picture);
            newUser.setStatus(true);
            userId = userDao.insertFacebookUser(newUser); // Lấy id mới
        } else {
            existingUser.setFullname(name);
            existingUser.setEmail(email);
            existingUser.setAvatar(picture);
            userId = existingUser.getId();
            userDao.updateUserFaceBook(existingUser);
        }

        // Lưu vào session
        HttpSession session = request.getSession();
        session.setAttribute("auth", new User(userId, name, email, null, picture, null, null, true, null, null, 0, fbId, 0));
        new LogBuilder()
                .level(LogLevel.INFO)
                .message("Đăng nhập bằng Facebook thành công")
                .setHeaderRequest(request, response)
                .location("FacebookLoginServlet")
                .beforeData("")
                .afterData("")
                .type(LogType.INSERT)
                .build(handle);
        response.sendRedirect("/");
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