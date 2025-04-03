package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.JsonObject;
import dev.samstevens.totp.exceptions.QrGenerationException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.TOTPUtils;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "TOTPController", value = "/totp")
public class TOTPController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("auth");
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
        String secretKey = TOTPUtils.getGenerateKey();
        session.setAttribute("secretKey", secretKey);
        String dataUri = null;
        try {
            dataUri = TOTPUtils.getQRCode(secretKey, "tahoangphuc1901@gmail.com");
        } catch (QrGenerationException e) {
            throw new RuntimeException(e);
        }

        JsonObject ob = new JsonObject();
        ob.addProperty("status", 204);
        ob.addProperty("dataUri", dataUri);
        response.setStatus(HttpServletResponse.SC_NO_CONTENT);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(ob);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("auth");
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