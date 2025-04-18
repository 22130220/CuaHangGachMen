package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;

@WebServlet(name = "FileManagerServlet", value = "/FileManagerServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 10 * 1024 * 1024) // 5MB file, 10MB request
public class FileManagerServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "upload_image";
    private static final long MAX_FILE_SIZE = 5 * 1024 * 1024; // 5MB

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response); // Chuyển hướng doGet sang doPost nếu cần
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // Tạo thư mục uploads nếu chưa tồn tại
        String uploadPath = getServletContext().getRealPath("/") + UPLOAD_DIR + "/";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        try {
            if ("FileUpload".equals(command)) {
                handleFileUpload(request, response, out, uploadPath);
            } else if ("GetFiles".equals(command)) {
                listFiles(uploadDir, out);
            } else if ("DeleteFile".equals(command)) {
                deleteFile(request, uploadPath, out);
            } else {
                out.write("{\"error\": \"Invalid command\"}");
            }
        } catch (Exception e) {
            out.write("{\"error\": \"" + e.getMessage() + "\"}");
        } finally {
            out.close();
        }
    }

    private void handleFileUpload(HttpServletRequest request, HttpServletResponse response, PrintWriter out, String uploadPath) throws Exception {
        // Lấy danh sách các Part từ request
        for (Part part : request.getParts()) {
            String fileName = sanitizeFileName(part.getSubmittedFileName());
            if (fileName == null || fileName.isEmpty()) {
                continue; // Bỏ qua nếu không phải file
            }

            // Kiểm tra loại file (chỉ cho phép hình ảnh)
            String contentType = part.getContentType();
            if (contentType == null || !contentType.startsWith("image/")) {
                out.write("{\"error\": \"Only image files are allowed\"}");
                return;
            }

            // Kiểm tra kích thước file
            if (part.getSize() > MAX_FILE_SIZE) {
                out.write("{\"error\": \"File size exceeds 5MB\"}");
                return;
            }

            // Lưu file
            File uploadedFile = new File(uploadPath + fileName);
            part.write(uploadPath + fileName);
            out.write("{\"location\": \"/" + UPLOAD_DIR + "/" + fileName + "\"}");
            return;
        }
        out.write("{\"error\": \"No file uploaded\"}");
    }

    private void listFiles(File uploadDir, PrintWriter out) {
        File[] files = uploadDir.listFiles();
        StringBuilder json = new StringBuilder("[");
        if (files != null) {
            for (int i = 0; i < files.length; i++) {
                json.append("{\"name\": \"").append(files[i].getName())
                        .append("\", \"url\": \"/").append(UPLOAD_DIR).append("/")
                        .append(files[i].getName()).append("\"}");
                if (i < files.length - 1) json.append(",");
            }
        }
        json.append("]");
        out.write(json.toString());
    }

    private void deleteFile(HttpServletRequest request, String uploadPath, PrintWriter out) {
        String fileName = request.getParameter("fileName");
        if (fileName == null || fileName.isEmpty()) {
            out.write("{\"error\": \"Invalid file name\"}");
            return;
        }

        // Ngăn chặn path traversal attack
        fileName = sanitizeFileName(fileName);
        File file = new File(uploadPath + fileName);
        if (file.exists()) {
            file.delete();
            out.write("{\"status\": \"success\"}");
        } else {
            out.write("{\"status\": \"error\"}");
        }
    }

    private String sanitizeFileName(String fileName) {
        if (fileName == null) return null;
        // Loại bỏ ký tự nguy hiểm và path traversal
        fileName = fileName.replaceAll("[^a-zA-Z0-9\\.\\-]", "_");
        return new File(fileName).getName(); // Chỉ lấy tên file, bỏ đường dẫn
    }
}