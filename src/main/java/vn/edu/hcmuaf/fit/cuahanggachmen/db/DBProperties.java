package vn.edu.hcmuaf.fit.cuahanggachmen.db;

import java.io.IOException;
import java.util.Properties;

public class DBProperties {
    private static Properties prop = new Properties();

    static{
        try{
            prop.load(DBProperties.class.getClassLoader().getResourceAsStream("db.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String host() {
        return prop.get("db.host").toString();
    }
    public static int port() {
        return Integer.parseInt(prop.get("db.port").toString());
    }
    public static String username() {
        return prop.get("db.username").toString();
    }
    public static String password() {
        return prop.get("db.password").toString();
    }
    public static String dbname() {
        return prop.get("db.dbname").toString();
    }

    public static String option() {
        return prop.get("db.option").toString();
    }

    public static String dataSourceEnv() {
        return prop.get("db.dataSourceEnv").toString();
    }

    public static void main(String[] args) {
        System.out.println(host());
        System.out.println(port());
        System.out.println(username());
        System.out.println(password());
        System.out.println(dbname());
        System.out.println(option());
        System.out.println(dataSourceEnv());
    }

}
