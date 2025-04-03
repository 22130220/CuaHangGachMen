package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.argument.internal.NamedArgumentFinderFactory;
import org.jdbi.v3.core.statement.UnableToExecuteStatementException;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.ActionResult;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.Result;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper.UserMapper;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.time.LocalDateTime;
import java.util.List;

public class UserDao extends BaseDao {

    public UserDao(Handle handle) {
        super(handle);
    }

    public void updatePassword(String email, String hashedPassword, String salt) {
        handle.createUpdate("UPDATE users SET password = :password, salt = :salt WHERE email = :email")
                .bind("password", hashedPassword)
                .bind("salt", salt)
                .bind("email", email)
                .execute();
    }
    public boolean checkEmail(String email) {

        String check=handle.createQuery("SELECT email FROM users WHERE email = :email")
                .bind("email", email)
                .mapTo(String.class)
                .findOne().orElse(null);
        return check!=null;
    }

    // Tìm user bằng password (Facebook ID)
    public User findByFacebookId(String facebookId) {
        return handle.createQuery("SELECT * FROM users WHERE fbid = :facebookId AND status=1")
                .bind("facebookId", facebookId)
                .map(new UserMapper())
                .findOne()
                .orElse(null);
    }

    // Insert user với Facebook ID vào password
    public int insertFacebookUser(User user) {
        return handle.createUpdate("INSERT INTO users (fbid, fullname, email, avatar, status, phone, address, birthtime, sex) " +
                        "VALUES (:fbid, :fullname, :email, :avatar, :status, :phone, :address, :birthtime, :sex)")
                .bind("fbid", user.getFbid())
                .bind("fullname", user.getFullname())
                .bind("email", user.getEmail())
                .bind("avatar", user.getAvatar())
                .bind("status", user.isStatus())
                .bind("phone", user.getPhone())
                .bind("address", user.getAddress())
                .bind("birthtime", user.getBirthtime())
                .bind("sex", user.getSex())
                .executeAndReturnGeneratedKeys("id")
                .mapTo(int.class)
                .one();
    }

    // Update user dựa trên password (Facebook ID)
    public int updateUserFaceBook(User user) {
        return handle.createUpdate("UPDATE users SET fullname = :fullname, email = :email, avatar = :avatar, " +
                        "phone = :phone, address = :address, birthtime = :birthtime, sex = :sex " +
                        "WHERE fbid = :fbid")
                .bind("fullname", user.getFullname())
                .bind("email", user.getEmail())
                .bind("avatar", user.getAvatar())
                .bind("phone", user.getPhone())
                .bind("address", user.getAddress())
                .bind("birthtime", user.getBirthtime())
                .bind("sex", user.getSex())
                .bind("fbid", user.getFbid())
                .execute();
    }


    public void updateUserProfileAvatar(User user) {
        handle.createUpdate("UPDATE users SET avatar = :avatar WHERE id = :id")
                .bind("avatar", user.getAvatar())
                .bind("id", user.getId())
                .execute();
    }

    public int countUser() {
        return handle.createQuery("SELECT COUNT(id) as tongSo FROM users WHERE status = 1").mapTo(Integer.class).one();
    }

    public void updateUserProfile(User user) {
        handle.createUpdate("UPDATE users SET fullname = :fullname,email=:email, phone = :phone, address = :address, birthtime = :birthtime, sex = :sex WHERE id = :id")
                .bind("fullname", user.getFullname())
                .bind("phone", user.getPhone())
                .bind("address", user.getAddress())
                .bind("birthtime", user.getBirthtime())
                .bind("sex", user.getSex())
                .bind("id", user.getId())
                .bind("email", user.getEmail())
                .execute();
    }


    // Lấy tất cả người dùng
    public List<User> getAllUsers() {
        return handle.createQuery("SELECT * FROM users")
                .map(new UserMapper()) // Sử dụng UserMapper để ánh xạ
                .list();
    }

