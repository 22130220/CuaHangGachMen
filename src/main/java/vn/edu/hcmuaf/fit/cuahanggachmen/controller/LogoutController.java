package vn.edu.hcmuaf.fit.cuahanggachmen.controller;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.builder.LoginDeviceBuilder;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.log_config.LoginLevel;

import java.io.IOException;

@WebServlet(name = "logout", value = "/logout")
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User u = (User) session.getAttribute("auth");
        if (u != null) {
            Handle handle = DBConect.get().open();
            new LoginDeviceBuilder()
                    .loginLevel(LoginLevel.LOGOUT)
                    .setHeaderRequest(request, response)
                    .location("LogoutController")
                    .message("Đăng xuất")
                    .build(handle);
            session.invalidate(); // Hủy session
        }

//        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
        response.sendRedirect("/");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
