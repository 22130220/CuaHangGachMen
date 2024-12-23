package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;
import org.jdbi.v3.core.statement.UnableToExecuteStatementException;
import org.jdbi.v3.core.statement.Update;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.Result;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Review;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper.ReviewMapper;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

public class ReviewDao {
    // Thêm một bản ghi mới vào bảng Review
    public int insertReview(Review review) {
        Jdbi jdbi = null;
        try {
            jdbi = DBConect.get();
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        try {
            return jdbi.withHandle(handle -> {
                return handle.createUpdate("INSERT INTO review (UserID, ProductID, Rating, ReviewText, ReviewDate, OrderID) " +
                                "VALUES (:userId, :productId, :rating, :reviewText, :reviewDate, :orderId)")
                        .bind("userId", review.getUserId())
                        .bind("productId", review.getProductId())
                        .bind("rating", review.getRating())
                        .bind("reviewText", review.getReviewText())
                        .bind("reviewDate", review.getReviewDate())
                        .bind("orderId", review.getOrderId())
                        .execute();
            });
        } catch (UnableToExecuteStatementException e) {
            Throwable cause = e.getCause();
            if (cause instanceof SQLIntegrityConstraintViolationException) {
                return 0;
            }
           return 0;
        }

    }

    // Lấy tất cả các review
    public List<Review> getAllReviews() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();

        return jdbi.withHandle(handle -> {
            Query query = handle.createQuery("SELECT * FROM review");
            return query.mapToBean(Review.class).list();
        });
    }

    // Tìm các review theo UserID
    public List<Review> findReviewsByUserId(int userId) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();

        return jdbi.withHandle(handle -> {
            Query query = handle.createQuery("SELECT * FROM review WHERE UserID = :userId");
            query.bind("userId", userId);
            return query.mapToBean(Review.class).list();
        });
    }

    // Tìm các review theo ProductID
    public List<Review> findReviewsByProductId(int productId) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();

        return jdbi.withHandle(handle -> {
            Query query = handle.createQuery("select us.fullname, us.avatar, rv.*\n" +
                    "from products p JOIN review rv on p.id = rv.ProductID\n" +
                    "join users us on us.id = rv.UserID\n" +
                    "WHERE rv.ProductID = :id;");
            query.bind("id", productId);
            return query.map(new ReviewMapper()).list();
        });
    }

    // Cập nhật rating và nội dung review
    public void updateReview(int userId, int productId, int rating, String reviewText) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();

        jdbi.useHandle(handle -> {
            Update update = handle.createUpdate("UPDATE review SET Rating = :rating, ReviewText = :reviewText " +
                    "WHERE UserID = :userId AND ProductID = :productId");
            update.bind("userId", userId)
                    .bind("productId", productId)
                    .bind("rating", rating)
                    .bind("reviewText", reviewText)
                    .execute();
        });
    }

    // Xóa review theo UserID và ProductID
    public void deleteReview(int userId, int productId) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();

        jdbi.useHandle(handle -> {
            Update update = handle.createUpdate("DELETE FROM review WHERE UserID = :userId AND ProductID = :productId");
            update.bind("userId", userId)
                    .bind("productId", productId)
                    .execute();
        });
    }

    // Lấy danh sách các review gần đây nhất
    public List<Review> getRecentReviews(int limit) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();

        return jdbi.withHandle(handle -> {
            Query query = handle.createQuery("SELECT * FROM review ORDER BY ReviewDate DESC LIMIT :limit");
            query.bind("limit", limit);
            return query.mapToBean(Review.class).list();
        });
    }
}

