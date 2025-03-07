package vn.edu.hcmuaf.fit.cuahanggachmen.service;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.ActionResult;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.StatusCode;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.regex.Pattern;

public class RegisterService {
    public ActionResult checkPassword(String password) {
        ActionResult result = new ActionResult();
        boolean hasUppercase = Pattern.compile(".*[A-Z].*").matcher(password).matches();
        boolean hasDigit = Pattern.compile(".*\\d.*").matcher(password).matches();
        boolean isCorrectLength = password.length() >= 8;


        if (!hasUppercase) {
            result.setCode(StatusCode.PASSWORD_FAILED);
            result.put("hasUppercase", "Mật khẩu phải có một ký tự in hoa");
        }
        if (!hasDigit) {
            result.setCode(StatusCode.PASSWORD_FAILED);
            result.put("hasDigit", "Mật khẩu phải có ít nhất một số");
        }
        if (!isCorrectLength) {
            result.setCode(StatusCode.PASSWORD_FAILED);
            result.put("isCorrectLength", "Mật khẩu phải có độ dài từ 8 ký tự trở lên");
        }

        if (hasUppercase && hasDigit && isCorrectLength) {
            result.setCode(StatusCode.OK);
        }

        return result;
    }

    public ActionResult checkConfirmPassword(String password, String confirmPassword) {
        ActionResult result = new ActionResult();
        boolean isCorrectPassword = password.equals(confirmPassword);
        if (!isCorrectPassword) {
            result.setCode(StatusCode.PASSWORD_CONFIRM_FAILED);
            result.setMessage("Nhập lại mật khẩu không đúng");
            return result;
        } else {
            result.setCode(StatusCode.OK);
            return result;
        }
    }

    public ActionResult addUser(User user) {
        Handle handle = DBConect.get().open();
        ActionResult rs = new UserDao(handle).insertUser(user.getFullname(), user.getEmail(), user.getPhone(), user.getAvatar(), user.getAddress(), user.getBirthtime(), user.getSalt(), user.getPassword(), user.getSex());
        handle.close();
        return rs;
    }

    public Timestamp convertToTimestamp(String dateTime) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = sdf.parse(dateTime);
            return new Timestamp(parsedDate.getTime());
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }
}
