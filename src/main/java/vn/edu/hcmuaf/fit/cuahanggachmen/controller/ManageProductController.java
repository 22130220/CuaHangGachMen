package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "admin/manage-product", value = "/admin/manage-product")
public class ManageProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryDao categoryDao = new CategoryDao();
        MaterialDao materialDao = new MaterialDao();
        ManufacturerDao manufacturerDao = new ManufacturerDao();
        SizeDao sizeDao = new SizeDao();

        List<Category> categories = null;
        List<Size> sizes = null;
        List<Manufacturer> manufacturers = null;
        List<Material> materials = null;

        try {
            categories = categoryDao.findAll();
            sizes = sizeDao.findAll();
            manufacturers = manufacturerDao.findAll();
            materials = materialDao.findAll();

        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("categories", categories);
        request.setAttribute("sizes", sizes);
        request.setAttribute("manufacturers", manufacturers);
        request.setAttribute("materials", materials);
        request.getRequestDispatcher("/WEB-INF/admin_manageproduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}