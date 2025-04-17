package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import com.sun.net.httpserver.Request;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.Result;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ContactDAO;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.mail.EmailService;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Contact;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDateTime;

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
        String email= request.getParameter("email");
        String tieuDe= request.getParameter("subject");
        String content= request.getParameter("content");
        AjaxResponse resp = new AjaxResponse();
//        String mailManager="ltphat240103@gmail.com";
//        // Xây dựng nội dung email
//        String emailBody = "<h2>Vấn đề khách hàng</h2>" + "<p><strong>Người gửi:</strong> " + name + "</p>"
//                + "<p><strong>Email:</strong> " + email + "</p>" + "<hr>" + "<h3>Nội dung:</h3>" + "<p>" + content
//                + "</p>";
//
//        EmailService emailService = new EmailService();
//        boolean emailSent = emailService.send(mailManager, "Vấn đề của khách hàng", emailBody);
        resp.addBool("success",true);
        Contact ct = new Contact();
        ct.setFullname(name);
        ct.setEmail(email);
        ct.setTitle(tieuDe);
        ct.setContent(content);
        ct.setDate(LocalDateTime.now());
        Handle handle= DBConect.get().open();

        ContactDAO cdao= new ContactDAO(handle);
        cdao.insert(ct);
        handle.close();
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());

    }
}