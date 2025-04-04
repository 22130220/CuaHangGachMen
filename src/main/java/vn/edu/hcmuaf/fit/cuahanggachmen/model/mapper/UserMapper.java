package vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper;

import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

public class UserMapper implements RowMapper<User> {
    @Override
    public User map(ResultSet rs, StatementContext ctx) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setFullname(rs.getString("fullname"));
        user.setEmail(rs.getString("email"));
        user.setPhone(rs.getString("phone"));
        user.setAvatar(rs.getString("avatar"));
        user.setAddress(rs.getString("address"));
        Timestamp ts= rs.getTimestamp("birthtime");
        user.setBirthtime(ts==null?null:ts.toLocalDateTime());
        user.setStatus(rs.getBoolean("status"));
        user.setCreatetime(rs.getTimestamp("createtime").toLocalDateTime());
        user.setSalt(rs.getString("salt"));
        user.setRole(rs.getInt("role"));
        user.setPassword(rs.getString("password"));
        user.setSex(rs.getInt("sex"));
        user.setFbid(rs.getString("fbid"));
        return user;
    }
}
