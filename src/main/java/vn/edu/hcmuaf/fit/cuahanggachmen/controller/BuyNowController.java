package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ColorDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Cart;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.CartItem;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Color;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "BuyNowController", value = "/buynow")
public class BuyNowController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        int productId = Integer.parseInt(request.getParameter("pid"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int colorid = Integer.parseInt(request.getParameter("colorId"));
        Handle handle = DBConect.get().open();
        ProductDao dao = new ProductDao(handle);
        ColorDao colorDao= new ColorDao(handle);
        Product pd = dao.findById(productId);
        Color c = colorDao.findById(colorid);

        CartItem ci = new CartItem(pd.getId(),pd.getName(),c.getName(),pd.getImgThumbnail(),pd.getPricePerBox(),quantity,pd.getQuantityPerBox());
        cart.addItem(ci);
        List<CartItem> list = cart.getItems();
        int size= list.size();
        session.setAttribute("quantity", size);
        session.setAttribute("cart", cart);
        handle.close();
        RequestDispatcher rd = request.getRequestDispatcher("/cart");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}