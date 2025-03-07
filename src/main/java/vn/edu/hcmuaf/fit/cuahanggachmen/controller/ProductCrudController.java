package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.*;

import java.io.*;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "productcrud", value = "/admin/productcrud")
public class ProductCrudController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");
        String message = null;
        String operation = null;

        Handle handle = DBConect.get().open();
        CategoryDao categoryDao = new CategoryDao(handle);
        MaterialDao materialDao = new MaterialDao(handle);
        ManufacturerDao manufacturerDao = new ManufacturerDao(handle);
        SizeDao sizeDao = new SizeDao(handle);
        ProductDao productDao = new ProductDao(handle);
        Product product = null;

        List<Category> categories = null;
        List<Size> sizes = null;
        List<Manufacturer> manufacturers = null;
        List<Material> materials = null;

            categories = categoryDao.findAll();
            sizes = sizeDao.findAll();
            manufacturers = manufacturerDao.findAll();
            materials = materialDao.findAll();
            if (pid != null) {
                product = productDao.findById(Integer.parseInt(pid));
                message = product.getName();
                operation = "Cập nhật";
            } else {
                product = new Product();
                message = "Thêm sản phẩm";
                operation = "Thêm";
            }


        request.setAttribute("categories", categories);
        request.setAttribute("sizes", sizes);
        request.setAttribute("manufacturers", manufacturers);
        request.setAttribute("materials", materials);
        request.setAttribute("operation", operation);
        request.setAttribute("p", product);
        request.setAttribute("message", message);
        handle.close();
        request.getRequestDispatcher("/WEB-INF/admin_addproduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("name");
        String productSize = request.getParameter("size");
        String productQuantity = request.getParameter("quantity");
        String productPrice = request.getParameter("price");
        String productPricePromotion = request.getParameter("price_promotion");
        String productCategory = request.getParameter("category");
        String productMaterial = request.getParameter("material");
        String productManufacturer = request.getParameter("manufacturer");
        String productDes = request.getParameter("editor");
        String path = null;
        int success = 0;

        if (productName != null && !productName.isEmpty()) {
            ServletContext context = getServletContext();
            String serverPath = context.getRealPath("");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
            LocalDateTime now = LocalDateTime.now();
            path = "upload/ProductDes/" + now.format(formatter) + "_" + productName + ".jsp";
            String absolutePath = serverPath + path;

            // Đọc file
            File file = new File(absolutePath);
            if (!file.exists()) {
                if (file.createNewFile()) {
                    PrintWriter out = new PrintWriter(new OutputStreamWriter(new FileOutputStream(absolutePath), StandardCharsets.UTF_8), true);
                    out.println(productDes);
                    out.close();
                }
            }

            Handle handle = DBConect.get().open();
            ProductDao productDao = new ProductDao(handle);
            Product product = new Product();
            product.setDescription(path);
            product.setName(productName);
            product.setSizeId(Integer.parseInt(productSize));
            product.setQuantityPerBox(Integer.parseInt(productQuantity));
            product.setPricePerBox(Integer.parseInt(productPrice));
            product.setPromotionPrice(BigDecimal.valueOf(Double.parseDouble(productPricePromotion)));
            product.setCategoryId(Integer.parseInt(productCategory));
            product.setManufacturerId(Integer.parseInt(productManufacturer));
            product.setMaterialId(Integer.parseInt(productMaterial));

            success = productDao.insert(product);

            if (success > 0) {
                String[] specValue = request.getParameterValues("value");
                String[] specId = request.getParameterValues("id");

                String[] colorValue = request.getParameterValues("color");
                String[] colorId = request.getParameterValues("color_id");

                if(specId != null) {
                    ProductSpecDao productSpecDao = new ProductSpecDao(handle);
                    for(int i = 0; i < specValue.length; i++) {
                        ProductSpec productSpec = new ProductSpec();
                        productSpec.setSpecId(Integer.parseInt(specId[i]));
                        productSpec.setSpecName(specValue[i]);
                        productSpec.setProcuctId(success);
                        productSpecDao.insert(productSpec);
                    }
                }

                if(colorId != null) {
                    ProductColorImgDao productColorImgDao = new ProductColorImgDao(handle);
                    for(int i = 0; i < colorValue.length; i++) {
                        ProductColorImg productColorImg = new ProductColorImg();
                        productColorImg.setColorId(Integer.parseInt(colorId[i]));
                        productColorImg.setUrl(colorValue[i]);
                        productColorImg.setProductId(success);

                        productColorImgDao.insert(productColorImg.getColorId(), productColorImg.getProductId(), productColorImg.getUrl());
                    }
                }

                //request.setAttribute("success", success);
                handle.close();
                request.getRequestDispatcher("/WEB-INF/admin_manageproduct.jsp").forward(request, response);
            } else {
                handle.close();
                response.setStatus(HttpServletResponse.SC_CONFLICT);
            }
        }
    }
}