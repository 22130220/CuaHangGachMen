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

@WebServlet(name = "UserVoucherUsage", value = "/user/voucher")
public class UserVoucherUsage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        String code = request.getParameter("code");
        User u = (User) request.getSession().getAttribute("auth");
        VoucherUsage voucherUsage = new VoucherUsage();
        int id = u.getId();
        boolean status = false;
        double discount = 0;

        VoucherUsageDAO dao = new VoucherUsageDAO(handle);
        voucherUsage = dao.findByCodeAndUser(code, id).orElse(null);

        status = voucherUsage != null;

        AjaxResponse resp = new AjaxResponse();

        if(!status) {
            VoucherDao vDao = new VoucherDao(handle);
            Voucher vs = null;
            vs = vDao.findByName(code).orElse(null);
            if(vs != null) {
                HttpSession session = request.getSession();
                Cart cart = (Cart)session.getAttribute("cart");
                cart.setDiscount(vs.getDiscountValue().doubleValue());
                cart.setVoucherId(vs.getId());
                resp.addDouble("discount", vs.getDiscountValue().doubleValue());
                resp.addInt("voucherID", vs.getId()); // Trả về ID của voucher
            } else status = true;
        }
        resp.addBool("status", status);
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
