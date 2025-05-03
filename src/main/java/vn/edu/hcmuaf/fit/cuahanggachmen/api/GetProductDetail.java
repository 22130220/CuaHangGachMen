package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.*;
import com.google.zxing.LuminanceSource;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.controller.ContactManagerDetailController;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "GetProductDetail", value = "/get-pdetail")
public class GetProductDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pidParam = request.getParameter("pid");
        String colorParam = request.getParameter("color");

        Product product = null;
        List<Product> relatedProducts = new ArrayList<>();
        Handle handle = DBConect.get().open();
        ProductDao productDao = new ProductDao(handle);
        AjaxResponse resp = new AjaxResponse();
        try {
            int productId = Integer.parseInt(pidParam);
            int colorId = colorParam != null ? Integer.parseInt(colorParam) : 0;

            if (colorParam == null || colorParam.isEmpty()) {
                productDao.updateProductView(productId);
            }

            product = productDao.findById(productId);

            relatedProducts = productDao.findRelatedProducts(product.getManufacturerId(), productId);
            request.setAttribute("relatedProducts", relatedProducts);

            if (colorId > 0) {
                product.setImgList(productDao.findImagesByColor(productId, colorId));
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product or color ID");
            handle.close();
            return;
        }
        request.setAttribute("p", product);

        handle.close();

//        resp.addProductList(List.of(product));
//        resp.addReleatedProductList(relatedProducts);

        Map<String, List<Product>> map = new HashMap<>();
        map.put("product", List.of(product));
        map.put("relatedProducts", relatedProducts);
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                .create();
        String text = gson.toJson(map);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(text);

        handle.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private static class LocalDateTimeAdapter implements JsonSerializer<LocalDateTime>, JsonDeserializer<LocalDateTime> {
        private static final DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;

        @Override
        public JsonElement serialize(LocalDateTime src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive(formatter.format(src));
        }

        @Override
        public LocalDateTime deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
                throws JsonParseException {
            return LocalDateTime.parse(json.getAsString(), formatter);
        }
    }
}