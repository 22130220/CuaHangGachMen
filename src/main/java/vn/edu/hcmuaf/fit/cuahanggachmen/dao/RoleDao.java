package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.UnableToExecuteStatementException;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Role;

import java.util.List;
import java.util.Optional;

public class RoleDao extends BaseDao {

    public RoleDao(Handle handle) {
        super(handle, true, 60, 1000);
    }

    public RoleDao(Handle handle, boolean cacheEnabled, long cacheExpirationSeconds, long cacheMaximumSize) {
        super(handle, cacheEnabled, cacheExpirationSeconds, cacheMaximumSize);
    }

    // Thêm mới một Role
    public int insertRole(String name, String description, boolean status) {
        try {
            int rowsAffected = handle.createUpdate("INSERT INTO role (name, description, status) VALUES (:name, :description, :status)")
                    .bind("name", name)
                    .bind("description", description)
                    .bind("status", status)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("roles_all");
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể thêm role: " + e.getMessage(), e);
        }
    }

    // Lấy danh sách tất cả Role
    public List<Role> getAllRoles() {
        String cacheKey = "roles_all";
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM role")
                        .map((rs, ctx) -> new Role(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getString("description"),
                                rs.getBoolean("status")
                        ))
                        .list()
        );
    }

    // Tìm Role theo ID
    public Optional<Role> getRoleById(int id) {
        String cacheKey = "role_" + id;
        return getFromCacheOrCompute(cacheKey, Optional.class, () ->
                handle.createQuery("SELECT * FROM role WHERE id = :id")
                        .bind("id", id)
                        .map((rs, ctx) -> new Role(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getString("description"),
                                rs.getBoolean("status")
                        ))
                        .findOne()
        );
    }

    // Cập nhật Role
    public int updateRole(int id, String newName, String newDescription, boolean status) {
        try {
            int rowsAffected = handle.createUpdate("UPDATE role SET name = :name, description = :description, status = :status WHERE id = :id")
                    .bind("name", newName)
                    .bind("description", newDescription)
                    .bind("status", status)
                    .bind("id", id)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("role_" + id);
            invalidateCache("roles_all");
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể cập nhật role: " + e.getMessage(), e);
        }
    }

    // Xóa Role theo ID
    public int deleteRole(int id) {
        try {
            int rowsAffected = handle.createUpdate("DELETE FROM role WHERE id = :id")
                    .bind("id", id)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("role_" + id);
            invalidateCache("roles_all");
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể xóa role: " + e.getMessage(), e);
        }
    }
}