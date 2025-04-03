package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.builder.LogBuilder;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.log_config.LogLevel;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.log_config.LogType;

import java.io.IOException;
import java.time.LocalDateTime;

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

        // Ưu tiên tempUser nếu có (người dùng mới)
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
        String address = request.getParameter("address"); // Thêm address
        String birthtimeStr = request.getParameter("birthtime");
        int sex = Integer.parseInt(request.getParameter("sex"));

        LocalDateTime birthtime = LocalDateTime.parse(birthtimeStr);

        UserDao userDao = new UserDao(DBConect.get().open());
        if (userDao.checkEmail(email) && (user == null || !email.equals(user.getEmail()))) {
            request.setAttribute("error", "Email đã tồn tại, vui lòng chọn email khác.");
            request.getRequestDispatcher("/WEB-INF/complete-profile.jsp").forward(request, response);
            return;
        }

        if (tempUser != null) {
            // Người dùng mới: Insert vào database
            tempUser.setEmail(email);
            tempUser.setPhone(phone);
            tempUser.setAddress(address); // Thêm address
            tempUser.setBirthtime(birthtime);
            tempUser.setSex(sex);
            int userId = userDao.insertFacebookUser(tempUser);
            tempUser.setId(userId);
            session.setAttribute("auth", tempUser);
            session.removeAttribute("tempUser"); // Xóa tempUser sau khi insert

            new LogBuilder()
                    .level(LogLevel.INFO)
                    .message("Thêm người dùng mới từ Facebook thành công")
                    .setHeaderRequest(request, response)
                    .location("CompleteProfileServlet")
                    .type(LogType.INSERT)
                    .build(DBConect.get().open());
        } else {
            // Người dùng cũ: Update thông tin
            user.setEmail(email);
            user.setPhone(phone);
            user.setAddress(address); // Thêm address
            user.setBirthtime(birthtime);
            user.setSex(sex);
            userDao.updateUserProfile(user);

            new LogBuilder()
                    .level(LogLevel.INFO)
                    .message("Cập nhật thông tin người dùng thành công")
                    .setHeaderRequest(request, response)
                    .location("CompleteProfileServlet")
                    .type(LogType.UPDATE)
                    .build(DBConect.get().open());
        }
        if (user != null) {
            if (user.getEmail() != null && !user.getEmail().isEmpty()) {
                session.setAttribute("profileCompleted", true);
                response.sendRedirect("/");
                return;
            }
        }


        response.sendRedirect("/");
    }
}