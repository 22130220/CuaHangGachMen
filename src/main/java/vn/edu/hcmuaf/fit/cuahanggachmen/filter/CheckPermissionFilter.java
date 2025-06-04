package vn.edu.hcmuaf.fit.cuahanggachmen.filter;

import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.io.IOException;

@WebFilter(filterName = "CheckPermissionFilter", urlPatterns = "/*")
public class CheckPermissionFilter implements Filter {
    public static Cache<String, String> cache;
    public void init(FilterConfig config) throws ServletException {
        cache = Caffeine.newBuilder().build();
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession();

        User user = (User) session.getAttribute("auth");
        if (user!=null) {
            // Cập nhật phân quyền
            String value = cache.getIfPresent(String.valueOf(user.getId()));
            if (value != null) {
                cache.invalidate(String.valueOf(user.getId()));
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/logout");
                return;
            }
        }

        chain.doFilter(request, response);
    }
}