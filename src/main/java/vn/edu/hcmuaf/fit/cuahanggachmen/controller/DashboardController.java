package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Order;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "admin", value = "/admin")
public class DashboardController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDao pDao = new ProductDao();
        UserDao dao = new UserDao();
        OrderDao orderDao = new OrderDao();
        try {
            request.setAttribute("doanhThu", orderDao.sumDoanhThu());
            request.setAttribute("khachHang", dao.countUser());
            request.setAttribute("TongSanPham", pDao.countProduct());
            request.setAttribute("GDMotNgay",orderDao.transcPerDay());
            request.setAttribute("DonHang", orderDao.backToOrder());
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("/WEB-INF/admin_dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}