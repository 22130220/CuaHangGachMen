package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.SpecTypeDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.VoucherDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.SpecType;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Voucher;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxParseRequest;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.PasswordUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.Clock;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GetSetUser", value = "/admin/user")
public class GetSetUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> ls = new ArrayList<>();
        UserDao dao = new UserDao();
        try {
            ls = dao.getAllUsers();
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }

        AjaxResponse resp = new AjaxResponse();
        resp.addUserList(ls);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String fullName = request.getParameter("fullname");

        String status = request.getParameter("status");
        String email = request.getParameter("email");
        String birthTime = request.getParameter("birth");
        String sex = request.getParameter("sex");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String id = request.getParameter("id");
        int success = 0;
        UserDao dao = new UserDao();
        User c = new User();

        if(action.equalsIgnoreCase("Thêm")) {
            String salt = PasswordUtils.generateSalt();
            String hash = PasswordUtils.hashPassword(password, salt);
            c.setFullname(fullName);
            c.setEmail(email);
            c.setBirthtime(LocalDate.parse(birthTime).atTime(LocalTime.now(Clock.systemUTC()).getHour(), LocalTime.now(Clock.systemUTC()).getHour()));
            c.setSex(Integer.parseInt(sex));
            c.setAddress(address);
            c.setPassword(hash);
            c.setSalt(salt);
            c.setPhone((phone.replaceAll("[^0-9]", "")));

            success = dao.insertUser(c.getFullname(), c.getEmail(), c.getPhone(), c.getAvatar(), c.getAddress(), c.getBirthtime(), c.getSalt(), c.getPassword(), c.getSex()).getCode();
        } else if(action.equalsIgnoreCase("Cập nhật")) {
            c.setFullname(fullName);
            c.setEmail(email);
            c.setBirthtime(LocalDateTime.parse(birthTime));
            c.setSex(Integer.parseInt(sex));
            c.setAddress(address);
            c.setStatus(getBoolVal(status));
            c.setPhone((phone.replaceAll("[^0-9]", "")));
            c.setId(Integer.parseInt(id));
            try {
                success = dao.updateUser(c);
            } catch (SQLException | IllegalAccessException | InstantiationException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        } else if(action.equalsIgnoreCase("Đổi MK")) {
                try {
                    String salt = PasswordUtils.generateSalt();
                    String hash = PasswordUtils.hashPassword(password, salt);
                    success += dao.changePassword(Integer.parseInt(id), hash, salt);
                } catch (SQLException | IllegalAccessException | InstantiationException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }

        }


        AjaxResponse resp = new AjaxResponse();
        resp.addBool("success", success > 0);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
    }

    private boolean getBoolVal(String value) {
        if(value.equalsIgnoreCase("true")) return true;
        else if(value.equalsIgnoreCase("false")) return false;
        return false;
    }
}