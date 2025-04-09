package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.AuthService;

import java.io.IOException;

@WebServlet(name = "UseRecoveryCodeController", value = "/recovery_account")
public class UseRecoveryCodeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userVerify");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/totp_use_recovery_code.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userVerify");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        String recoveryCode = request.getParameter("code");
        if (recoveryCode == null || recoveryCode.isEmpty()) {
            request.setAttribute("error", "Mã khôi phục không được để trống");
            request.getRequestDispatcher("/WEB-INF/totp_use_recovery_code.jsp").forward(request, response);
            return;
        }

        AuthService service = new AuthService();
        if(service.checkUserRecoveryCode(user.getId(), recoveryCode)) {
            session.setAttribute("auth", user);
            session.removeAttribute("userVerify");
            service.userResetTotp(user.getId());
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            request.setAttribute("error", "Mã khôi phục không chính xác");
            request.getRequestDispatcher("/WEB-INF/totp_use_recovery_code.jsp").forward(request, response);
        }

    }
}