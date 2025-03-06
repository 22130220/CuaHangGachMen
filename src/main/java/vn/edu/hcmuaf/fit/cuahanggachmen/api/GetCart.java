package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Cart;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.CartItem;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GetCart", value = "/get-cart")
public class GetCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String num_page = request.getParameter("xpage");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        List<CartItem> lst = new ArrayList<CartItem>();

        List<CartItem> list = cart.getItems();
        int size = list.size();
        int page, numperpage=5;
        int num = (size % numperpage == 0 ? (size / numperpage) : ((size / numperpage) + 1));// số trangv

        if (num_page == null) {
            page = 1;
        } else {
            page = Integer.parseInt(num_page);
        }

        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);

        list = getListBypage(list, start, end);

        AjaxResponse resp = new AjaxResponse();
        resp.addBool("success", true);
        resp.addCartItem(list);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());

    }

    public static ArrayList<CartItem> getListBypage(List<CartItem> list, int start, int end) {
        ArrayList<CartItem> arr = new ArrayList<CartItem>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
}