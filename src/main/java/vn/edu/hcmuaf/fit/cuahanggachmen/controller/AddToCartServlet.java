package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ColorDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddToCartServlet", value = "/add-to-cart")
public class AddToCartServlet extends HttpServlet {

    private ProductDao productDao;
    private ColorDao colorDao;

    @Override
    public void init() throws ServletException {
        productDao = new ProductDao();
        colorDao = new ColorDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
//        User user = (User) session.getAttribute("auth"); // Kiểm tra xem người dùng đã đăng nhập chưa
//
//        if (user == null) {
//            // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
//            response.sendRedirect(request.getContextPath() + "/login");
//            return;
//        }
        // Lấy tham số
        String pidStr = request.getParameter("productId");
        String colorIdStr = request.getParameter("colorId");
        String quantityStr = request.getParameter("quantity");

        int productId = Integer.parseInt(pidStr);
        int colorId = Integer.parseInt(colorIdStr);
        int quantity = Integer.parseInt(quantityStr);

        try {
            // Lấy product
            Product product = productDao.findById(productId);

            // Lấy color (nếu cần hiển thị tên màu)
            Color colorObj = colorDao.findById(colorId);
            String colorName = (colorObj != null) ? colorObj.getName() : "No color";

            // Tạo cartItem
            CartItem cartItem = new CartItem();
            cartItem.setProductId(productId);
            cartItem.setProductName(product.getName());
            cartItem.setProductColor(colorName);

            cartItem.setProductImage(product.getImgThumbnail());
            cartItem.setPricePerBox(product.getPricePerBox());
            cartItem.setQuantity(quantity);
            cartItem.setQuantityPerBox(product.getQuantityPerBox());

            // Lấy giỏ hàng từ session

            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }

            // Thêm vào giỏ
            cart.addItem(cartItem);

            // Lưu cart lại session
            session.setAttribute("cart", cart);



            // Chuyển hướng về trang giỏ, hoặc quay lại product detail
//            response.sendRedirect(request.getContextPath() + "/cart");
            // Thay vì chuyển hướng qua /cart, ta chuyển về trang trước (referer)
            String referer = request.getHeader("referer");
            if (referer == null) {
                referer = request.getContextPath() + "/list-product";
            }
            response.sendRedirect(referer);
        } catch (SQLException | ClassNotFoundException |
                 InstantiationException | IllegalAccessException e) {
            e.printStackTrace();
            // Xử lý lỗi tuỳ ý
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}

