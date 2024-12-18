package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.AuthService;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "login", value = "/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User)session.getAttribute("auth");

        if(user != null) {
            response.sendRedirect("/");
            return;
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().invalidate();
        HttpSession session = request.getSession(true);
        User user = null;
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AuthService service = new AuthService();

        try {
            user = service.checkLogin(email, password);
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }

        if(user!=null){
            user.setPassword(null);
            user.setSalt(null);
            session.setAttribute("auth", user);
            response.sendRedirect("/");
        }else{
            request.setAttribute("error", "Email hoặc mật khẩu bạn vừa nhập chưa đúng");
            request.setAttribute("email", email);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }
}
