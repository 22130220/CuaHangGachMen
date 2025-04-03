package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDetailDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.VoucherUsageDAO;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.mail.EmailService;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@WebServlet(name = "CheckoutVNPay", value = "/checkoutVNPay")
public class CheckoutVNPay extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String status = request.getParameter("vnp_TransactionStatus");
        HttpSession session = request.getSession();

        if(status.equalsIgnoreCase("00")){
            String name =(String) session.getAttribute("name");
            String email =(String) session.getAttribute("email");
            String phone =(String) session.getAttribute("phone");
            String address =(String) session.getAttribute("address");
            String note="";
            String finalTotal = session.getAttribute("finalTotal").toString();
            if(session.getAttribute("note") != null){
                note =(String) session.getAttribute("note");
            }


            int lastRowId = 0;


            User u = (User) session.getAttribute("auth");
            Cart c = (Cart) session.getAttribute("cart");

            Order order = new Order();
            Handle handle = DBConect.get().open();
            OrderDao dao = new OrderDao(handle);


            order.setFullName(name);
            order.setEmail(email);
            order.setPhone(phone);
            order.setAddress(address);
            order.setDescription(note);
            order.setPayment("Thanh toán VNPay");
            order.setUserId(u.getId());
            order.setOrderDate(LocalDateTime.now());
            double totalPrice=Double.parseDouble(finalTotal);
            if(c.getVoucherId() > 0) {
                totalPrice = totalPrice - c.getDiscount();
                if(totalPrice < 0) totalPrice =0;
            }
            order.setTotalPrice(BigDecimal.valueOf(totalPrice));
            lastRowId = dao.insert(order);

            if(lastRowId <= 0) {
                handle.close();
                response.sendRedirect("/WEB-INF/404.jsp");
            } else {
                int rowCount = 0;
                OrderDetailDao dDao = new OrderDetailDao(handle);
                for(CartItem item : c.getItems()) {
                    OrderDetail oDetail = new OrderDetail();
                    oDetail.setOrderId(lastRowId);
                    oDetail.setProductId(item.getProductId());
                    oDetail.setQuantity(item.getQuantity());
                    oDetail.setPrice(item.getPricePerBox());
                    oDetail.setColor(item.getProductColor());
                    rowCount += dDao.insert(oDetail);
                }

                if(rowCount == c.getItems().size()) {
                    // Nếu có sử dụng voucher, lưu thông tin VoucherUsage
                    if (  c.getVoucherId() > 0) {
                        VoucherUsage voucherUsage = new VoucherUsage();
                        voucherUsage.setVoucherId(c.getVoucherId());
                        voucherUsage.setUserId(u.getId());
                        voucherUsage.setOrderId(lastRowId);
                        voucherUsage.setUsageDate(LocalDateTime.now());

                        VoucherUsageDAO voucherUsageDAO = new VoucherUsageDAO(handle);
                        voucherUsageDAO.insert(voucherUsage);
                    }

                    // Gửi email xác nhận đơn hàng
                    EmailService emailService = new EmailService();
                    String emailContent = emailService.buildOrderEmailContent(order, c.getItems());
                    emailService.send(email, "Xác nhận đơn hàng #" + lastRowId, emailContent);
                    // XÓA DỮ LIỆU TRONG GIỎ HÀNG
                    session.removeAttribute("cart");
                    session.removeAttribute("name");
                    session.removeAttribute("email");
                    session.removeAttribute("phone");
                    session.removeAttribute("address");
                    session.removeAttribute("note");
                    session.removeAttribute("finalTotal");
                    session.removeAttribute("voucherID");
                    session.setAttribute("quantity",0);
                    // Truyền thông tin sang trang JSP
                    request.setAttribute("orderId", lastRowId);
                    request.setAttribute("name", name);
                    request.setAttribute("email", email);
                    request.setAttribute("phone", phone);
                    request.setAttribute("address", address);
                    request.setAttribute("payment", "Thanh toán VNPay");
                    request.setAttribute("totalPrice", finalTotal);
                    handle.close();
                    request.getRequestDispatcher("/WEB-INF/complete_order.jsp").forward(request,response);
                } else {
                    handle.close();
                    response.sendRedirect("/WEB-INF/404.jsp");
                }
            }





        }




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

}}