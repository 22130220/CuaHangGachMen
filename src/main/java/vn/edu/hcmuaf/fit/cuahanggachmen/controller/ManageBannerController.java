package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.PermissionCheck;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.BannerDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Banner;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

@MultipartConfig
@WebServlet(name = "admin/manage-banner", value = "/admin/manage-banner")
public class ManageBannerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "GET"), request, response)) return;
        Handle handle = DBConect.get().open();
        BannerDao bannerDao = new BannerDao(handle);

        // Lấy danh sách các giá trị position từ cơ sở dữ liệu
        List<Banner> banners = bannerDao.getAllBanners();
        // Lấy danh sách các position duy nhất
        List<String> positions = Arrays.asList("Home", "Category", "Cart", "Checkout", "Blog");

        request.setAttribute("positions", positions);
        handle.close();
        request.getRequestDispatcher("/WEB-INF/admin_managebanner.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "POST"), request, response)) return;

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String title = request.getParameter("title");
        String imageUrl = request.getParameter("image_url");
        String link = request.getParameter("link");
        String position = request.getParameter("position");
        String startDateStr = request.getParameter("start_date");
        String endDateStr = request.getParameter("end_date");
        String priorityStr = request.getParameter("priority");
        String isActiveStr = request.getParameter("is_active");

        Handle handle = DBConect.get().open();
        BannerDao bannerDao = new BannerDao(handle);
        try {
            // Kiểm tra hợp lệ
            if (title == null || title.trim().isEmpty() || imageUrl == null || imageUrl.trim().isEmpty() ||
                    priorityStr == null || priorityStr.trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"message\": \"Tiêu đề, URL hình ảnh và mức ưu tiên là bắt buộc\"}");
                return;
            }

            int priority = Integer.parseInt(priorityStr);
            if (priority < 0) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"message\": \"Mức ưu tiên không được âm\"}");
                return;
            }

            List<String> validPositions = Arrays.asList("Home", "Category", "Cart", "Checkout", "Blog");
            if (!validPositions.contains(position)) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"message\": \"Vị trí không hợp lệ\"}");
                return;
            }

            boolean isActive = Boolean.parseBoolean(isActiveStr);

            bannerDao.insertBanner(
                    title,
                    imageUrl,
                    link,
                    position,
                    isActive,
                    startDateStr != null && !startDateStr.isEmpty() ? LocalDateTime.parse(startDateStr) : null,
                    endDateStr != null && !endDateStr.isEmpty() ? LocalDateTime.parse(endDateStr) : null,
                    priority
            );

            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("{\"success\": true, \"message\": \"Thêm banner thành công\"}");
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"success\": false, \"message\": \"Mức ưu tiên không hợp lệ\"}");
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"success\": false, \"message\": \"Lỗi khi thêm banner: " + e.getMessage() + "\"}");
        } finally {
            handle.close();
        }
    }
}