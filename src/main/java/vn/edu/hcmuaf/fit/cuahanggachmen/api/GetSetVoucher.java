package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.PermissionCheck;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.SpecTypeDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.StockInDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.VoucherDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.SpecType;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.StockIn;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Voucher;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxParseRequest;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.LocalDateTimeAdapter;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "GetSetVoucher", value = "/admin/voucher")
public class GetSetVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "GET"), request, response)) return;

        Handle handle = DBConect.get().open();
        VoucherDao voucherDao = new VoucherDao(handle);
        List<Voucher> list =voucherDao.findAll1();
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter()) // Hỗ trợ LocalDateTime
                .setPrettyPrinting()
                .create();
        Map<String, Object> responseMap = new HashMap<>();
        responseMap.put("data", list);
        String json = gson.toJson(responseMap);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
        handle.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "POST"), request, response)) return;

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
            String typeid = request.getParameter("type1");
            c.setVoucherType(Integer.parseInt(typeid));
            c.setCode(code);
            c.setActive(getBoolVal(active));
            c.setExpireDate(LocalDateTime.parse(expireDate));
            c.setDiscountValue(BigDecimal.valueOf(Double.parseDouble(discountValue.replaceAll("[^0-9]", ""))));
            success = dao.insert(c);
        } else if(action.equalsIgnoreCase("Cập nhật")) {
            String typeid = request.getParameter("type");
            c.setVoucherType(Integer.parseInt(typeid));
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