package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductSpecDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.SpecTypeDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.ProductSpec;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.SpecType;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxParseRequest;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@MultipartConfig
@WebServlet(name = "GetProductDes", value = "/admin/getspec")
public class GetProductSpec extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        String pid = request.getParameter("pid");
        List<ProductSpec> ls = null;
        List<SpecType> specTypes = null;
        ProductSpecDao dao = new ProductSpecDao(handle);
        SpecTypeDao spDao = new SpecTypeDao(handle);
        AjaxResponse resp = new AjaxResponse();

        if(pid == null) {
                specTypes = spDao.findAll();
                resp.addSpecTypeList(specTypes);
                response.setStatus(HttpServletResponse.SC_OK);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print(resp.getText());
                handle.close();
                return;
        } else {
            ls = dao.findByProductId(Integer.parseInt(pid));
            specTypes = spDao.findByProduct(Integer.parseInt(pid));

            resp.addProductSpecList(ls);
            resp.addSpecTypeList(specTypes);
            response.setStatus(HttpServletResponse.SC_OK);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(resp.getText());
            handle.close();
            return;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        String action = request.getParameter("action");
        String value = request.getParameter("value");
        String sel = request.getParameter("sel");
        String vid = request.getParameter("vid");
        String pid = request.getParameter("pid");
        String specId = request.getParameter("specId");
        String specIdToDel = request.getParameter("specIdToDel");

        ProductSpecDao dao = new ProductSpecDao(handle);
        ProductSpec c = new ProductSpec();

        int success = 0;

        if(action.equalsIgnoreCase("Thêm")) {
            c.setSpecId(Integer.parseInt(sel));
            c.setValue(value);
            c.setProcuctId(Integer.parseInt(pid));
            success = dao.insert(c);
        } else if(action.equalsIgnoreCase("Cập nhật")) {
            c.setProcuctId(Integer.parseInt(pid));
            c.setValue(value);
            c.setSpecId(Integer.parseInt(specId));
            success = dao.update(c);
        } else if(action.equalsIgnoreCase("Xoá")) {
            String[] deleteId = AjaxParseRequest.parse(specIdToDel);
            int realPid = Integer.parseInt(pid);
            for (String s : deleteId) {
                success += dao.deleteById(realPid, Integer.parseInt(s));
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
}