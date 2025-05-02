package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.time.LocalDateTime;

public class StockIn {
    private int id;
    private LocalDateTime createDate;
    private int userId;
    private LocalDateTime updateDate;
    private boolean isActive;

    public StockIn() {
    }

    public StockIn(int id, LocalDateTime createDate, int userId, LocalDateTime updateDate, boolean isActive) {
        this.id = id;
        this.createDate = createDate;
        this.userId = userId;
        this.updateDate = updateDate;
        this.isActive = isActive;
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

    @Override
    public String toString() {
        return "StockIn{" +
                "id=" + id +
                ", createDate=" + createDate +
                ", userId=" + userId +
                ", updateDate=" + updateDate +
                ", isActive=" + isActive +
                '}';
    }
}
