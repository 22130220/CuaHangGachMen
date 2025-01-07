package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.CategoryDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Category;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxParseRequest;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "get-product", value = "/admin/get-product")
public class GetProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDao pDao = new ProductDao();
        List<Product> ls = null;
        try {
             ls = pDao.findAll();
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }

        AjaxResponse resp = new AjaxResponse();
        resp.addProductList(ls);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String active = request.getParameter("active");
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        int success = 0;
        ProductDao dao = new ProductDao();
        Product c = new Product();

        if(action.equalsIgnoreCase("Thêm")) {
//            c.setName(name);
//            c.setStatus(getBoolVal(active));
//            try {
//                success = dao.insert(c);
//            } catch (SQLException | IllegalAccessException | InstantiationException | ClassNotFoundException e) {
//                throw new RuntimeException(e);
//            }
        } else if(action.equalsIgnoreCase("Cập nhật")) {
//            c.setId(Integer.parseInt(id));
//            c.setName(name);
//            c.setStatus(getBoolVal(active));
//            try {
//                success = dao.update(c);
//            } catch (SQLException | IllegalAccessException | InstantiationException | ClassNotFoundException e) {
//                throw new RuntimeException(e);
//            }
        } else if(action.equalsIgnoreCase("Xoá")) {
            String[] deleteId = AjaxParseRequest.parse(id);
            boolean realAcive = getBoolVal(active);
            for (String s : deleteId) {
                try {
                    success += dao.updateActive(Integer.parseInt(s), realAcive);
                } catch (SQLException | IllegalAccessException | InstantiationException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
            }

        }


        AjaxResponse resp = new AjaxResponse();
        resp.addBool("success", success > 0);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
    }
    private boolean getBoolVal(String value) {
        if(value.equalsIgnoreCase("true")) return true;
        else if(value.equalsIgnoreCase("false")) return false;
        return false;
    }

}