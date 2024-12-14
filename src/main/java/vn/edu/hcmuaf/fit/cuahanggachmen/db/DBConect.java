package vn.edu.hcmuaf.fit.cuahanggachmen.db;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DBConect {
    static String url = "jdbc:mysql://"+ DBProperties.host()+":"+DBProperties.port()+"/"+DBProperties.dbname()+"?"+DBProperties.option();
    static Jdbi jdbi;
    static Connection conn;

    public static Jdbi get() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        if(jdbi==null) makeConnect();
        return jdbi;
    }

    private static void makeConnect() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        MysqlDataSource src = new MysqlDataSource();
        src.setURL(url);
        src.setUser(DBProperties.username());
        src.setPassword(DBProperties.password());

        src.setUseCompression(true);
        src.setAutoReconnect(true);

        jdbi = jdbi.create(src);
    }


    }

