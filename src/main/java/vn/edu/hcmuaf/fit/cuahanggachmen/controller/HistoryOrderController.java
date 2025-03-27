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
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

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
        String sortOption = request.getParameter("sort"); // Tham số sắp xếp
        String ajax = request.getParameter("ajax");
        Handle handle = DBConect.get().open();
        OrderDetailDao orderDetailDao = new OrderDetailDao(handle);
        List<OrderDetail> orderDetails;

        if (status == null || "all".equalsIgnoreCase(status)) {
            orderDetails = orderDetailDao.findAllOrderDetailsByUserId(user.getId());
        } else {
            orderDetails = orderDetailDao.findOrderDetailsByUserIdAndStatus(user.getId(), status);
        }

        // Nhóm các OrderDetail theo OrderID
        Map<Integer, List<OrderDetail>> orderGroups = orderDetails.stream()
                .collect(Collectors.groupingBy(OrderDetail::getOrderId));

        // Lấy trạng thái, ngày tạo và TotalPrice của từng đơn hàng
        Map<Integer, String> orderStatusMap = new HashMap<>();
        Map<Integer, LocalDateTime> orderCreateDateMap = new HashMap<>();
        Map<Integer, Integer> orderTotalPriceMap = new HashMap<>();
        for (Integer orderId : orderGroups.keySet()) {
            String orderStatus = orderDetailDao.getOrderStatus(orderId);
            LocalDateTime createDate = orderDetailDao.getOrderCreateDate(orderId);
            Integer totalPrice = orderDetailDao.getOrderTotalPrice(orderId);
            orderStatusMap.put(orderId, orderStatus);
            orderCreateDateMap.put(orderId, createDate);
            orderTotalPriceMap.put(orderId, totalPrice);
        }

        // Sắp xếp các đơn hàng theo tiêu chí
        List<Map.Entry<Integer, List<OrderDetail>>> sortedOrderGroups = new ArrayList<>(orderGroups.entrySet());
        if (sortOption != null) {
            switch (sortOption) {
                case "newest":
                    sortedOrderGroups.sort((o1, o2) -> orderCreateDateMap.get(o2.getKey()).compareTo(orderCreateDateMap.get(o1.getKey())));
                    break;
                case "oldest":
                    sortedOrderGroups.sort((o1, o2) -> orderCreateDateMap.get(o1.getKey()).compareTo(orderCreateDateMap.get(o2.getKey())));
                    break;
                case "totalPriceDesc":
                    sortedOrderGroups.sort((o1, o2) -> orderTotalPriceMap.get(o2.getKey()).compareTo(orderTotalPriceMap.get(o1.getKey())));
                    break;
                case "totalPriceAsc":
                    sortedOrderGroups.sort((o1, o2) -> orderTotalPriceMap.get(o1.getKey()).compareTo(orderTotalPriceMap.get(o2.getKey())));
                    break;
                default:
                    // Mặc định: Sắp xếp theo mới nhất
                    sortedOrderGroups.sort((o1, o2) -> orderCreateDateMap.get(o2.getKey()).compareTo(orderCreateDateMap.get(o1.getKey())));
                    break;
            }
        }

        if ("true".equals(ajax)) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();

            out.println("<div class=\"cacsanpham\">");
            out.println("<div class=\"hoanthanh\"><b>" + getStatusText(status) + "</b></div>");
            out.println("<div class=\"sort-container\">");
            out.println("<select id=\"sortOption\" onchange=\"loadOrdersWithSort()\">");
            out.println("<option value=\"newest\"" + ("newest".equals(sortOption) ? " selected" : "") + ">Mới nhất</option>");
            out.println("<option value=\"oldest\"" + ("oldest".equals(sortOption) ? " selected" : "") + ">Cũ nhất</option>");
            out.println("<option value=\"totalPriceDesc\"" + ("totalPriceDesc".equals(sortOption) ? " selected" : "") + ">Tổng giá: Cao đến thấp</option>");
            out.println("<option value=\"totalPriceAsc\"" + ("totalPriceAsc".equals(sortOption) ? " selected" : "") + ">Tổng giá: Thấp đến cao</option>");
            out.println("</select>");
            out.println("</div>");
            out.println("<hr>");

            if (orderDetails.isEmpty()) {
                out.println("<p>Không có đơn hàng nào trong trạng thái này.</p>");
            } else {
                for (Map.Entry<Integer, List<OrderDetail>> entry : sortedOrderGroups) {
                    Integer orderId = entry.getKey();
                    List<OrderDetail> orders = entry.getValue();
                    String orderStatus = orderStatusMap.get(orderId);
                    LocalDateTime createDate = orderCreateDateMap.get(orderId);
                    Integer totalPrice = orderTotalPriceMap.get(orderId);

                    out.println("<div class=\"order-group\">");
                    out.println("<div class=\"order-header\">");
                    out.println("<span>Đơn hàng #" + orderId + " - Ngày tạo: " + createDate + " - Trạng thái: " + orderStatus + " - Tổng: ₫" + totalPrice + "</span>");
                    if ("Processing".equals(orderStatus) || "Shipping".equals(orderStatus)) {
                        out.println("<a class=\"mualaine\" href=\"/cancelOrder?orderId=" + orderId + "\" style=\"display: inline-block;\">");
                        out.println("<div class=\"mualai\">Hủy</div>");
                        out.println("</a>");
                    }
                    out.println("</div>");

                    for (OrderDetail order : orders) {
                        out.println("<div class=\"sanpham\">");
                        out.println("<div class=\"hinhanhcuacaigach\">");
                        out.println("<img class=\"img-donhang\" src=\"" + order.getProductImg() + "\" alt=\"\">");
                        out.println("</div>");
                        out.println("<div class=\"chitietsanpham\">");
                        out.println("<div class=\"tengachmen1\">" + order.getProductName() + "</div>");
                        out.println("<div class=\"soluong1\">Số lượng " + order.getQuantity() + "</div>");
                        out.println("</div>");

                        if ("Processing".equals(orderStatus) || "Shipping".equals(orderStatus)) {
                            out.println("<a class=\"mualaine\" href=\"/pdetail?pid=" + order.getProductId() + "\" style=\"display: inline-block;\">");
                            out.println("<div class=\"mualai\">Xem chi tiết</div>");
                            out.println("</a>");
                        } else if ("Cancelled".equals(orderStatus)) {
                            out.println("<a class=\"mualaine\" href=\"/reorder?orderId=" + order.getOrderId() + "\" style=\"display: inline-block;\">");
                            out.println("<div class=\"mualai\">Đặt lại</div>");
                            out.println("</a>");
                            out.println("<a class=\"mualaine\" href=\"/pdetail?pid=" + order.getProductId() + "\" style=\"display: inline-block;\">");
                            out.println("<div class=\"mualai\">Xem chi tiết</div>");
                            out.println("</a>");
                        } else if ("Delivered".equals(orderStatus)) {
                            out.println("<a class=\"mualaine\" href=\"/pdetail?pid=" + order.getProductId() + "\" style=\"display: inline-block;\">");
                            out.println("<div class=\"mualai\">Đánh giá</div>");
                            out.println("</a>");
                            out.println("<a class=\"mualaine\" href=\"/pdetail?pid=" + order.getProductId() + "\" style=\"display: inline-block;\">");
                            out.println("<div class=\"mualai\">Mua lại</div>");
                            out.println("</a>");
                        }

                        out.println("</div>");
                        out.println("<hr>");
                    }
                    out.println("</div>");
                }
            }
            out.println("</div>");

            handle.close();
        } else {
            request.setAttribute("orderGroups", new LinkedHashMap<>(sortedOrderGroups.stream()
                    .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e1, LinkedHashMap::new))));
            request.setAttribute("orderStatusMap", orderStatusMap);
            request.setAttribute("orderCreateDates", orderCreateDateMap);
            request.setAttribute("orderTotalPrices", orderTotalPriceMap);
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