package vn.edu.hcmuaf.fit.cuahanggachmen.filter;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.CategoryDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ManufacturerDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.MaterialDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Category;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Manufacturer;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Material;

import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "GlobalFilter", urlPatterns = "/*")
public class GlobalFilter implements Filter {

    @Override
    public void init(FilterConfig config) throws ServletException {
        // Khởi tạo filter nếu cần
    }

    @Override
    public void destroy() {
        // Dọn dẹp tài nguyên nếu cần
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
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
        chain.doFilter(request, response);

    }
}
