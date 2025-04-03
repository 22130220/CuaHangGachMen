package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import dev.samstevens.totp.exceptions.QrGenerationException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.TOTPUtils;

import java.io.IOException;

@WebServlet(name = "TOTPController", value = "/totp")
public class TOTPController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("auth");
        if (u != null) {
            Handle handle = DBConect.get().open();
            String secretKey = new UserDao(handle).getSecretKey(u.getId());
            if(secretKey != null) {
                response.sendRedirect(request.getContextPath() + "/");
                return;
            }
            secretKey = session.getAttribute("secretKey") == null ? TOTPUtils.getGenerateKey() : (String) session.getAttribute("secretKey");
            session.setAttribute("secretKey", secretKey);
            String dataUri = null;
            try {
                dataUri = (String) session.getAttribute("dataUri") == null ? TOTPUtils.getQRCode(secretKey, "tahoangphuc1901@gmail.com") : (String) session.getAttribute("dataUri");
                session.setAttribute("dataUri", dataUri);
            } catch (QrGenerationException e) {
                throw new RuntimeException(e);
            }
            request.setAttribute("dataUri", dataUri);
            request.getRequestDispatcher("WEB-INF/totp_register.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}