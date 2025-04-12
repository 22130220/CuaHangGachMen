package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.RoleDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.RoleResourcePermissionDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Role;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.RoleResourcePermission;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "GetSetRole", value = "/admin/role/api")
public class GetSetRole extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        RoleDao roleDao = new RoleDao(handle);
        RoleResourcePermissionDao permissionDao = new RoleResourcePermissionDao(handle);

        List<Role> roles = roleDao.getAllRoles();
        List<RoleResourcePermission> permissions = permissionDao.getAll();

        AjaxResponse resp = new AjaxResponse();
        resp.addRoleList(roles);
        resp.addRoleResourcePermissionList(permissions);

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
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String permissions = request.getParameter("permissions");
        String id = request.getParameter("id");

        Handle handle = DBConect.get().open();
        RoleDao roleDao = new RoleDao(handle);
        RoleResourcePermissionDao permissionDao = new RoleResourcePermissionDao(handle);

        AjaxResponse resp = new AjaxResponse();
        boolean success = false;

        try {
            if ("Tạo".equalsIgnoreCase(action)) {
                int roleId = roleDao.insertRole(name, description);
                if (roleId > 0 && permissions != null && !permissions.isEmpty()) {
                    String[] permissionArray = permissions.split(",");
                    for (String perm : permissionArray) {
                        String[] parts = perm.split(":");
                        if (parts.length == 2) {
                            int resourceId = Integer.parseInt(parts[0]);
                            int permissionId = Integer.parseInt(parts[1]);
                            permissionDao.insert(roleId, resourceId, permissionId);
                        }
                    }
                }
                success = roleId > 0;
            } else if ("Cập nhật".equalsIgnoreCase(action)) {
                int roleId = Integer.parseInt(id);
                success = roleDao.updateRole(roleId, name, description);
                if (success) {
                    // Xóa quyền cũ
                    permissionDao.deleteByRoleId(roleId);
                    // Thêm quyền mới
                    if (permissions != null && !permissions.isEmpty()) {
                        String[] permissionArray = permissions.split(",");
                        for (String perm : permissionArray) {
                            String[] parts = perm.split(":");
                            if (parts.length == 2) {
                                int resourceId = Integer.parseInt(parts[0]);
                                int permissionId = Integer.parseInt(parts[1]);
                                permissionDao.insert(roleId, resourceId, permissionId);
                            }
                        }
                    }
                }
            } else if ("Xóa".equalsIgnoreCase(action)) {
                int roleId = Integer.parseInt(id);
                permissionDao.deleteByRoleId(roleId); // Xóa quyền trước
                success = roleDao.deleteRole(roleId);
            }

            resp.addBool("success", success);
        } catch (Exception e) {
            resp.addBool("success", false);
            resp.addString("error", e.getMessage());
        }

        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
        handle.close();
    }
}