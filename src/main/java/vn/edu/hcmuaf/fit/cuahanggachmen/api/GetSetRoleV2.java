package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.RoleDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Role;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@MultipartConfig
@WebServlet(name = "GetSetRole", value = "/admin/get-role-v2")
public class GetSetRoleV2 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Handle handle = DBConect.get().open();
        List<Role> ls = new RoleDao(handle).getAllRoles();
        Map<String, List<Role>> map = new HashMap<>();
        map.put("roles", ls);
        Gson gson = new Gson();
        String jsonString = gson.toJson(map);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonString);
        handle.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String roleName = request.getParameter("role_name");
        String roleDescription = request.getParameter("role_description");
        boolean status = Boolean.parseBoolean(request.getParameter("status")); // Lấy status từ request

        Handle handle = DBConect.get().open();
        RoleDao roleDao = new RoleDao(handle);

        int success = roleDao.insertRole(roleName, roleDescription, status);
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
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("id");

        int success = 0;
        String[] ids = id.split(",");
        Handle handle = DBConect.get().open();
        RoleDao roleDao = new RoleDao(handle);
        for (String idRole : ids) {
            success += roleDao.deleteRole(Integer.parseInt(idRole));
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
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String roleId = req.getParameter("role_id_update");
        String roleName = req.getParameter("role_name_update");
        String roleDescription = req.getParameter("role_description_update");
        boolean status = Boolean.parseBoolean(req.getParameter("status")); // Lấy status từ request

        Handle handle = DBConect.get().open();
        RoleDao roleDao = new RoleDao(handle);
        int success = roleDao.updateRole(Integer.parseInt(roleId), roleName, roleDescription, status);

        JsonObject ob = new JsonObject();
        ob.addProperty("success", success > 0);
        ob.addProperty("message", success > 0 ? "Cập nhật thành công" : "Cập nhật thất bại");
        resp.setStatus(HttpServletResponse.SC_OK);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.print(ob);
        handle.close();
    }
}