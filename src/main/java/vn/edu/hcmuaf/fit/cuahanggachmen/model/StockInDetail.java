package vn.edu.hcmuaf.fit.cuahanggachmen.model;

public class StockInDetail {
    private int id;
    private int stockId;
    private int productId;
    private int colorId;
    private int quantity;
    private double unitPrice;
    private double totalPrice;


    public StockInDetail() {
    }


    public StockInDetail(int id, int stockId, int productId, int colorId, int quantity, double unitPrice, double totalPrice) {
        this.id = id;
        this.stockId = stockId;
        this.productId = productId;
        this.colorId = colorId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.totalPrice = totalPrice;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStockId() {
        return stockId;
    }

    public void setStockId(int stockId) {
        this.stockId = stockId;
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

    @Override
    public String toString() {
        return "StockInDetail{" +
                "id=" + id +
                ", stockId=" + stockId +
                ", productId=" + productId +
                ", colorId=" + colorId +
                ", quantity=" + quantity +
                ", unitPrice=" + unitPrice +
                ", totalPrice=" + totalPrice +
                '}';
    }
}
