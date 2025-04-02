package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.builder.LogBuilder;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.builder.LoginDeviceBuilder;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.AuthService;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.VerifyRecaptcha;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.PasswordUtils;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.log_config.LogLevel;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.log_config.LogType;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.log_config.LoginLevel;

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
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        User user = null;
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
        System.out.println(gRecaptchaResponse);
        boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
        Handle handle = DBConect.get().open();

        if(verify) {
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

                new LoginDeviceBuilder()
                        .loginLevel(LoginLevel.LOGIN)
                        .setHeaderRequest(request, response)
                        .location("LoginController")
                        .message("Đăng nhập thành công")
                        .build(handle);
                response.sendRedirect("/");
            }else{
                new LoginDeviceBuilder()
                        .loginLevel(LoginLevel.FAILED)
                        .setHeaderRequest(request, response)
                        .location("LoginController")
                        .level(LogLevel.WARNING)
                        .message("Đăng nhập thất bại")
                        .build(handle);
                request.setAttribute("error", "Email hoặc mật khẩu bạn vừa nhập chưa đúng");
                request.setAttribute("email", email);
                request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            }
        }
        handle.close();

    }
}
