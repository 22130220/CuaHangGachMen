package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.GoogleAccount;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Log;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.GoogleLogin;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.LogService;

import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "GoogleLoginController", value = "/googlelogin")
public class GoogleLoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        String code = request.getParameter("code");
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

            url = "/";
       }else{
          int id= dao.insertUser1(account.getName(),account.getEmail());
          if(id>0){
              Log log=new Log("alert",id,"Đăng nhập Google","Người dùng chưa có trong cơ sở dữ liệu","Người dùng đã được cập nhập vô cơ sở dữ liệu");
              LogService logService = new LogService();
              logService.alert(log);
              User user1=dao.findByEmail(account.getEmail());
              session.setAttribute("auth", user1);
          }
           url = "/";
       }
       handle.close();

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}