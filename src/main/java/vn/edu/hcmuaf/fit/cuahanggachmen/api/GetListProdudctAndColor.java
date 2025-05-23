package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ColorDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.TypeOfReceiptDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.TypeOutOfStockDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Color;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.TypeOfReceipt;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.TypeOutOfStock;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.LocalDateTimeAdapter;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "GetListProdudctAndColor", value = "/GetListProdudctAndColor")
public class GetListProdudctAndColor extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (Handle handle = DBConect.get().open()) {
            ProductDao productDao = new ProductDao(handle);
            ColorDao colorDao = new ColorDao(handle);
            TypeOfReceiptDao typeOfReceiptDao = new TypeOfReceiptDao(handle);
            TypeOutOfStockDao typeOutOfStockDao = new TypeOutOfStockDao(handle);
            Gson gson = new GsonBuilder()
                    .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter()) // Hỗ trợ LocalDateTime
                    .setPrettyPrinting()
                    .create();
            List<Product> productList = productDao.findAll();
            List<Color> colorList = colorDao.findAll();
            List<TypeOfReceipt> typeList = typeOfReceiptDao.findAllActive();
            List<TypeOutOfStock> typeOutOfStockList = typeOutOfStockDao.findAllisActive();
            Map<String, Object> data = new HashMap<>();
            data.put("productList", productList);
            data.put("colorList", colorList);
            data.put("typeList", typeList);
            data.put("typeoutList", typeOutOfStockList);

            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write(gson.toJson(data));
        } catch (Exception e) {
            e.printStackTrace(); // Log ra để bạn xem
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi server: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}