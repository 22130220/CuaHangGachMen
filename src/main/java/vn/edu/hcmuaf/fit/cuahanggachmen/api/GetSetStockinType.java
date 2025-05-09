package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.TypeOfReceiptDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.VoucherTypeDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.TypeOfReceipt;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.VoucherType;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "GetSetStockinType", value = "/GetSetStockinType")
public class GetSetStockinType extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        TypeOfReceiptDao typeOfReceiptDao = new TypeOfReceiptDao(handle);
        List<TypeOfReceipt> list = typeOfReceiptDao.findAll();
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

        Handle handle = DBConect.get().open();
        int so=0;
        String active = null;
        String action = request.getParameter("action");
        AjaxResponse resp = new AjaxResponse();
        TypeOfReceipt typeOfReceipt = new TypeOfReceipt();
        TypeOfReceiptDao typeOfReceiptDao = new TypeOfReceiptDao(handle);
        if(action.equalsIgnoreCase("Thêm")){
            String type = request.getParameter("type");
            typeOfReceipt.setType(type);
            typeOfReceipt.setActive(true);
            so=typeOfReceiptDao.insert(typeOfReceipt);

        }else if(action.equalsIgnoreCase("sửa")){
            String id = request.getParameter("id");
            String name = request.getParameter("type");
            active = request.getParameter("update_active");
            boolean isActive = Boolean.parseBoolean(active);
            int id1=Integer.parseInt(id);
            typeOfReceipt.setId(id1);
            typeOfReceipt.setType(name);
            typeOfReceipt.setActive(isActive);
            so=typeOfReceiptDao.update(typeOfReceipt);
        }else if (action.equalsIgnoreCase("cp")) {
            String[] ids = request.getParameterValues("id");
            String realAcive = request.getParameter("active");
            Boolean isActive = Boolean.parseBoolean(realAcive);
            for (String s : ids) {
                so += typeOfReceiptDao.updateActive(Integer.parseInt(s), isActive);
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