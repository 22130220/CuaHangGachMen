package vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper;

import org.jdbi.v3.core.config.ConfigRegistry;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Contact;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.ProductSpec;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ContactMapper implements RowMapper<Contact> {

    @Override
    public Contact map (ResultSet rs, StatementContext ctx) throws SQLException {
        return new Contact(
                rs.getInt("ID"),
                rs.getTimestamp("SendDate").toLocalDateTime(),
                rs.getString("Email"),
                rs.getString("Title"),
                rs.getString("Fullname"),
                rs.getString("Content"),
                rs.getBoolean("IsReply")
        );
    }

    @Override
    public RowMapper<Contact> specialize (ResultSet rs, StatementContext ctx) throws SQLException {
        return RowMapper.super.specialize(rs, ctx);
    }

    @Override
    public void init (ConfigRegistry registry){
        RowMapper.super.init(registry);
    }
}
