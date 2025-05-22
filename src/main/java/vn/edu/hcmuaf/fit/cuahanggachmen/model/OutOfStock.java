package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.time.LocalDateTime;

public class OutOfStock {
    private int id;
    private LocalDateTime createdDate;
    private int userId;
    private LocalDateTime updatedDate;
    private boolean isActive;
    private int typeId;
    private String userName;
    private String typeName;


    public OutOfStock() {
    }

    public OutOfStock(int id, LocalDateTime createdDate, int userId, LocalDateTime updatedDate, boolean isActive, int typeId, String userName, String typeName) {
        this.id = id;
        this.createdDate = createdDate;
        this.userId = userId;
        this.updatedDate = updatedDate;
        this.isActive = isActive;
        this.typeId = typeId;
        this.userName = userName;
        this.typeName = typeName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }



    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public LocalDateTime getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(LocalDateTime updatedDate) {
        this.updatedDate = updatedDate;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    @Override
    public String toString() {
        return "OutOfStock{" +
                "id=" + id +
                ", createdDate=" + createdDate +
                ", userId=" + userId +
                ", updatedDate=" + updatedDate +
                ", isActive=" + isActive +
                ", typeId=" + typeId +
                ", userName='" + userName + '\'' +
                ", typeName='" + typeName + '\'' +
                '}';
    }
}
