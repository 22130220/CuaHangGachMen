package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.ActionResult;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.Result;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.StatusCode;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.RegisterService;

import java.io.IOException;
import java.sql.SQLException;

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
        String gender = request.getParameter("gender");
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
            user.setFullname(name);
            user.setPassword(password);
            user.setEmail(email);
            user.setPhone(phone);
            user.setAddress(address);
            user.setSex(0);
            user.setAvatar(null);
            user.setSalt(null);
            checkEmail = resService.addUser(user);
        }
        ac.put("checkPassword", checkPassword);
        ac.put("checkConfirm", checkConfirm);
        ac.put("checkEmail", checkEmail);

        if(checkPassword.isOk(StatusCode.OK) && checkConfirm.isOk(StatusCode.OK) && checkEmail.isOk(StatusCode.OK)) {
            ac.setCode(StatusCode.OK);
            ac.setMessage("Đăng ký thành công");
        }

        ac.put("name", name);
        ac.put("password", password);
        ac.put("confirmPassword", confirmPassword);
        ac.put("email", email);
        ac.put("phone", phone);
        ac.put("address", address);
        ac.put("gender", gender);

        request.setAttribute("register", ac);
        doGet(request, response);
    }
}