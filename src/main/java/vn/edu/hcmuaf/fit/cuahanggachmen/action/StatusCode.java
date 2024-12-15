package vn.edu.hcmuaf.fit.cuahanggachmen.action;

public class StatusCode {
    public static final int NONE = -1;
    public static final int OK = 200;
    public static final int CREATED = 201;
    public static final int ACCEPTED = 202;
    public static final int NO_CONTENT = 204;
    public static final int FOUND = 302;
    public static final int SEE_OTHER = 303;
    public static final int NOT_MODIFIED = 304;
    public static final int BAD_REQUEST = 400;
    public static final int UNAUTHORIZED = 401;
    public static final int FORBIDDEN = 403;
    public static final int NOT_FOUND = 404;
    public static final int REQUEST_TIMEOUT = 408;
    public static final int INTERNAL_SERVER_ERROR = 500;

    // User defined error
    public static final int PASSWORD_FAILED = 450;
    public static final int PASSWORD_CONFIRM_FAILED = 451;
    public static final int REGISTER_FAILED = 460;
}
