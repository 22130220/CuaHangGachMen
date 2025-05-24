package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.PermissionCheck;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ReviewDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Review;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxParseRequest;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@MultipartConfig
@WebServlet(name = "GetSetComment", value = "/admin/comment")
public class GetSetComment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "GET"), request, response)) return;

        Handle handle = DBConect.get().open();
        String pid = request.getParameter("productId");
        Integer id = Integer.parseInt(pid);
        ReviewDao dao = new ReviewDao(handle);
        List<Review> rv = null;
        rv = dao.findReviewsByProductId(id);

        AjaxResponse resp =  new AjaxResponse();
        resp.addReviewList(rv);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
        handle.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "POST"), request, response)) return;
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className!= null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".",className, "PUT"), req, resp)) return;
        String pid = req.getParameter("productId");
        String oId = req.getParameter("orderId");
        String uid = req.getParameter("userId");

        String status = req.getParameter("status");
        String productId[] = AjaxParseRequest.parse(pid);
        String orderId[] = AjaxParseRequest.parse(oId);
        String userId[] = AjaxParseRequest.parse(uid);
        int statusId = Integer.parseInt(status);

        Handle handle = DBConect.get().open();
        ReviewDao dao = new ReviewDao(handle);

        int success = 0;

        for (int i = 0; i < productId.length; i++) {
            success += dao.setStatus(Integer.parseInt(userId[i]), Integer.parseInt(productId[i]), Integer.parseInt(orderId[i]), statusId);
        }

        JsonObject ob = new JsonObject();
        ob.addProperty("success", success > 0);
        ob.addProperty("message", success > 0 ? "Cập nhật thành công" : "Cập nhật thất bại");
        resp.setStatus(HttpServletResponse.SC_OK);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.print(ob);
        handle.close();
    }
}