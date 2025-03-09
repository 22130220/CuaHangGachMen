package vn.edu.hcmuaf.fit.cuahanggachmen.controller;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.VoucherDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Cart;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.CartItem;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Voucher;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        List<Voucher> vs = new ArrayList<>();
        vs = new VoucherDao(handle).findAll();
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
        request.setAttribute("listo", list1);
        request.setAttribute("page", page);
        request.setAttribute("num", num);

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
        int productId = Integer.parseInt(request.getParameter("productId"));
        String color = request.getParameter("color");
        if ("remove".equals(action)) {
            cart.removeItem(productId, color);
        }

        if ("update".equals(action)) {
            int newQuantity = Integer.parseInt(request.getParameter("quantity"));
            cart.updateQuantity(productId, color, newQuantity);
        }

        session.setAttribute("cart", cart);

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
//        JsonObject object1 = JsonParser.parseString(gson.toJson(cart)).getAsJsonObject();
        JsonObject object2 = JsonParser.parseString(gson.toJson(Map.of(
                "status", true,
                "totalPrice", cart.getTotal(),
                "thisElementPrice", cart.getItems().stream().filter(n -> n.getProductId() == productId && n.getProductColor().equals(color)).findFirst().orElse(null).getTotalPrice()
        ))).getAsJsonObject();

//        for (String key : object2.keySet()) {
//            object1.add(key, object2.get(key));
//        }

        String resp = gson.toJson(object2);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp);
    }

    public static ArrayList<CartItem> getListBypage(List<CartItem> list, int start, int end) {
        ArrayList<CartItem> arr = new ArrayList<CartItem>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
}
