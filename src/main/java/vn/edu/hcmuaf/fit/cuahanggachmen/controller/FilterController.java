package vn.edu.hcmuaf.fit.cuahanggachmen.controller;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.view_model.ProductFilter;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.ProductService;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxParseRequest;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "list-product/filter", value = "/list-product/filter")
public class FilterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductFilter productFilter = new ProductFilter();
        String manufacturers = request.getParameter("nsx");
        String size = request.getParameter("size");
        String price = request.getParameter("price");
        String category = request.getParameter("category");
        String material = request.getParameter("material");
        String currentPage = request.getParameter("page");
        String pageSize = request.getParameter("pageSize");
        String sort = request.getParameter("sort");


        productFilter.setPriceRanges(AjaxParseRequest.parse(price));
        productFilter.setSizes(AjaxParseRequest.parse(size));
        productFilter.setOrigins(AjaxParseRequest.parse(manufacturers));
        productFilter.setCategory(AjaxParseRequest.parse(category));
        productFilter.setMaterial(AjaxParseRequest.parse(material));
        productFilter.setPageSize(AjaxParseRequest.parseInt(pageSize));
        productFilter.setPage(AjaxParseRequest.parseInt(currentPage));
        productFilter.setSort(AjaxParseRequest.parseInt(sort));

        ProductService pService = new ProductService();
        List<Product> ls = null;
        try {
            ls = pService.findByFilter(productFilter);
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }

        AjaxResponse resp = new AjaxResponse();

        resp.addProductList(ls);
        resp.addInt("TotalPages", productFilter.getTotalPages());
       response.setStatus(HttpServletResponse.SC_OK);
       response.setContentType("application/json");
       response.setCharacterEncoding("UTF-8");
       PrintWriter out = response.getWriter();
       out.print(resp.getText());

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}