package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

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
import java.util.List;

@WebServlet(name = "RoleController", value = "/admin/role")
public class RoleController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Handle handle = DBConect.get().open()) {
            RoleDao roleDao = new RoleDao(handle);
            RoleResourcePermissionDao permissionDao = new RoleResourcePermissionDao(handle);

            // Lấy danh sách tất cả roles và permissions
            List<Role> roles = roleDao.getAllRoles();
            List<RoleResourcePermission> permissions = permissionDao.getAll();

            // Đưa dữ liệu vào request để JSP sử dụng
            request.setAttribute("roles", roles);
            request.setAttribute("permissions", permissions);

            // Forward đến JSP
            request.getRequestDispatcher("/WEB-INF/admin_role.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Không thể tải dữ liệu vai trò");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Hiện tại chưa cần xử lý POST
    }
}