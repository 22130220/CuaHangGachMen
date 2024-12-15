package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper.UserMapper;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

public class UserService {

    public UserService() {
    }

    // Lấy tất cả người dùng
    public List<User> getAllUsers() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM user")
                        .map(new UserMapper()) // Sử dụng UserMapper để ánh xạ
                        .list()
        );
    }

    // Lấy một người dùng theo ID
    public User getUserById(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM user WHERE id = :id")
                        .bind("id", id) // Gắn giá trị id
                        .map(new UserMapper())
                        .findOne()
                        .orElse(null)
        );
    }

    // Thêm một người dùng mới
    public void insertUser(String name, String email, String phone, String avatar, String address, LocalDateTime birthtime, String salt, String password) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        jdbi.useHandle(handle ->
                handle.createUpdate("INSERT INTO user (fullname, email, phone, avatar, address, birthtime, salt, password) " +
                                "VALUES (:fullname, :email, :phone, :avatar, :address, :birthtime, :salt, :password)")
                        .bind("fullname", name)
                        .bind("email", email)
                        .bind("phone", phone)
                        .bind("avatar", avatar)
                        .bind("address", address)
                        .bind("birthtime", birthtime)
                        .bind("salt", salt)
                        .bind("password", password)
                        .execute()
        );
    }

    // Cập nhật thông tin người dùng
    public void updateUser(User user) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        jdbi.useHandle(handle ->
                handle.createUpdate("UPDATE user SET fullname = :fullname, email = :email, phone = :phone, address = :address WHERE id = :id")
                        .bind("fullname", user.getFullname())
                        .bind("email", user.getEmail())
                        .bind("phone", user.getPhone())
                        .bind("address", user.getAddress())
                        .bind("id", user.getId())
                        .execute()
        );
    }

    // Xóa người dùng theo ID
    public void deleteUser(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        jdbi.useHandle(handle ->
                handle.createUpdate("DELETE FROM user WHERE id = :id")
                        .bind("id", id)
                        .execute()
        );
    }
}
