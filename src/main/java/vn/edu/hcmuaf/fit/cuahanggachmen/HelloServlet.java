package vn.edu.hcmuaf.fit.cuahanggachmen;

import java.io.*;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;

@WebServlet("")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ProductDao productDao = new ProductDao();

        // BÁN CHẠY
        List<Product> productList = null;
        try {
            productList = productDao.findTopSellingProducts(1, 3);
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("productList", productList);

        // MOI NHAT
        List<Product> latestProducts = null;
        try {
            latestProducts = productDao.findLatestProducts();
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("latestProducts", latestProducts);

        // XEM NHIEU
        List<Product> mostViewedProducts = null;
        try {
            mostViewedProducts = productDao.findMostViewedProducts();
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {

        }

        request.setAttribute("mostViewedProducts", mostViewedProducts);


        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }

    public void destroy() {
    }
}