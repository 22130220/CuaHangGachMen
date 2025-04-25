package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Review implements Serializable {
        private int userId;
        private String userName;
        private int productId;
        private int rating;
        private String reviewText;
        private LocalDateTime reviewDate;
        private int orderId;
        private String avatar;
        private boolean status;

    public Review(int userId, String userName, int productId, int rating, String reviewText, LocalDateTime reviewDate, int orderId, String avatar, boolean status) {
        this.userId = userId;
        this.userName = userName;
        this.productId = productId;
        this.rating = rating;
        this.reviewText = reviewText;
        this.reviewDate = reviewDate;
        this.orderId = orderId;
        this.avatar = avatar;
        this.status = status;
    }

    public Review() {
    }

    // Getters và Setters
        public int getUserId() {
            return userId;
        }

        public void setUserId(int userId) {
            this.userId = userId;
        }

        public int getProductId() {
            return productId;
        }

        public void setProductId(int productId) {
            this.productId = productId;
        }

        public int getRating() {
            return rating;
        }

        public void setRating(int rating) {
            this.rating = rating;
        }

        public String getReviewText() {
            return reviewText;
        }

        public void setReviewText(String reviewText) {
            this.reviewText = reviewText;
        }

        public LocalDateTime getReviewDate() {
            return reviewDate;
        }

        public void setReviewDate(LocalDateTime reviewDate) {
            this.reviewDate = reviewDate;
        }

        public int getOrderId() {
            return orderId;
        }

        public void setOrderId(int orderId) {
            this.orderId = orderId;
        }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
        public String toString() {
            return "Review{" +
                    "userId=" + userId +
                    ", productId=" + productId +
                    ", rating=" + rating +
                    ", reviewText='" + reviewText + '\'' +
                    ", reviewDate='" + reviewDate + '\'' +
                    ", orderId=" + orderId +
                    '}';
        }
    }

