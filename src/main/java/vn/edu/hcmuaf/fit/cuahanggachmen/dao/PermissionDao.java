package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Permission;

import java.util.List;
import java.util.Optional;

public class PermissionDao extends BaseDao {
    public PermissionDao(Handle handle) {
        super(handle);
    }

    /**
     * Thêm mới một Permission
     */
    public int insertPermission(String name) {
        handle.createUpdate("INSERT INTO permission (name) VALUES (:name)")
                    .bind("name", name)
                    .execute();
            return handle.createQuery("SELECT LAST_INSERT_ID()").mapTo(Integer.class).one();
    }

    /**
     * Lấy danh sách tất cả Permission
     */
    public List<Permission> getAllPermissions() {
        return handle.createQuery("SELECT * FROM permission")
                        .map((rs, ctx) -> new Permission(
                                rs.getInt("id"),
                                rs.getString("name")
                        ))
                        .list();
    }

    /**
     * Tìm Permission theo ID
     */
    public Optional<Permission> getPermissionById(int id) {
        return handle.createQuery("SELECT * FROM permission WHERE id = :id")
                        .bind("id", id)
                        .map((rs, ctx) -> new Permission(
                                rs.getInt("id"),
                                rs.getString("name")
                        ))
                        .findOne();
    }

    /**
     * Cập nhật Permission
     */
    public boolean updatePermission(int id, String newName) {
        int rowsAffected = handle.createUpdate("UPDATE permission SET name = :name WHERE id = :id")
                        .bind("name", newName)
                        .bind("id", id)
                        .execute();
        return rowsAffected > 0;
    }

    /**
     * Xóa Permission theo ID
     */
    public boolean deletePermission(int id) {
        int rowsAffected = handle.createUpdate("DELETE FROM permission WHERE id = :id")
                        .bind("id", id)
                        .execute();
        return rowsAffected > 0;
    }
}
