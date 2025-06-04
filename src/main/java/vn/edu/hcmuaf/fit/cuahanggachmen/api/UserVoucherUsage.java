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
        String[] ids = request.getParameterValues("ids");
        String price = request.getParameter("price");
        String feevn = request.getParameter("feevn");
        String feedh = request.getParameter("feedh");

        Double feevn1 = Double.parseDouble(feevn);
        Double feedh1 = Double.parseDouble(feedh);
        Double price2 = Double.valueOf(price);

        User u = (User) request.getSession().getAttribute("auth");
        int userId = u.getId();

        VoucherDao vDao = new VoucherDao(handle);
        VoucherUsageDAO voucherUsageDAO = new VoucherUsageDAO(handle);
        AjaxResponse resp = new AjaxResponse();
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        double discount = 0;
        double discountShip = 0;
        double discountOther = 0;
        List<Integer> listVoucherId = new ArrayList<>();

        boolean appliedOrder = false;
        boolean appliedShip = false;

        if (ids != null) {
            for (String id : ids) {
                if (id == null || id.trim().isEmpty()) continue;

                Voucher voucher = vDao.findByID(id);
                if (voucher == null) continue;

                VoucherUsage usage = voucherUsageDAO.findByIdAndUser(voucher.getId(), userId);
                if (usage != null) continue; // đã dùng → bỏ qua

                int type = voucher.getVoucherType(); // 1: ORDER, 2: SHIP, khác: OTHER

                if (type == 1 && !appliedOrder) {
                    discount += voucher.getDiscountValue().doubleValue();
                    listVoucherId.add(voucher.getId());
                    appliedOrder = true;
                    resp.addInt("voucherID", voucher.getId());
                } else if (type == 2 && !appliedShip) {
                    discountShip += voucher.getDiscountValue().doubleValue();
                    listVoucherId.add(voucher.getId());
                    appliedShip = true;
                    resp.addInt("voucherIDShip", voucher.getId());
                } else if (type != 1 && type != 2) {
                    discountOther += voucher.getDiscountValue().doubleValue();
                    listVoucherId.add(voucher.getId());
                    resp.addInt("voucherIDOther",voucher.getId());
                }
            }
        }

// Gán vào cart
        cart.setListVoucherId(listVoucherId);

// Tính tổng giảm giá, kiểm soát không vượt quá phí gốc
        double feevn2 = Math.min(feevn1, discountShip);
        double feedh2 = discount;
        double finalPrice = price2 - feevn2 - feedh2 - discountOther;
        if (finalPrice < 0) finalPrice = 0;

// Trả kết quả
        resp.addDouble("price", finalPrice);
        resp.addDouble("discount", discount);
        resp.addDouble("discountShip", discountShip);
        resp.addDouble("discountOther", discountOther);
        resp.addBool("status", true);

        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
        handle.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xử lý yêu cầu POST
        response.getWriter().println("Hello from POST method!");
    }
}
