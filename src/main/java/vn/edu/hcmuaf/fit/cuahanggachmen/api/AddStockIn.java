package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import io.leangen.geantyref.TypeToken;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.StockInDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.StockInDetailDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.StockIn;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.StockInDetail;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "AddStockIn", value = "/AddStockIn")
public class AddStockIn extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JsonObject json = new JsonObject();

        try {
            HttpSession session = request.getSession();
            User user = (User)session.getAttribute("auth");

            BufferedReader reader = request.getReader();
            Type listType = new TypeToken<List<StockInDetail>>() {}.getType();
            List<StockInDetail> detailList = new Gson().fromJson(reader, listType);

            Handle handle = DBConect.get().open();
            StockInDao stockInDao = new StockInDao(handle);
            StockInDetailDao stockInDetailDao = new StockInDetailDao(handle);

            StockIn stockIn = new StockIn();
            stockIn.setUserId(user.getId());
            stockIn.setCreateDate(LocalDateTime.now());
            stockIn.setUpdateDate(LocalDateTime.now());

            int stockInId = stockInDao.insertNhapMua(stockIn);
            System.out.println("Insert StockIn thành công, ID: " + stockInId);

            for (StockInDetail detail : detailList) {
                detail.setStockId(stockInId);
                detail.setTotalPrice(detail.getQuantity() * detail.getUnitPrice());
                stockInDetailDao.insert(detail);
                System.out.println("Thêm chi tiết: " + detail);
            }

            handle.close();
            json.addProperty("success", true);
        } catch (Exception e) {
            System.out.println("LỖI: " + e.getMessage());
            e.printStackTrace();
            json.addProperty("success", false);
            json.addProperty("error", e.getMessage());
        }

        out.print(json);
        out.flush();
    }
}