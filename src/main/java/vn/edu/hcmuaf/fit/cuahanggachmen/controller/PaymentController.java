package vn.edu.hcmuaf.fit.cuahanggachmen.controller;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDetailDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.VoucherUsageDAO;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@WebServlet(name = "payment", value = "/thanhtoan")
public class PaymentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        String voucherID = request.getParameter("voucherID");
        String finalTotal = request.getParameter("finalTotal");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address1 = request.getParameter("address");
        String province = request.getParameter("province1");
        String district1 = request.getParameter("district1");
        String ward=request.getParameter("ward1");
        String note = request.getParameter("note");
        String address = address1+", "+province+", "+district1+", "+ward;

        // Kiểm tra nếu người dùng không nhập mã voucher
        if (voucherID == null || voucherID.isEmpty()) {
            voucherID = "Không có mã voucher"; // Giá trị mặc định nếu không có voucher
        }

        // Đặt thông tin vào request để truyền sang JSP
        session.setAttribute("name", name);
        session.setAttribute("email", email);
        session.setAttribute("phone", phone);
        session.setAttribute("address", address);
        session.setAttribute("note", note);
        session.setAttribute("voucherID", voucherID);
        session.setAttribute("finalTotal", finalTotal);


        request.setAttribute("cart", cart);





        request.getRequestDispatcher("/WEB-INF/payment_method.jsp").forward(request, response);


    }}

