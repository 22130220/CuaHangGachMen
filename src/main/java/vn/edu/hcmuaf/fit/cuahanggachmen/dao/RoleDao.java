package vn.edu.hcmuaf.fit.cuahanggachmen.dao;


import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Role;

import java.util.List;
import java.util.Optional;

public class RoleDao extends BaseDao{

    public RoleDao(Handle handle) {
        super(handle);
    }

    /**
     * Thêm mới một Role
     */
    public int insertRole(String name, String description) {
        return handle.createUpdate("INSERT INTO role (name, description) VALUES (:name, :description)")
                    .bind("name", name)
                    .bind("description", description)
                    .execute();
    }

    /**
     * Lấy danh sách tất cả Role
     */
    public List<Role> getAllRoles() {
        return handle.createQuery("SELECT * FROM role")
                        .map((rs, ctx) -> new Role(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getString("description")
                        ))
                        .list();
    }

    /**
     * Tìm Role theo ID
     */
    public Optional<Role> getRoleById(int id) {
        return handle.createQuery("SELECT * FROM role WHERE id = :id")
                        .bind("id", id)
                        .map((rs, ctx) -> new Role(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getString("description")
                        ))
                        .findOne();
    }

    /**
     * Cập nhật Role
     */
    public boolean updateRole(int id, String newName, String newDescription) {
        int rowsAffected = handle.createUpdate("UPDATE role SET name = :name, description = :description WHERE id = :id")
                        .bind("name", newName)
                        .bind("description", newDescription)
                        .bind("id", id)
                        .execute();
        return rowsAffected > 0;
    }

    /**
     * Xóa Role theo ID
     */
    public boolean deleteRole(int id) {
        int rowsAffected = handle.createUpdate("DELETE FROM role WHERE id = :id")
                        .bind("id", id)
                        .execute();
        return rowsAffected > 0;
    }
}
