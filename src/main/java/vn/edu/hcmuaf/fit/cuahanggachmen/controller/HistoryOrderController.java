package vn.edu.hcmuaf.fit.cuahanggachmen.controller;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDetailDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Order;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.OrderDetail;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "completeorderhistory", value = "/completeorderhistory")
public class HistoryOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth"); // Lấy userId từ session

        if (user == null) {
            // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
            response.sendRedirect("/login");
            return;
        }
        Handle handle = DBConect.get().open();
        OrderDetailDao orderDetailDao = new OrderDetailDao(handle);
        List<OrderDetail> deliveredOrderDetails = orderDetailDao.findDeliveredOrderDetailsByUserId(user.getId());
        request.setAttribute("deliveredOrderDetails", deliveredOrderDetails);
        handle.close();
        request.getRequestDispatcher("/WEB-INF/complete_order_history.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
