package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Category;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductDetailController", value = "/pdetail")
public class ProductDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pidParam = request.getParameter("pid");
        String colorParam = request.getParameter("color");

        Product product = null;
        Handle handle = DBConect.get().open();
        ProductDao productDao = new ProductDao(handle);

        try {
            // Lấy ID sản phẩm từ request
            int productId = Integer.parseInt(pidParam);
            int colorId = colorParam != null ? Integer.parseInt(colorParam) : 0;

            //Thêm lượt xem vào product_view
            if (colorParam == null || colorParam.isEmpty()) {
                productDao.updateProductView(productId);
            }

            // Lấy thông tin sản phẩm từ DAO
            product = productDao.findById(productId);

            // Lay ra danh sach san pham cung nha san xuat
            List<Product> relatedProducts = productDao.findRelatedProducts(product.getManufacturerId(), productId);
            request.setAttribute("relatedProducts", relatedProducts);


            // Nếu có colorId, cập nhật danh sách ảnh theo màu sắc được chọn
            if (colorId > 0) {
                product.setImgList(productDao.findImagesByColor(productId, colorId));
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product or color ID");
            handle.close();
            return;
        }
        // Đặt sản phẩm vào request attribute để hiển thị trên JSP
        request.setAttribute("p", product);

        handle.close();
        // Chuyển tiếp đến trang chi tiết sản phẩm
        request.getRequestDispatcher("/WEB-INF/product-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pidParam = request.getParameter("pid");
        String colorParam = request.getParameter("color");

        Product product = null;
        Handle handle = DBConect.get().open();
        ProductDao productDao = new ProductDao(handle);

        try {
            // Lấy ID sản phẩm từ request
            int productId = Integer.parseInt(pidParam);
            int colorId = colorParam != null ? Integer.parseInt(colorParam) : 0;

            //Thêm lượt xem vào product_view
            if (colorParam == null || colorParam.isEmpty()) {
                productDao.updateProductView(productId);
            }

            // Lấy thông tin sản phẩm từ DAO
            product = productDao.findById(productId);

            // Lay ra danh sach san pham cung nha san xuat
            List<Product> relatedProducts = productDao.findRelatedProducts(product.getManufacturerId(), productId);
            request.setAttribute("relatedProducts", relatedProducts);


            // Nếu có colorId, cập nhật danh sách ảnh theo màu sắc được chọn
            if (colorId > 0) {
                product.setImgList(productDao.findImagesByColor(productId, colorId));
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product or color ID");
            handle.close();
            return;
        }
        Gson gson = new Gson();
        String json = gson.toJson(Map.of(
                "success", true,
                "listImg", product.getImgList()
        ));
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        out.print(json);
    }
}
