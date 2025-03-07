package vn.edu.hcmuaf.fit.cuahanggachmen.service;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.PasswordUtils;

import java.sql.SQLException;

public class AuthService {
    public  User checkLogin(String email, String password) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Handle handle = DBConect.get().open();
        UserDao usDao = new UserDao(handle);
        User u = usDao.findByEmail(email);

        System.out.println(u);
        if(u!=null && password!=null){
            String salt = u.getSalt();
            String hashedPassword = u.getPassword();
            if(PasswordUtils.verifyPassword(password,salt,hashedPassword)) {
                u.setPassword(null);
                u.setSalt(null);
            } else u = null;
        }

        handle.close();
        return u;
    }

}
