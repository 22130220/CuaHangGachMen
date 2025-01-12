package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Orders implements Serializable {
    private int id;
    private int userId;
    private LocalDateTime orderDate;
    private String address;
    private String status;
    private BigDecimal totalPrice;
    private String description;
    private LocalDateTime createDate;
    private String fullName;

    public Orders(int id, int userId, LocalDateTime orderDate, String address, String status, BigDecimal totalPrice, String description, LocalDateTime createDate) {
        this.id = id;
        this.userId = userId;
        this.orderDate = orderDate;
        this.address = address;
        this.status = status;
        this.totalPrice = totalPrice;
        this.description = description;
        this.createDate = createDate;
    }

    public Orders() {
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDateTime createDate) {
        this.createDate = createDate;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", userId=" + userId +
                ", orderDate=" + orderDate +
                ", address='" + address + '\'' +
                ", status='" + status + '\'' +
                ", totalPrice=" + totalPrice +
                ", description='" + description + '\'' +
                ", createDate=" + createDate +
                '}';
    }
}
