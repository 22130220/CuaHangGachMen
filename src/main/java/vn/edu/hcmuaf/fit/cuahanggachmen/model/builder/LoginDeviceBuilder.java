package vn.edu.hcmuaf.fit.cuahanggachmen.model.builder;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.jdbi.v3.core.Handle;
import ua_parser.Client;
import ua_parser.Parser;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.LogDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.LoginDeviceLogDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.LogModel;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.LoginDeviceLog;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.log_config.LoginLevel;

import java.util.UUID;

public class LoginDeviceBuilder extends LogBuilder{
    protected String deviceId;
    protected String deviceIp;
    protected String userAgent;
    protected boolean isLocked;
    private String loginLevel;
    private String os;
    private String browser;

    public LoginDeviceBuilder() {
        super();
        deviceId = null;
        deviceIp = null;
        userAgent = null;
        isLocked = false;
        loginLevel = null;
        os = null;
        browser = null;
    }

    @Override
    protected void loginDeviceSetHeader(HttpServletRequest request, HttpServletResponse response) {
        // Lấy User-Agent và IP
        this.userAgent = request.getHeader("User-Agent");
        this.deviceIp = request.getRemoteAddr();

        // Lấy hoặc tạo Device ID
        this.deviceId = getOrCreateDeviceId(request, response);

        String uaString = request.getHeader("User-Agent");

        Parser uaParser = new Parser();
        Client c = uaParser.parse(uaString);
        browser = c.userAgent.family;
        os = c.os.family;
    }

    public LoginDeviceBuilder deviceId(String deviceId) {
        this.deviceId = deviceId;
        return this;
    }

    public LoginDeviceBuilder deviceIp(String deviceIp) {
        this.deviceIp = deviceIp;
        return this;
    }

    public LoginDeviceBuilder userAgent(String userAgent) {
        this.userAgent = userAgent;
        return this;
    }

    public LoginDeviceBuilder isLocked(boolean isLocked) {
        this.isLocked = isLocked;
        return this;
    }

    public LoginDeviceBuilder loginLevel(LoginLevel level) {
        this.loginLevel = switch (level) {
            case FAILED -> "FAILED";
            case LOGIN -> "LOGIN";
            case REGISTERED -> "REGISTERED";
            case VERIFYING_EMAIL -> "VERIFYING_EMAIL";
            case VERIFYING_TOTP -> "VERIFYING_TOTP";
            case LOGOUT -> "LOGOUT";
            case LOCKED10 -> "LOCKED10";
            case LOCKED30 -> "LOCKED30";
            case LOCKED -> "LOCKED";
        };
        return this;
    }

    public LoginDeviceLog getLoginDeviceLog() {
        LoginDeviceLog log = new LoginDeviceLog();
        log.setDeviceId(deviceId);
        log.setDeviceIp(deviceIp);
        log.setUserAgent(userAgent);
        log.setIsLocked(isLocked);
        log.setLoginLevel(loginLevel);
        log.setUserId(userId);
        log.setTime(time);
        log.setOs(os);
        log.setBrowser(browser);
        return log;
    }

    private String getOrCreateDeviceId(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        return session.getId();
    }

    @Override
    public void build(Handle handle) {
        LogModel log = getLog();
        LoginDeviceLog loginDeviceLog = getLoginDeviceLog();

        log.setMessage(log.getMessage() + " - " + loginDeviceLog.getDeviceId() + " - " + loginDeviceLog.getDeviceIp());
        int logId = new LogDao(handle).insertLog(log);
        new LoginDeviceLogDao(handle).insertLog(loginDeviceLog);

    }
}
