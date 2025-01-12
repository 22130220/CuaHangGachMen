package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.ActionResult;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.Result;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.StatusCode;
import vn.edu.hcmuaf.fit.cuahanggachmen.mail.EmailService;
import vn.edu.hcmuaf.fit.cuahanggachmen.mail.VerificationTokenStore;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.RegisterService;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.PasswordUtils;


import java.io.IOException;
import java.time.LocalDateTime;
import java.util.UUID;

@WebServlet(name = "register", value = "/register")
public class RegisterController extends HttpServlet {
    private EmailService emailService = new EmailService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Thu thập dữ liệu từ form
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");
        String email = request.getParameter("email");
        String phone = request.getParameter("tel");
        String address = request.getParameter("address");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String birthTime = request.getParameter("birthday");
        User user = new User();

        RegisterService resService = new RegisterService();

        ActionResult checkPassword = resService.checkPassword(password);
        ActionResult checkConfirm = resService.checkConfirmPassword(password, confirmPassword);
        ActionResult checkEmail = Result.BadRequest(null);

        ActionResult ac = new ActionResult();
        if(!checkPassword.isOk(StatusCode.OK) || !checkConfirm.isOk(StatusCode.OK)) {
            ac.setCode(StatusCode.REGISTER_FAILED);
            password = null;
            confirmPassword = null;
        } else {
            // Tạo salt và hash password
            String salt = PasswordUtils.generateSalt();
            String hashedPassword = PasswordUtils.hashPassword(password, salt);
            user.setFullname(name);
            user.setPassword(hashedPassword);
            user.setSalt(salt);
            user.setEmail(email);
            user.setPhone(phone);
            user.setAddress(address);
            user.setSex(gender);
            user.setAvatar(null);
            user.setCreatetime(LocalDateTime.now());
            user.setBirthtime(resService.convertToTimestamp(birthTime).toLocalDateTime());
            if(checkPassword.isOk(StatusCode.OK) && checkConfirm.isOk(StatusCode.OK) && checkEmail.isOk(StatusCode.OK)) {
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                response.setHeader("Pragma", "no-cache");
                response.setHeader("Expires", "0");
                response.sendRedirect(request.getContextPath() + "/registration-success");
                return;
            }
            // Tạo token xác thực
            String token = UUID.randomUUID().toString();
            VerificationTokenStore.addToken(token, user);

            // Xây dựng liên kết xác thực
            String verificationLink = request.getRequestURL().toString().replace("/register", "") + "/verify-email?token=" + token;
            String emailContent = emailService.buildVerificationEmailContent(user, verificationLink);

            // Gửi email xác thực
            boolean emailSent = emailService.send(user.getEmail(), "Xác thực tài khoản Cửa hàng gạch men", emailContent);

            if(!emailSent) {
                checkEmail = Result.BadRequest("Không thể gửi email xác thực.");
            }
        }


        ac.put("checkPassword", checkPassword);
        ac.put("checkConfirm", checkConfirm);
        ac.put("checkEmail", checkEmail);
        ac.put("name", name);
        ac.put("phone", phone);
        ac.put("address", address);
        ac.put("gender", gender);
        ac.put("birthday", birthTime);
        ac.put("email", email);
        
        request.setAttribute("email", user.getEmail());
        request.setAttribute("register", ac);
        request.getRequestDispatcher("/WEB-INF/registration-success.jsp").forward(request, response);
    }
}
