package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ColorDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Color;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxParseRequest;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "getSetColor", value = "/admin/color")
public class GetSetColor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        ColorDao dao = new ColorDao(handle);
        List<Color> ls = null;

        ls = dao.getAllColors();

        AjaxResponse resp = new AjaxResponse();
        resp.addColorList(ls);
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
        ColorDao dao = new ColorDao(handle);
        Color c = new Color();

        if(action.equalsIgnoreCase("Thêm")) {
            c.setName(data);
            success = dao.insertColor(c);
        } else if(action.equalsIgnoreCase("Cập nhật")) {
            c.setID(Integer.parseInt(id));
            c.setName(data);
            success = dao.updateColor(c);
        } else if(action.equalsIgnoreCase("Xoá")) {
            String[] deleteId = AjaxParseRequest.parse(data);
            for(int i = 0; i < deleteId.length; i++) {
                success += dao.deleteColor(Integer.parseInt(deleteId[i]));
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