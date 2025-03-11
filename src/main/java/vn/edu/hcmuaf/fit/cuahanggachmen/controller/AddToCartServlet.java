package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ColorDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Cart;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.CartItem;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Color;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "AddToCartServlet", value = "/add-to-cart")
public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Thiết lập response là JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        // Lấy session
        HttpSession session = request.getSession(true);

        try {
            // Lấy tham số từ request
            String pidStr = request.getParameter("productId");
            String colorIdStr = request.getParameter("colorId");
            String quantityStr = request.getParameter("quantity");

            // Chuyển đổi sang kiểu int
            int productId = Integer.parseInt(pidStr);
            int colorId = Integer.parseInt(colorIdStr);
            int quantity = Integer.parseInt(quantityStr);

            // Kết nối database
            Handle handle = DBConect.get().open();
            ProductDao productDao = new ProductDao(handle);
            ColorDao colorDao = new ColorDao(handle);

            // Lấy thông tin product
            Product product = productDao.findById(productId);
            if (product == null) {
                out.print("{\"status\":\"error\",\"message\":\"Không tìm thấy sản phẩm\"}");
                out.flush();
                handle.close();
                return;
            }

            // Lấy thông tin color
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

            // Thêm sản phẩm vào giỏ
            cart.addItem(cartItem);

            // Cập nhật giỏ hàng vào session
            session.setAttribute("cart", cart);
            List<CartItem> list = cart.getItems();
            session.setAttribute("quantity", list.size());

            // Trả về response JSON
            out.print("{\"status\":\"success\",\"message\":\"Đã thêm vào giỏ hàng\",\"quantity\":" + list.size() + "}");
            out.flush();

            // Đóng kết nối
            handle.close();

        } catch (NumberFormatException e) {
            out.print("{\"status\":\"error\",\"message\":\"Dữ liệu đầu vào không hợp lệ\"}");
            out.flush();
        } catch (Exception e) {
            out.print("{\"status\":\"error\",\"message\":\"Có lỗi xảy ra: " + e.getMessage() + "\"}");
            out.flush();
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print("{\"status\":\"error\",\"message\":\"Phương thức không được hỗ trợ\"}");
        out.flush();
    }
}


//package vn.edu.hcmuaf.fit.cuahanggachmen.controller;
//
//import jakarta.servlet.*;
//        import jakarta.servlet.http.*;
//        import jakarta.servlet.annotation.*;
//        import org.jdbi.v3.core.Handle;
//import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ColorDao;
//import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
//import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
//import vn.edu.hcmuaf.fit.cuahanggachmen.model.*;
//
//        import java.io.IOException;
//import java.sql.SQLException;
//import java.util.List;
//
//@WebServlet(name = "AddToCartServlet", value = "/add-to-cart")
//public class AddToCartServlet extends HttpServlet {
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        HttpSession session = request.getSession(true);
//
//        // Lấy tham số
//        String pidStr = request.getParameter("productId");
//        String colorIdStr = request.getParameter("colorId");
//        String quantityStr = request.getParameter("quantity");
//
//        int productId = Integer.parseInt(pidStr);
//        int colorId = Integer.parseInt(colorIdStr);
//        int quantity = Integer.parseInt(quantityStr);
//        Handle handle = DBConect.get().open();
//        ProductDao productDao = new ProductDao(handle);
//        ColorDao colorDao = new ColorDao(handle);
//        // Lấy product
//        Product product = productDao.findById(productId);
//
//        // Lấy color (nếu cần hiển thị tên màu)
//        Color colorObj = colorDao.findById(colorId);
//        String colorName = (colorObj != null) ? colorObj.getName() : "No color";
//
//        // Tạo cartItem
//        CartItem cartItem = new CartItem();
//        cartItem.setProductId(productId);
//        cartItem.setProductName(product.getName());
//        cartItem.setProductColor(colorName);
//
//        cartItem.setProductImage(product.getImgThumbnail());
//        cartItem.setPricePerBox(product.getPricePerBox());
//        cartItem.setQuantity(quantity);
//        cartItem.setQuantityPerBox(product.getQuantityPerBox());
//
//        // Lấy giỏ hàng từ session
//
//        Cart cart = (Cart) session.getAttribute("cart");
//        if (cart == null) {
//            cart = new Cart();
//        }
//
//        // Thêm vào giỏ
//        cart.addItem(cartItem);
//
//        // Lưu cart lại session
//        session.setAttribute("cart", cart);
//        List<CartItem> list = cart.getItems();
//        session.setAttribute("quantity", list.size());
//
//
//        // Chuyển hướng về trang giỏ, hoặc quay lại product detail
////            response.sendRedirect(request.getContextPath() + "/cart");
//        // Thay vì chuyển hướng qua /cart, ta chuyển về trang trước (referer)
//        String referer = request.getHeader("referer");
//        if (referer == null) {
//            referer = request.getContextPath() + "/list-product";
//        }
//        response.sendRedirect(referer);
//
//        handle.close();
//    }
//}