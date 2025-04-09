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

    public boolean checkUserHasTotpSecretKey(int uId) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Handle handle = DBConect.get().open();
        UserDao usDao = new UserDao(handle);
        boolean result = false;
        String secretKey = usDao.getSecretKey(uId);
        if(secretKey != null && !secretKey.isEmpty()) {
            result = true;
        }
        handle.close();
        return result;
    }

    public boolean checkUserRecoveryCode(int uId, String userCode) {
        Handle handle = DBConect.get().open();
        UserDao usDao = new UserDao(handle);
        boolean result = false;

        String recoveryCode = usDao.getRecoryCode(uId);
//        if(recoveryCode != null && !recoveryCode.isEmpty()) {
//            handle.close();
//            return true;
//        }
        String[] recoveryCodes = recoveryCode.split("\\s*,\\s*");

        for (String code : recoveryCodes) {
            if (code.toUpperCase().equals(userCode.toUpperCase())) {
                result = true;
                break;
            }
        }

        handle.close();
        return  result;
    }

    public boolean userHasSecretKey(int uId) {
        Handle handle = DBConect.get().open();

        UserDao usDao = new UserDao(handle);

        String secretKey = usDao.getSecretKey(uId);
        if(secretKey != null && !secretKey.isEmpty()) {
            handle.close();
            return true;
        }
        handle.close();
        return false;
    }

    public void userResetTotp(int uId) {
        Handle handle = DBConect.get().open();
        UserDao usDao = new UserDao(handle);
        usDao.insertRecoveryCode(uId, null);
        usDao.insertSecretKey(uId, null);
        handle.close();
    }

    public String getUserSecretKey(int uId) {
        Handle handle = DBConect.get().open();
        UserDao usDao = new UserDao(handle);
        String secretKey = usDao.getSecretKey(uId);
        handle.close();
        return secretKey;
    }

}
