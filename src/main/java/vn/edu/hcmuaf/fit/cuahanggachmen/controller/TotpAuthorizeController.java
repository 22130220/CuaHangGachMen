package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.AuthService;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.TOTPUtils;

import java.io.IOException;

@WebServlet(name = "TotpAuthorizeController", value = "/totp_auth")
public class TotpAuthorizeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userVerify");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        request.getRequestDispatcher("WEB-INF/totp_authorize.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userVerify");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        String verifyCode = request.getParameter("code");
        if (verifyCode == null || verifyCode.isEmpty()) {
            request.setAttribute("error", "Mã khôi phục không được để trống");
            request.getRequestDispatcher("/WEB-INF/totp_authorize.jsp").forward(request, response);
            return;
        }

        AuthService service = new AuthService();
        String secretKey = service.getUserSecretKey(user.getId());

        if (TOTPUtils.verifyCode(secretKey, verifyCode)) {
            session.setAttribute("auth", user);
            session.removeAttribute("userVerify");
            response.sendRedirect(request.getContextPath() + "/");
            return;
        } else {
            request.setAttribute("error", "Mã xác thực không chính xác");
        }

        request.getRequestDispatcher("WEB-INF/totp_authorize.jsp").forward(request, response);
    }
}