package vn.edu.hcmuaf.fit.cuahanggachmen.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.VoucherDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Cart;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.CartItem;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Voucher;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
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

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart == null) {
            cart = new Cart();
        }
        List<CartItem> list = cart.getItems();
        int size = list.size();
        int page, numperpage=5;
        int num = (size % numperpage == 0 ? (size / numperpage) : ((size / numperpage) + 1));// số trangv
        String xpage = request.getParameter("xpage");

        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }

        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);

        ArrayList<CartItem> list1 =getListBypage(list, start, end);
//        AjaxResponse resp = new AjaxResponse();
        request.setAttribute("listo", list1);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
//        resp.addInt("page", page);
//        resp.addInt("num", num);
//
//
//        response.setStatus(HttpServletResponse.SC_OK);
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        PrintWriter out = response.getWriter();
//        out.print(resp.getText());



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

    public static ArrayList<CartItem> getListBypage(List<CartItem> list, int start, int end) {
        ArrayList<CartItem> arr = new ArrayList<CartItem>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
}
