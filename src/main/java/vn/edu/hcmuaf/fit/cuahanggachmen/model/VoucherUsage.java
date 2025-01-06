package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.time.LocalDateTime;

public class VoucherUsage {
    private int voucherId;
    private int userId;
    private int orderId;
    private LocalDateTime usageDate;

    // Getters and Setters
    public int getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(int voucherId) {
        this.voucherId = voucherId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public LocalDateTime getUsageDate() {
        return usageDate;
    }

    public void setUsageDate(LocalDateTime usageDate) {
        this.usageDate = usageDate;
    }

    public VoucherUsage(int voucherId, int userId, int orderId, LocalDateTime usageDate) {
        this.voucherId = voucherId;
        this.userId = userId;
        this.orderId = orderId;
        this.usageDate = usageDate;
    }

    @Override
    public String toString() {
        return "VoucherUsage{" +
                "voucherId=" + voucherId +
                ", userId=" + userId +
                ", orderId=" + orderId +
                ", usageDate=" + usageDate +
                '}';
    }

    public VoucherUsage() {
    }
}

