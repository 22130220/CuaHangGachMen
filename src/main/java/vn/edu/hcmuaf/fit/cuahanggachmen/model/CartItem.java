package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.io.Serializable;

public class CartItem implements Serializable {
    private int productId;
    private String productName;
    private String productColor; // tên/ID màu
    private String productImage; // ảnh hiển thị
    private int pricePerBox;
    private int quantity; // số lượng hộp
    private int quantityPerBox; // số thẻ/hộp (nếu cần)

    public CartItem() {
    }

    public CartItem(int productId, String productName, String productColor, String productImage,
                    int pricePerBox, int quantity, int quantityPerBox) {
        this.productId = productId;
        this.productName = productName;
        this.productColor = productColor;
        this.productImage = productImage;
        this.pricePerBox = pricePerBox;
        this.quantity = quantity;
        this.quantityPerBox = quantityPerBox;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductColor() {
        return productColor;
    }

    public void setProductColor(String productColor) {
        this.productColor = productColor;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public int getPricePerBox() {
        return pricePerBox;
    }

    public void setPricePerBox(int pricePerBox) {
        this.pricePerBox = pricePerBox;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantityPerBox() {
        return quantityPerBox;
    }

    public void setQuantityPerBox(int quantityPerBox) {
        this.quantityPerBox = quantityPerBox;
    }

    // Tính tổng tiền của CartItem = đơn giá/hộp * số hộp
    public int getTotalPrice() {
        return this.pricePerBox * this.quantity;
    }
}

