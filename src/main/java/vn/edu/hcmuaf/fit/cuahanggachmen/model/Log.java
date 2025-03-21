package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.sql.Date;

public class Log {
    private int id;
    private String level;
    private int userId;
    private Date time;
    private String where;
    private String beforeData;
    private String afterData;

    public Log(int id, String level, int userId, Date time, String where, String beforeData, String afterData) {
        this.id = id;
        this.level = level;
        this.userId = userId;
        this.time = time;
        this.where = where;
        this.beforeData = beforeData;
        this.afterData = afterData;
    }

    public Log(String level, int userId, String where, String beforeData, String afterData) {
        this.level = level;
        this.userId = userId;
        this.where = where;
        this.beforeData = beforeData;
        this.afterData = afterData;
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

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getWhere() {
        return where;
    }

    public void setWhere(String where) {
        this.where = where;
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
}
