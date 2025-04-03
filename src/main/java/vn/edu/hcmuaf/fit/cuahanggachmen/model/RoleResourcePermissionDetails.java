package vn.edu.hcmuaf.fit.cuahanggachmen.model;

public class RoleResourcePermissionDetails {
    private Role role;
    private Resource resource;
    private Permission permission;

    public RoleResourcePermissionDetails() {}

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Resource getResource() {
        return resource;
    }

    public void setResource(Resource resource) {
        this.resource = resource;
    }

    public Permission getPermission() {
        return permission;
    }

    public void setPermission(Permission permission) {
        this.permission = permission;
    }

    @Override
    public String toString() {
        return "RoleResourcePermissionDetails{role=" + role + ", resource=" + resource + ", permission=" + permission + "}";
    }
}
