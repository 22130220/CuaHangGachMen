package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ResourceDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.RoleDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Resource;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@MultipartConfig
@WebServlet(name = "GetSetResource", value = "/admin/get-resource")
public class GetSetResource extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        List<Resource> ls = new ResourceDao(handle).getAllResources();
        Map<String, List<Resource>> map = new HashMap<>();
        map.put("resources", ls);
        JsonObject json = new JsonObject();
        Gson gson = new Gson();
        String jsonString = gson.toJson(map);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonString);
        handle.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String resourceName = request.getParameter("resource_name");

        Handle handle = DBConect.get().open();
        ResourceDao resourceDao = new ResourceDao(handle);

        int success = resourceDao.insertResource(resourceName);
        JsonObject ob = new JsonObject();
        ob.addProperty("success", success > 0);
        ob.addProperty("message", success > 0 ? "Thêm thành công" : "Thêm thất bại");
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(ob);
        handle.close();
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        int success = 0;
        String[] ids = id.split(",");
        Handle handle = DBConect.get().open();
        ResourceDao resourceDao = new ResourceDao(handle);
        for (String idRole : ids) {
            success += resourceDao.deleteResource(Integer.parseInt(idRole));
        }

        JsonObject ob = new JsonObject();
        ob.addProperty("success", success > 0);
        ob.addProperty("message", success > 0 ? "Xoá thành công" : "Xoá thất bại");
        resp.setStatus(HttpServletResponse.SC_OK);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.print(ob);
        handle.close();
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String resourceId = req.getParameter("resource_id_update");
        String resourceName = req.getParameter("resource_name_update");

        int success = 0;
        Handle handle = DBConect.get().open();
        ResourceDao resourceDao = new ResourceDao(handle);
        success = resourceDao.updateResource(Integer.parseInt(resourceId), resourceName);

        JsonObject ob = new JsonObject();
        ob.addProperty("success", success > 0);
        ob.addProperty("message", success > 0 ? "Câp nhật thành công" : "Cập nhật thất bại");
        resp.setStatus(HttpServletResponse.SC_OK);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.print(ob);
        handle.close();
    }
}