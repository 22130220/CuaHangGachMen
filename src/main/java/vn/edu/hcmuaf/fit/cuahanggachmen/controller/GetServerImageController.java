package vn.edu.hcmuaf.fit.cuahanggachmen.controller;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.logging.Logger;

@WebServlet(name = "GetServerImageController", value = "/upload_image/*")
public class GetServerImageController extends HttpServlet {
//    private static final Logger LOGGER = Logger.getLogger(GetServerImageController.class.getName());
    private static final String UPLOAD_DIR = "/upload_image";
    private static final int BUFFER_SIZE = 8192;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String resourcePath = request.getPathInfo();
        if (resourcePath == null || resourcePath.isEmpty()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Resource path is empty");
            return;
        }

        if (resourcePath.contains("..")) {
//            LOGGER.warning("Potential path traversal attempt: " + resourcePath);
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Invalid path");
            return;
        }

        Path basePath = Paths.get(getServletContext().getRealPath(UPLOAD_DIR)).normalize();
        Path filePath = basePath.resolve(resourcePath.startsWith("/") ? resourcePath.substring(1) : resourcePath).normalize();

        if (!filePath.startsWith(basePath)) {
//            LOGGER.warning("Attempt to access file outside upload directory: " + filePath);
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied");
            return;
        }

        File resourceFile = filePath.toFile();
        if (!resourceFile.exists() || resourceFile.isDirectory()) {
//            LOGGER.info("File not found: " + filePath);
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
            return;
        }

        String mimeType = getServletContext().getMimeType(resourceFile.getName());
        if (mimeType == null) {
            mimeType = Files.probeContentType(filePath);
            if (mimeType == null) {
                mimeType = "application/octet-stream";
            }
        }
        response.setContentType(mimeType);

        if (mimeType.startsWith("text/")) {
            response.setCharacterEncoding("UTF-8");
        }

        response.setHeader("Cache-Control", "public, max-age=86400");
        response.setDateHeader("Last-Modified", resourceFile.lastModified());
        response.setHeader("Accept-Ranges", "bytes"); // Báo cho client rằng server hỗ trợ Range Requests

        String disposition = request.getParameter("download") != null ? "attachment" : "inline";
        response.setHeader("Content-Disposition", disposition + "; filename=\"" + resourceFile.getName() + "\"");

        long fileLength = resourceFile.length();
        String rangeHeader = request.getHeader("Range");
        long start = 0;
        long end = fileLength - 1;
        boolean isRangeRequest = rangeHeader != null && rangeHeader.startsWith("bytes=");

        if (isRangeRequest) {
            String[] ranges = rangeHeader.substring("bytes=".length()).split("-");
            start = Long.parseLong(ranges[0]);
            if (ranges.length > 1 && !ranges[1].isEmpty()) {
                end = Long.parseLong(ranges[1]);
            }

            if (start < 0 || end >= fileLength || start > end) {
                response.setStatus(HttpServletResponse.SC_REQUESTED_RANGE_NOT_SATISFIABLE);
                response.setHeader("Content-Range", "bytes */" + fileLength);
                return;
            }

            response.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT);
            response.setHeader("Content-Range", "bytes " + start + "-" + end + "/" + fileLength);
            response.setContentLengthLong(end - start + 1);
        } else {
            response.setContentLengthLong(fileLength);
        }

        try (RandomAccessFile file = new RandomAccessFile(resourceFile, "r");
             OutputStream outputStream = response.getOutputStream()) {
            if (isRangeRequest) {
                file.seek(start);
                long bytesToRead = end - start + 1;
                byte[] buffer = new byte[BUFFER_SIZE];
                int bytesRead;
                while (bytesToRead > 0 && (bytesRead = file.read(buffer, 0, (int) Math.min(buffer.length, bytesToRead))) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                    bytesToRead -= bytesRead;
                }
            } else {
                byte[] buffer = new byte[BUFFER_SIZE];
                int bytesRead;
                while ((bytesRead = file.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
            }
        } catch (IOException e) {
//            LOGGER.severe("Error reading file: " + filePath + " - " + e.getMessage());
            if (!response.isCommitted()) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error reading file");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "POST method not supported");
    }
}
