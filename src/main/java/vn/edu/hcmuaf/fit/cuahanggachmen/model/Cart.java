package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Cart implements Serializable {
    private List<CartItem> items;
    private double discount;
    private int voucherId;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }

    // Thêm sản phẩm vào giỏ
    public void addItem(CartItem item) {
        // Kiểm tra xem productId + productColor này đã có trong giỏ chưa
        for (CartItem ci : items) {
            // Nếu muốn phân biệt theo màu thì so sánh thêm color
            if (ci.getProductId() == item.getProductId() &&
                    ci.getProductColor().equals(item.getProductColor())) {
                // Nếu cùng sản phẩm, cùng màu -> cập nhật số lượng
                ci.setQuantity(ci.getQuantity() + item.getQuantity());
                return;
            }
        }
        // Nếu chưa có, thêm mới
        items.add(item);
    }

    // Xoá 1 sản phẩm ra khỏi giỏ
    public void removeItem(int productId, String color) {
        items.removeIf(ci -> ci.getProductId() == productId
                && ci.getProductColor().equals(color));
    }

    // Cập nhật số lượng sản phẩm trong giỏ
    public void updateQuantity(int productId, String color, int quantity) {
        for (CartItem ci : items) {
            if (ci.getProductId() == productId && ci.getProductColor().equals(color)) {
                ci.setQuantity(quantity);
                break;
            }
        }
    }

    // Tính tổng tiền cho cả giỏ
    public int getTotal() {
        int sum = 0;
        for (CartItem ci : items) {
            sum += ci.getTotalPrice();
        }
        return sum;
    }

    // Đếm số lượng items
    public int getTotalItems() {
        int count = 0;
        for (CartItem ci : items) {
            count += ci.getQuantity();
        }
        return count;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(int voucherId) {
        this.voucherId = voucherId;
    }
}

