package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.StockInDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.StockIn;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.LocalDateTimeAdapter;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "GetSetStockin", value = "/GetSetStockin")
public class GetSetStockin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        StockInDao stockInDao = new StockInDao(handle);
        List<StockIn> list =stockInDao.findAll();
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        int so =0;
        String action = request.getParameter("action");
        StockInDao stockInDao = new StockInDao(handle);
        StockIn stockIn = new StockIn();
        AjaxResponse resp = new AjaxResponse();
        if(action.equalsIgnoreCase("sửa")){
            String id =request.getParameter("id");
            String active = request.getParameter("update_active");
            String userId= request.getParameter("userId");
            String typeId= request.getParameter("type");
            stockIn.setId(Integer.parseInt(id));
            stockIn.setUserId(Integer.parseInt(userId));
            stockIn.setTypeId(Integer.parseInt(typeId));
            stockIn.setActive(Boolean.parseBoolean(active));
            stockIn.setUpdateDate(LocalDateTime.now());
            boolean check=  stockInDao.update(stockIn);
            resp.addBool("success", check);
        }else if(action.equalsIgnoreCase("cp")){
            String[] ids = request.getParameterValues("id");
            String realAcive = request.getParameter("active");
            Boolean isActive = Boolean.parseBoolean(realAcive);
            for (String s : ids) {
                so += stockInDao.updateActive(Integer.parseInt(s), isActive);
            }
            resp.addBool("success", so>0);
        }

        handle.close();
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
    }
}