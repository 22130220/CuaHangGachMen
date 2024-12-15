package vn.edu.hcmuaf.fit.cuahanggachmen.service;

import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserService;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.sql.SQLException;

public class AuthService {
    public  User checkLogin(String email, String password) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        UserService usDao = new UserService();
        User u = usDao.findByEmail(email);
        System.out.println(u);
        if(u!=null && password!=null && password.equals(u.getPassword())){
            u.setPassword(null);
            return u;
        }


        return null;
    }

}
