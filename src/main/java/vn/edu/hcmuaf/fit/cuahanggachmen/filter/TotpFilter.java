package vn.edu.hcmuaf.fit.cuahanggachmen.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.io.IOException;

@WebFilter(filterName = "TotpFilter", value = "/*")
public class TotpFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String requestUri = httpRequest.getRequestURI();
        String path = requestUri.substring(httpRequest.getContextPath().length());

        // Bỏ qua các tài nguyên tĩnh và URL cụ thể
        if (path.matches(".*\\.(css|js|png|jpg|jpeg|gif)$") ||
                path.startsWith("/assets/") ||
                path.equals("/totp_auth")) {
            chain.doFilter(request, response);
            return;
        }
        HttpSession session = httpRequest.getSession(false);
        User verifydUser = (User) session.getAttribute("userVerify");

        if (verifydUser != null) {
            if (path.equals("/recovery_account")) {
                chain.doFilter(request, response);
                return;
            }
            httpResponse.sendRedirect("/totp_auth");
            return;
        }
        chain.doFilter(request, response);
    }
}