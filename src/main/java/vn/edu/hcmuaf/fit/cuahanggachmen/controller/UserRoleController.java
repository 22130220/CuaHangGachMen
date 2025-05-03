package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserRoleDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.UserRole;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserRoleController", value = "/admin/user-role")
public class UserRoleController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Handle handle = DBConect.get().open()) {
            UserDao userDao = new UserDao(handle);
            UserRoleDao userRoleDao = new UserRoleDao(handle);

            List<User> users = userDao.getAllUsers();
            List<UserRole> userRoles = userRoleDao.getAllUserRoles();

            request.setAttribute("users", users);
            request.setAttribute("userRoles", userRoles);

            request.getRequestDispatcher("/WEB-INF/admin_user_role.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Không thể tải dữ liệu người dùng và vai trò");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Hiện tại chưa cần xử lý POST
    }
}