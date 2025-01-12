package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Jdbi;
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

public class UserDao {

    public UserDao() {
    }

    // Lấy tất cả người dùng
    public List<User> getAllUsers() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM users")
                        .map(new UserMapper()) // Sử dụng UserMapper để ánh xạ
                        .list()
        );
    }

    // Lấy một người dùng theo ID
    public User getUserById(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM users WHERE id = :id")
                        .bind("id", id) // Gắn giá trị id
                        .map(new UserMapper())
                        .findOne()
                        .orElse(null)
        );
    }
    public User findByEmail(String email) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM users WHERE email = :email")
                        .bind("email", email) // Gắn giá trị id
                        .map(new UserMapper())
                        .findOne()
                        .orElse(null)
        );
    }

    // Thêm một người dùng mới
    public ActionResult insertUser(String name, String email, String phone, String avatar, String address, LocalDateTime birthtime, String salt, String password, int sex) {
        Jdbi jdbi = null;
        try {
            jdbi = DBConect.get();
        } catch (SQLException | InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            return Result.BadRequest("");
        }
        try {
            jdbi.useHandle(handle ->
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
                            .execute()
            );
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
    public int updateUser(User user) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE users SET fullname = :fullname, email = :email, phone = :phone, address = :address, sex = :sex, birthtime = :birthtime, status = :status WHERE id = :id")
                        .bind("fullname", user.getFullname())
                        .bind("email", user.getEmail())
                        .bind("phone", user.getPhone())
                        .bind("address", user.getAddress())
                        .bind("id", user.getId())
                        .bind("sex", user.getSex())
                        .bind("birthtime", user.getBirthtime())
                        .bind("status", user.isStatus())
                        .execute()
        );
    }

    // Xóa người dùng theo ID
    public void deleteUser(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        jdbi.useHandle(handle ->
                handle.createUpdate("DELETE FROM users WHERE id = :id")
                        .bind("id", id)
                        .execute()
        );
    }

    public int changePassword(int id, String hash, String salt) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE users SET password = :hash, salt = :salt WHERE id = :id")
                        .bind("id", id)
                        .bind("hash", hash)
                        .bind("salt", salt)
                        .execute()
        );
    }

}
