package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.PermissionCheck;
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
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "GET"), request, response)) return;
        Handle handle = DBConect.get().open();
            UserDao userDao = new UserDao(handle);
            UserRoleDao userRoleDao = new UserRoleDao(handle);

            List<User> users = userDao.getAllUsers();
            List<UserRole> userRoles = userRoleDao.getAllUserRoles();

            request.setAttribute("users", users);
            request.setAttribute("userRoles", userRoles);

            request.getRequestDispatcher("/WEB-INF/admin_user_role.jsp").forward(request, response);

            handle.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "POST"), request, response)) return;
    }
}