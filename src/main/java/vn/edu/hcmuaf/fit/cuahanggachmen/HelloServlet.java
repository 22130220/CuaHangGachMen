package vn.edu.hcmuaf.fit.cuahanggachmen;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("")
public class HelloServlet extends HttpServlet {
    private String message;


    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Handle handle = DBConect.get().open();
        ProductDao productDao = new ProductDao(handle);

        // BÁN CHẠY
        List<Product> productList = null;
        productList = productDao.findTopSellingProducts(1, 3);
        request.setAttribute("productList", productList);

        // MOI NHAT
        List<Product> latestProducts = null;
        latestProducts = productDao.findLatestProducts();
        request.setAttribute("latestProducts", latestProducts);

        // XEM NHIEU
        List<Product> mostViewedProducts = null;
        mostViewedProducts = productDao.findMostViewedProducts();

        request.setAttribute("mostViewedProducts", mostViewedProducts);

        handle.close();
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }

    public void destroy() {
    }
}