package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductSpecDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.SpecTypeDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.ProductSpec;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.SpecType;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxParseRequest;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "GetProductDes", value = "/admin/getspec")
public class GetProductSpec extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");
        if(pid == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        List<ProductSpec> ls = null;
        List<SpecType> specTypes = null;
        ProductSpecDao dao = new ProductSpecDao();
        SpecTypeDao spDao = new SpecTypeDao();
        AjaxResponse resp = new AjaxResponse();

        try {
            ls = dao.findByProductId(Integer.parseInt(pid));
            specTypes = spDao.findByProduct(Integer.parseInt(pid));
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }

        resp.addProductSpecList(ls);
        resp.addSpecTypeList(specTypes);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String value = request.getParameter("value");
        String sel = request.getParameter("sel");
        String vid = request.getParameter("vid");
        String pid = request.getParameter("pid");
        String specId = request.getParameter("specId");
        String specIdToDel = request.getParameter("specIdToDel");

        ProductSpecDao dao = new ProductSpecDao();
        ProductSpec c = new ProductSpec();

        int success = 0;

        if(action.equalsIgnoreCase("Thêm")) {
            c.setSpecId(Integer.parseInt(sel));
            c.setValue(value);
            c.setProcuctId(Integer.parseInt(pid));
            try {
                success = dao.insert(c);
            } catch (SQLException | IllegalAccessException | InstantiationException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        } else if(action.equalsIgnoreCase("Cập nhật")) {
            c.setProcuctId(Integer.parseInt(pid));
            c.setValue(value);
            c.setSpecId(Integer.parseInt(specId));
            try {
                success = dao.update(c);
            } catch (SQLException | IllegalAccessException | InstantiationException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        } else if(action.equalsIgnoreCase("Xoá")) {
            String[] deleteId = AjaxParseRequest.parse(specIdToDel);
            int realPid = Integer.parseInt(pid);
            for (String s : deleteId) {
                try {
                    success += dao.deleteById(realPid, Integer.parseInt(s));
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
}