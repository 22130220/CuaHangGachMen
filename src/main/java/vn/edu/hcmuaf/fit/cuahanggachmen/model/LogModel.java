package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class LogModel implements Serializable {
    private int id;
    private String level;
    private int userId;
    private String location;
    private Timestamp time;
    private String beforeData;
    private String afterData;
    private String type;
    private String message;
    private String requestId;

    public LogModel(int id, String level, int userId, String location, Timestamp time, String beforeData, String afterData, String type, String message, String requestId) {
        this.id = id;
        this.level = level;
        this.userId = userId;
        this.location = location;
        this.time = time;
        this.beforeData = beforeData;
        this.afterData = afterData;
        this.type = type;
        this.message = message;
        this.requestId = requestId;
    }

    public LogModel() {
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getRequestId() {
        return requestId;
    }

    public void setRequestId(String requestId) {
        this.requestId = requestId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getBeforeData() {
        return beforeData;
    }

    public void setBeforeData(String beforeData) {
        this.beforeData = beforeData;
    }

    public String getAfterData() {
        return afterData;
    }

    public void setAfterData(String afterData) {
        this.afterData = afterData;
    }

    @Override
    public String toString() {
        return "LogModel{" +
                "id=" + id +
                ", level='" + level + '\'' +
                ", userId=" + userId +
                ", location='" + location + '\'' +
                ", time=" + time +
                ", beforeData='" + beforeData + '\'' +
                ", afterData='" + afterData + '\'' +
                ", type='" + type + '\'' +
                ", message='" + message + '\'' +
                ", requestId='" + requestId + '\'' +
                '}';
    }
}
