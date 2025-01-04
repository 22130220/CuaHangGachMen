package vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper;

import org.jdbi.v3.core.config.ConfigRegistry;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.ProductSpec;

import java.sql.ResultSet;
import java.sql.SQLException;


public class ProductSpecMapper implements RowMapper<ProductSpec> {

    @Override
    public ProductSpec map(ResultSet rs, StatementContext ctx) throws SQLException {
        ProductSpec productSpec = new ProductSpec();

        productSpec.setProcuctId(rs.getInt("ProductId"));
        productSpec.setSpecId(rs.getInt("SpecId"));
        productSpec.setValue(rs.getString("Value"));
        productSpec.setSpecName(rs.getString("Name"));
        return productSpec;
    }

    @Override
    public RowMapper<ProductSpec> specialize(ResultSet rs, StatementContext ctx) throws SQLException {
        return RowMapper.super.specialize(rs, ctx);
    }

    @Override
    public void init(ConfigRegistry registry) {
        RowMapper.super.init(registry);
    }
}
