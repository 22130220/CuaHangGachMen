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
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.*;
import java.util.stream.Collectors;

import com.google.gson.Gson;

@WebServlet(name = "completeorderhistory", value = "/completeorderhistory")
public class HistoryOrderController extends HttpServlet {

    // Hàm ánh xạ trạng thái từ tiếng Anh sang tiếng Việt
    private String translateStatusToVietnamese(String status) {
        switch (status) {
            case "Processing": return "Đang xử lý";
            case "Shipping": return "Chờ giao hàng";
            case "Delivered": return "Đơn đã giao";
            case "Cancelled": return "Đơn đã hủy";
            default: return status; // Giữ nguyên nếu không có ánh xạ
        }
    }

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
        String sortOption = request.getParameter("sort");
        String searchKeyword = request.getParameter("search");
        String suggest = request.getParameter("suggest");
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
        Map<Integer, String> orderStatusMap = new HashMap<>(); // Trạng thái gốc (tiếng Anh)
        Map<Integer, String> orderStatusDisplayMap = new HashMap<>(); // Trạng thái hiển thị (tiếng Việt)
        Map<Integer, LocalDateTime> orderCreateDateMap = new HashMap<>();
        Map<Integer, String> orderCreateDateStrMap = new HashMap<>(); // Lưu định dạng "dd-MM-yyyy"
        Map<Integer, Integer> orderTotalPriceMap = new HashMap<>();
        DateTimeFormatter isoFormatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME; // Định dạng "2025-03-27T17:12:42"
        DateTimeFormatter displayFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy"); // Định dạng "27-03-2025"

        for (Integer orderId : orderGroups.keySet()) {
            String orderStatus = orderDetailDao.getOrderStatus(orderId);
            LocalDateTime createDate = orderDetailDao.getOrderCreateDate(orderId);
            Integer totalPrice = orderDetailDao.getOrderTotalPrice(orderId);
            orderStatusMap.put(orderId, orderStatus);
            orderStatusDisplayMap.put(orderId, translateStatusToVietnamese(orderStatus)); // Dịch sang tiếng Việt
            orderCreateDateMap.put(orderId, createDate);
            orderTotalPriceMap.put(orderId, totalPrice);
            // Chuyển đổi CreateDate sang định dạng "dd-MM-yyyy"
            String createDateStr = createDate.format(displayFormatter);
            orderCreateDateStrMap.put(orderId, createDateStr);
        }

        // Xử lý gợi ý (autocomplete)
        if ("true".equals(suggest)) {
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out = response.getWriter();
            Set<String> suggestions = new HashSet<>();

            if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
                String keyword = searchKeyword.toLowerCase();

                for (Map.Entry<Integer, List<OrderDetail>> entry : orderGroups.entrySet()) {
                    Integer orderId = entry.getKey();
                    List<OrderDetail> orders = entry.getValue();

                    // Gợi ý theo OrderID
                    if (String.valueOf(orderId).contains(keyword)) {
                        suggestions.add("Đơn hàng #" + orderId);
                    }
                    // Gợi ý theo trạng thái (sử dụng trạng thái tiếng Việt)
                    if (orderStatusDisplayMap.get(orderId).toLowerCase().contains(keyword)) {
                        suggestions.add("Trạng thái: " + orderStatusDisplayMap.get(orderId));
                    }
                    // Gợi ý theo tên sản phẩm
                    for (OrderDetail order : orders) {
                        if (order.getProductName().toLowerCase().contains(keyword)) {
                            suggestions.add(order.getProductName());
                        }
                    }
                    // Gợi ý theo ngày tạo
                    String createDateStr = orderCreateDateStrMap.get(orderId);
                    if (createDateStr.contains(keyword)) {
                        suggestions.add("Ngày: " + createDateStr);
                    }
                }
            }

