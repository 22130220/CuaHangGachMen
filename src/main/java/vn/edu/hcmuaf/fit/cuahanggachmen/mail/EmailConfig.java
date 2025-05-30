package vn.edu.hcmuaf.fit.cuahanggachmen.mail;

import java.io.IOException;
import java.util.Properties;

public class EmailConfig {
    private static final Properties properties = new Properties();

    static {
        try {
            properties.load(EmailConfig.class.getClassLoader().getResourceAsStream("email.properties"));
        } catch (IOException e) {
            throw new RuntimeException("Không thể tải tệp email.properties", e);
        }
    }

    public static String getHostName() {
        return properties.getProperty("smtp.host");
    }

    public static int getTslPort() {
        return Integer.parseInt(properties.getProperty("smtp.tsl.port"));
    }

    public static int getSslPort() {
        return Integer.parseInt(properties.getProperty("smtp.ssl.port"));
    }

    public static String getEmail() {
        return properties.getProperty("smtp.email");
    }

    public static String getPassword() {
        return properties.getProperty("smtp.password");
    }
}