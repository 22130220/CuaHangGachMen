package vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper;

import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Banner;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class BannerMapper implements RowMapper<Banner> {
    @Override
    public Banner map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Banner(
                rs.getInt("id"),
                rs.getString("title"),
                rs.getString("image_url"),
                rs.getString("link"),
                rs.getString("position"),
                rs.getBoolean("is_active"),
                rs.getObject("start_date", LocalDateTime.class),
                rs.getObject("end_date", LocalDateTime.class),
                rs.getInt("priority"),
                rs.getObject("created_at", LocalDateTime.class),
                rs.getObject("updated_at", LocalDateTime.class)
        );
    }
}