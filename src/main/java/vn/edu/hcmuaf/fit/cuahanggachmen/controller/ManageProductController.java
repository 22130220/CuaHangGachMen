package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "admin/manage-product", value = "/admin/manage-product")
public class ManageProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        CategoryDao categoryDao = new CategoryDao(handle);
        MaterialDao materialDao = new MaterialDao(handle);
        ManufacturerDao manufacturerDao = new ManufacturerDao(handle);
        SizeDao sizeDao = new SizeDao(handle);

        List<Category> categories = null;
        List<Size> sizes = null;
        List<Manufacturer> manufacturers = null;
        List<Material> materials = null;

        categories = categoryDao.findAll();
        sizes = sizeDao.findAll();
        manufacturers = manufacturerDao.findAll();
        materials = materialDao.findAll();


        request.setAttribute("categories", categories);
        request.setAttribute("sizes", sizes);
        request.setAttribute("manufacturers", manufacturers);
        request.setAttribute("materials", materials);
        handle.close();
        request.getRequestDispatcher("/WEB-INF/admin_manageproduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}