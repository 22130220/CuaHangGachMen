package vn.edu.hcmuaf.fit.cuahanggachmen.action;

import java.util.Map;

public class Result {
    public static ActionResult Ok() {
        return new ActionResult(200, null, null);
    }

    public static ActionResult Ok(String body) {
        return new ActionResult(200, body, null);
    }

    public static ActionResult Ok(String body, Map<String, Object> data) {
        return new ActionResult(200, body, null, data);
    }

    public static ActionResult Ok(Map<String, Object> data) {
        return new ActionResult(200, null, null, data);
    }

    public static ActionResult BadRequest(String errorMessage) {
        return new ActionResult(400, errorMessage, null);
    }

    public static ActionResult NotFound(String errorMessage) {
        return new ActionResult(404, errorMessage, null);
    }
}

