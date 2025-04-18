package vn.edu.hcmuaf.fit.cuahanggachmen.dao;


import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Role;

import java.util.List;
import java.util.Optional;

public class RoleDao extends BaseDao{

    public RoleDao(Handle handle) {
        super(handle);
    }

    public int insertRole(String name, String description, boolean status) {
        return handle.createUpdate("INSERT INTO role (name, description, status) VALUES (:name, :description, :status)")
                .bind("name", name)
                .bind("description", description)
                .bind("status", status)
                .execute();
    }

    public List<Role> getAllRoles() {
        return handle.createQuery("SELECT * FROM role")
                .map((rs, ctx) -> new Role(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getBoolean("status")
                ))
                .list();
    }

    public Optional<Role> getRoleById(int id) {
        return handle.createQuery("SELECT * FROM role WHERE id = :id")
                .bind("id", id)
                .map((rs, ctx) -> new Role(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getBoolean("status")
                ))
                .findOne();
    }

    public int updateRole(int id, String newName, String newDescription, boolean status) {
        return handle.createUpdate("UPDATE role SET name = :name, description = :description, status = :status WHERE id = :id")
                .bind("name", newName)
                .bind("description", newDescription)
                .bind("status", status)
                .bind("id", id)
                .execute();
    }

    public int deleteRole(int id) {
        return handle.createUpdate("DELETE FROM role WHERE id = :id")
                .bind("id", id)
                .execute();
    }
}
