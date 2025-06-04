package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.PermissionCheck;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Order;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "admin", value = "/admin")
public class DashboardController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "GET"), request, response)) return;

        Handle handle = DBConect.get().open();
        ProductDao pDao = new ProductDao(handle);
        UserDao dao = new UserDao(handle);
        OrderDao orderDao = new OrderDao(handle);
        request.setAttribute("doanhThu", orderDao.sumDoanhThu());
        request.setAttribute("khachHang", dao.countUser());
        request.setAttribute("TongSanPham", pDao.countProduct());
        request.setAttribute("GDMotNgay",orderDao.transcPerDay());
        request.setAttribute("DonHang", orderDao.backToOrder());

        // Lấy danh sách sản phẩm cần nhập kho
        List<Map<String, Object>> lowStockProducts = pDao.findLowStockProductsWithColor(100); // Giảm ngưỡng xuống 100
        System.out.println("LowStockProducts size: " + lowStockProducts.size()); // Log để kiểm tra
        request.setAttribute("LowStockProducts", lowStockProducts);

        List<Map<String, Object>> productsToExport = pDao.findProductsToExport(200); // Ngưỡng 200
        System.out.println("ProductsToExport size in Controller: " + (productsToExport != null ? productsToExport.size() : "null"));
        System.out.println("ProductsToExport content: " + productsToExport);
        request.setAttribute("ProductsToExport", productsToExport);

        handle.close();
        request.getRequestDispatcher("/WEB-INF/admin_dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "POST"), request, response)) return;
    }
}