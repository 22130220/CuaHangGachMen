package vn.edu.hcmuaf.fit.cuahanggachmen.controller;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.view_model.ProductFilter;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.ProductService;
import vn.edu.hcmuaf.fit.cuahanggachmen.storage.ProductStorage;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxParseRequest;

import java.io.IOException;
import java.io.PrintWriter;
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

        String[] prices = AjaxParseRequest.parse(price);
        String[] sizes = AjaxParseRequest.parse(size);
        String[] manufactures = AjaxParseRequest.parse(manufacturers);

        productFilter.setPriceRanges(AjaxParseRequest.parse(price));
        productFilter.setSizes(AjaxParseRequest.parse(size));
        productFilter.setOrigins(AjaxParseRequest.parse(manufacturers));

        ProductService pService = new ProductService();
        List<Product> ls = pService.findByFilter(productFilter);

        String jsonList = AjaxParseRequest.productListToJson(ls);

       response.setStatus(HttpServletResponse.SC_OK);
       response.setContentType("application/json");
       response.setCharacterEncoding("UTF-8");
       PrintWriter out = response.getWriter();
       out.print(jsonList);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}