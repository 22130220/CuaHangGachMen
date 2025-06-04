package vn.edu.hcmuaf.fit.cuahanggachmen.filter;


import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Bool;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.CategoryDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ManufacturerDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.MaterialDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Category;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Manufacturer;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Material;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "GlobalFilter", urlPatterns = "/*")
public class GlobalFilter implements Filter {

    @Override
    public void init(FilterConfig config) throws ServletException {
    }

    @Override
    public void destroy() {
        // Dọn dẹp tài nguyên nếu cần
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        Cache<String, String> cache = Caffeine.newBuilder()
                .recordStats()
                .build();
        cache.put("uid", "hehe");
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession();

        List<Category> ct =(List<Category>) session.getAttribute("categories");
        List<Material> mt =(List<Material>) session.getAttribute("materials");
        List<Manufacturer> mn =(List<Manufacturer>) session.getAttribute("manufacturers");

        if (ct == null || mt == null || mn == null) {
            try (Handle handle = DBConect.get().open()) {
                CategoryDao ctDao = new CategoryDao(handle);
                MaterialDao mtDao = new MaterialDao(handle);
                ManufacturerDao mnDao = new ManufacturerDao(handle);

                ct = ctDao.findAllWithStatus();
                mt = mtDao.findAllWithStatus();
                mn = mnDao.findAllWithStatus();

                session.setAttribute("categories", ct);
                session.setAttribute("materials", mt);
                session.setAttribute("manufacturers", mn);
            }

        }

        User user = (User) session.getAttribute("auth");
        if (user!=null) {
            // Cập nhật phân quyền
            Cache<String, String> cache2 = Caffeine.newBuilder()
                    .recordStats()
                    .build();
            String value = cache2.getIfPresent("uid");
            System.out.println(user.getId() + " " + value);
            System.out.println(cache.stats());
        }
        chain.doFilter(request, response);

    }
}
