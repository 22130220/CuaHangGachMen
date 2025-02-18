package vn.edu.hcmuaf.fit.cuahanggachmen.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.VoucherDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Cart;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Voucher;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Voucher> vs = new ArrayList<>();
        try {
            vs = new VoucherDao().findAll();
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("vs", vs);
        request.getRequestDispatcher("/WEB-INF/cart.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy action
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }

        if ("remove".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String color = request.getParameter("color");
            cart.removeItem(productId, color);
        }

        if ("update".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String color = request.getParameter("color");
            int newQuantity = Integer.parseInt(request.getParameter("quantity"));
            cart.updateQuantity(productId, color, newQuantity);


        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart");
    }
}
