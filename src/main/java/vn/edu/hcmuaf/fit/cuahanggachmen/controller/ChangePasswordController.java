package vn.edu.hcmuaf.fit.cuahanggachmen.controller;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.PasswordUtils;

import java.io.IOException;

@WebServlet("/profile/change-password")
public class ChangePasswordController extends HttpServlet {
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("auth"); // Lấy thông tin người dùng từ session

    if (user == null) {
        response.sendRedirect("/login.jsp");
        return;
    }

    try {
        UserDao userDao = new UserDao();
        User fullUserInfo = userDao.getUserById(user.getId()); // Lấy thông tin đầy đủ từ DB
        request.setAttribute("user", fullUserInfo); // Truyền thông tin qua JSP
        String birthDate = fullUserInfo.getBirthtime().toLocalDate().toString(); // Định dạng yyyy-MM-dd
        request.setAttribute("birthtime", birthDate);

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("/error.jsp");
        return;
    }

    request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
}
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy thông tin người dùng
        HttpSession session = req.getSession();
        User currentUser = (User) session.getAttribute("auth");

        if (currentUser == null) {
            resp.sendRedirect("/login"); // Nếu người dùng chưa đăng nhập
            return;
        }

        // Lấy tham số từ form
        String currentPassword = req.getParameter("currentPassword");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            req.setAttribute("message", "Mật khẩu mới và xác nhận không khớp.");
           doGet(req, resp);
            return;
        }
        try {
            UserDao userDao = new UserDao();
            // Kiểm tra mật khẩu cũ
            User user = userDao.findByEmail(currentUser.getEmail());
            if (user == null || !PasswordUtils.verifyPassword(currentPassword, user.getSalt(), user.getPassword())) {
                req.setAttribute("message", "Mật khẩu hiện tại không chính xác.");
                doGet(req, resp);
                return;
            }

            // Hash mật khẩu mới
            String salt = PasswordUtils.generateSalt();
            String hashedPassword = PasswordUtils.hashPassword(newPassword, salt);

            // Cập nhật mật khẩu
            userDao.updatePassword(currentUser.getEmail(), hashedPassword, salt);

            req.setAttribute("message", "Đổi mật khẩu thành công.");
            doGet(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("message", "Có lỗi xảy ra, vui lòng thử lại.");
            doGet(req, resp);
        }
    }
}