            // Chuyển danh sách gợi ý thành JSON
            Gson gson = new Gson();
            out.print(gson.toJson(new ArrayList<>(suggestions)));
            out.flush();
            handle.close();
            return;
        }

        // Lọc đơn hàng theo từ khóa tìm kiếm
        if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
            String keyword = searchKeyword.toLowerCase();
            // Loại bỏ tiền tố nếu có (do gợi ý thêm tiền tố như "Ngày: ", "Trạng thái: ")
            if (keyword.startsWith("đơn hàng #")) {
                keyword = keyword.replace("đơn hàng #", "");
            } else if (keyword.startsWith("trạng thái: ")) {
                keyword = keyword.replace("trạng thái: ", "");
            } else if (keyword.startsWith("ngày: ")) {
                keyword = keyword.replace("ngày: ", "");
            }

            Map<Integer, List<OrderDetail>> filteredOrderGroups = new HashMap<>();
            DateTimeFormatter searchFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            DateTimeFormatter dbFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

            for (Map.Entry<Integer, List<OrderDetail>> entry : orderGroups.entrySet()) {
                Integer orderId = entry.getKey();
                List<OrderDetail> orders = entry.getValue();
                boolean matches = false;

                // Tìm theo OrderID
                if (String.valueOf(orderId).contains(keyword)) {
                    matches = true;
                }
                // Tìm theo trạng thái (sử dụng trạng thái tiếng Việt)
                else if (orderStatusDisplayMap.get(orderId).toLowerCase().contains(keyword)) {
                    matches = true;
                }
                // Tìm theo tên sản phẩm
                else {
                    for (OrderDetail order : orders) {
                        if (order.getProductName().toLowerCase().contains(keyword)) {
                            matches = true;
                            break;
                        }
                    }
                }
                // Tìm theo ngày tạo (CreateDate)
                if (!matches) {
                    LocalDateTime createDate = orderCreateDateMap.get(orderId);
                    String createDateStr = createDate.format(searchFormatter); // Định dạng "27-03-2025"
                    String createDateForDb = createDate.format(dbFormatter); // Định dạng "2025-03-27"

                    // Hỗ trợ tìm kiếm linh hoạt: "27-03-2025" hoặc "03-2025"
                    if (createDateStr.equals(keyword) || createDateStr.startsWith(keyword)) {
                        matches = true;
                    } else {
                        // Nếu người dùng nhập định dạng "yyyy-MM-dd", chuyển đổi để so sánh
                        try {
                            LocalDateTime parsedKeyword = LocalDateTime.parse(keyword + "T00:00:00", isoFormatter);
                            String keywordFormatted = parsedKeyword.format(dbFormatter);
                            if (createDateForDb.equals(keywordFormatted) || createDateForDb.startsWith(keywordFormatted)) {
                                matches = true;
                            }
                        } catch (DateTimeParseException e) {
                            // Không phải định dạng ngày, bỏ qua
                        }
                    }
                }

                if (matches) {
                    filteredOrderGroups.put(orderId, orders);
                }
            }
            orderGroups = filteredOrderGroups;
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
                    sortedOrderGroups.sort((o1, o2) -> orderTotalPriceMap.get(o1.getKey()).compareTo(orderTotalPriceMap.get(o1.getKey())));
                    break;
                default:
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
            out.println("<div style=\"position: relative;\">");
            out.println("<input type=\"text\" id=\"searchKeyword\" placeholder=\"Tìm kiếm đơn hàng (VD: 27-03-2025, BAMBU, Đang xử lý)\" onkeyup=\"handleSearch(event)\" value=\"" + (searchKeyword != null ? searchKeyword : "") + "\">");
            out.println("<div id=\"suggestions\" class=\"autocomplete-suggestions\" style=\"display: none;\"></div>");
            out.println("</div>");
            out.println("<select id=\"sortOption\" onchange=\"loadOrdersWithSortAndSearch()\">");
            out.println("<option value=\"newest\"" + ("newest".equals(sortOption) ? " selected" : "") + ">Mới nhất</option>");
            out.println("<option value=\"oldest\"" + ("oldest".equals(sortOption) ? " selected" : "") + ">Cũ nhất</option>");
            out.println("<option value=\"totalPriceDesc\"" + ("totalPriceDesc".equals(sortOption) ? " selected" : "") + ">Tổng giá: Cao đến thấp</option>");
            out.println("<option value=\"totalPriceAsc\"" + ("totalPriceAsc".equals(sortOption) ? " selected" : "") + ">Tổng giá: Thấp đến cao</option>");
            out.println("</select>");
            out.println("</div>");
            out.println("<hr>");

            if (orderGroups.isEmpty()) {
                out.println("<p>Không tìm thấy đơn hàng nào.</p>");
            } else {
                for (Map.Entry<Integer, List<OrderDetail>> entry : sortedOrderGroups) {
                    Integer orderId = entry.getKey();
                    List<OrderDetail> orders = entry.getValue();
                    String orderStatus = orderStatusMap.get(orderId);
                    String orderStatusDisplay = translateStatusToVietnamese(orderStatus); // Dịch sang tiếng Việt
                    LocalDateTime createDate = orderCreateDateMap.get(orderId);
                    Integer totalPrice = orderTotalPriceMap.get(orderId);
                    String createDateStr = createDate.format(displayFormatter); // Hiển thị theo định dạng "27-03-2025"

                    out.println("<div class=\"order-group\">");
                    out.println("<div class=\"order-header\">");
                    out.println("<span>Đơn hàng #" + orderId + " - Ngày tạo: " + createDateStr + " - Trạng thái: " + orderStatusDisplay + " - Tổng: ₫" + totalPrice + "</span>");
                    if ("Processing".equals(orderStatus) || "Shipping".equals(orderStatus)) {
                        // Thay liên kết <a> bằng div với sự kiện onclick
                        out.println("<div class=\"mualaine\" onclick=\"confirmCancelOrder(" + orderId + ")\" style=\"display: inline-block; cursor: pointer;\">");
                        out.println("<div class=\"mualai\">Hủy đơn</div>");
                        out.println("</div>");
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

                            out.println("<a class=\"mualaine\" href=\"/pdetail?pid=" + order.getProductId() + "\" style=\"display: inline-block;\">");
                            out.println("<div class=\"mualai\">Mua lại</div>");
                            out.println("</a>");
                        } else if ("Delivered".equals(orderStatus)) {
                            out.println("<a class=\"mualaine\" href=\"/pdetail?pid=" + order.getProductId() + "&tab=review\" style=\"display: inline-block;\">");
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
            request.setAttribute("orderStatusMap", orderStatusMap); // Trạng thái gốc (tiếng Anh)
            request.setAttribute("orderStatusDisplayMap", orderStatusDisplayMap); // Trạng thái hiển thị (tiếng Việt)
            request.setAttribute("orderCreateDates", orderCreateDateStrMap); // Truyền định dạng "dd-MM-yyyy"
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
            case "Delivered": return "ĐƠN ĐÃ GIAO";
            case "Cancelled": return "ĐƠN ĐÃ HỦY";
            default: return "TRẠNG THÁI";
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Để trống hoặc thêm logic nếu cần
    }
}