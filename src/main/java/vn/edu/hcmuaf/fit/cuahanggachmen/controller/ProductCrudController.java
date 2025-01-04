package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "productcrud", value = "/admin/productcrud")
public class ProductCrudController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");
        String message = null;
        String operation = null;

        CategoryDao categoryDao = new CategoryDao();
        MaterialDao materialDao = new MaterialDao();
        ManufacturerDao manufacturerDao = new ManufacturerDao();
        SizeDao sizeDao = new SizeDao();
        ProductDao productDao = new ProductDao();
        Product product = null;

        List<Category> categories = null;
        List<Size> sizes = null;
        List<Manufacturer> manufacturers = null;
        List<Material> materials = null;

        try {
            categories = categoryDao.findAll();
            sizes = sizeDao.findAll();
            manufacturers = manufacturerDao.findAll();
            materials = materialDao.findAll();
            if(pid != null) {
                product = productDao.findById(Integer.parseInt(pid));
                message = product.getName();
                operation = "Cập nhật";
            } else {
                product = new Product();
                message = "Thêm sản phẩm";
                operation = "Thêm";
            }

        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("categories", categories);
        request.setAttribute("sizes", sizes);
        request.setAttribute("manufacturers", manufacturers);
        request.setAttribute("materials", materials);
        request.setAttribute("operation", operation);
        request.setAttribute("p", product);
        request.setAttribute("message", message);

        request.getRequestDispatcher("/WEB-INF/admin_addproduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}