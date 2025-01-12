package vn.edu.hcmuaf.fit.cuahanggachmen.mail;

public interface IJavaMail {
    boolean send(String to,String subject,String message);
}
