package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ColorDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductColorImgDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductSpecDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.SpecTypeDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Color;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.ProductColorImg;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.ProductSpec;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.SpecType;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxParseRequest;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "GetSetProductColor", value = "/admin/productColorImg")
public class GetSetProductColor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");
        if(pid == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        List<ProductColorImg> ls = null;
        List<Color> colorLs = null;
        Handle handle = DBConect.get().open();
        ProductColorImgDao dao = new ProductColorImgDao(handle);
        ColorDao spDao = new ColorDao(handle);
        AjaxResponse resp = new AjaxResponse();

        ls = dao.findByProductId(Integer.parseInt(pid));
        colorLs = spDao.getAllColors();

        resp.addProductColorList(ls);
        resp.addColorList(colorLs);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
        handle.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String value = request.getParameter("value");
        String sel = request.getParameter("sel");
        String vid = request.getParameter("vid");
        String pid = request.getParameter("pid");

        String colorRowId = request.getParameter("colorRowId");
        String colorIdToDel = request.getParameter("colorIdToDel");

        Handle handle = DBConect.get().open();
        ProductColorImgDao dao = new ProductColorImgDao(handle);
        ProductColorImg c = new ProductColorImg();

        int success = 0;

        if(action.equalsIgnoreCase("Thêm")) {
            c.setColorId(Integer.parseInt(sel));
            c.setUrl(value);
            c.setProductId(Integer.parseInt(pid));
            success = dao.insert(c.getColorId(), c.getProductId(),c.getUrl());
        } else if(action.equalsIgnoreCase("Cập nhật")) {
            c.setId(Integer.parseInt(colorRowId));
            c.setUrl(value);
            success = dao.update(c.getId(), c.getUrl());
        } else if(action.equalsIgnoreCase("Xoá")) {
            String[] deleteId = AjaxParseRequest.parse(colorIdToDel);
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