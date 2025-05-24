package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.PermissionCheck;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.PermissionDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Permission;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@MultipartConfig
@WebServlet(name = "GetSetPermission", value = "/admin/get-permission")
public class GetSetPermission extends HttpServlet {

    // Helper method to send JSON response
    private void sendJsonResponse(HttpServletResponse resp, boolean success, String message) throws IOException {
        JsonObject ob = new JsonObject();
        ob.addProperty("success", success);
        ob.addProperty("message", message);
        resp.setStatus(HttpServletResponse.SC_OK);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.print(ob);
        out.flush();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "GET"), request, response)) return;
        Handle handle = DBConect.get().open();
        List<Permission> permissions = new PermissionDao(handle).getAllPermissions();
        Map<String, List<Permission>> map = new HashMap<>();
        map.put("permissions", permissions);
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
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "POST"), request, response)) return;
        String permissionName = request.getParameter("permission_name");

        Handle handle = DBConect.get().open();
        PermissionDao permissionDao = new PermissionDao(handle);

        int success = permissionDao.insertPermission(permissionName);
        sendJsonResponse(response, success > 0, success > 0 ? "Thêm thành công" : "Thêm thất bại");
        handle.close();
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "DELETE"), req, resp)) return;

        String id = req.getParameter("id");

        int success = 0;
        String[] ids = id.split(",");
        Handle handle = DBConect.get().open();
        PermissionDao permissionDao = new PermissionDao(handle);
        for (String idPerm : ids) {
            // Increment success if deletion is successful
            if (permissionDao.deletePermission(Integer.parseInt(idPerm))) {
                success++;
            }
        }

        sendJsonResponse(resp, success > 0, success > 0 ? "Xoá thành công" : "Xoá thất bại");
        handle.close();
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "PUT"), req, resp)) return;
        String permissionId = req.getParameter("permission_id_update");
        String permissionName = req.getParameter("permission_name_update");

        Handle handle = DBConect.get().open();
        PermissionDao permissionDao = new PermissionDao(handle);
        boolean success = permissionDao.updatePermission(Integer.parseInt(permissionId), permissionName);

        sendJsonResponse(resp, success, success ? "Cập nhật thành công" : "Cập nhật thất bại");
        handle.close();
    }
}