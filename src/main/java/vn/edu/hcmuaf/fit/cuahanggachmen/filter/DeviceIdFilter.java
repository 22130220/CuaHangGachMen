package vn.edu.hcmuaf.fit.cuahanggachmen.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.UUID;

@WebFilter(filterName = "DeviceIdFilter")
public class DeviceIdFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();
        String deviceId = (String) session.getAttribute("DEVICE_ID");
        if (deviceId != null) {
            chain.doFilter(request, response);
            return;
        }

        String newDeviceId = UUID.randomUUID().toString();
        session.setAttribute("DEVICE_ID", newDeviceId);
        chain.doFilter(request, response);
    }
}