package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.CategoryDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Category;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxParseRequest;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "get-product", value = "/admin/get-product")
public class GetProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        ProductDao pDao = new ProductDao(handle);
        List<Product> ls = null;
        ls = pDao.findAll();

        AjaxResponse resp = new AjaxResponse();
        resp.addProductList(ls);
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
        } else if(action.equalsIgnoreCase("Cập nhật")) {
            c.setId(Integer.parseInt(id));
            c.setName(name);
            c.setSizeId(Integer.parseInt(size));
            c.setCategoryId(Integer.parseInt(category));
            c.setManufacturerId(Integer.parseInt(manufacturer));
            c.setMaterialId(Integer.parseInt(material));
            c.setPricePerBox(Integer.parseInt(price.replaceAll("[^0-9]", "")));
            promotion = promotion.replaceAll("[^0-9]", "");
            boolean isDiscount = !(promotion.equals("") || promotion.equals("0"));
            c.setDiscount(isDiscount);
            if(isDiscount) {
                c.setPromotionPrice(BigDecimal.valueOf(Double.parseDouble(promotion)));
            }
            c.setQuantityPerBox(Integer.parseInt(quantity.replaceAll("[^0-9]", "")));
            c.setImgThumbnail(img);
            success = dao.update(c);
        } else if(action.equalsIgnoreCase("Xoá")) {
            String[] deleteId = AjaxParseRequest.parse(vid);
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