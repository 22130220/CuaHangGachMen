package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.PermissionCheck;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OutOfStockDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Order;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.OutOfStock;
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
        try {
            handle.begin(); // Bắt đầu giao dịch

            OrderDao orderDao = new OrderDao(handle);
            OutOfStockDao outOfStockDao = new OutOfStockDao(handle);

            // Kiểm tra trạng thái đơn hàng trước khi hủy
            Order order = orderDao.findById(orderId).orElse(null);
            if (order == null || (!"Processing".equals(order.getStatus()))) {
                out.print("{\"success\": false, \"message\": \"Không thể hủy đơn hàng này.\"}");
                out.flush();
                handle.rollback();
                return;
            }

            // Thực hiện hủy đơn hàng
            int result = orderDao.updateStatus(orderId, "Cancelled");

            // Nếu trạng thái là Processing, cập nhật isActive trong outofstock
            if ("Processing".equals(order.getStatus())) {
                OutOfStock outOfStock = outOfStockDao.findByUserIdAndDate(user.getId(), order.getOrderDate());
                if (outOfStock == null) {
                    out.print("{\"success\": false, \"message\": \"Không tìm thấy bản ghi kho để cập nhật.\"}");
                    out.flush();
                    handle.rollback();
                    return;
                }
                int outOfStockResult = outOfStockDao.updateActive(outOfStock.getId(), false);
                if (outOfStockResult == 0) {
                    out.print("{\"success\": false, \"message\": \"Cập nhật kho thất bại.\"}");
                    out.flush();
                    handle.rollback();
                    return;
                }
            }

            if (result > 0) {
                handle.commit(); // Xác nhận giao dịch
                out.print("{\"success\": true, \"message\": \"Đơn hàng đã được hủy thành công.\"}");
            } else {
                handle.rollback();
                out.print("{\"success\": false, \"message\": \"Có lỗi xảy ra khi hủy đơn hàng.\"}");
            }
        } catch (Exception e) {
            handle.rollback();
            out.print("{\"success\": false, \"message\": \"Có lỗi xảy ra: " + e.getMessage() + "\"}");
            e.printStackTrace(); // Thay bằng logger trong môi trường sản xuất
        } finally {
            out.flush();
            handle.close();
        }
    }
}