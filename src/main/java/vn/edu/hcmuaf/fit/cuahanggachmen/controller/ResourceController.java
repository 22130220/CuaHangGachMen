package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet(name = "assets", value = "/assets/*")
public class ResourceController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy đường dẫn tệp từ URL
        String resourcePath = request.getPathInfo();
        if (resourcePath == null || resourcePath.isEmpty()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // Xác định đường dẫn thực tế trong thư mục WEB-INF/resources
        String realPath = getServletContext().getRealPath("/assets" + resourcePath);
        File resourceFile = new File(realPath);

        // Kiểm tra xem file có tồn tại không
        if (!resourceFile.exists() || resourceFile.isDirectory()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // Lấy MIME type từ file
        String mimeType = getServletContext().getMimeType(resourceFile.getName());
        if (mimeType == null) {
            // MIME type mặc định
            mimeType = "application/octet-stream";
        }

        response.setContentType(mimeType);

        // Đặt encoding nếu là text (CSS, JS, HTML)
        if (mimeType.startsWith("text/")) {
            response.setCharacterEncoding("UTF-8");
        }

        // Gửi nội dung file
        try (FileInputStream fileInputStream = new FileInputStream(resourceFile);
             OutputStream outputStream = response.getOutputStream()) {
            byte[] buffer = new byte[8192];
            int bytesRead;
            while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}