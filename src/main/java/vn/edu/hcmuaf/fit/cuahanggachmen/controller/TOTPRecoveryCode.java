package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "TOTPRecoveryCode", value = "/totp-recovery-code")
public class TOTPRecoveryCode extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("auth") == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        boolean verifyTotpState = session.getAttribute("verifyTotpState") != null && (boolean) session.getAttribute("verifyTotpState");
        if (!verifyTotpState) {
            response.sendRedirect(request.getContextPath() + "/");
            session.removeAttribute("recoveryCodes");
            return;
        }
        String recoveryCodes = (String) session.getAttribute("recoveryCodes");
        if (recoveryCodes == null) {
            response.sendRedirect(request.getContextPath() + "/");
            session.removeAttribute("recoveryCodes");
            return;
        }

        request.setAttribute("recoveryCodes", recoveryCodes);
        session.removeAttribute("recoveryCodes");
        session.removeAttribute("verifyTotpState");
        request.getRequestDispatcher("WEB-INF/totp_recovery_code.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}