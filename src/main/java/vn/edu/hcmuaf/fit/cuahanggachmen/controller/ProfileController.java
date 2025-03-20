package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "profile", value = "/profile")
public class ProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth"); // Lấy thông tin người dùng từ session

        if (user == null) {
            response.sendRedirect("/login.jsp");
            return;
        }

        try {
            Handle handle = DBConect.get().open();
            UserDao userDao = new UserDao(handle);
            User fullUserInfo = userDao.getUserById(user.getId()); // Lấy thông tin đầy đủ từ DB
            request.setAttribute("user", fullUserInfo); // Truyền thông tin qua JSP
            if(fullUserInfo.getBirthtime() != null) {
                String birthDate = fullUserInfo.getBirthtime().toLocalDate().toString();// Định dạng yyyy-MM-dd
                request.setAttribute("birthtime", birthDate);
            }
            handle.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/error.jsp");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth"); // Lấy thông tin người dùng từ session

        if (user == null) {
            response.sendRedirect("/login.jsp");
            return; // Người dùng chưa đăng nhập
        }

        // Lấy dữ liệu từ form
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String birthtime = request.getParameter("birthtime");
        String gender = request.getParameter("gender");

        // Cập nhật đối tượng User
        user.setFullname(fullname);
        user.setPhone(phone);
        user.setAddress(address);
        user.setBirthtime(LocalDateTime.parse(birthtime + "T00:00:00"));
        user.setSex("male".equals(gender) ? 1 : 0);

        try {
            Handle handle = DBConect.get().open();
            UserDao userDao = new UserDao(handle);
            userDao.updateUserProfile(user); // Cập nhật trong database
            session.setAttribute("auth", user); // Cập nhật lại trong session

            request.setAttribute("message", "Cập nhật thông tin thành công!");
            handle.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Cập nhật thông tin thất bại!");
        }
doGet(request, response);
//        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);

    }
}