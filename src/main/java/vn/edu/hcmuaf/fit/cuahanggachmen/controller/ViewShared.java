package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
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
            ProductDao dao = new ProductDao();
            Product p = null;
            try {
                p = dao.findById(Integer.parseInt(pid));
            } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
                throw new RuntimeException(e);
            }
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