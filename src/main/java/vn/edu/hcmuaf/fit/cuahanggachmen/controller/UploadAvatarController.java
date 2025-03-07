package vn.edu.hcmuaf.fit.cuahanggachmen.controller;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.io.*;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet(name = "uploadAvatar", value = "/uploadAvatar")
@MultipartConfig
public class UploadAvatarController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        if (user == null) {
            response.sendRedirect("/login.jsp");
            return;
        }

        // Đường dẫn thư mục assets/img
        String uploadPath = getServletContext().getRealPath("") + "assets" + File.separator + "img";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        try {
            Part filePart = request.getPart("avatar"); // Nhận file từ input
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            // Đảm bảo tên file duy nhất
            String uniqueFileName = System.currentTimeMillis() + "_" + fileName;
            String filePath = uploadPath + File.separator + uniqueFileName;

            // Lưu file vào thư mục
            filePart.write(filePath);

            // Cập nhật thông tin avatar trong database
            String avatarUrl = "assets/img/" + uniqueFileName; // Đường dẫn dùng để hiển thị
            Handle handle = DBConect.get().open();
            UserDao userDao = new UserDao(handle);
            user.setAvatar(avatarUrl);
            userDao.updateUserProfileAvatar(user);

            // Cập nhật lại trong session
            session.setAttribute("auth", user);

            response.sendRedirect("/profile?success=1");
            handle.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/profile?error=1");
        }
    }
}


