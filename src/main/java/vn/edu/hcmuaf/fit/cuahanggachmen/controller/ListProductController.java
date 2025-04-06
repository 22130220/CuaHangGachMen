package vn.edu.hcmuaf.fit.cuahanggachmen.controller;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.ActionResult;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.StatusCode;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Category;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Size;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.UserPermission;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "list-product", value = "/list-product")
public class ListProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String danhMuc = request.getParameter("danhmuc");
        String thuongHieu = request.getParameter("thuonghieu");
        String chatLieu = request.getParameter("chatlieu");

        Handle handle = DBConect.get().open();
        MaterialDao materialDao = new MaterialDao(handle);
        ManufacturerDao manufacturerDao  = new ManufacturerDao(handle);
        SizeDao sizeDao = new SizeDao(handle);
        CategoryDao categoryDao = new CategoryDao(handle);
        ActionResult rs = new ActionResult();
        rs.setCode(StatusCode.OK);

        rs.put("category", categoryDao.findAll());
        rs.put("material", materialDao.findAll());
        rs.put("manufacturer", manufacturerDao.findAll());
        rs.put("size", sizeDao.findAll());
        Category category = new Category();
        if(danhMuc != null) {
            rs.put("categoryMain", categoryDao.findById(Integer.parseInt(danhMuc)));
        }
        if(thuongHieu != null) {
            rs.put("manufacturerMain", manufacturerDao.findById(Integer.parseInt(thuongHieu)));
        }
        if(chatLieu != null) {
            rs.put("materialMain", materialDao.findById(Integer.parseInt(chatLieu)));
        } else {
//            category.setName("TẤT CẢ SẢN PHẨM");
//            category.setId(0);
//            rs.put("categoryMain", category);
        }


        request.setAttribute("rs", rs);
        handle.close();
        request.getRequestDispatcher("/WEB-INF/list_product.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
