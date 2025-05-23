package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OutOfStockDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OutOfStockDetailDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.StockInDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.StockInDetailDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.wrapper.OutOfStockRequest;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.wrapper.StockInRequest;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "AddOutOfStock", value = "/AddOutOfStock")
public class AddOutOfStock extends HttpServlet {

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
            OutOfStockRequest outOfStockRequest = new Gson().fromJson(reader, OutOfStockRequest.class);

            List<OutOfStockDetail> detailList = outOfStockRequest.getOutOfStockDetails();
            int typeid = outOfStockRequest.getTypeid();

            Handle handle = DBConect.get().open();
            OutOfStockDao outOfStockDao = new OutOfStockDao(handle);
            OutOfStockDetailDao outOfStockDetailDao = new OutOfStockDetailDao(handle);

            OutOfStock outOfStock = new OutOfStock();
            outOfStock.setUserId(user.getId());
            outOfStock.setCreatedDate(LocalDateTime.now());
            outOfStock.setUpdatedDate(LocalDateTime.now());
            outOfStock.setTypeId(typeid);

            int outofstockId = outOfStockDao.insert(outOfStock);
            System.out.println("Insert OutOfStock thành công, ID: " + outofstockId);

            for (OutOfStockDetail detail : detailList) {
                detail.setOutOfStockId(outofstockId);
                detail.setTotalPrice(detail.getQuantity() * detail.getUnitPrice());
                outOfStockDetailDao.insert(detail);
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