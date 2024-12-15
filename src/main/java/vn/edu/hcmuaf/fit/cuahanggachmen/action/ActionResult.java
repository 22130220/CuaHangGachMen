package vn.edu.hcmuaf.fit.cuahanggachmen.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ActionResult {
    private int statusCode;
    private String message;
    private final String contentType;
    private Map<String, Object> data;

    public ActionResult(int statusCode, String message, String contentType) {
        this.statusCode = statusCode;
        this.message = message;
        this.contentType = contentType;
        this.data = new HashMap<>();
    }

    public ActionResult(int statusCode, String message, String contentType, Map<String, Object> data) {
        this.statusCode = statusCode;
        this.message = message;
        this.contentType = contentType;
        this.data = data;
    }

    public ActionResult() {
        this.statusCode = StatusCode.NONE;
        this.message = null;
        this.contentType = null;
        this.data = new HashMap<>();
    }

    public ActionResult(ActionResult actionResult) {
        this.statusCode = actionResult.statusCode;
        this.message = actionResult.message;
        this.contentType = actionResult.contentType;
        this.data = actionResult.data;
    }

    public void put(String key, Object value) {
        if(data == null) {
            data = new HashMap<>();
        }
        this.data.put(key, value);
    }

    public void putAll(Map<String, Object> data) {
        if(data == null) {
            data = new HashMap<>();
        }
        this.data.putAll(data);
    }

    public void delete(String key) {
        data.remove(key);
    }

    public int getCode() {
        return statusCode;
    }

    public void setCode(int code) {
        this.statusCode = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isOk(int statusCode) {
        return this.statusCode == statusCode;
    }

    public String getContentType() {
        return contentType;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public List<Object> getList() {
        return new ArrayList<>(data.values());
    }

}
