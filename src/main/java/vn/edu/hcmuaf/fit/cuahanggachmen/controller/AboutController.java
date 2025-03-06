package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import com.sun.net.httpserver.Request;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.Result;
import vn.edu.hcmuaf.fit.cuahanggachmen.mail.EmailService;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AboutController", value = "/AboutController")
public class AboutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            request.getRequestDispatcher("/WEB-INF/about.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name= request.getParameter("name");
        String email= request.getParameter("Email");
        String tieuDe= request.getParameter("TieuDe");
        String content= request.getParameter("content");
        AjaxResponse resp = new AjaxResponse();
        String mailManager="ltphat240103@gmail.com";
        // Xây dựng nội dung email
        String emailBody = "<h2>Vấn đề khách hàng</h2>" + "<p><strong>Người gửi:</strong> " + name + "</p>"
                + "<p><strong>Email:</strong> " + email + "</p>" + "<hr>" + "<h3>Nội dung:</h3>" + "<p>" + content
                + "</p>";

        EmailService emailService = new EmailService();
        boolean emailSent = emailService.send(mailManager, "Vấn đề của khách hàng", emailBody);
        resp.addBool("success", emailSent);


        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());

    }
}