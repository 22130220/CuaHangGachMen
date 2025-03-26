package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDetailDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.OrderDetail;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "completeorderhistory", value = "/completeorderhistory")
public class HistoryOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        if (user == null) {
            response.sendRedirect("/login");
            return;
        }

        String status = request.getParameter("status");
        String ajax = request.getParameter("ajax");
        Handle handle = DBConect.get().open();
        OrderDetailDao orderDetailDao = new OrderDetailDao(handle);
        List<OrderDetail> orderDetails;

        // Xử lý trạng thái
        if (status == null || "all".equalsIgnoreCase(status)) {
            orderDetails = orderDetailDao.findAllOrderDetailsByUserId(user.getId());
        } else {
            orderDetails = orderDetailDao.findOrderDetailsByUserIdAndStatus(user.getId(), status);
        }

        // Nếu là yêu cầu AJAX, trả về HTML trực tiếp
        if ("true".equals(ajax)) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();

            out.println("<div class=\"cacsanpham\">");
            out.println("<div class=\"hoanthanh\"><b>" + getStatusText(status) + "</b></div>");
            out.println("<hr>");

            if (orderDetails.isEmpty()) {
                out.println("<p>Không có đơn hàng nào trong trạng thái này.</p>");
            } else {
                for (OrderDetail order : orderDetails) {
                    out.println("<div class=\"sanpham\">");
                    out.println("<div class=\"hinhanhcuacaigach\">");
                    out.println("<img class=\"img-donhang\" src=\"" + order.getProductImg() + "\" alt=\"\">");
                    out.println("</div>");
                    out.println("<div class=\"chitietsanpham\">");
                    out.println("<div class=\"tengachmen1\">" + order.getProductName() + "</div>");
                    out.println("<div class=\"soluong1\">Số lượng " + order.getQuantity() + "</div>");
                    out.println("<div class=\"soluong1\">" + order.getCreateDate() + "</div>");
                    out.println("</div>");
                    out.println("<div>₫" + order.getPrice() + "</div>");
                    out.println("<a class=\"mualaine\" href=\"/pdetail?pid=" + order.getProductId() + "\" style=\"display: inline-block;\">");
                    out.println("<div class=\"mualai\">Đánh giá</div>");
                    out.println("</a>");
                    out.println("<a class=\"mualaine\" href=\"/pdetail?pid=" + order.getProductId() + "\" style=\"display: inline-block;\">");
                    out.println("<div class=\"mualai\">Mua lại</div>");
                    out.println("</a>");
                    out.println("</div>");
                    out.println("<hr>");
                }
            }
            out.println("</div>");

            handle.close();
        } else {
            // Nếu không phải AJAX, forward đến JSP
            request.setAttribute("orderDetails", orderDetails);
            handle.close();
            request.getRequestDispatcher("/WEB-INF/complete_order_history.jsp").forward(request, response);
        }
    }

    private String getStatusText(String status) {
        if (status == null || "all".equalsIgnoreCase(status)) return "TẤT CẢ ĐƠN HÀNG";
        switch (status) {
            case "Processing": return "ĐANG XỬ LÝ";
            case "Shipping": return "CHỜ GIAO HÀNG";
            case "Delivered": return "HOÀN THÀNH";
            case "Cancelled": return "ĐÃ HỦY";
            default: return "TRẠNG THÁI";
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Để trống hoặc thêm logic nếu cần
    }
}