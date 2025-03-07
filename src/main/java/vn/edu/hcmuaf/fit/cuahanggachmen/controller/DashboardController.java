package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Order;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "admin", value = "/admin")
public class DashboardController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        ProductDao pDao = new ProductDao(handle);
        UserDao dao = new UserDao(handle);
        OrderDao orderDao = new OrderDao(handle);
        request.setAttribute("doanhThu", orderDao.sumDoanhThu());
        request.setAttribute("khachHang", dao.countUser());
        request.setAttribute("TongSanPham", pDao.countProduct());
        request.setAttribute("GDMotNgay",orderDao.transcPerDay());
        request.setAttribute("DonHang", orderDao.backToOrder());

        handle.close();
        request.getRequestDispatcher("/WEB-INF/admin_dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}