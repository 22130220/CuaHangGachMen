package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.ActionResult;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.StatusCode;
import vn.edu.hcmuaf.fit.cuahanggachmen.mail.VerificationTokenStore;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.RegisterService;


import java.io.IOException;

@WebServlet(name = "emailVerification", value = "/verify-email")
public class EmailVerificationController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String token = request.getParameter("token");
        if (token == null || token.isEmpty()) {
            request.setAttribute("message", "Token không hợp lệ.");
            request.getRequestDispatcher("/WEB-INF/verification-result.jsp").forward(request, response);
            return;
        }

        User user = VerificationTokenStore.getUserByToken(token);
        if (user == null) {
            request.setAttribute("message", "Token không hợp lệ hoặc đã hết hạn.");
            request.getRequestDispatcher("/WEB-INF/verification-result.jsp").forward(request, response);
            return;
        }

        // Lưu người dùng vào cơ sở dữ liệu
        RegisterService registerService = new RegisterService();
        ActionResult addUserResult = registerService.addUser(user);

        if (addUserResult.isOk(StatusCode.OK)) {
            // Xóa token sau khi xác thực thành công
            VerificationTokenStore.removeToken(token);
            // Chuyển hướng đến trang xác thực thành công
            request.setAttribute("message", "Xác thực tài khoản thành công! Bạn có thể đăng nhập ngay bây giờ.");
        } else {
            // Xử lý lỗi khi lưu người dùng
            request.setAttribute("message", "Có lỗi xảy ra khi xác thực tài khoản.");
        }

        request.getRequestDispatcher("/WEB-INF/verification-result.jsp").forward(request, response);
    }
}
