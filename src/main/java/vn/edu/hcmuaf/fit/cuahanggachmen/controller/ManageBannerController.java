package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.BannerDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Banner;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "admin/manage-banner", value = "/admin/manage-banner")
public class ManageBannerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        // Chưa triển khai chức năng thêm banner
    }
}