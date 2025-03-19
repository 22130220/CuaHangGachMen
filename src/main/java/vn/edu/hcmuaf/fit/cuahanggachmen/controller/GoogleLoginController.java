package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.GoogleLogin;

import java.io.IOException;

@WebServlet(name = "GoogleLoginController", value = "/googlelogin")
public class GoogleLoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        String code = request.getParameter("code");
        GoogleLogin gg = new GoogleLogin();
        String accessToken=gg.getToken(code);
        System.out.println(accessToken);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}