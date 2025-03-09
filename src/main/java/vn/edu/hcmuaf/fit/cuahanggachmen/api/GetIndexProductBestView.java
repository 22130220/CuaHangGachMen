package vn.edu.hcmuaf.fit.cuahanggachmen.api;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "GetIndexProductBestView", value = "/GetIndexProductBestView")
public class GetIndexProductBestView extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xử lý yêu cầu GET
        response.getWriter().println("Hello from GET method!");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xử lý yêu cầu POST
        response.getWriter().println("Hello from POST method!");
    }
}
