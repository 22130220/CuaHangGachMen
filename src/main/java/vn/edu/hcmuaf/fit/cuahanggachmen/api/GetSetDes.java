package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductSpecDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.ProductSpec;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxParseRequest;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;

@WebServlet(name = "GetSetDes", value = "/admin/des")
public class GetSetDes extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pid = request.getParameter("pid");
        String linkDes = request.getParameter("linkDes");
        if(pid == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        request.setAttribute("pid", pid);
        request.getRequestDispatcher("/view/"+linkDes).forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String value = request.getParameter("value");
        String linkDes = request.getParameter("linkDes");


        ServletContext context = getServletContext();
        String absolutePath = context.getRealPath("/"+linkDes);

        int success = 0;

        if(action.equalsIgnoreCase("Thêm")) {

        } else if(action.equalsIgnoreCase("Cập nhật")) {
            // Đọc file
            File file = new File(absolutePath);
            if (file.exists()) {
                PrintWriter out = new PrintWriter(new FileWriter(file), true);
                out.println("<html>");
                out.println("<head>");
                out.println("<meta charset=\"UTF-8\" />");
                out.println("</head>");
                out.println("<body>");
                out.println(value);
                out.println("</body>");
                out.println("</html>");
                out.close();
                success = 1;
            }
        } else if(action.equalsIgnoreCase("Xoá")) {


        }


        AjaxResponse resp = new AjaxResponse();
        resp.addBool("success", success > 0);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
    }
}