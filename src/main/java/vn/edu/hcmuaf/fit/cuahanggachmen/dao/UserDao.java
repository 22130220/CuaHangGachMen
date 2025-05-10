package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.UnableToExecuteStatementException;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.ActionResult;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.Result;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper.UserMapper;

import java.sql.SQLIntegrityConstraintViolationException;
import java.time.LocalDateTime;
import java.util.List;

public class UserDao extends BaseDao {

    public UserDao(Handle handle) {
        super(handle);
    }

    public UserDao(Handle handle, boolean cacheEnabled, long cacheExpirationSeconds, long cacheMaximumSize) {
        super(handle, cacheEnabled, cacheExpirationSeconds, cacheMaximumSize);
    }

    // Cập nhật mật khẩu
    public void updatePassword(String email, String hashedPassword, String salt) {
        try {
            handle.createUpdate("UPDATE users SET password = :password, salt = :salt WHERE email = :email")
                    .bind("password", hashedPassword)
                    .bind("salt", salt)
                    .bind("email", email)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("user_email_" + email);
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể cập nhật mật khẩu: " + e.getMessage(), e);
        }
    }

    // Kiểm tra email
    public boolean checkEmail(String email) {
        String cacheKey = "user_email_" + email;
        return getFromCacheOrCompute(cacheKey, Boolean.class, () -> {
            String check = handle.createQuery("SELECT email FROM users WHERE email = :email")
                    .bind("email", email)
                    .mapTo(String.class)
                    .findOne()
                    .orElse(null);
            return check != null;
        });
    }

    // Tìm user bằng Facebook ID
    public User findByFacebookId(String facebookId) {
        String cacheKey = "user_fbid_" + facebookId;
        return getFromCacheOrCompute(cacheKey, User.class, () ->
                handle.createQuery("SELECT * FROM users WHERE fbid = :facebookId AND status=1")
                        .bind("facebookId", facebookId)
                        .map(new UserMapper())
                        .findOne()
                        .orElse(null)
        );
    }

