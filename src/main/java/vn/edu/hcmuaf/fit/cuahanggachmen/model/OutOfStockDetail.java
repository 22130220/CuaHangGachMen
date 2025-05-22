package vn.edu.hcmuaf.fit.cuahanggachmen.model;

public class OutOfStockDetail {
    private int id;
    private int outOfStockId;
    private int productId;
    private int colorId;
    private int quantity;
    private double unitPrice;
    private double totalPrice;
    private String product;
    private String color;

    public OutOfStockDetail() {
    }

    public OutOfStockDetail(int id, int outOfStockId, int productId, int colorId, int quantity, double unitPrice, double totalPrice, String product, String color) {
        this.id = id;
        this.outOfStockId = outOfStockId;
        this.productId = productId;
        this.colorId = colorId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.totalPrice = totalPrice;
        this.product = product;
        this.color = color;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOutOfStockId() {
        return outOfStockId;
    }

    public void setOutOfStockId(int outOfStockId) {
        this.outOfStockId = outOfStockId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getColorId() {
        return colorId;
    }

    public void setColorId(int colorId) {
        this.colorId = colorId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public String toString() {
        return "OutOfStockDetail{" +
                "id=" + id +
                ", outOfStockId=" + outOfStockId +
                ", productId=" + productId +
                ", colorId=" + colorId +
                ", quantity=" + quantity +
                ", unitPrice=" + unitPrice +
                ", totalPrice=" + totalPrice +
                ", product='" + product + '\'' +
                ", color='" + color + '\'' +
                '}';
    }
}
