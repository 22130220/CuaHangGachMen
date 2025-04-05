package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.mail.VerificationTokenStore;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Base64;

@WebServlet(name = "profileEmailVerification", value = "/verify-profile-email")
public class ProfileEmailVerificationController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        if (Duration.between(user.getCreatetime(), LocalDateTime.now()).toHours() >= 24) {
            request.setAttribute("message", "Token đã hết hạn. Vui lòng yêu cầu xác thực lại.");
            request.getRequestDispatcher("/WEB-INF/verification-result.jsp").forward(request, response);
            return;
        }

        // Khởi tạo UserDao và HttpSession
        UserDao userDao = new UserDao(DBConect.get().open());
        HttpSession session = request.getSession();

        // Kiểm tra xem email đã tồn tại trong database chưa (ngoại trừ chính user hiện tại)
        User existingUser = userDao.findByEmail(user.getEmail());
        User authUser = (User) session.getAttribute("auth");

        if (existingUser != null && (authUser == null || existingUser.getId() != authUser.getId())) {
            request.setAttribute("message", "Email đã được sử dụng bởi tài khoản khác.");
            request.getRequestDispatcher("/WEB-INF/verification-result.jsp").forward(request, response);
            return;
        }

        // Xử lý cho người dùng mới hoặc cập nhật thông tin
        if (session.getAttribute("tempUser") != null) {
            // Người dùng mới từ Facebook
            int userId = userDao.insertFacebookUser(user);
            user.setId(userId);
            session.setAttribute("auth", user);
            session.removeAttribute("tempUser");
            VerificationTokenStore.removeToken(token);
            request.setAttribute("message", "Xác thực thành công! Thông tin của bạn đã được cập nhật.");
        } else if (authUser != null) {
            // Người dùng cũ cập nhật thông tin
            user.setId(authUser.getId()); // Đảm bảo ID không thay đổi
            userDao.updateUserProfile(user);
            session.setAttribute("auth", user);
            VerificationTokenStore.removeToken(token);
            request.setAttribute("message", "Xác thực thành công! Thông tin của bạn đã được cập nhật.");
        } else {
            request.setAttribute("message", "Không tìm thấy thông tin người dùng để cập nhật.");
            request.getRequestDispatcher("/WEB-INF/verification-result.jsp").forward(request, response);
            return;
        }

        // Chuyển hướng đến trang kết quả
        request.getRequestDispatcher("/WEB-INF/verification-result.jsp").forward(request, response);
    }
}