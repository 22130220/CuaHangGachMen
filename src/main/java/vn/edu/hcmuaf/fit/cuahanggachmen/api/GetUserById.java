package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "GetUserById", value = "/GetUserById")
public class GetUserById extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        String id = request.getParameter("id");
        UserDao dao = new UserDao(handle);
        User us = dao.getUserById1(Integer.parseInt(id));

        Map<String, Object> resp = new HashMap<>();
        if (us != null) {
            resp.put("status", true);
            resp.put("id", us.getId());
            resp.put("Name", us.getFullname());
            resp.put("Email", us.getEmail());
        } else {
            resp.put("status", false);
        }

        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        out.print(new Gson().toJson(resp));
        out.flush();
        handle.close();
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}