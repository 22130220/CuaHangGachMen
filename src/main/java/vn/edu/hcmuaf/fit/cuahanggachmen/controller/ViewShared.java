package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ViewShared", value = "/view/*")
public class ViewShared extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        String path = request.getPathInfo(); // Lấy phần sau /view-shared/
        String pid = request.getParameter("pid"); // Lấy tham số pid



        // Ghi đè xử lý nếu cần
        if (path != null && pid != null) {
            Handle handle = DBConect.get().open();
            ProductDao dao = new ProductDao(handle);
            Product p = null;
            p = dao.findById(Integer.parseInt(pid));
            request.setAttribute("p", p);
            request.getRequestDispatcher(path).forward(request, response);

        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}