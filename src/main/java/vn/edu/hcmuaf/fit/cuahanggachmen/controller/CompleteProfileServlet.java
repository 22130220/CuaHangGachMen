package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.mail.EmailService;
import vn.edu.hcmuaf.fit.cuahanggachmen.mail.VerificationTokenStore;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Base64;
import java.util.UUID;

@WebServlet("/complete-profile")
public class CompleteProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        User tempUser = (User) session.getAttribute("tempUser");

        if (user == null && tempUser == null) {
            response.sendRedirect("/facebooklogin");
            return;
        }

        request.setAttribute("user", tempUser != null ? tempUser : user);
        request.getRequestDispatcher("/WEB-INF/complete-profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        User tempUser = (User) session.getAttribute("tempUser");

        if (user == null && tempUser == null) {
            response.sendRedirect("/facebooklogin");
            return;
        }

        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String birthtimeStr = request.getParameter("birthtime");
        int sex = Integer.parseInt(request.getParameter("sex"));

        LocalDateTime birthtime = LocalDateTime.parse(birthtimeStr);

        UserDao userDao = new UserDao(DBConect.get().open());
        if (userDao.checkEmail(email) && (user == null || !email.equals(user.getEmail()))) {
            request.setAttribute("error", "Email đã tồn tại, vui lòng chọn email khác.");
            request.getRequestDispatcher("/WEB-INF/complete-profile.jsp").forward(request, response);
            return;
        }

        // Tạo đối tượng User để lưu tạm
        User updatedUser = (tempUser != null) ? tempUser : user;
        updatedUser.setEmail(email);
        updatedUser.setPhone(phone);
        updatedUser.setAddress(address);
        updatedUser.setBirthtime(birthtime);
        updatedUser.setSex(sex);
        updatedUser.setCreatetime(LocalDateTime.now());

        // Tạo token xác minh
        String token = UUID.randomUUID().toString() + "." + Base64.getEncoder().encodeToString(email.getBytes());
        VerificationTokenStore.addToken(token, updatedUser);

        // Gửi email xác minh
        String verificationLink = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/verify-profile-email?email=" + email + "&token=" + token;
        EmailService emailService = new EmailService();
        String emailContent = emailService.buildVerificationEmailContent(updatedUser, verificationLink);
        boolean emailSent = emailService.send(email, "Xác minh email của bạn", emailContent);

        if (emailSent) {
            request.setAttribute("email", email);
            request.getRequestDispatcher("/WEB-INF/registration-success.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Không thể gửi email xác minh. Vui lòng thử lại.");
            request.getRequestDispatcher("/WEB-INF/complete-profile.jsp").forward(request, response);
        }
    }
}