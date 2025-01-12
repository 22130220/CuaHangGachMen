package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.io.Serializable;
import java.time.LocalDateTime;

public class OrderDetailWithName implements Serializable {
    private int orderId;
    private int productId;
    private int quantity;
    private int price;
    private LocalDateTime createDate;
    private String Color;
    private String name;
    private String img;

    public OrderDetailWithName() {
    }

    @Override
    public String toString() {
        return "OrderDetailWithName{" +
                "orderId=" + orderId +
                ", productId=" + productId +
                ", quantity=" + quantity +
                ", price=" + price +
                ", createDate=" + createDate +
                ", Color='" + Color + '\'' +
                ", name='" + name + '\'' +
                ", img='" + img + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    // Getters and Setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public LocalDateTime getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDateTime createDate) {
        this.createDate = createDate;
    }

    public String getColor() {
        return Color;
    }

    public void setColor(String color) {
        Color = color;
    }


}
