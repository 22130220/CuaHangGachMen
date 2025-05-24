package vn.edu.hcmuaf.fit.cuahanggachmen.controller;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.PermissionCheck;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.VoucherDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Cart;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Voucher;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "delivery_information", value = "/delivery_information")
public class Delivery_InfController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "GET"), request, response)) return;

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("auth");

        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("cart"); // Nếu giỏ hàng rỗng, quay lại trang giỏ hàng
            return;
        }

        // Tính phí vận chuyển (tạm tính / 10)
//        double shippingFee = cart.getTotal() / 10.0;
        Handle handle = DBConect.get().open();
        VoucherDao voucherDao = new VoucherDao(handle);
        List<Voucher> listVoucher = voucherDao.findAllUnusedVouchersByUser(user.getId());

        request.setAttribute("Vouchers", listVoucher);
        // Truyền thông tin sang JSP
        request.setAttribute("cart", cart);
//        request.setAttribute("shippingFee", shippingFee);
        request.getRequestDispatcher("/WEB-INF/delivery_information.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "POST"), request, response)) return;
    }
}
