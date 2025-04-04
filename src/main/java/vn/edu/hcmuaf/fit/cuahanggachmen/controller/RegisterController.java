package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.ActionResult;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.Result;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.StatusCode;
import vn.edu.hcmuaf.fit.cuahanggachmen.mail.EmailService;
import vn.edu.hcmuaf.fit.cuahanggachmen.mail.VerificationTokenStore;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.RegisterService;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.VerifyRecaptcha;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.PasswordUtils;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Base64;
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
        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");

        // Xác minh reCAPTCHA
        boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
        if (!verify) {
            request.setAttribute("error", "Vui lòng xác minh reCAPTCHA.");
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            return;
        }

        // Kiểm tra dữ liệu đầu vào
        RegisterService resService = new RegisterService();
        ActionResult checkPassword = resService.checkPassword(password);
        ActionResult checkConfirm = resService.checkConfirmPassword(password, confirmPassword);
        ActionResult checkEmail = Result.BadRequest(null);

        ActionResult ac = new ActionResult();
        if (!checkPassword.isOk(StatusCode.OK) || !checkConfirm.isOk(StatusCode.OK)) {
            ac.setCode(StatusCode.REGISTER_FAILED);
            ac.put("checkPassword", checkPassword);
            ac.put("checkConfirm", checkConfirm);
            ac.put("name", name);
            ac.put("phone", phone);
            ac.put("address", address);
            ac.put("gender", gender);
            ac.put("birthday", birthTime);
            ac.put("email", email);
            request.setAttribute("register", ac);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            return;
        }

        // Tạo user và hash password
        User user = new User();
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
        user.setStatus(false); // Chưa kích hoạt

        // Tạo token chứa email
        String tokenBase = UUID.randomUUID().toString();
        String emailEncoded = Base64.getEncoder().encodeToString(email.getBytes()); // Mã hóa email
        String token = tokenBase + "." + emailEncoded; // Nối token với email (dấu . để phân tách)

        // Lưu user tạm thời vào VerificationTokenStore
        VerificationTokenStore.addToken(token, user);

        // Tạo liên kết xác thực với email và token
        String verificationLink = request.getRequestURL().toString().replace("/register", "")
                + "/verify-email?token=" + token + "&email=" + email;
        String emailContent = emailService.buildVerificationEmailContent(user, verificationLink);

        // Gửi email xác thực
        boolean emailSent = emailService.send(email, "Xác thực tài khoản Cửa hàng gạch men", emailContent);
        if (!emailSent) {
            checkEmail = Result.BadRequest("Không thể gửi email xác thực.");
            ac.put("checkEmail", checkEmail);
            request.setAttribute("register", ac);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            return;
        }

        // Chuyển hướng đến trang thành công
        request.getRequestDispatcher("/WEB-INF/registration-success.jsp").forward(request, response);
    }
}