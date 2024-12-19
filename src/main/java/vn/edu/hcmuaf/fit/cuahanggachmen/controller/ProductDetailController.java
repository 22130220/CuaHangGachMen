package vn.edu.hcmuaf.fit.cuahanggachmen.controller;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "pdetail", value = "/pdetail")
public class ProductDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("pid");
        Product p = null;
        ProductDao productDao = new ProductDao();
        try{
            Integer id = Integer.parseInt(pid);
            try {
              p = productDao.findById(id);
            } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
                throw new RuntimeException(e);
            }

        } catch (NumberFormatException e) {
            throw new NumberFormatException();
        }

        request.setAttribute("p", p);
        request.getRequestDispatcher("/WEB-INF/product-detail.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xử lý yêu cầu POST
        response.getWriter().println("Hello from POST method!");
    }
}
