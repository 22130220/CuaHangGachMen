package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.PermissionCheck;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.PermissionDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ResourceDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.RoleDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.RoleResourcePermissionDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Permission;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Resource;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Role;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.RoleResourcePermission;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet(name = "GetSetRoleOfNguyen", value = "/admin/role/api/*")
public class GetSetRoleOfNguyen extends HttpServlet {
    private final Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "GET"), request, response)) return;

        Map<String, Object> responseData = new HashMap<>();
        String pathInfo = request.getPathInfo();
        String roleName = request.getParameter("roleName");

        try (Handle handle = DBConect.get().open()) {
            RoleDao roleDao = new RoleDao(handle);
            RoleResourcePermissionDao permissionDao = new RoleResourcePermissionDao(handle);
            PermissionDao permissionDaoObj = new PermissionDao(handle);
            ResourceDao resourceDao = new ResourceDao(handle);

            if (pathInfo == null || "/".equals(pathInfo)) {
                List<Role> roles = roleDao.getAllRoles();
                List<RoleResourcePermission> permissions;

                if (roleName != null && !roleName.isEmpty()) {
                    permissions = permissionDao.getAll().stream()
                            .filter(p -> p.getRoleName().equalsIgnoreCase(roleName))
                            .collect(Collectors.toList());
                } else {
                    permissions = permissionDao.getAll();
                }

                responseData.put("success", true);
                responseData.put("roles", roles);
                responseData.put("permissions", permissions);
            } else if ("/permissions".equals(pathInfo)) {
                List<Permission> permissions = permissionDaoObj.getAllPermissions();
                responseData.put("success", true);
                responseData.put("permissions", permissions);
            } else if ("/resources".equals(pathInfo)) {
                List<Resource> resources = resourceDao.getAllResources();
                responseData.put("success", true);
                responseData.put("resources", resources);
            } else {
                responseData.put("success", false);
                responseData.put("error", "Đường dẫn không hợp lệ");
                sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                return;
            }

            sendResponse(response, HttpServletResponse.SC_OK, responseData);
        } catch (Exception e) {
            responseData.put("success", false);
            responseData.put("error", "Lỗi server khi lấy dữ liệu: " + e.getMessage());
            sendResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, responseData);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "POST"), request, response)) return;

        Map<String, Object> responseData = new HashMap<>();
        String pathInfo = request.getPathInfo();

        try (Handle handle = DBConect.get().open()) {
            RoleDao roleDao = new RoleDao(handle);
            RoleResourcePermissionDao permissionDao = new RoleResourcePermissionDao(handle);
            ResourceDao resourceDao = new ResourceDao(handle);
            PermissionDao permissionDaoObj = new PermissionDao(handle);

            if ("/create".equals(pathInfo)) {
                // Đọc dữ liệu JSON từ request
                BufferedReader reader = request.getReader();
                StringBuilder jsonBuilder = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    jsonBuilder.append(line);
                }

                // Kiểm tra JSON rỗng
                if (jsonBuilder.length() == 0) {
                    responseData.put("success", false);
                    responseData.put("error", "Dữ liệu JSON rỗng");
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }

                // Parse JSON
                Map<String, Object> requestData;
                try {
                    requestData = gson.fromJson(jsonBuilder.toString(), Map.class);
                } catch (Exception e) {
                    responseData.put("success", false);
                    responseData.put("error", "Dữ liệu JSON không hợp lệ: " + e.getMessage());
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }

                // Kiểm tra dữ liệu đầu vào
                if (requestData == null || !requestData.containsKey("roleId") || !requestData.containsKey("permissions")) {
                    responseData.put("success", false);
                    responseData.put("error", "Dữ liệu không đầy đủ: Thiếu roleId hoặc permissions");
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }

                String roleIdStr = String.valueOf(requestData.get("roleId"));
                List<Map<String, Object>> permissions = (List<Map<String, Object>>) requestData.get("permissions");

                // Chuyển đổi roleId thành int
                int roleId;
                try {
                    roleId = Integer.parseInt(roleIdStr);
                } catch (NumberFormatException e) {
                    responseData.put("success", false);
                    responseData.put("error", "roleId không hợp lệ: " + roleIdStr);
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }

                if (permissions == null || permissions.isEmpty()) {
                    responseData.put("success", false);
                    responseData.put("error", "Dữ liệu không hợp lệ: permissions rỗng");
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }

                // Bắt đầu giao dịch
                handle.begin();
                try {
                    // Thêm các role-resource-permission
                    for (Map<String, Object> perm : permissions) {
                        if (!perm.containsKey("permissionId") || !perm.containsKey("resourceIds")) {
                            responseData.put("success", false);
                            responseData.put("error", "Dữ liệu không hợp lệ: Thiếu permissionId hoặc resourceIds");
                            sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                            return;
                        }

                        String permissionIdStr = String.valueOf(perm.get("permissionId"));
                        List<String> resourceIds = (List<String>) perm.get("resourceIds");

                        // Chuyển đổi permissionId thành int
                        int permissionId;
                        try {
                            permissionId = Integer.parseInt(permissionIdStr);
                        } catch (NumberFormatException e) {
                            responseData.put("success", false);
                            responseData.put("error", "permissionId không hợp lệ: " + permissionIdStr);
                            sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                            return;
                        }

                        if (resourceIds == null || resourceIds.isEmpty()) {
                            continue; // Bỏ qua nếu không có resource nào được chọn
                        }

                        for (String resourceIdStr : resourceIds) {
                            // Chuyển đổi resourceId thành int
                            int resourceId;
                            try {
                                resourceId = Integer.parseInt(resourceIdStr);
                            } catch (NumberFormatException e) {
                                responseData.put("success", false);
                                responseData.put("error", "resourceId không hợp lệ: " + resourceIdStr);
                                sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                                return;
                            }

                            // Kiểm tra trùng lặp trước khi thêm
                            List<RoleResourcePermission> existing = permissionDao.getAll().stream()
                                    .filter(p -> p.getRoleId() == roleId && p.getResourceId() == resourceId && p.getPermissionId() == permissionId)
                                    .collect(Collectors.toList());
                            if (existing.isEmpty()) {
                                permissionDao.insert(roleId, resourceId, permissionId);
                            }
                        }
                    }

                    // Commit giao dịch
                    handle.commit();
                    responseData.put("success", true);
                    responseData.put("message", "Tạo vai trò và tài nguyên thành công");
                    sendResponse(response, HttpServletResponse.SC_OK, responseData);
                } catch (IllegalArgumentException e) {
                    // Rollback giao dịch nếu có lỗi
                    handle.rollback();
                    responseData.put("success", false);
                    responseData.put("error", "Lỗi khi thêm dữ liệu: " + e.getMessage());
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                }
            } else if ("/update".equals(pathInfo)) {
                // Đọc dữ liệu JSON từ request
                BufferedReader reader = request.getReader();
                StringBuilder jsonBuilder = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    jsonBuilder.append(line);
                }

                // Kiểm tra JSON rỗng
                if (jsonBuilder.length() == 0) {
                    responseData.put("success", false);
                    responseData.put("error", "Dữ liệu JSON rỗng");
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }

                // Parse JSON
                Map<String, Object> requestData;
                try {
                    requestData = gson.fromJson(jsonBuilder.toString(), Map.class);
                } catch (Exception e) {
                    responseData.put("success", false);
                    responseData.put("error", "Dữ liệu JSON không hợp lệ: " + e.getMessage());
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }

                // Kiểm tra dữ liệu đầu vào
                if (requestData == null || !requestData.containsKey("roleId") || !requestData.containsKey("permissions")) {
                    responseData.put("success", false);
                    responseData.put("error", "Dữ liệu không đầy đủ: Thiếu roleId hoặc permissions");
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }

                String roleIdStr = String.valueOf(requestData.get("roleId"));
                List<Map<String, Object>> permissions = (List<Map<String, Object>>) requestData.get("permissions");

                // Chuyển đổi roleId thành int
                int roleId;
                try {
                    roleId = Integer.parseInt(roleIdStr);
                } catch (NumberFormatException e) {
                    responseData.put("success", false);
                    responseData.put("error", "roleId không hợp lệ: " + roleIdStr);
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }

                if (permissions == null) {
                    responseData.put("success", false);
                    responseData.put("error", "Dữ liệu không hợp lệ: permissions rỗng");
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }

                // Bắt đầu giao dịch
                handle.begin();
                try {
                    // Xóa tất cả permissions hiện tại của roleId
                    permissionDao.deleteByRoleId(roleId);

                    // Thêm lại các permissions mới
                    for (Map<String, Object> perm : permissions) {
                        if (!perm.containsKey("permissionId") || !perm.containsKey("resourceIds")) {
                            responseData.put("success", false);
                            responseData.put("error", "Dữ liệu không hợp lệ: Thiếu permissionId hoặc resourceIds");
                            sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                            return;
                        }

                        String permissionIdStr = String.valueOf(perm.get("permissionId"));
                        List<String> resourceIds = (List<String>) perm.get("resourceIds");

                        // Chuyển đổi permissionId thành int
                        int permissionId;
                        try {
                            permissionId = Integer.parseInt(permissionIdStr);
                        } catch (NumberFormatException e) {
                            responseData.put("success", false);
                            responseData.put("error", "permissionId không hợp lệ: " + permissionIdStr);
                            sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                            return;
                        }

                        if (resourceIds == null || resourceIds.isEmpty()) {
                            continue; // Bỏ qua nếu không có resource nào được chọn
                        }

                        for (String resourceIdStr : resourceIds) {
                            // Chuyển đổi resourceId thành int
                            int resourceId;
                            try {
                                resourceId = Integer.parseInt(resourceIdStr);
                            } catch (NumberFormatException e) {
                                responseData.put("success", false);
                                responseData.put("error", "resourceId không hợp lệ: " + resourceIdStr);
                                sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                                return;
                            }

                            // Thêm mới permission
                            permissionDao.insert(roleId, resourceId, permissionId);
                        }
                    }

                    // Commit giao dịch
                    handle.commit();
                    responseData.put("success", true);
                    responseData.put("message", "Cập nhật vai trò và tài nguyên thành công");
                } catch (IllegalArgumentException e) {
                    // Rollback giao dịch nếu có lỗi
                    handle.rollback();
                    responseData.put("success", false);
                    responseData.put("error", "Lỗi khi cập nhật dữ liệu: " + e.getMessage());
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                }
            } else {
                responseData.put("success", false);
                responseData.put("error", "Đường dẫn không hợp lệ");
                sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
            }
        } catch (Exception e) {
            responseData.put("success", false);
            responseData.put("error", "Lỗi server khi xử lý yêu cầu: " + e.getMessage());
            sendResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, responseData);
        }
    }

    private void sendResponse(HttpServletResponse response, int status, Map<String, Object> responseData) throws IOException {
        response.setStatus(status);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.print(gson.toJson(responseData));
        }
    }
}