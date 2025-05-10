package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.result.RowView;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.RoleResourcePermission;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.UserPermission;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class UserResourceDao extends BaseDao {

    public UserResourceDao(Handle handle) {
        super(handle, true, 60 * 3, 1000);
    }

    public UserResourceDao(Handle handle, boolean cacheEnabled, long cacheExpirationSeconds, long cacheMaximumSize) {
        super(handle, cacheEnabled, cacheExpirationSeconds, cacheMaximumSize);
    }

    // Lấy quyền của user theo userId
    public UserPermission getPermission(int userId) {
        String cacheKey = "user_permission_" + userId;
        return getFromCacheOrCompute(cacheKey, UserPermission.class, () -> {
            try {
                List<RoleResourcePermission> rlist = handle.createQuery(
                                "SELECT rrp.*, r.name AS resourceName " +
                                        "FROM role_resource_permission rrp " +
                                        "JOIN user_role ur ON rrp.roleId = ur.roleId " +
                                        "JOIN resource r ON rrp.resourceId = r.id " +
                                        "WHERE ur.userId = :userId"
                        )
                        .bind("userId", userId)
                        .map(this::mapRow)
                        .list();

                // Sử dụng Stream để nhóm các permissionId theo resourceName
                Map<String, List<Integer>> result = rlist.stream()
                        .filter(rrp -> rrp.getResourceName() != null)
                        .collect(Collectors.groupingBy(
                                RoleResourcePermission::getResourceName,
                                Collectors.mapping(RoleResourcePermission::getPermissionId, Collectors.toList())
                        ));

                return new UserPermission(result);
            } catch (Exception e) {
                throw new RuntimeException("Không thể lấy quyền của user: " + e.getMessage(), e);
            }
        });
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