    // Insert user với Facebook ID
    public int insertFacebookUser(User user) {
        try {
            int id = handle.createUpdate("INSERT INTO users (fbid, fullname, email, avatar, status, phone, address, birthtime, sex) " +
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
            // Invalidate related cache keys
            invalidateCache("users_all");
            invalidateCache("user_email_" + user.getEmail());
            invalidateCache("user_fbid_" + user.getFbid());
            return id;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể thêm user Facebook: " + e.getMessage(), e);
        }
    }

    // Update user dựa trên Facebook ID
    public int updateUserFaceBook(User user) {
        try {
            int rowsAffected = handle.createUpdate("UPDATE users SET fullname = :fullname, email = :email, avatar = :avatar, " +
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
            // Invalidate related cache keys
            invalidateCache("user_fbid_" + user.getFbid());
            invalidateCache("user_email_" + user.getEmail());
            invalidateCache("users_all");
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể cập nhật user Facebook: " + e.getMessage(), e);
        }
    }

    // Cập nhật avatar hồ sơ user
    public void updateUserProfileAvatar(User user) {
        try {
            handle.createUpdate("UPDATE users SET avatar = :avatar WHERE id = :id")
                    .bind("avatar", user.getAvatar())
                    .bind("id", user.getId())
                    .execute();
            // Invalidate related cache keys
            invalidateCache("user_" + user.getId());
            invalidateCache("users_all");
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể cập nhật avatar: " + e.getMessage(), e);
        }
    }

    // Đếm số user
    public int countUser() {
        String cacheKey = "users_count";
        return getFromCacheOrCompute(cacheKey, Integer.class, () ->
                handle.createQuery("SELECT COUNT(id) as tongSo FROM users WHERE status = 1")
                        .mapTo(Integer.class)
                        .one()
        );
    }

    // Cập nhật hồ sơ user
    public void updateUserProfile(User user) {
        try {
            handle.createUpdate("UPDATE users SET fullname = :fullname, email = :email, phone = :phone, address = :address, birthtime = :birthtime, sex = :sex WHERE id = :id")
                    .bind("fullname", user.getFullname())
                    .bind("phone", user.getPhone())
                    .bind("address", user.getAddress())
                    .bind("birthtime", user.getBirthtime())
                    .bind("sex", user.getSex())
                    .bind("id", user.getId())
                    .bind("email", user.getEmail())
                    .execute();
            // Invalidate related cache keys
            invalidateCache("user_" + user.getId());
            invalidateCache("user_email_" + user.getEmail());
            invalidateCache("users_all");
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể cập nhật hồ sơ user: " + e.getMessage(), e);
        }
    }

    // Lấy tất cả người dùng
    public List<User> getAllUsers() {
        String cacheKey = "users_all";
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM users")
                        .map(new UserMapper())
                        .list()
        );
    }

    // Lấy một người dùng theo ID (status=1)
    public User getUserById(int id) {
        String cacheKey = "user_" + id;
        return getFromCacheOrCompute(cacheKey, User.class, () ->
                handle.createQuery("SELECT * FROM users WHERE id = :id AND status=1")
                        .bind("id", id)
                        .map(new UserMapper())
                        .findOne()
                        .orElse(null)
        );
    }

    // Lấy một người dùng theo ID (không kiểm tra status)
    public User getUserById1(int id) {
        String cacheKey = "user_" + id;
        return getFromCacheOrCompute(cacheKey, User.class, () ->
                handle.createQuery("SELECT * FROM users WHERE id = :id")
                        .bind("id", id)
                        .map(new UserMapper())
                        .findOne()
                        .orElse(null)
        );
    }

    // Tìm user bằng email
    public User findByEmail(String email) {
        String cacheKey = "user_email_" + email;
        return getFromCacheOrCompute(cacheKey, User.class, () ->
                handle.createQuery("SELECT * FROM users WHERE email = :email AND status=1")
                        .bind("email", email)
                        .map(new UserMapper())
                        .findOne()
                        .orElse(null)
        );
    }

    // Lấy mã khôi phục
    public String getRecoveryCode(int userId) {
        String cacheKey = "user_recovery_code_" + userId;
        return getFromCacheOrCompute(cacheKey, String.class, () ->
                handle.createQuery("SELECT totp_recovery_code FROM users WHERE id = :id")
                        .bind("id", userId)
                        .mapTo(String.class)
                        .findOne()
                        .orElse(null)
        );
    }

    // Lấy khóa bí mật
    public String getSecretKey(int userId) {
        String cacheKey = "user_secret_key_" + userId;
        return getFromCacheOrCompute(cacheKey, String.class, () ->
                handle.createQuery("SELECT totp_secret_key FROM users WHERE id = :id")
                        .bind("id", userId)
                        .mapTo(String.class)
                        .findOne()
                        .orElse(null)
        );
    }

    // Thêm mã khôi phục
    public int insertRecoveryCode(int userId, String recoveryCode) {
        try {
            int rowsAffected = handle.createUpdate("UPDATE users SET totp_recovery_code = :recoveryCode WHERE id = :id")
                    .bind("id", userId)
                    .bind("recoveryCode", recoveryCode)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("user_recovery_code_" + userId);
            invalidateCache("user_" + userId);
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể thêm mã khôi phục: " + e.getMessage(), e);
        }
    }

    // Thêm khóa bí mật
    public int insertSecretKey(int userId, String secretKey) {
        try {
            int rowsAffected = handle.createUpdate("UPDATE users SET totp_secret_key = :secretKey WHERE id = :id")
                    .bind("id", userId)
                    .bind("secretKey", secretKey)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("user_secret_key_" + userId);
            invalidateCache("user_" + userId);
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể thêm khóa bí mật: " + e.getMessage(), e);
        }
    }

    // Thêm user tối giản
    public int insertUser1(String name, String email) {
        try {
            int rowsAffected = handle.createUpdate("INSERT INTO users (fullname, email) " +
                            "VALUES (:fullname, :email)")
                    .bind("fullname", name)
                    .bind("email", email)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("users_all");
            invalidateCache("user_email_" + email);
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể thêm user: " + e.getMessage(), e);
        }
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
            // Invalidate related cache keys
            invalidateCache("users_all");
            invalidateCache("user_email_" + email);
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
        try {
            int rowsAffected = handle.createUpdate("UPDATE users SET fullname = :fullname, email = :email, phone = :phone, address = :address, sex = :sex, birthtime = :birthtime, status = :status WHERE id = :id")
                    .bind("fullname", user.getFullname())
                    .bind("email", user.getEmail())
                    .bind("phone", user.getPhone())
                    .bind("address", user.getAddress())
                    .bind("id", user.getId())
                    .bind("sex", user.getSex())
                    .bind("birthtime", user.getBirthtime())
                    .bind("status", user.isStatus())
                    .execute();
            // Invalidate related cache keys
            invalidateCache("user_" + user.getId());
            invalidateCache("user_email_" + user.getEmail());
            invalidateCache("users_all");
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể cập nhật user: " + e.getMessage(), e);
        }
    }

    // Xóa người dùng theo ID
    public void deleteUser(int id) {
        try {
            handle.createUpdate("DELETE FROM users WHERE id = :id")
                    .bind("id", id)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("user_" + id);
            invalidateCache("users_all");
            invalidateCache("users_count");
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể xóa user: " + e.getMessage(), e);
        }
    }

    // Thay đổi mật khẩu
    public int changePassword(int id, String hash, String salt) {
        try {
            int rowsAffected = handle.createUpdate("UPDATE users SET password = :hash, salt = :salt WHERE id = :id")
                    .bind("id", id)
                    .bind("hash", hash)
                    .bind("salt", salt)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("user_" + id);
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể thay đổi mật khẩu: " + e.getMessage(), e);
        }
    }

    // Tìm user bằng Zalo ID
    public User findByZaloId(String zaloId) {
        String cacheKey = "user_zaloid_" + zaloId;
        return getFromCacheOrCompute(cacheKey, User.class, () ->
                handle.createQuery("SELECT * FROM users WHERE zaloid = :zaloId AND status=1")
                        .bind("zaloId", zaloId)
                        .map(new UserMapper())
                        .findOne()
                        .orElse(null)
        );
    }

    // Insert user với Zalo ID
    public int insertZaloUser(User user) {
        try {
            int id = handle.createUpdate("INSERT INTO users (zaloid, fullname, email, avatar, status, phone, address, birthtime, sex) " +
                            "VALUES (:zaloId, :fullname, :email, :avatar, :status, :phone, :address, :birthtime, :sex)")
                    .bind("zaloId", user.getZaloId())
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
            // Invalidate related cache keys
            invalidateCache("users_all");
            invalidateCache("user_email_" + user.getEmail());
            invalidateCache("user_zaloid_" + user.getZaloId());
            return id;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể thêm user Zalo: " + e.getMessage(), e);
        }
    }

    // Update user dựa trên Zalo ID
    public int updateUserZalo(User user) {
        try {
            int rowsAffected = handle.createUpdate("UPDATE users SET fullname = :fullname, email = :email, avatar = :avatar, " +
                            "phone = :phone, address = :address, birthtime = :birthtime, sex = :sex " +
                            "WHERE zaloid = :zaloId")
                    .bind("fullname", user.getFullname())
                    .bind("email", user.getEmail())
                    .bind("avatar", user.getAvatar())
                    .bind("phone", user.getPhone())
                    .bind("address", user.getAddress())
                    .bind("birthtime", user.getBirthtime())
                    .bind("sex", user.getSex())
                    .bind("zaloId", user.getZaloId())
                    .execute();
            // Invalidate related cache keys
            invalidateCache("user_zaloid_" + user.getZaloId());
            invalidateCache("user_email_" + user.getEmail());
            invalidateCache("users_all");
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể cập nhật user Zalo: " + e.getMessage(), e);
        }
    }
}