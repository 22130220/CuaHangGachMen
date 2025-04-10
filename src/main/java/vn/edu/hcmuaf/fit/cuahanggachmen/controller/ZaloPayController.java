package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.ZaloPayService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ZaloPayController", value = "/ZaloPayController")
public class ZaloPayController extends HttpServlet {
    private ZaloPayService zalopayService;

    @Override
    public void init() throws ServletException {
        zalopayService = new ZaloPayService(); // Khởi tạo service
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String appTransId = request.getParameter("appTransId");
//        if (appTransId != null) {
//            String result = zalopayService.getOrderStatus(appTransId);
//
//            response.setStatus(HttpServletResponse.SC_OK);
//            PrintWriter out = response.getWriter();
//            out.write(result);
//        } else {
//            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//            PrintWriter out = response.getWriter();
//            out.write("Missing appTransId parameter");
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String tien =(String) session.getAttribute("finalTotal");

        try {
            // Đọc dữ liệu từ request
            Map<String, Object> orderRequest = new HashMap<>();

            // Gọi service để tạo đơn hàng
            String result = zalopayService.createOrder(orderRequest,tien);
            // Chuyển kết quả trả về từ Zalopay thành JSONObject
            JSONObject jsonResponse = new JSONObject(result);

            // Kiểm tra mã trả về, nếu thành công thì lấy order_url
            if (jsonResponse.getInt("return_code") == 1) {
                String orderUrl = jsonResponse.getString("order_url");

                // Chuyển hướng người dùng đến order_url
                response.sendRedirect(orderUrl);
            } else {
                // Nếu có lỗi, trả về mã lỗi 500
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Error: " + jsonResponse.getString("return_message"));
            }
            // Trả về kết quả
//            response.setStatus(HttpServletResponse.SC_OK);
//            PrintWriter out = response.getWriter();
//            out.write(result);
//            response.sendRedirect("/success.jsp");
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            PrintWriter out = response.getWriter();
            out.write("Error creating payment: " + e.getMessage());
        }



    }
}