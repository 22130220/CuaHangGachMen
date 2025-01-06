package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Voucher implements Serializable {
    private int id;
    private String code;
    private BigDecimal discountValue;
    private LocalDateTime expireDate;
    private boolean isActive;
    private LocalDateTime createDate;

    public BigDecimal getDiscountValue() {
        return discountValue;
    }

    public void setDiscountValue(BigDecimal discountValue) {
        this.discountValue = discountValue;
    }

    public Voucher(int id, String code, BigDecimal discountValue, LocalDateTime expireDate, boolean isActive, LocalDateTime createDate) {
        this.id = id;
        this.code = code;
        this.discountValue = discountValue;
        this.expireDate = expireDate;
        this.isActive = isActive;
        this.createDate = createDate;
    }

    public Voucher() {
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public LocalDateTime getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(LocalDateTime expireDate) {
        this.expireDate = expireDate;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public LocalDateTime getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDateTime createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "Voucher{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", discountValue=" + discountValue +
                ", expireDate=" + expireDate +
                ", isActive=" + isActive +
                ", createDate=" + createDate +
                '}';
    }
}

