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
    private int VoucherType;
    private String VoucerName;

    public BigDecimal getDiscountValue() {
        return discountValue;
    }

    public Voucher(int id, String code, BigDecimal discountValue, LocalDateTime expireDate, boolean isActive, LocalDateTime createDate, int voucherType, String voucerName) {
        this.id = id;
        this.code = code;
        this.discountValue = discountValue;
        this.expireDate = expireDate;
        this.isActive = isActive;
        this.createDate = createDate;
        VoucherType = voucherType;
        VoucerName = voucerName;
    }

    public Voucher(int id, String code, BigDecimal discountValue, LocalDateTime expireDate, boolean isActive, LocalDateTime createDate, int voucherType) {
        this.id = id;
        this.code = code;
        this.discountValue = discountValue;
        this.expireDate = expireDate;
        this.isActive = isActive;
        this.createDate = createDate;
        VoucherType = voucherType;
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

    public int getVoucherType() {
        return VoucherType;
    }

    public void setVoucherType(int voucherType) {
        VoucherType = voucherType;
    }

    public String getVoucerName() {
        return VoucerName;
    }

    public void setVoucerName(String voucerName) {
        VoucerName = voucerName;
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
                ", VoucherType=" + VoucherType +
                ", VoucerName='" + VoucerName + '\'' +
                '}';
    }
}

