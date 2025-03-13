package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Cart;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.CartItem;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@WebServlet(name = "DeleteProductController", value = "/deleteproduct")
public class DeleteProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        int productId = Integer.parseInt(request.getParameter("productId"));
        String color = request.getParameter("productColor");
        cart.removeItem(productId,color);

        List<CartItem> items = cart.getItems();
        int size = items.size();
        session.setAttribute("cart", cart);
        session.setAttribute("quantity", size);


        Gson gson = new Gson();
        String json = gson.toJson(Map.of(
                "success", true,
                "totalPrice1", cart.getTotal(),
                "quantity", items.size(),
                "listItems", items
        ));


        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        out.print(json);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {





    }
}