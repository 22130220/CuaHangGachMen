package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.result.RowView;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

public class RoleResourcePermissionDao extends BaseDao{
    public RoleResourcePermissionDao(Handle handle) {
        super(handle);
    }
    /**
     * Thêm mới một RoleResourcePermission
     */
    public int insert(int roleId, int resourceId, int permissionId) {
        return handle.createUpdate("INSERT INTO role_resource_permission (roleId, resourceId, permissionId) VALUES (:roleId, :resourceId, :permissionId)")
                        .bind("roleId", roleId)
                        .bind("resourceId", resourceId)
                        .bind("permissionId", permissionId)
                        .execute();

    }

    /**
     * Lấy danh sách tất cả RoleResourcePermission
     */
    public List<RoleResourcePermission> getAll() {
        return handle.createQuery("SELECT rrp.*, r.name AS resourceName, p.name AS permissionName, ro.name as roleName FROM role_resource_permission rrp JOIN resource r ON rrp.resourceId = r.id JOIN permission p ON rrp.permissionId = p.id JOIN role ro ON rrp.roleId = ro.id WHERE rrp.roleId = ro.id;")
                        .mapToBean(RoleResourcePermission.class)
                        .list();
    }

    /**
     * Tìm RoleResourcePermission theo ID
     */
    public RoleResourcePermission getById(int id) {
        return handle.createQuery("SELECT rrp.*, r.name AS resourceName, p.name AS permissionName, ro.name as roleName FROM role_resource_permission rrp JOIN resource r ON rrp.resourceId = r.id JOIN permission p ON rrp.permissionId = p.id JOIN role ro ON rrp.roleId = ro.id WHERE rrp.roleId = ro.id WHERE rrp.id = :id;")
                        .bind("id", id)
                        .mapToBean(RoleResourcePermission.class)
                        .findOne().orElse(null);
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


//    public List<RoleResourcePermissionDetails> getDetailsByRoleId(int roleId) {
//        return handle.createQuery("SELECT \n" +
//                "    rrp.roleId,\n" +
//                "    r.name AS roleName,\n" +
//                "    r.description AS roleDescription,\n" +
//                "    res.id AS resourceId,\n" +
//                "    res.name AS resourceName,\n" +
//                "    p.id AS permissionId,\n" +
//                "    p.name AS permissionName\n" +
//                "FROM role_resource_permission rrp\n" +
//                "JOIN role r ON rrp.roleId = r.id\n" +
//                "JOIN resource res ON rrp.resourceId = res.id\n" +
//                "JOIN permission p ON rrp.permissionId = p.id WHERE r.id = :roleId;")
//                .bind("roleId", roleId)
//                .map(this::roleResourcePermissionDetailsMapper)
//                .list();
//    }
//
//    public List<RoleResourcePermissionDetails> getAllDetails() {
//        return handle.createQuery("SELECT \n" +
//                        "    rrp.roleId,\n" +
//                        "    r.name AS roleName,\n" +
//                        "    r.description AS roleDescription,\n" +
//                        "    res.id AS resourceId,\n" +
//                        "    res.name AS resourceName,\n" +
//                        "    p.id AS permissionId,\n" +
//                        "    p.name AS permissionName\n" +
//                        "FROM role_resource_permission rrp\n" +
//                        "JOIN role r ON rrp.roleId = r.id\n" +
//                        "JOIN resource res ON rrp.resourceId = res.id\n" +
//                        "JOIN permission p ON rrp.permissionId = p.id;")
//                .map(this::roleResourcePermissionDetailsMapper)
//                .list();
//    }
//
//    public Map<Role, Map<Resource, List<Permission>>> getMapAllDetails() {
//        List<RoleResourcePermissionDetails> details = getAllDetails();
//        return details.stream()
//                .collect(Collectors.groupingBy(
//                        RoleResourcePermissionDetails::getRole,
//                        Collectors.groupingBy(
//                                RoleResourcePermissionDetails::getResource, // Nhóm theo Resource
//                                Collectors.mapping(RoleResourcePermissionDetails::getPermission, Collectors.toList()) // Lấy danh sách Permission
//                        )
//                ));
//    }
//
//    public Map<Role, Map<Resource, List<Permission>>> getMapAllDetailsByRoleId(int roleId) {
//        List<RoleResourcePermissionDetails> details = getDetailsByRoleId(roleId);
//        return details.stream()
//                .collect(Collectors.groupingBy(
//                        RoleResourcePermissionDetails::getRole,
//                        Collectors.groupingBy(
//                                RoleResourcePermissionDetails::getResource, // Nhóm theo Resource
//                                Collectors.mapping(RoleResourcePermissionDetails::getPermission, Collectors.toList()) // Lấy danh sách Permission
//                        )
//                ));
//    }
//
//    private RoleResourcePermissionDetails roleResourcePermissionDetailsMapper(RowView view) {
//        RoleResourcePermissionDetails details = new RoleResourcePermissionDetails();
//
//        Role role = new Role();
//        role.setId(view.getColumn("roleId", Integer.class));
//        role.setName(view.getColumn("roleName", String.class));
//        role.setDescription(view.getColumn("roleDescription", String.class));
//        details.setRole(role);
//
//        Resource resource = new Resource();
//        resource.setId(view.getColumn("resourceId", Integer.class));
//        resource.setName(view.getColumn("resourceName", String.class));
//        details.setResource(resource);
//
//        Permission permission = new Permission();
//        permission.setId(view.getColumn("permissionId", Integer.class));
//        permission.setName(view.getColumn("permissionName", String.class));
//        details.setPermission(permission);
//
//        return details;
//    }
}
