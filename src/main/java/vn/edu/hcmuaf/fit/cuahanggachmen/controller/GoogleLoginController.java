package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserResourceDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserRoleDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.filter.CheckPermissionFilter;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.GoogleAccount;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.LogModel;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.UserPermission;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.builder.GoogleLoginBuilder;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.builder.LogBuilder;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.builder.LoginDeviceBuilder;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.GoogleLogin;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.LogService;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.log_config.LogLevel;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.log_config.LoginLevel;

import java.io.IOException;

@WebServlet(name = "GoogleLoginController", value = "/googlelogin")
public class GoogleLoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            response.sendRedirect("/login");
            return;
        }
        GoogleLogin gg = new GoogleLogin();
        String accessToken=gg.getToken(code);
        GoogleAccount account=gg.getUserInfo(accessToken);
        HttpSession session = request.getSession();
        System.out.println(account);
        if(account==null||account.getEmail()==null){
            response.sendRedirect("/WEB-INF/404.jsp");
            return;
        }

        Handle handle=DBConect.get().open();
        UserDao dao = new UserDao(handle);
        String url=null;
        if(dao.checkEmail(account.getEmail())){
            User user = dao.findByEmail(account.getEmail());
            session.setAttribute("auth", user);

            new GoogleLoginBuilder()
                    .loginLevel(LoginLevel.LOGIN)
                    .setHeaderRequest(request, response)
                    .location("GoogleLoginController")
                    .message("Đăng nhập google thành công")
                    .build(handle);
            url = "/";
            CheckPermissionFilter.cache.invalidate(String.valueOf(user.getId()));
            UserResourceDao uDao = new UserResourceDao(handle);

            UserPermission rMap = uDao.getPermission(user.getId());
            session.setAttribute("userRole", rMap);
        }else{
            int id= dao.insertUser1(account.getName(),account.getEmail());
            if(id>0){
                UserRoleDao userRoleDao = new UserRoleDao(handle);
                userRoleDao.insertUserRole(id, 2);
                new GoogleLoginBuilder()
                        .loginLevel(LoginLevel.REGISTERED)
                        .setHeaderRequest(request, response)
                        .level(LogLevel.ALERT)
                        .location("GoogleLoginController")
                        .message("Đăng ký google thành công")
                        .build(handle);
                CheckPermissionFilter.cache.invalidate(String.valueOf(id));
                User user1=dao.findByEmail(account.getEmail());
                session.setAttribute("auth", user1);
                UserResourceDao uDao = new UserResourceDao(handle);

                UserPermission rMap = uDao.getPermission(user1.getId());
                session.setAttribute("userRole", rMap);
            }
            url = "/";
        }
        handle.close();

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }
}