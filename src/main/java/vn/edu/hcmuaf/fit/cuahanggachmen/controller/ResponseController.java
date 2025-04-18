package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ContactDAO;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.mail.EmailService;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Contact;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ResponseController", value = "/ResponseController")
public class ResponseController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id=request.getParameter("id");
        String reply=request.getParameter("reply");
        Handle handle = DBConect.get().open();
        ContactDAO ctdao = new ContactDAO(handle);
        Contact contact = ctdao.getById(Integer.parseInt(id));
        AjaxResponse resp = new AjaxResponse();
        // Xây dựng nội dung email
        String emailBody = "<h2>Vấn đề khách hàng</h2>"
                + "<p><strong>Người gửi:</strong> " + contact.getFullname() + "</p>"
                + "<p><strong>Email:</strong> " + contact.getEmail() + "</p>"
                + "<hr>"
                + "<h3>Nội dung khách hàng gửi:</h3>"
                + "<p>" + contact.getContent() + "</p>"
                + "<hr>"
                + "<h3>Phản hồi:</h3>"
                + "<p>" + reply + "</p>";

        EmailService emailService = new EmailService();
        boolean emailSent = emailService.send(contact.getEmail(), "Reply "+contact.getTitle(), emailBody);
        resp.addBool("success",emailSent);
        contact.setReply(true);
        contact.setResponse(reply);
        ctdao.update(contact);
        handle.close();
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());

    }
}