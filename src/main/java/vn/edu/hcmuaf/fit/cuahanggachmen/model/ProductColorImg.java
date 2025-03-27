package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import vn.edu.hcmuaf.fit.cuahanggachmen.AppContextListenter;

import java.io.Serializable;

public class ProductColorImg implements Serializable {
    private int id;
    private int colorId;
    private int productId;
    private String colorName;
    private String url;

    public ProductColorImg(int id, int colorId, int productId, String colorName, String url) {
        this.id = id;
        this.colorId = colorId;
        this.productId = productId;
        this.colorName = colorName;
        this.url = url;
    }

    public ProductColorImg() {
    }

    public String getColorName() {
        return colorName;
    }

    public void setColorName(String colorName) {
        this.colorName = colorName;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getColorId() {
        return colorId;
    }

    public void setColorId(int colorId) {
        this.colorId = colorId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "ProductColorImg{" +
                "id=" + id +
                ", colorId=" + colorId +
                ", productId=" + productId +
                ", colorName='" + colorName + '\'' +
                ", url='" + url + '\'' +
                '}';
    }
}

