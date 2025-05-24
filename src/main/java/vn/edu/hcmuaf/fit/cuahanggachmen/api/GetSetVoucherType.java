package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.PermissionCheck;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.VoucherTypeDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Voucher;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.VoucherType;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "GetSetVoucherType", value = "/GetSetVoucherType")
public class GetSetVoucherType extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "GET"), request, response)) return;

        Handle handle = DBConect.get().open();
        VoucherTypeDao voucherTypeDao = new VoucherTypeDao(handle);
        List<VoucherType> list =voucherTypeDao.getList();
        Gson gson = new Gson();
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "POST"), request, response)) return;

        Handle handle = DBConect.get().open();
        int so=0;
        String active = null;
        String action = request.getParameter("action");
        AjaxResponse resp = new AjaxResponse();
        VoucherType vouchertype = new VoucherType();
        VoucherTypeDao voucherTypeDao = new VoucherTypeDao(handle);
        if(action.equalsIgnoreCase("Thêm")){
            String type = request.getParameter("type");
            vouchertype.setName(type);
            vouchertype.setActive(true);
             so=voucherTypeDao.insert(vouchertype);

        }else if(action.equalsIgnoreCase("sửa")){
            String id = request.getParameter("id");
            String name = request.getParameter("type");
            active = request.getParameter("update_active");
            boolean isActive = Boolean.parseBoolean(active);
            int id1=Integer.parseInt(id);
            vouchertype.setId(id1);
            vouchertype.setName(name);
            vouchertype.setActive(isActive);
             so=voucherTypeDao.update(vouchertype);
        }else if (action.equalsIgnoreCase("cp")) {
            String[] ids = request.getParameterValues("id");
            String realAcive = request.getParameter("active");
            Boolean isActive = Boolean.parseBoolean(realAcive);
            for (String s : ids) {
                so += voucherTypeDao.updateActive(Integer.parseInt(s), isActive);
            }
        }
        resp.addBool("success",so>0);
        handle.close();
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
    }
}