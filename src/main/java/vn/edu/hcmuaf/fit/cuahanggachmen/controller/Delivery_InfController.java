package vn.edu.hcmuaf.fit.cuahanggachmen.controller;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Cart;

import java.io.IOException;

@WebServlet(name = "delivery_information", value = "/delivery_information")
public class Delivery_InfController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("cart"); // Nếu giỏ hàng rỗng, quay lại trang giỏ hàng
            return;
        }

        // Tính phí vận chuyển (tạm tính / 10)
//        double shippingFee = cart.getTotal() / 10.0;

        // Truyền thông tin sang JSP
        request.setAttribute("cart", cart);
//        request.setAttribute("shippingFee", shippingFee);
        request.getRequestDispatcher("/WEB-INF/delivery_information.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
