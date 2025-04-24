package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.result.RowView;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

public class RoleResourcePermissionDao extends BaseDao {
    public RoleResourcePermissionDao(Handle handle) {
        super(handle);
    }

    /**
     * Thêm mới một RoleResourcePermission
     */
    public int insert(int roleId, int resourceId, int permissionId) {
        // Kiểm tra ràng buộc khóa ngoại trước khi chèn
        RoleDao roleDao = new RoleDao(handle);
        ResourceDao resourceDao = new ResourceDao(handle);
        PermissionDao permissionDao = new PermissionDao(handle);

        if (roleDao.getRoleById(roleId).isEmpty()) {
            throw new IllegalArgumentException("roleId không tồn tại: " + roleId);
        }
        if (resourceDao.getResourceById(resourceId).isEmpty()) {
            throw new IllegalArgumentException("resourceId không tồn tại: " + resourceId);
        }
        if (permissionDao.getPermissionById(permissionId).isEmpty()) {
            throw new IllegalArgumentException("permissionId không tồn tại: " + permissionId);
        }

        return handle.createUpdate("INSERT INTO role_resource_permission (roleId, resourceId, permissionId) VALUES (:roleId, :resourceId, :permissionId)")
                .bind("roleId", roleId)
                .bind("resourceId", resourceId)
                .bind("permissionId", permissionId)
                .execute();
    }

    /**
     * Xóa tất cả RoleResourcePermission theo roleId
     */
    public boolean deleteByRoleId(int roleId) {
        int rowsAffected = handle.createUpdate("DELETE FROM role_resource_permission WHERE roleId = :roleId")
                .bind("roleId", roleId)
                .execute();
        return rowsAffected > 0;
    }

    /**
     * Lấy danh sách tất cả RoleResourcePermission
     */
    public List<RoleResourcePermission> getAll() {
        return handle.createQuery("SELECT rrp.*, r.name AS resourceName, p.name AS permissionName, ro.name AS roleName " +
                        "FROM role_resource_permission rrp " +
                        "JOIN resource r ON rrp.resourceId = r.id " +
                        "JOIN permission p ON rrp.permissionId = p.id " +
                        "JOIN role ro ON rrp.roleId = ro.id")
                .mapToBean(RoleResourcePermission.class)
                .list();
    }

    /**
     * Tìm RoleResourcePermission theo ID
     */
    public Optional<RoleResourcePermission> getById(int id) {
        return handle.createQuery("SELECT rrp.*, r.name AS resourceName, p.name AS permissionName, ro.name AS roleName " +
                        "FROM role_resource_permission rrp " +
                        "JOIN resource r ON rrp.resourceId = r.id " +
                        "JOIN permission p ON rrp.permissionId = p.id " +
                        "JOIN role ro ON rrp.roleId = ro.id " +
                        "WHERE rrp.id = :id")
                .bind("id", id)
                .mapToBean(RoleResourcePermission.class)
                .findOne();
    }

    /**
     * Xóa RoleResourcePermission theo ID
     */
    public boolean deleteById(int id) {
        int rowsAffected = handle.createUpdate("DELETE FROM role_resource_permission WHERE id = :id")
                .bind("id", id)
                .execute();
        return rowsAffected > 0;
    }

    /**
     * Cập nhật RoleResourcePermission theo ID
     */
    public boolean update(int id, int roleId, int resourceId, int permissionId) {
        // Kiểm tra ràng buộc khóa ngoại trước khi cập nhật
        RoleDao roleDao = new RoleDao(handle);
        ResourceDao resourceDao = new ResourceDao(handle);
        PermissionDao permissionDao = new PermissionDao(handle);

        if (roleDao.getRoleById(roleId).isEmpty()) {
            throw new IllegalArgumentException("roleId không tồn tại: " + roleId);
        }
        if (resourceDao.getResourceById(resourceId).isEmpty()) {
            throw new IllegalArgumentException("resourceId không tồn tại: " + resourceId);
        }
        if (permissionDao.getPermissionById(permissionId).isEmpty()) {
            throw new IllegalArgumentException("permissionId không tồn tại: " + permissionId);
        }

        int rowsAffected = handle.createUpdate("UPDATE role_resource_permission SET roleId = :roleId, resourceId = :resourceId, permissionId = :permissionId WHERE id = :id")
                .bind("id", id)
                .bind("roleId", roleId)
                .bind("resourceId", resourceId)
                .bind("permissionId", permissionId)
                .execute();
        return rowsAffected > 0;
    }
}