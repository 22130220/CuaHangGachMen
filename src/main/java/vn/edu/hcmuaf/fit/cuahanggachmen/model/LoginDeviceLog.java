package vn.edu.hcmuaf.fit.cuahanggachmen.model;


import java.io.Serializable;
import java.sql.Timestamp;

public class LoginDeviceLog implements Serializable {

    private int id;
    private String deviceId;
    private String deviceIp;
    private String userAgent;
    private boolean isLocked;
    private int userId;
    private String loginLevel;
    private Timestamp time;
    private String os;
    private String browser;

    public LoginDeviceLog(int id, String deviceId, String deviceIp, String userAgent, boolean isLocked, int userId, String loginLevel, Timestamp time, String os, String browser) {
        this.id = id;
        this.deviceId = deviceId;
        this.deviceIp = deviceIp;
        this.userAgent = userAgent;
        this.isLocked = isLocked;
        this.userId = userId;
        this.loginLevel = loginLevel;
        this.time = time;
        this.os = os;
        this.browser = browser;
    }

    public LoginDeviceLog() {
    }

    public String getOs() {
        return os;
    }

    public void setOs(String os) {
        this.os = os;
    }

    public String getBrowser() {
        return browser;
    }

    public void setBrowser(String browser) {
        this.browser = browser;
    }

    public boolean isLocked() {
        return isLocked;
    }

    public void setLocked(boolean locked) {
        isLocked = locked;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId;
    }

    public String getDeviceIp() {
        return deviceIp;
    }

    public void setDeviceIp(String deviceIp) {
        this.deviceIp = deviceIp;
    }

    public String getUserAgent() {
        return userAgent;
    }

    public void setUserAgent(String userAgent) {
        this.userAgent = userAgent;
    }

    public boolean getIsLocked() {
        return isLocked;
    }

    public void setIsLocked(boolean locked) {
        isLocked = locked;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getLoginLevel() {
        return loginLevel;
    }

    public void setLoginLevel(String loginLevel) {
        this.loginLevel = loginLevel;
    }



    @Override
    public String toString() {
        return "LoginDeviceLog{" +
                "id=" + id +
                ", deviceId='" + deviceId + '\'' +
                ", deviceIp='" + deviceIp + '\'' +
                ", userAgent='" + userAgent + '\'' +
                ", isLocked=" + isLocked +
                ", userId=" + userId +
                ", loginLevel='" + loginLevel + '\'' +
                '}';
    }
}
