package vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper;

import org.jdbi.v3.core.config.ConfigRegistry;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Color;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ColorMapper  implements RowMapper<Color> {
    @Override
    public Color map(ResultSet rs, StatementContext ctx) throws SQLException {
        Color color = new Color();
        color.setID(rs.getInt("ID"));
        color.setName(rs.getString("Name"));
        color.setUrl(rs.getString("Url"));

        return color;
    }


    @Override
    public RowMapper<Color> specialize(ResultSet rs, StatementContext ctx) throws SQLException {
        return RowMapper.super.specialize(rs, ctx);
    }

    @Override
    public void init(ConfigRegistry registry) {
        RowMapper.super.init(registry);
    }
}
