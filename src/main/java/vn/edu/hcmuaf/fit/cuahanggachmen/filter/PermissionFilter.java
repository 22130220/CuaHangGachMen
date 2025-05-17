package vn.edu.hcmuaf.fit.cuahanggachmen.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.cuahanggachmen.RequirePermission;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.UserPermission;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;

@WebFilter("/*")
public class PermissionFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        User u = (User) session.getAttribute("auth");

        if (u == null) {
            resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        try {
            HttpServlet servlet = (HttpServlet) req.getAttribute("jakarta.servlet.http.HttpServlet");
            if (servlet != null) {
                String httpMethod = req.getMethod().toUpperCase();
                Method method = servlet.getClass().getMethod("do" + httpMethod, HttpServletRequest.class, HttpServletResponse.class);
                String servletName = req.getHttpServletMapping().getServletName();

                RequirePermission rp = method.getAnnotation(RequirePermission.class);
                if (rp != null) {
                    String[] requiredPermission = rp.value();
                    if(hasPermission(session, requiredPermission, servletName)) {
                        chain.doFilter(request, response);
                        return;
                    } else {
                        resp.setStatus(HttpServletResponse.SC_FORBIDDEN);
                        return;
                    }

                }
            }
        } catch (Exception e) {
            // Log lỗi nếu cần
        }

        chain.doFilter(request, response);
    }

    private boolean hasPermission(HttpSession session, String[] permission, String resourceName) {
        UserPermission rmap = (UserPermission) session.getAttribute("userRole");
        if(rmap == null) return true;
        else
            for (String p : permission) {
                if (rmap.havePermission(resourceName, Integer.parseInt(p))) {
                    return true;
                }
            }

            return false;
        }

}