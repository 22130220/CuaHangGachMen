package vn.edu.hcmuaf.fit.cuahanggachmen;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    public void destroy() {
    }
}