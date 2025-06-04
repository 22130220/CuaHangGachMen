package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.PermissionCheck;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDaos;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Orders;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "GetSetOrder", value = "/admin/order")
public class GetSetOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String className = this.getClass().getName();
        if (className != null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".", className, "GET"), request, response)) return;
        Handle handle = DBConect.get().open();
        OrderDaos pDao = new OrderDaos(handle);
        List<Orders> ls = pDao.getOrdersWithFullNames();

        AjaxResponse resp = new AjaxResponse();
        resp.addOrderList(ls);
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
        if (className != null) {
            className = className.substring(className.lastIndexOf(".") + 1);
        } else return;
        if (!PermissionCheck.check(String.join(".", className, "POST"), request, response)) return;

        // Lấy dữ liệu từ request
        String action = request.getParameter("action");
        String active = request.getParameter("active");
        String idJson = request.getParameter("id");

        // Chuyển đổi danh sách ID từ JSON sang List<Integer>
        Gson gson = new Gson();
        List<Integer> ids = gson.fromJson(idJson, new TypeToken<List<Integer>>(){}.getType());

        Handle handle = DBConect.get().open();
        OrderDaos orderDao = new OrderDaos(handle);
        AjaxResponse resp = new AjaxResponse();

        try {
            if ("Cập nhật".equals(action)) {
                boolean success = true;
                for (Integer id : ids) {
                    Orders order = orderDao.getOrderById(id);
                    if (order != null) {
                        // Chỉ cho phép cập nhật nếu trạng thái hiện tại không phải "Delivered" hoặc "Cancelled"
                        if (!"Delivered".equals(order.getStatus()) && !"Cancelled".equals(order.getStatus())) {
                            order.setStatus(active);
                            orderDao.updateOrder(order);
                        } else {
                            success = false;
                            break;
                        }
                    } else {
                        success = false;
                        break;
                    }
                }
                // Sử dụng addBool để thêm trường "success" vào phản hồi JSON
                resp.addBool("success", success);
            } else {
                resp.addBool("success", false);
            }
        } catch (Exception e) {
            resp.addBool("success", false);
        } finally {
            handle.close();
        }

        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
    }
}