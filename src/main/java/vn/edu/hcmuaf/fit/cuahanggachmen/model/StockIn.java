package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.time.LocalDateTime;

public class StockIn {
    private int id;
    private LocalDateTime createDate;
    private int userId;
    private LocalDateTime updateDate;
    private int typeId;
    private boolean isActive;
    private String userName;
    private String typeName;

    public StockIn() {
    }

    public StockIn(int id, LocalDateTime createDate, int userId, LocalDateTime updateDate, int typeId, boolean isActive, String userName, String typeName) {
        this.id = id;
        this.createDate = createDate;
        this.userId = userId;
        this.updateDate = updateDate;
        this.typeId = typeId;
        this.isActive = isActive;
        this.userName = userName;
        this.typeName = typeName;
    }

    public StockIn(int id, LocalDateTime createDate, int userId, LocalDateTime updateDate, int typeId , boolean isActive) {
        this.id = id;
        this.createDate = createDate;
        this.userId = userId;
        this.updateDate = updateDate;
        this.typeId=typeId;
        this.isActive = isActive;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDateTime getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDateTime createDate) {
        this.createDate = createDate;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    public LocalDateTime getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(LocalDateTime updateDate) {
        this.updateDate = updateDate;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
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
        return "StockIn{" +
                "id=" + id +
                ", createDate=" + createDate +
                ", userId=" + userId +
                ", updateDate=" + updateDate +
                ", typeId=" + typeId +
                ", isActive=" + isActive +
                ", userName='" + userName + '\'' +
                ", typeName='" + typeName + '\'' +
                '}';
    }
}
