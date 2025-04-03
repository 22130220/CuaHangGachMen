package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.result.RowView;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Order;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.RoleResourcePermission;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.UserPermission;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class UserResourceDao extends BaseDao{

    public UserResourceDao(Handle handle) {
        super(handle);
    }

    public UserPermission getPermission(int userId) {
        List<RoleResourcePermission> rlist =  handle.createQuery("SELECT rrp.* , r.name AS resourceName\n" +
                "FROM role_resource_permission rrp\n" +
                "JOIN user_role ur ON rrp.roleId = ur.roleId\n" +
                "JOIN resource r ON rrp.resourceId = r.id\n" +
                "WHERE ur.userId = :userId;")
                .bind("userId", userId)
                .map(this::mapRow)
                .list();
        // Sử dụng Stream để nhóm các permissionId theo resourceIdỉ
        Map<String, List<Integer>> result = rlist.stream()
                .filter(rrp -> rrp.getResourceName() != null)
                .collect(Collectors.groupingBy(
                        RoleResourcePermission::getResourceName,
                        Collectors.mapping(RoleResourcePermission::getPermissionId, Collectors.toList()) // Value là List<permissionId>
                ));

        return  new UserPermission(result);
    }


    private RoleResourcePermission mapRow(RowView rowView) {
        RoleResourcePermission rl = new RoleResourcePermission();
        rl.setResourceId(rowView.getColumn("resourceId", Integer.class));
        rl.setId(rowView.getColumn("id", Integer.class));
        rl.setPermissionId(rowView.getColumn("permissionId", Integer.class));
        rl.setRoleId(rowView.getColumn("roleId", Integer.class));
        rl.setResourceName(rowView.getColumn("resourceName", String.class));
        return rl;
    }

}
