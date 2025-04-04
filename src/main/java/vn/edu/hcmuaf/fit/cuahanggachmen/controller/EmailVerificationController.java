package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.ActionResult;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.StatusCode;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.mail.VerificationTokenStore;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Base64;

@WebServlet(name = "emailVerification", value = "/verify-email")
public class EmailVerificationController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy email và token từ query parameters
        String emailFromQuery = request.getParameter("email");
        String token = request.getParameter("token");

        // Kiểm tra email và token có tồn tại không
        if (emailFromQuery == null || emailFromQuery.isEmpty() || token == null || token.isEmpty()) {
            request.setAttribute("message", "Email hoặc token không hợp lệ.");
            request.getRequestDispatcher("/WEB-INF/verification-result.jsp").forward(request, response);
            return;
        }

        // Tách token để lấy email
        String[] tokenParts = token.split("\\.");
        if (tokenParts.length != 2) {
            request.setAttribute("message", "Token không hợp lệ.");
            request.getRequestDispatcher("/WEB-INF/verification-result.jsp").forward(request, response);
            return;
        }

        String emailEncoded = tokenParts[1];
        String emailFromToken;
        try {
            emailFromToken = new String(Base64.getDecoder().decode(emailEncoded));
        } catch (IllegalArgumentException e) {
            request.setAttribute("message", "Token không hợp lệ.");
            request.getRequestDispatcher("/WEB-INF/verification-result.jsp").forward(request, response);
            return;
        }

        // Kiểm tra email từ query có khớp với email trong token không
        if (!emailFromQuery.equals(emailFromToken)) {
            request.setAttribute("message", "Email không khớp với token.");
            request.getRequestDispatcher("/WEB-INF/verification-result.jsp").forward(request, response);
            return;
        }

        // Lấy user từ VerificationTokenStore
        User user = VerificationTokenStore.getUserByToken(token);
        if (user == null) {
            request.setAttribute("message", "Token không hợp lệ hoặc đã hết hạn.");
            request.getRequestDispatcher("/WEB-INF/verification-result.jsp").forward(request, response);
            return;
        }

        // Kiểm tra email từ user có khớp với email từ query không
        if (!user.getEmail().equals(emailFromQuery)) {
            request.setAttribute("message", "Email không khớp với thông tin người dùng.");
            request.getRequestDispatcher("/WEB-INF/verification-result.jsp").forward(request, response);
            return;
        }

        // Kiểm tra thời gian hết hạn (24 giờ)
        LocalDateTime now = LocalDateTime.now();
        if (Duration.between(user.getCreatetime(), now).toHours() >= 24) {
            request.setAttribute("message", "Token đã hết hạn. Vui lòng yêu cầu xác thực lại.");
            request.getRequestDispatcher("/WEB-INF/verification-result.jsp").forward(request, response);
            return;
        }

        // Kiểm tra xem email đã tồn tại trong database chưa
        UserDao userDao = new UserDao(DBConect.get().open());
        User existingUser = userDao.findByEmail(user.getEmail());
        if (existingUser != null) {
            request.setAttribute("message", "Email đã được sử dụng.");
            request.getRequestDispatcher("/WEB-INF/verification-result.jsp").forward(request, response);
            return;
        }

        // Lưu user vào database
        ActionResult insertResult = userDao.insertUser(
                user.getFullname(),
                user.getEmail(),
                user.getPhone(),
                user.getAvatar(),
                user.getAddress(),
                user.getBirthtime(),
                user.getSalt(),
                user.getPassword(),
                user.getSex()
        );

        if (insertResult.isOk(StatusCode.OK)) {
            // Xóa token sau khi xác thực thành công
            VerificationTokenStore.removeToken(token);
            request.setAttribute("message", "Xác thực tài khoản thành công! Bạn có thể đăng nhập ngay bây giờ.");
        } else {
            request.setAttribute("message", "Có lỗi xảy ra khi lưu tài khoản: " + insertResult.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/verification-result.jsp").forward(request, response);
    }
}