package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import jakarta.servlet.ServletContext;
import vn.edu.hcmuaf.fit.cuahanggachmen.AppContextListenter;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Product implements Serializable{
    private int id;
    private String name;
    private int pricePerBox;
    private int stock;
    private String description;
    private boolean status;
    private int rating;
    private boolean discount;
    private BigDecimal promotionPrice;
    private int quantityPerBox;
    private LocalDateTime createDate;
    private int categoryId;
    private int sizeId;
    private int materialId;
    private int manufacturerId;
    private String imgThumbnail;
    private Category category;

    private List<String> imgList = null;

    private Map<String, Object> specs = null;

    private List<Review> lsReview = null;

    private  List<Color> lsColor=null;

    public Product() {
    }

    public Product(int id, String name, int pricePerBox, int stock, String description, boolean status,
                   int rating, boolean discount, BigDecimal promotionPrice, int quantityPerBox,
                   LocalDateTime createDate, int categoryId, int sizeId, int materialId,
                   int manufacturerId, String imgThumbnail) {
        this.id = id;
        this.name = name;
        this.pricePerBox = pricePerBox;
        this.stock = stock;
        this.description = description;
        this.status = status;
        this.rating = rating;
        this.discount = discount;
        this.promotionPrice = promotionPrice;
        this.quantityPerBox = quantityPerBox;
        this.createDate = createDate;
        this.categoryId = categoryId;
        this.sizeId = sizeId;
        this.materialId = materialId;
        this.manufacturerId = manufacturerId;
        this.imgThumbnail = imgThumbnail;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPricePerBox() {
        return pricePerBox;
    }

    public void setPricePerBox(int pricePerBox) {
        this.pricePerBox = pricePerBox;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public boolean isDiscount() {
        return discount;
    }

    public void setDiscount(boolean discount) {
        this.discount = discount;
    }

    public BigDecimal getPromotionPrice() {
        return promotionPrice;
    }

    public void setPromotionPrice(BigDecimal promotionPrice) {
        this.promotionPrice = promotionPrice;
    }

    public int getQuantityPerBox() {
        return quantityPerBox;
    }

    public void setQuantityPerBox(int quantityPerBox) {
        this.quantityPerBox = quantityPerBox;
    }

    public LocalDateTime getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDateTime createDate) {
        this.createDate = createDate;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getSizeId() {
        return sizeId;
    }

    public void setSizeId(int sizeId) {
        this.sizeId = sizeId;
    }

    public int getMaterialId() {
        return materialId;
    }

    public void setMaterialId(int materialId) {
        this.materialId = materialId;
    }

    public int getManufacturerId() {
        return manufacturerId;
    }

    public void setManufacturerId(int manufacturerId) {
        this.manufacturerId = manufacturerId;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getImgThumbnail() {
        return imgThumbnail;
    }

    public void setImgThumbnail(String imgThumbnail) {
        this.imgThumbnail = imgThumbnail;
    }

    public Map<String, Object> getSpecs() {
        return specs;
    }

    public void setSpecs(Map<String, Object> specs) {
        this.specs = specs;
    }

    public void addSpec(String key, Object value) {
        if(specs == null) {
            specs = new HashMap<>();
        }
        specs.put(key, value);
    }

    public List<String> getImgList() {
        return imgList;
    }

    public void setImgList(List<String> imgList) {
        if(imgList == null) imgList = new ArrayList<>();
        this.imgList = imgList;
    }

    public List<Review> getLsReview() {
        return lsReview;
    }

    public void setLsReview(List<Review> lsReview) {
        this.lsReview = lsReview;
    }

    public List<Color> getLsColor() {
        return lsColor;
    }

    public void setLsColor(List<Color> lsColor) {
        this.lsColor = lsColor;
    }


    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pricePerBox=" + pricePerBox +
                ", stock=" + stock +
                ", description='" + description + '\'' +
                ", status=" + status +
                ", rating=" + rating +
                ", discount=" + discount +
                ", promotionPrice=" + promotionPrice +
                ", quantityPerBox=" + quantityPerBox +
                ", createDate=" + createDate +
                ", categoryId=" + categoryId +
                ", sizeId=" + sizeId +
                ", materialId=" + materialId +
                ", manufacturerId=" + manufacturerId +
                ", imgThumbnail='" + imgThumbnail + '\'' +
                '}';
    }
}