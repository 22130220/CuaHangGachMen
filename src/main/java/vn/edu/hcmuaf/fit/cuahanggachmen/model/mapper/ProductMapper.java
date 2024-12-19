package vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper;

import org.jdbi.v3.core.config.ConfigRegistry;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;

import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductMapper implements RowMapper<Product> {

    @Override
    public Product map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Product(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getInt("pricePerBox"),
                rs.getInt("stock"),
                rs.getString("description"),
                rs.getBoolean("status"),
                rs.getInt("rating"),
                rs.getBoolean("discount"),
                rs.getBigDecimal("promotionPrice"),
                rs.getInt("quantityPerBox"),
                rs.getTimestamp("createDate").toLocalDateTime(),
                rs.getInt("categoryId"),
                rs.getInt("sizeId"),
                rs.getInt("materialId"),
                rs.getInt("manufacturerId"),
                rs.getString("imgThumbnail")
        );
    }

    @Override
    public RowMapper<Product> specialize(ResultSet rs, StatementContext ctx) throws SQLException {
        return RowMapper.super.specialize(rs, ctx);
    }

    @Override
    public void init(ConfigRegistry registry) {
        RowMapper.super.init(registry);
    }
}
