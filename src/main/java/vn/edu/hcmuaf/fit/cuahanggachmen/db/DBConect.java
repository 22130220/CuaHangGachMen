package vn.edu.hcmuaf.fit.cuahanggachmen.db;
import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.SQLException;

public class DBConect {
    private static DataSource dataSource;
    private static Jdbi jdbi;

    private DBConect() {}

    public static void init() {
        InitialContext ctx = null;
        try {
            ctx = new InitialContext();
            dataSource = (DataSource) ctx.lookup(DBProperties.dataSourceEnv());
            jdbi = Jdbi.create(dataSource);
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
    }

    public static Jdbi get() {
        return jdbi;
    }

    public static void mySqlDataSource() {
        String url = "jdbc:mysql://"+ DBProperties.host()+":"+DBProperties.port()+"/"+DBProperties.dbname()+"?"+DBProperties.option();
        MysqlDataSource src = new MysqlDataSource();
        src.setURL(url);
        src.setUser(DBProperties.username());
        src.setPassword(DBProperties.password());

        try {
            src.setUseCompression(true);
            src.setAutoReconnect(true);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        jdbi = Jdbi.create(src);
    }

    public static void dataSource() {
        jdbi = Jdbi.create(dataSource);
    }


}

