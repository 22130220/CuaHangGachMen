package vn.edu.hcmuaf.fit.cuahanggachmen.model;

public class RoleResourcePermission implements java.io.Serializable {
    private int id;
    private int roleId;
    private int resourceId;
    private int permissionId;
    private String resourceName;
    private String permissionName;
    private String roleName;

    public RoleResourcePermission() {}

    public RoleResourcePermission(int id, int roleId, int resourceId, int permissionId, String resourceName, String roleName, String permissionName) {
            this.id = id;
            this.roleId = roleId;
            this.resourceId = resourceId;
            this.permissionId = permissionId;
            this.resourceName = resourceName;
            this.roleName = roleName;
            this.permissionName = permissionName;
    }

    // Getters và Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getResourceId() {
        return resourceId;
    }

    public void setResourceId(int resourceId) {
        this.resourceId = resourceId;
    }

    public int getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(int permissionId) {
        this.permissionId = permissionId;
    }

    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public String toString() {
        return "RoleResourcePermission{" +
                "id=" + id +
                ", roleId=" + roleId +
                ", resourceId=" + resourceId +
                ", permissionId=" + permissionId +
                ", resourceName='" + resourceName + '\'' +
                ", permissionName='" + permissionName + '\'' +
                ", roleName='" + roleName + '\'' +
                '}';
    }
}
