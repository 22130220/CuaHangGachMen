package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.io.*;

@WebServlet(name = "uploadAvatar", value = "/uploadAvatar")
public class UploadAvatarController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("{\"success\": false, \"message\": \"Vui lòng đăng nhập\"}");
            return;
        }

        try {
            String avatarUrl = request.getParameter("avatar_url");
            if (avatarUrl == null || avatarUrl.trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"message\": \"URL ảnh không được để trống\"}");
                return;
            }

            // Cập nhật thông tin avatar trong database
            Handle handle = DBConect.get().open();
            UserDao userDao = new UserDao(handle);
            user.setAvatar(avatarUrl);
            userDao.updateUserProfileAvatar(user);

            // Cập nhật lại trong session
            session.setAttribute("auth", user);

            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("{\"success\": true, \"message\": \"Cập nhật ảnh đại diện thành công\"}");
            handle.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"success\": false, \"message\": \"Có lỗi xảy ra khi cập nhật ảnh đại diện\"}");
        }
    }
}