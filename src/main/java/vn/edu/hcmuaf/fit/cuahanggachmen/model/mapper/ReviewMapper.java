package vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper;

import org.jdbi.v3.core.config.ConfigRegistry;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Review;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ReviewMapper implements RowMapper<Review> {
    @Override
    public Review map(ResultSet rs, StatementContext ctx) throws SQLException {
        Review review = new Review();

        // Mapping các cột từ ResultSet sang đối tượng Review
        review.setUserId(rs.getInt("UserID"));
        review.setUserName(rs.getString("fullname")); // Tên đầy đủ từ bảng users
        review.setAvatar(rs.getString("avatar")); // Avatar từ bảng users
        review.setProductId(rs.getInt("ProductID"));
        review.setRating(rs.getInt("Rating"));
        review.setReviewText(rs.getString("ReviewText"));
        review.setReviewDate(rs.getTimestamp("ReviewDate").toLocalDateTime());
        review.setOrderId(rs.getInt("OrderID"));

        return review;
    }

    @Override
    public RowMapper<Review> specialize(ResultSet rs, StatementContext ctx) throws SQLException {
        return RowMapper.super.specialize(rs, ctx);
    }

    @Override
    public void init(ConfigRegistry registry) {
        RowMapper.super.init(registry);
    }
}
