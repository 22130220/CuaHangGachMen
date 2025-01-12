package vn.edu.hcmuaf.fit.cuahanggachmen.controller;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.mail.EmailService;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@WebServlet(name = "forgetpassword", value = "/forgetpassword")
public class ForgetPassword extends HttpServlet {
    private static final Map<String, String> passwordResetTokens = new HashMap<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/forget_password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        UserDao userDao = new UserDao();

        try {
            // Kiểm tra email người dùng
            User user = userDao.findByEmail(email);

            if (user != null) {
                // Tạo token đặt lại mật khẩu
                String token = UUID.randomUUID().toString();
                passwordResetTokens.put(token, email);

                // Gửi email với liên kết đặt lại mật khẩu
                String resetLink = request.getRequestURL().toString().replace("/forgetpassword", "/resetpassword?token=" + token);
                String emailContent = "<h1>Đặt lại mật khẩu</h1>"
                        + "<p>Vui lòng nhấn vào liên kết bên dưới để đặt lại mật khẩu của bạn:</p>"
                        + "<a href='" + resetLink + "'>Đặt lại mật khẩu</a>";
                EmailService emailService = new EmailService();
                emailService.send(email, "Yêu cầu đặt lại mật khẩu", emailContent);

                // Hiển thị thông báo thành công
                request.setAttribute("message", "Email đặt lại mật khẩu đã được gửi.");
            } else {
                // Hiển thị thông báo lỗi nếu email không tồn tại
                request.setAttribute("error", "Email không tồn tại trong hệ thống.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi. Vui lòng thử lại.");
        }
        request.getRequestDispatcher("/WEB-INF/forget_password.jsp").forward(request, response);
    }

    public static String getEmailByToken(String token) {
        return passwordResetTokens.get(token);
    }

    public static void removeToken(String token) {
        passwordResetTokens.remove(token);
    }
}
