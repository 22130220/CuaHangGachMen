package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.PermissionCheck;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.MoMoService;

import java.io.IOException;

@WebServlet(name = "MoMoController", value = "/MoMoController")
public class MoMoController extends HttpServlet {
//    private static final String REDIRECT_URL = "http://localhost:8080/CheckoutMoMo";
//    private static final String IPN_URL = "http://localhost:8080/";
    private static final String REDIRECT_URL = "https://webtmdt.site/CheckoutMoMo";
    private static final String IPN_URL = "https://webtmdt.site/";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "GET"), request, response)) return;

        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "POST"), request, response)) return;
        String amount = request.getParameter("total_momo");
        MoMoService paymentService = new MoMoService();
        String payUrl = paymentService.createPayment(amount, REDIRECT_URL, IPN_URL);
        response.sendRedirect(payUrl);
    }
}