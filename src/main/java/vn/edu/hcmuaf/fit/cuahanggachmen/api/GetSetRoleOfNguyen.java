package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.Gson;
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

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet(name = "GetSetRoleOfNguyen", value = "/admin/role/api")
public class GetSetRoleOfNguyen extends HttpServlet {
    private final Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, Object> responseData = new HashMap<>();
        String roleName = request.getParameter("roleName");

        try (Handle handle = DBConect.get().open()) {
            RoleDao roleDao = new RoleDao(handle);
            RoleResourcePermissionDao permissionDao = new RoleResourcePermissionDao(handle);

            // Lấy danh sách tất cả roles
            List<Role> roles = roleDao.getAllRoles();

            // Lấy danh sách permissions
            List<RoleResourcePermission> permissions;
            if (roleName != null && !roleName.isEmpty()) {
                // Lọc permissions theo roleName
                permissions = permissionDao.getAll().stream()
                        .filter(p -> p.getRoleName().equalsIgnoreCase(roleName))
                        .collect(Collectors.toList());
            } else {
                // Lấy tất cả permissions
                permissions = permissionDao.getAll();
            }

            // Tạo phản hồi JSON
            responseData.put("success", true);
            responseData.put("roles", roles);
            responseData.put("permissions", permissions);

            sendResponse(response, HttpServletResponse.SC_OK, responseData);
        } catch (Exception e) {
            responseData.put("success", false);
            responseData.put("error", "Không thể lấy dữ liệu vai trò: " + e.getMessage());
            sendResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, responseData);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("success", false);
        responseData.put("error", "Hành động POST không được hỗ trợ");
        sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
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