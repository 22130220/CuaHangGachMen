package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.MaterialDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.SizeDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Material;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Size;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxParseRequest;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "GetSetSize", value = "/admin/size")
public class GetSetSize extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        SizeDao dao = new SizeDao(handle);
        List<Size> ls = null;

        ls = dao.findAll();

        AjaxResponse resp = new AjaxResponse();
        resp.addSizeList(ls);
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
        String data = request.getParameter("data");
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        int success = 0;
        SizeDao dao = new SizeDao(handle);
        Size c = new Size();

        if(action.equalsIgnoreCase("Thêm")) {
            c.setName(data);
            success = dao.insert(c);
        } else if(action.equalsIgnoreCase("Cập nhật")) {
            c.setId(Integer.parseInt(id));
            c.setName(data);
            success = dao.update(c);
        } else if(action.equalsIgnoreCase("Xoá")) {
            String[] deleteId = AjaxParseRequest.parse(data);
            for (String s : deleteId) {
                success += dao.deleteById(Integer.parseInt(s));
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