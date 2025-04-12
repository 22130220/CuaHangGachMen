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
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "GetSetRole", value = "/admin/role/api")
public class GetSetRole extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AjaxResponse ajaxResponse = new AjaxResponse();

        try (Handle handle = DBConect.get().open()) {
            RoleDao roleDao = new RoleDao(handle);
            RoleResourcePermissionDao permissionDao = new RoleResourcePermissionDao(handle);

            // Lấy danh sách roles và permissions
            List<Role> roles = roleDao.getAllRoles();
            List<RoleResourcePermission> permissions = permissionDao.getAll();

            ajaxResponse.addRoleList(roles);
            ajaxResponse.addRoleResourcePermissionList(permissions);
            sendResponse(response, HttpServletResponse.SC_OK, ajaxResponse);
        } catch (Exception e) {
            ajaxResponse.addBool("success", false);
            ajaxResponse.addString("error", "Không thể lấy danh sách vai trò: " + e.getMessage());
            sendResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, ajaxResponse);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        AjaxResponse ajaxResponse = new AjaxResponse();

        try (Handle handle = DBConect.get().open()) {
            RoleDao roleDao = new RoleDao(handle);
            RoleResourcePermissionDao permissionDao = new RoleResourcePermissionDao(handle);

            switch (action != null ? action.toLowerCase() : "") {
                case "tạo":
                    handleCreateRole(request, roleDao, permissionDao, ajaxResponse);
                    break;
                case "cập nhật":
                    handleUpdateRole(request, roleDao, permissionDao, ajaxResponse);
                    break;
                case "xóa":
                    handleDeleteRole(request, roleDao, permissionDao, ajaxResponse);
                    break;
                default:
                    ajaxResponse.addBool("success", false);
                    ajaxResponse.addString("error", "Hành động không hợp lệ");
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, ajaxResponse);
                    return;
            }
            sendResponse(response, HttpServletResponse.SC_OK, ajaxResponse);
        } catch (Exception e) {
            ajaxResponse.addBool("success", false);
            ajaxResponse.addString("error", "Thao tác thất bại: " + e.getMessage());
            sendResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, ajaxResponse);
        }
    }

    private void handleCreateRole(HttpServletRequest request, RoleDao roleDao, RoleResourcePermissionDao permissionDao, AjaxResponse ajaxResponse) {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String permissions = request.getParameter("permissions");

        if (name == null || name.trim().isEmpty()) {
            ajaxResponse.addBool("success", false);
            ajaxResponse.addString("error", "Tên vai trò là bắt buộc");
            return;
        }

        int roleId = roleDao.insertRole(name, description);
        if (roleId > 0) {
            updatePermissions(roleId, permissions, permissionDao);
            ajaxResponse.addBool("success", true);
        } else {
            ajaxResponse.addBool("success", false);
            ajaxResponse.addString("error", "Không thể tạo vai trò");
        }
    }

    private void handleUpdateRole(HttpServletRequest request, RoleDao roleDao, RoleResourcePermissionDao permissionDao, AjaxResponse ajaxResponse) {
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String permissions = request.getParameter("permissions");

        if (idStr == null || name == null || name.trim().isEmpty()) {
            ajaxResponse.addBool("success", false);
            ajaxResponse.addString("error", "ID và tên vai trò là bắt buộc");
            return;
        }

        try {
            int roleId = Integer.parseInt(idStr);
            Optional<Role> role = roleDao.getRoleById(roleId);
            if (role.isPresent()) {
                int rowsAffected = roleDao.updateRole(roleId, name, description);
                if (rowsAffected > 0) {
                    permissionDao.deleteByRoleId(roleId); // Xóa quyền cũ
                    updatePermissions(roleId, permissions, permissionDao); // Thêm quyền mới
                    ajaxResponse.addBool("success", true);
                } else {
                    ajaxResponse.addBool("success", false);
                    ajaxResponse.addString("error", "Không thể cập nhật vai trò");
                }
            } else {
                ajaxResponse.addBool("success", false);
                ajaxResponse.addString("error", "Vai trò không tồn tại");
            }
        } catch (NumberFormatException e) {
            ajaxResponse.addBool("success", false);
            ajaxResponse.addString("error", "ID vai trò không hợp lệ");
        }
    }

    private void handleDeleteRole(HttpServletRequest request, RoleDao roleDao, RoleResourcePermissionDao permissionDao, AjaxResponse ajaxResponse) {
        String idStr = request.getParameter("id");

        if (idStr == null) {
            ajaxResponse.addBool("success", false);
            ajaxResponse.addString("error", "ID vai trò là bắt buộc");
            return;
        }

        try {
            int roleId = Integer.parseInt(idStr);
            Optional<Role> role = roleDao.getRoleById(roleId);
            if (role.isPresent()) {
                permissionDao.deleteByRoleId(roleId); // Xóa quyền trước
                int rowsAffected = roleDao.deleteRole(roleId);
                ajaxResponse.addBool("success", rowsAffected > 0);
            } else {
                ajaxResponse.addBool("success", false);
                ajaxResponse.addString("error", "Vai trò không tồn tại");
            }
        } catch (NumberFormatException e) {
            ajaxResponse.addBool("success", false);
            ajaxResponse.addString("error", "ID vai trò không hợp lệ");
        }
    }

    private void updatePermissions(int roleId, String permissions, RoleResourcePermissionDao permissionDao) {
        if (permissions != null && !permissions.isEmpty()) {
            Arrays.stream(permissions.split(","))
                    .map(String::trim)
                    .filter(perm -> !perm.isEmpty())
                    .forEach(perm -> {
                        String[] parts = perm.split(":");
                        if (parts.length == 2) {
                            try {
                                int resourceId = Integer.parseInt(parts[0]);
                                int permissionId = Integer.parseInt(parts[1]);
                                permissionDao.insert(roleId, resourceId, permissionId);
                            } catch (NumberFormatException ignored) {
                                // Bỏ qua nếu định dạng sai
                            }
                        }
                    });
        }
    }

    private void sendResponse(HttpServletResponse response, int status, AjaxResponse ajaxResponse) throws IOException {
        response.setStatus(status);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.print(ajaxResponse.getText());
        }
    }
}