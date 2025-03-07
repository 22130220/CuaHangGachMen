package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.CategoryDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.SizeDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.VoucherDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Category;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Size;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Voucher;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxParseRequest;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "GetSetCategory", value = "/admin/category")
public class GetSetCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        CategoryDao dao = new CategoryDao(handle);
        List<Category> ls = null;

        ls = dao.findAll();

        AjaxResponse resp = new AjaxResponse();
        resp.addCategoryList(ls);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
        handle.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        String name = request.getParameter("name");
        String active = request.getParameter("active");
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        int success = 0;
        CategoryDao dao = new CategoryDao(handle);
        Category c = new Category();

        if(action.equalsIgnoreCase("Thêm")) {
            c.setName(name);
            c.setStatus(getBoolVal(active));
            success = dao.insert(c);
        } else if(action.equalsIgnoreCase("Cập nhật")) {
            c.setId(Integer.parseInt(id));
            c.setName(name);
            c.setStatus(getBoolVal(active));
            success = dao.update(c);
        } else if(action.equalsIgnoreCase("Xoá")) {
            String[] deleteId = AjaxParseRequest.parse(id);
            boolean realAcive = getBoolVal(active);
            for (String s : deleteId) {
                success += dao.updateActive(Integer.parseInt(s), realAcive);
            }

        }


        AjaxResponse resp = new AjaxResponse();
        resp.addBool("success", success > 0);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
        handle.close();
    }

    private boolean getBoolVal(String value) {
        if(value.equalsIgnoreCase("true")) return true;
        else if(value.equalsIgnoreCase("false")) return false;
        return false;
    }
}