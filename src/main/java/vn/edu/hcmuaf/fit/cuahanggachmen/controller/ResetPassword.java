package vn.edu.hcmuaf.fit.cuahanggachmen.controller;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.PasswordUtils;

import java.io.IOException;

@WebServlet(name = "resetpassword", value = "/resetpassword")
public class ResetPassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String token = request.getParameter("token");
        String email = ForgetPassword.getEmailByToken(token);

        if (email != null) {
            request.setAttribute("email", email);
            request.setAttribute("token", token);
            request.getRequestDispatcher("/WEB-INF/reset_password.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Liên kết đặt lại mật khẩu không hợp lệ hoặc đã hết hạn.");
            request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String token = request.getParameter("token");
        String newPassword = request.getParameter("password");
        String email = ForgetPassword.getEmailByToken(token);

        if (email != null) {
            try {
                // Hash mật khẩu mới
                String salt = PasswordUtils.generateSalt();
                String hashedPassword = PasswordUtils.hashPassword(newPassword, salt);

                // Cập nhật mật khẩu người dùng
                Handle handle = DBConect.get().open();
                UserDao userDao = new UserDao(handle);
                userDao.updatePassword(email, hashedPassword, salt);

                // Xóa token khỏi bộ nhớ
                ForgetPassword.removeToken(token);

                request.setAttribute("message", "Mật khẩu của bạn đã được đặt lại thành công.");
                handle.close();
                request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Đã xảy ra lỗi. Vui lòng thử lại.");
                request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Liên kết đặt lại mật khẩu không hợp lệ hoặc đã hết hạn.");
            request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
        }
    }
}
