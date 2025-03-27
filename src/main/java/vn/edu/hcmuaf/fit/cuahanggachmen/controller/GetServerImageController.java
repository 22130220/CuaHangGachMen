package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet(name = "GetServerImageController", value = "/upload_image/*")
public class GetServerImageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String resourcePath = request.getPathInfo();
        if (resourcePath == null || resourcePath.isEmpty()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String realPath = getServletContext().getRealPath("/upload_image" + resourcePath);
        File resourceFile = new File(realPath);

        if (!resourceFile.exists() || resourceFile.isDirectory()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String mimeType = getServletContext().getMimeType(resourceFile.getName());
        if (mimeType == null) {
            mimeType = "application/octet-stream";
        }

        response.setContentType(mimeType);

        if (mimeType.startsWith("text/")) {
            response.setCharacterEncoding("UTF-8");
        }

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