    // Lấy một người dùng theo ID
    public User getUserById(int id) {
        return handle.createQuery("SELECT * FROM users WHERE id = :id AND status=1")
                .bind("id", id) // Gắn giá trị id
                .map(new UserMapper())
                .findOne()
                .orElse(null);
    }
    public User findByEmail(String email) {
        return handle.createQuery("SELECT * FROM users WHERE email = :email AND status=1")
                .bind("email", email) // Gắn giá trị id
                .map(new UserMapper())
                .findOne()
                .orElse(null);
    }

    public String getRecoryCode(int userId) {
        return handle.createQuery("SELECT totp_recovery_code FROM users WHERE id = :id")
                .bind("id", userId) // Gắn giá trị id
                .mapTo(String.class)
                .findOne()
                .orElse(null);
    }

    public String getSecretKey(int userId) {
        return handle.createQuery("SELECT totp_secret_key FROM users WHERE id = :id")
                .bind("id", userId) // Gắn giá trị id
                .mapTo(String.class)
                .findOne()
                .orElse(null);
    }

    public int insertRecoveryCode(int userId, String recoveryCode) {
        return handle.createUpdate("UPDATE users SET totp_recovery_code = :recoveryCode WHERE id = :id")
                .bind("id", userId)
                .bind("recoveryCode", recoveryCode)
                .execute();
    }

    public int insertSecretKey(int userId, String secretKey) {
        return handle.createUpdate("UPDATE users SET totp_secret_key = :secretKey WHERE id = :id")
                .bind("id", userId)
                .bind("secretKey", secretKey)
                .execute();
    }

    public int insertUser1(String name, String email) {

        return handle.createUpdate("INSERT INTO users (fullname, email) " +
                        "VALUES (:fullname, :email)")
                .bind("fullname", name)
                .bind("email", email)
                .execute();


    }



    // Thêm một người dùng mới
    public ActionResult insertUser(String name, String email, String phone, String avatar, String address, LocalDateTime birthtime, String salt, String password, int sex) {
        try {
            handle.createUpdate("INSERT INTO users (fullname, email, phone, avatar, address, birthtime, salt, password, sex) " +
                            "VALUES (:fullname, :email, :phone, :avatar, :address, :birthtime, :salt, :password, :sex)")
                    .bind("fullname", name)
                    .bind("email", email)
                    .bind("phone", phone)
                    .bind("avatar", avatar)
                    .bind("address", address)
                    .bind("birthtime", birthtime)
                    .bind("salt", salt)
                    .bind("password", password)
                    .bind("sex", sex)
                    .execute();
            return Result.Ok();
        } catch (UnableToExecuteStatementException e) {
            Throwable cause = e.getCause();
            if (cause instanceof SQLIntegrityConstraintViolationException) {
                return Result.BadRequest("Email đã tồn tại");
            }
            return Result.BadRequest(null);
        }
    }

    // Cập nhật thông tin người dùng
    public int updateUser(User user) {
        return handle.createUpdate("UPDATE users SET fullname = :fullname, email = :email, phone = :phone, address = :address, sex = :sex, birthtime = :birthtime, status = :status WHERE id = :id")
                .bind("fullname", user.getFullname())
                .bind("email", user.getEmail())
                .bind("phone", user.getPhone())
                .bind("address", user.getAddress())
                .bind("id", user.getId())
                .bind("sex", user.getSex())
                .bind("birthtime", user.getBirthtime())
                .bind("status", user.isStatus())
                .execute();
    }

    // Xóa người dùng theo ID
    public void deleteUser(int id) {
        handle.createUpdate("DELETE FROM users WHERE id = :id")
                .bind("id", id)
                .execute();
    }

    public int changePassword(int id, String hash, String salt) {
        return handle.createUpdate("UPDATE users SET password = :hash, salt = :salt WHERE id = :id")
                .bind("id", id)
                .bind("hash", hash)
                .bind("salt", salt)
                .execute();
    }

}
