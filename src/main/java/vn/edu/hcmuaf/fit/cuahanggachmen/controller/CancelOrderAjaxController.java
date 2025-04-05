package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Order;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "cancelOrderAjax", value = "/cancelOrderAjax")
public class CancelOrderAjaxController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        if (user == null) {
            out.print("{\"success\": false, \"message\": \"Vui lòng đăng nhập để hủy đơn hàng.\"}");
            out.flush();
            return;
        }

        String orderIdStr = request.getParameter("orderId");
        int orderId;
        try {
            orderId = Integer.parseInt(orderIdStr);
        } catch (NumberFormatException e) {
            out.print("{\"success\": false, \"message\": \"Mã đơn hàng không hợp lệ.\"}");
            out.flush();
            return;
        }

        Handle handle = DBConect.get().open();
        OrderDao orderDao = new OrderDao(handle);

        // Kiểm tra trạng thái đơn hàng trước khi hủy
        String currentStatus = orderDao.findById(orderId).map(Order::getStatus).orElse(null);
        if (currentStatus == null || (!"Processing".equals(currentStatus) && !"Shipping".equals(currentStatus))) {
            out.print("{\"success\": false, \"message\": \"Không thể hủy đơn hàng này.\"}");
            out.flush();
            handle.close();
            return;
        }

        // Thực hiện hủy đơn hàng
        int result = orderDao.updateStatus(orderId, "Cancelled");

        if (result > 0) {
            out.print("{\"success\": true, \"message\": \"Đơn hàng đã được hủy thành công.\"}");
        } else {
            out.print("{\"success\": false, \"message\": \"Có lỗi xảy ra khi hủy đơn hàng.\"}");
        }
        out.flush();
        handle.close();
    }
}