package vn.edu.hcmuaf.fit.cuahanggachmen.service;

import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.PasswordUtils;

import java.sql.SQLException;

public class AuthService {
    public  User checkLogin(String email, String password) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        UserDao usDao = new UserDao();
        User u = usDao.findByEmail(email);
        String salt = u.getSalt();
        String hashedPassword = u.getPassword();
        System.out.println(u);
        if(u!=null && password!=null && PasswordUtils.verifyPassword(password,salt,hashedPassword)){
            u.setPassword(null);
            u.setSalt(null);
            return u;
        }


        return null;
    }

}
