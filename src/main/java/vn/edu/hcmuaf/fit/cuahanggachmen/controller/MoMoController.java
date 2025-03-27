package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.MoMoService;

import java.io.IOException;

@WebServlet(name = "MoMoController", value = "/MoMoController")
public class MoMoController extends HttpServlet {
    private static final String REDIRECT_URL = "http://localhost:8080/CheckoutMoMo";
    private static final String IPN_URL = "http://localhost:8080/";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String amount = request.getParameter("total_momo");
        MoMoService paymentService = new MoMoService();
        String payUrl = paymentService.createPayment(amount, REDIRECT_URL, IPN_URL);
        response.sendRedirect(payUrl);
    }
}