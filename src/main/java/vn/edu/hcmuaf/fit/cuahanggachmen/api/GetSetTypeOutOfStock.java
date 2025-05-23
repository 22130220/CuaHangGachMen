package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.TypeOfReceiptDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.TypeOutOfStockDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.TypeOfReceipt;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.TypeOutOfStock;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "GetSetTypeOutOfStock", value = "/GetSetTypeOutOfStock")
public class GetSetTypeOutOfStock extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        TypeOutOfStockDao typeOutOfStockDao = new TypeOutOfStockDao(handle);
        List<TypeOutOfStock> list = typeOutOfStockDao.findAll();
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

    }
}