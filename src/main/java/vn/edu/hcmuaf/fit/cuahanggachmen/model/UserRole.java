package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.io.Serializable;

public class UserRole implements Serializable {
    private int userId;
    private int roleId;

    public UserRole() {}

    public UserRole(int userId, int roleId) {
        this.userId = userId;
        this.roleId = roleId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Override
    public String toString() {
        return "UserRole{userId=" + userId + ", roleId=" + roleId + "}";
    }
}
