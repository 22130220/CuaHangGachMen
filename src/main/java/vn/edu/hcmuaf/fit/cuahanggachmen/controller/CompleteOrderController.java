package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.PermissionCheck;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ColorDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDetailDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OutOfStockDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OutOfStockDetailDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.VoucherUsageDAO;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.mail.EmailService;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@WebServlet(name = "CompleteOrderController", value = "/CompleteOrderController")
public class CompleteOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className != null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".", className, "GET"), request, response)) return;

        request.getRequestDispatcher("/WEB-INF/complete_order.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className != null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".", className, "POST"), request, response)) return;

        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("name");
        String email = (String) session.getAttribute("email");
        String phone = (String) session.getAttribute("phone");
        String address = (String) session.getAttribute("address");
        String note = "";
        String finalTotal = session.getAttribute("finalTotal").toString();
        if (session.getAttribute("note") != null) {
            note = (String) session.getAttribute("note");
        }

        User u = (User) session.getAttribute("auth");
        Cart c = (Cart) session.getAttribute("cart");

        if (u == null || c == null || c.getItems().isEmpty()) {
            response.sendRedirect("/WEB-INF/404.jsp");
            return;
        }

        Handle handle = DBConect.get().open();
        try {
            handle.begin(); // Start transaction

            // Insert Order
            Order order = new Order();
            OrderDao dao = new OrderDao(handle);
            order.setFullName(name);
            order.setEmail(email);
            order.setPhone(phone);
            order.setAddress(address);
            order.setDescription(note);
            order.setPayment("COD");
            order.setUserId(u.getId());
            order.setOrderDate(LocalDateTime.now());
            double totalPrice = Double.parseDouble(finalTotal);
            order.setTotalPrice(BigDecimal.valueOf(totalPrice));
            int orderId = dao.insert(order);

            if (orderId <= 0) {
                handle.rollback();
                response.sendRedirect("/WEB-INF/404.jsp");
                return;
            }

            // Insert Order Details
            OrderDetailDao dDao = new OrderDetailDao(handle);
            int detailRowCount = 0;
            for (CartItem item : c.getItems()) {
                OrderDetail oDetail = new OrderDetail();
                oDetail.setOrderId(orderId);
                oDetail.setProductId(item.getProductId());
                oDetail.setQuantity(item.getQuantity());
                oDetail.setPrice(item.getPricePerBox());
                oDetail.setColor(item.getProductColor());
                detailRowCount += dDao.insert(oDetail);
            }

            if (detailRowCount != c.getItems().size()) {
                handle.rollback();
                response.sendRedirect("/WEB-INF/404.jsp");
                return;
            }

            // Insert into outofstock
            OutOfStockDao outOfStockDao = new OutOfStockDao(handle);
            OutOfStock outOfStock = new OutOfStock();
            outOfStock.setCreatedDate(LocalDateTime.now());
            outOfStock.setUserId(u.getId());
            outOfStock.setUpdatedDate(LocalDateTime.now());
            outOfStock.setTypeId(1); // Assume typeId 1 for order-related stock reduction
            int outOfStockId = outOfStockDao.insert(outOfStock);

            // Insert into outofstockdetail
            OutOfStockDetailDao outOfStockDetailDao = new OutOfStockDetailDao(handle);
            ColorDao colorDao = new ColorDao(handle);
            for (CartItem item : c.getItems()) {
                // Find colorId by name
                Color color = colorDao.findByName(item.getProductColor());
                if (color == null) {
                    handle.rollback();
                    response.sendRedirect("/WEB-INF/404.jsp");
                    return;
                }

                OutOfStockDetail detail = new OutOfStockDetail();
                detail.setOutOfStockId(outOfStockId);
                detail.setProductId(item.getProductId());
                detail.setColorId(color.getID());
                detail.setQuantity(item.getQuantity());
                detail.setUnitPrice(item.getPricePerBox());
                detail.setTotalPrice(item.getPricePerBox() * item.getQuantity());
                outOfStockDetailDao.insert(detail);
            }

            // Handle voucher usage
            if (c.getListVoucherId().size() > 0) {
                VoucherUsageDAO voucherUsageDAO = new VoucherUsageDAO(handle);
                for (Integer id : c.getListVoucherId()) {
                    VoucherUsage voucherUsage = new VoucherUsage();
                    voucherUsage.setVoucherId(id);
                    voucherUsage.setUserId(u.getId());
                    voucherUsage.setOrderId(orderId);
                    voucherUsage.setUsageDate(LocalDateTime.now());
                    voucherUsageDAO.insert(voucherUsage);
                }
            }

            // Send confirmation email
            EmailService emailService = new EmailService();
            String emailContent = emailService.buildOrderEmailContent(order, c.getItems());
            emailService.send(email, "Xác nhận đơn hàng #" + orderId, emailContent);

            // Clear session data
            session.removeAttribute("cart");
            session.removeAttribute("name");
            session.removeAttribute("email");
            session.removeAttribute("phone");
            session.removeAttribute("address");
            session.removeAttribute("note");
            session.removeAttribute("finalTotal");
            session.removeAttribute("voucherID");

            // Set attributes for JSP
            request.setAttribute("orderId", orderId);
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("payment", "COD");
            request.setAttribute("totalPrice", finalTotal);

            handle.commit(); // Commit transaction
            doGet(request, response);
        } catch (Exception e) {
            handle.rollback();
            e.printStackTrace(); // Consider logging instead
            response.sendRedirect("/WEB-INF/404.jsp");
        } finally {
            handle.close();
        }
    }
}