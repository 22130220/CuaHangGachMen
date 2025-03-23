package vn.edu.hcmuaf.fit.cuahanggachmen.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.UUID;

@WebFilter(filterName = "LoginTrackingFilter", urlPatterns = "/login")
public class LoginTrackingFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
//        HttpServletRequest httpRequest = (HttpServletRequest) request;
//        HttpServletResponse httpResponse = (HttpServletResponse) response;
//
//        // Lấy User-Agent và IP
//        String userAgent = httpRequest.getHeader("User-Agent");
//        String ipAddress = request.getRemoteAddr();
//
//        // Lấy hoặc tạo Device ID
//        String deviceId = getOrCreateDeviceId(httpRequest, httpResponse);
//
//        // Giả sử user đã đăng nhập và có userId trong session
//        Integer userId = (Integer) httpRequest.getSession().getAttribute("userId");
//
//        if (userId != null) {
//            try {
////                if (!loginSessionDAO.isDeviceRegistered(userId, deviceId)) {
//                    new LoginDeviceBuilder()
//                            .setHeaderRequest(httpRequest)
//                                    .logType("LOGIN")
//                                            .message("Login successful")
//                    loginSessionDAO.registerDevice(userId, deviceId, userAgent, ipAddress);
//                    System.out.println("New device detected: " + deviceId);
////                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        } else {
//
//        }
//
        chain.doFilter(request, response);
    }

    private String getOrCreateDeviceId(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("DEVICE_ID".equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }

        String newDeviceId = UUID.randomUUID().toString();
        Cookie newCookie = new Cookie("DEVICE_ID", newDeviceId);
        newCookie.setHttpOnly(true);
        newCookie.setMaxAge(60 * 60 * 24 * 365); // 1 năm
        response.addCookie(newCookie);
        return newDeviceId;
    }
}