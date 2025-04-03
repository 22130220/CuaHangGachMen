package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.JsonObject;
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
import java.io.PrintWriter;

@WebServlet(name = "TOTPCheck", value = "/totp-check")
public class TOTPServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            JsonObject ob = new JsonObject();
            ob.addProperty("message", "Unauthorized");
            ob.addProperty("status", 401);
            out.print(ob);
            return;
        }

        Handle handle = DBConect.get().open();
        UserDao userDao = new UserDao(handle);
        String sKey = userDao.getSecretKey(user.getId());
        if (sKey != null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            JsonObject ob = new JsonObject();
            ob.addProperty("message", "Secret key already exists");
            ob.addProperty("status", 400);
            out.print(ob);
            return;
        }
        String secretKey = session.getAttribute("secretKey") == null ? TOTPUtils.getGenerateKey() : (String) session.getAttribute("secretKey");
        session.setAttribute("secretKey", secretKey);
        String dataUri = null;
        try {
            dataUri = (String) session.getAttribute("dataUri") == null ? TOTPUtils.getQRCode(secretKey, "tahoangphuc1901@gmail.com") : (String) session.getAttribute("dataUri");
            session.setAttribute("dataUri", dataUri);
        } catch (QrGenerationException e) {
            throw new RuntimeException(e);
        }

        JsonObject ob = new JsonObject();
        ob.addProperty("status", 204);
        ob.addProperty("dataUri", dataUri);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(ob.toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            JsonObject ob = new JsonObject();
            ob.addProperty("message", "Unauthorized");
            ob.addProperty("status", 401);
            out.print(ob);
            return;
        }
    }

}