package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class RevenueByDay {
    private LocalDateTime revenueDay;
    private BigDecimal revenue;

    public RevenueByDay(LocalDateTime revenueDay, BigDecimal revenue) {
        this.revenueDay = revenueDay;
        this.revenue = revenue;
    }

    public RevenueByDay() {
    }

    // Getters and Setters
    public LocalDateTime getRevenueDay() {
        return revenueDay;
    }

    public void setRevenueDay(LocalDateTime revenueDay) {
        this.revenueDay = revenueDay;
    }

    public BigDecimal getRevenue() {
        return revenue;
    }

    public void setRevenue(BigDecimal revenue) {
        this.revenue = revenue;
    }

    @Override
    public String toString() {
        return "RevenueByDay{" +
                "revenueDay=" + revenueDay +
                ", revenue=" + revenue +
                '}';
    }
}
