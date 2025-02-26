package vn.edu.hcmuaf.fit.cuahanggachmen.controller;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDetailDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.VoucherUsageDAO;
import vn.edu.hcmuaf.fit.cuahanggachmen.mail.EmailService;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.Map;

@WebServlet(name = "CompleteOrderController", value = "/CompleteOrderController")
public class CompleteOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/complete_order.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String note = request.getParameter("note");

        int lastRowId = 0;

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("auth");
        Cart c = (Cart) session.getAttribute("cart");

        Order order = new Order();
        OrderDao dao = new OrderDao();


        order.setFullName(name);
        order.setEmail(email);
        order.setPhone(phone);
        order.setAddress(address);
        order.setDescription(note);
        order.setPayment("COD");
        order.setUserId(u.getId());
        order.setOrderDate(LocalDateTime.now());
        double totalPrice;
        if(c.getVoucherId() > 0) {
            totalPrice = c.getTotal() - c.getDiscount();
            if(totalPrice < 0) totalPrice =0;
        } else totalPrice = c.getTotal();

        order.setTotalPrice(BigDecimal.valueOf(totalPrice));
        try {
            lastRowId = dao.insert(order);
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }

        if(lastRowId <= 0) {
            response.sendRedirect("/WEB-INF/404.jsp");
        } else {
            int rowCount = 0;
            OrderDetailDao dDao = new OrderDetailDao();
            for(CartItem item : c.getItems()) {
                OrderDetail oDetail = new OrderDetail();
                oDetail.setOrderId(lastRowId);
                oDetail.setProductId(item.getProductId());
                oDetail.setQuantity(item.getQuantity());
                oDetail.setPrice(item.getPricePerBox());
                oDetail.setColor(item.getProductColor());
                try {
                    rowCount += dDao.insert(oDetail);
                } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
                    throw new RuntimeException(e);
                }
            }

            if(rowCount == c.getItems().size()) {
                // Nếu có sử dụng voucher, lưu thông tin VoucherUsage
                if (  c.getVoucherId() > 0) {
                    VoucherUsage voucherUsage = new VoucherUsage();
                    voucherUsage.setVoucherId(c.getVoucherId());
                    voucherUsage.setUserId(u.getId());
                    voucherUsage.setOrderId(lastRowId);
                    voucherUsage.setUsageDate(LocalDateTime.now());

                    VoucherUsageDAO voucherUsageDAO = new VoucherUsageDAO();
                    try {
                        voucherUsageDAO.insert(voucherUsage);
                    } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
                        // Xử lý lỗi khi lưu VoucherUsage (có thể rollback đơn hàng nếu cần)
                        e.printStackTrace();
                        response.sendRedirect("/WEB-INF/404.jsp");
                        return;
                    }
                }

                // Gửi email xác nhận đơn hàng
                EmailService emailService = new EmailService();
                String emailContent = emailService.buildOrderEmailContent(order, c.getItems());
                emailService.send(email, "Xác nhận đơn hàng #" + lastRowId, emailContent);
                // XÓA DỮ LIỆU TRONG GIỎ HÀNG
                session.removeAttribute("cart");
                // Truyền thông tin sang trang JSP
                request.setAttribute("orderId", lastRowId);
                request.setAttribute("name", name);
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);
                request.setAttribute("address", address);
                request.setAttribute("payment", "COD");
                request.setAttribute("totalPrice", totalPrice);
                doGet(request,response);
            } else response.sendRedirect("/WEB-INF/404.jsp");
        }

    }
}