package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.io.Serializable;

public class Product implements Serializable {
private int id;
private  String title;
private double price;
private String img;

    public Product(int id, String title, double price, String img) {
        this.id = id;
        this.title = title;
        this.price = price;
        this.img = img;
    }

    public Product() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", price=" + price +
                ", img='" + img + '\'' +
                '}';
    }
}
