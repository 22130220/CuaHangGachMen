package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.SpecTypeDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.VoucherDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.SpecType;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Voucher;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxParseRequest;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GetSetVoucher", value = "/admin/voucher")
public class GetSetVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        List<Voucher> ls = new ArrayList<Voucher>();
        VoucherDao dao = new VoucherDao(handle);
        ls = dao.findAll();

        AjaxResponse resp = new AjaxResponse();
        resp.addVoucherList(ls);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
        handle.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String discountValue = request.getParameter("discountValue");
        String expireDate = request.getParameter("expireDate");
        String active = request.getParameter("active");
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        int success = 0;
        Handle handle = DBConect.get().open();
        VoucherDao dao = new VoucherDao(handle);
        Voucher c = new Voucher();

        if(action.equalsIgnoreCase("Thêm")) {
            c.setCode(code);
            c.setActive(getBoolVal(active));
            c.setExpireDate(LocalDateTime.parse(expireDate));
            c.setDiscountValue(BigDecimal.valueOf(Double.parseDouble(discountValue.replaceAll("[^0-9]", ""))));
            success = dao.insert(c);
        } else if(action.equalsIgnoreCase("Cập nhật")) {
            c.setId(Integer.parseInt(id));
            c.setCode(code);
            c.setActive(getBoolVal(active));
            c.setExpireDate(LocalDateTime.parse(expireDate));
            c.setDiscountValue(BigDecimal.valueOf(Double.parseDouble(discountValue.replaceAll("[^0-9]", ""))));
            success = dao.update(c);
        } else if(action.equalsIgnoreCase("Xoá")) {
            String[] deleteId = AjaxParseRequest.parse(id);
            boolean realAcive = getBoolVal(active);
            for (String s : deleteId) {
                success += dao.updateActive(Integer.parseInt(s), realAcive);
            }

        }


        AjaxResponse resp = new AjaxResponse();
        resp.addBool("success", success > 0);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
        handle.close();
    }

    private boolean getBoolVal(String value) {
        if(value.equalsIgnoreCase("true")) return true;
        else if(value.equalsIgnoreCase("false")) return false;
        return false;
    }
}