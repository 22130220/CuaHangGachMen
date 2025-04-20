package vn.edu.hcmuaf.fit.cuahanggachmen.api;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.VoucherDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.VoucherUsageDAO;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Cart;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Voucher;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.VoucherUsage;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserVoucherUsage", value = "/user/voucher")
public class UserVoucherUsage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        String code = request.getParameter("code");
        String code2 = request.getParameter("code2");
        String price =request.getParameter("price");
        Double price2 = Double.valueOf(price);
        User u = (User) request.getSession().getAttribute("auth");
        int userId = u.getId();

        VoucherDao vDao = new VoucherDao(handle);
        Voucher vcOrder = (code != null && !code.isEmpty()) ? vDao.findByID(code) : null;
        Voucher vcShip = (code2 != null && !code2.isEmpty()) ? vDao.findByID(code2) : null;

        VoucherUsageDAO voucherUsageDAO = new VoucherUsageDAO(handle);
        VoucherUsage voucherUsageOrder = (vcOrder != null) ? voucherUsageDAO.findByIdAndUser(vcOrder.getId(), userId) : null;
        VoucherUsage voucherUsageShip  = (vcShip != null)  ? voucherUsageDAO.findByIdAndUser(vcShip.getId(), userId)  : null;

        AjaxResponse resp = new AjaxResponse();
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        List<Integer> listVoucherId = new ArrayList<>();

        double discount = 0;
        double discountShip = 0;

// Logic áp dụng voucher theo điều kiện
        if (vcOrder != null && voucherUsageOrder != null && vcShip != null) {
            // Dùng order, còn ship
            listVoucherId.add(vcShip.getId());
            discountShip = vcShip.getDiscountValue().doubleValue();
            resp.addInt("voucherIDShip", vcShip.getId());
            System.out.println("Đã dùng order, áp dụng ship.");
        } else if (vcShip != null && voucherUsageShip != null && vcOrder != null) {
            // Dùng ship, còn order
            listVoucherId.add(vcOrder.getId());
            discount = vcOrder.getDiscountValue().doubleValue();
            resp.addInt("voucherID", vcOrder.getId());
            System.out.println("Đã dùng ship, áp dụng order.");
        } else {
            // Cả hai chưa dùng hoặc chỉ gửi 1 mã và chưa dùng
            if (vcOrder != null && voucherUsageOrder == null) {
                listVoucherId.add(vcOrder.getId());
                discount = vcOrder.getDiscountValue().doubleValue();
                resp.addInt("voucherID", vcOrder.getId());
            }
            if (vcShip != null && voucherUsageShip == null) {
                listVoucherId.add(vcShip.getId());
                discountShip = vcShip.getDiscountValue().doubleValue();
                resp.addInt("voucherIDShip", vcShip.getId());
            }
            System.out.println("Áp dụng những mã còn lại chưa dùng.");
        }

// Gán vào cart
        cart.setListVoucherId(listVoucherId);

// Gửi response
        double finalPrice = price2 - discount - discountShip;
        if (finalPrice < 0) {
            finalPrice = 0;
        }

        resp.addDouble("price", finalPrice);
        resp.addDouble("discount", discount);
        resp.addDouble("discountShip", discountShip);
        resp.addBool("status", true);

        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
        handle.close();
//        resp.addBool("status", status);
//        response.setStatus(HttpServletResponse.SC_OK);
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        PrintWriter out = response.getWriter();
//        out.print(resp.getText());
//        handle.close();




//        if(!status) {
//            VoucherDao vDao = new VoucherDao(handle);
//            Voucher vs = null;
//            vs = vDao.findByName(code).orElse(null);
//            if(vs != null) {
//                HttpSession session = request.getSession();
//                Cart cart = (Cart)session.getAttribute("cart");
//                cart.setDiscount(vs.getDiscountValue().doubleValue());
//                cart.setVoucherId(vs.getId());
//                resp.addDouble("discount", vs.getDiscountValue().doubleValue());
//                resp.addInt("voucherID", vs.getId()); // Trả về ID của voucher
//            } else status = true;
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xử lý yêu cầu POST
        response.getWriter().println("Hello from POST method!");
    }
}
