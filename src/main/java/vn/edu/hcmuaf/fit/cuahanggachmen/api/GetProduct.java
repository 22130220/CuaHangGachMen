package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxParseRequest;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;

@MultipartConfig
@WebServlet(name = "get-product", value = "/admin/get-product")
public class GetProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        ProductDao pDao = new ProductDao(handle);
        CategoryDao cDao = new CategoryDao(handle);
        ManufacturerDao mDao = new ManufacturerDao(handle);
        SizeDao sDao = new SizeDao(handle);
        MaterialDao mtDao = new MaterialDao(handle);
        List<Product> ls = null;
        ls = pDao.findAll();
        List<Category> cs = cDao.findAll();
        List<Manufacturer> ms = mDao.findAll();
        List<Size> ss = sDao.findAll();
        List<Material> materials = mtDao.findAll();

        AjaxResponse resp = new AjaxResponse();
        resp.addProductList(ls);
        resp.addCategoryList(cs);
        resp.addManufacturerList(ms);
        resp.addSizeList(ss);
        resp.addMaterialList(materials);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());

        handle.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String active = request.getParameter("active");
        String action = request.getParameter("action");
        String id = request.getParameter("vid");
        String vid = request.getParameter("id");

        String name = request.getParameter("name");
        String size = request.getParameter("size");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");
        String category = request.getParameter("category");
        String material = request.getParameter("material");
        String manufacturer = request.getParameter("manufacturer");
        String promotion = request.getParameter("promotion");
        String img = request.getParameter("img");


        Handle handle = DBConect.get().open();
        int success = 0;
        ProductDao dao = new ProductDao(handle);
        Product c = new Product();

        if(action.equalsIgnoreCase("Thêm")) {
            c.setName(name);
            c.setStatus(getBoolVal(active));
//            try {
//               // success = dao.insert(c);
//            } catch (SQLException | IllegalAccessException | InstantiationException | ClassNotFoundException e) {
//                throw new RuntimeException(e);
//            }
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

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productName = req.getParameter("name");
        String productPrice = req.getParameter("price");
        String size = req.getParameter("size");
        String category = req.getParameter("category");
        String manufacturer = req.getParameter("manufacturer");
        String quantity = req.getParameter("quantity");
        String material  = req.getParameter("material");
        String promotion = req.getParameter("promotion");
        String img = req.getParameter("img");
        String vid = req.getParameter("vid");

        JsonObject json = new JsonObject();

        Handle handle = DBConect.get().open();
        int success = 0;
        ProductDao dao = new ProductDao(handle);
        Product c = new Product();

        try {
            c.setId(Integer.parseInt(vid));
            c.setName(productName);
            c.setSizeId(Integer.parseInt(size));
            c.setCategoryId(Integer.parseInt(category));
            c.setManufacturerId(Integer.parseInt(manufacturer));
            c.setMaterialId(Integer.parseInt(material));
            c.setPricePerBox(Integer.parseInt(productPrice.replaceAll("[^0-9]", "")));
            promotion = promotion.replaceAll("[^0-9]", "");
            boolean isDiscount = !(promotion.equals("") || promotion.equals("0"));
            c.setDiscount(isDiscount);
            if(isDiscount) {
                c.setPromotionPrice(BigDecimal.valueOf(Double.parseDouble(promotion)));
            }
            c.setQuantityPerBox(Integer.parseInt(quantity.replaceAll("[^0-9]", "")));
            c.setImgThumbnail(img);
            success = dao.update(c);

            json.addProperty("success", success > 0);

            resp.setStatus(HttpServletResponse.SC_OK);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");

            PrintWriter out = resp.getWriter();
            out.print(json.toString());
        } catch (NumberFormatException e) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String active = req.getParameter("update_active_id");
        boolean realActive = getBoolVal(active);
        String jsonData = readPartToString(req.getPart("setActive"));
        int success = 0;
        Gson gson = new Gson();
        JsonArray setActiveArray = gson.fromJson(jsonData, JsonArray.class);

        JsonArray activated = new JsonArray();

        try(Handle handle = DBConect.get().open()) {
            for (JsonElement s : setActiveArray) {
                int parseIntergerIndex = Integer.parseInt(s.getAsString());
                int indexUpdated = new ProductDao(handle).updateActive(parseIntergerIndex, realActive);
                if (indexUpdated > 0) {
                   activated.add(parseIntergerIndex);
                   success++;
                }
            }
        }
        JsonObject json = new JsonObject();
        json.addProperty("success", success > 0);
        json.addProperty("active", realActive);
        if (success > 0) {
            json.add("activated", activated);
        }

        resp.setStatus(HttpServletResponse.SC_OK);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        PrintWriter out = resp.getWriter();
        out.print(json.toString());
    }

    private String readPartToString(Part part) throws IOException {
        if (part == null) return null;

        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(part.getInputStream(), "UTF-8"))) {
            StringBuilder stringBuilder = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                stringBuilder.append(line);
            }
            return stringBuilder.toString();
        }
    }

    private boolean getBoolVal(String value) {
        if(value.equalsIgnoreCase("true")) return true;
        else if(value.equalsIgnoreCase("false")) return false;
        return false;
    }

}