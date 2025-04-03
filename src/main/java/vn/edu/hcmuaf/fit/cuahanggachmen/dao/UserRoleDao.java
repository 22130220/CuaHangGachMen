package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.UserRole;

import java.util.List;
import java.util.Optional;

public class UserRoleDao extends BaseDao {

    public UserRoleDao(Handle handle) {
        super(handle);
    }

    /**
     * Thêm mới một UserRole
     */
    public void insertUserRole(int userId, int roleId) {
        handle.createUpdate("INSERT INTO user_role (userId, roleId) VALUES (:userId, :roleId)")
                        .bind("userId", userId)
                        .bind("roleId", roleId)
                        .execute();
    }

    /**
     * Lấy danh sách tất cả UserRole
     */
    public List<UserRole> getAllUserRoles() {
        return handle.createQuery("SELECT * FROM user_role")
                        .map((rs, ctx) -> new UserRole(
                                rs.getInt("userId"),
                                rs.getInt("roleId")
                        ))
                        .list();
    }

    /**
     * Tìm UserRole theo UserID và RoleID
     */
    public Optional<UserRole> getUserRole(int userId, int roleId) {
        return handle.createQuery("SELECT * FROM user_role WHERE userId = :userId AND roleId = :roleId")
                        .bind("userId", userId)
                        .bind("roleId", roleId)
                        .map((rs, ctx) -> new UserRole(
                                rs.getInt("userId"),
                                rs.getInt("roleId")
                        ))
                        .findOne();
    }

    /**
     * Xóa UserRole theo UserID và RoleID
     */
    public boolean deleteUserRole(int userId, int roleId) {
        int rowsAffected = handle.createUpdate("DELETE FROM user_role WHERE userId = :userId AND roleId = :roleId")
                        .bind("userId", userId)
                        .bind("roleId", roleId)
                        .execute();
        return rowsAffected > 0;
    }
}
