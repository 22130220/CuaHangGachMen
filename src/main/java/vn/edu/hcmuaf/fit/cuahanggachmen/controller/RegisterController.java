package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import com.sun.net.httpserver.HttpsParameters;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.ActionResult;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.Result;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.StatusCode;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.RegisterService;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.PasswordUtils;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.UUID;

@WebServlet(name = "register", value = "/register")
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            checkEmail = resService.addUser(user);
        }
        if(checkPassword.isOk(StatusCode.OK) && checkConfirm.isOk(StatusCode.OK) && checkEmail.isOk(StatusCode.OK)) {
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            response.sendRedirect(request.getContextPath() + "/login?registion=1");
            return;
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

        request.setAttribute("register", ac);
        doGet(request, response);
    }
}