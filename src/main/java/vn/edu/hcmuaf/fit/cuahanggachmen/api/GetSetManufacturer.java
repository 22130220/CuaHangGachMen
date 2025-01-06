package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ManufacturerDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.MaterialDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Manufacturer;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Material;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxParseRequest;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "GetSetManufacturer", value = "/admin/manufacturer")
public class GetSetManufacturer extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ManufacturerDao dao = new ManufacturerDao();
        List<Manufacturer> ls = null;

        try {
            ls = dao.findAll();
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }

        AjaxResponse resp = new AjaxResponse();
        resp.addManufacturerList(ls);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String data = request.getParameter("data");
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        int success = 0;
        ManufacturerDao dao = new ManufacturerDao();
        Manufacturer c = new Manufacturer();

        if(action.equalsIgnoreCase("Thêm")) {
            c.setName(data);
            try {
                success = dao.insert(c);
            } catch (SQLException | IllegalAccessException | InstantiationException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        } else if(action.equalsIgnoreCase("Cập nhật")) {
            c.setId(Integer.parseInt(id));
            c.setName(data);
            try {
                success = dao.update(c);
            } catch (SQLException | IllegalAccessException | InstantiationException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        } else if(action.equalsIgnoreCase("Xoá")) {
            String[] deleteId = AjaxParseRequest.parse(data);
            for (String s : deleteId) {
                try {
                    success += dao.deleteById(Integer.parseInt(s));
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