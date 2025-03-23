package vn.edu.hcmuaf.fit.cuahanggachmen.model.builder;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.LogDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.filter.RequestIdFilter;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.LogModel;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.log_config.LogLevel;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.log_config.LogType;

import java.sql.Timestamp;

public class LogBuilder {
    protected int id;
    protected int userId;
    protected String level;
    protected Timestamp time;
    protected String requestId;
    protected String message;
    private String location;
    private String beforeData;
    private String afterData;
    private String type;

    public LogBuilder() {
        id = 0;
        level = "INFO";
        time = new Timestamp(System.currentTimeMillis());
        requestId = null;
        message = null;
        location = null;
        beforeData = null;
        afterData = null;
        type = null;
    }

    public LogBuilder id(int id) {
        this.id = id;
        return this;
    }

    public LogBuilder setHeaderRequest(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("auth");
        if (u != null) {
            userId = u.getId();
        }
        requestId = (String) request.getAttribute(RequestIdFilter.REQUEST_ID_HEADER);
        loginDeviceSetHeader(request, response);
        return this;
    }

    protected void loginDeviceSetHeader(HttpServletRequest request, HttpServletResponse response) {}

    public LogBuilder userId(int userId) {
        this.userId = userId;
        return this;
    }

    public LogBuilder level(LogLevel level) {
        this.level = switch (level) {
            case WARNING -> "WARNING";
            case ALERT -> "ALERT";
            case ERROR -> "ERROR";
            case FATAL -> "FATAL";
            case INFO -> "INFO";
            case DEBUG -> "DEBUG";
            case TRACE -> "TRACE";
        };
        return this;
    }

    public LogBuilder time(Timestamp time) {
        this.time = time;
        return this;
    }

    public LogBuilder requestId(String requestId) {
        this.requestId = requestId;
        return this;
    }

    public LogBuilder message(String message) {
        this.message = message;
        return this;
    }

   public LogBuilder location(String location) {
        this.location = location;
        return this;
   }

   public LogBuilder beforeData(String beforeData) {
        this.beforeData = beforeData;
        return this;
   }

   public LogBuilder afterData(String afterData) {
        this.afterData = afterData;
        return this;
   }

  public LogBuilder type(LogType type) {
        this.type = switch (type) {
            case UPDATE -> "CẬP NHẬT";
            case DELETE -> "XOÁ";
            case INSERT -> "THÊM";
        };
        return this;
  }

    public LogModel getLog() {
        LogModel log = new LogModel();
        log.setId(id);
        log.setUserId(userId);
        log.setLevel(level);
        log.setTime(time);
        log.setRequestId(requestId);
        log.setMessage(message);
        log.setLocation(location);
        log.setBeforeData(beforeData);
        log.setAfterData(afterData);
        log.setType(type);
        return log;
    }

    public void build(Handle handle) {
        LogModel log = getLog();
        LogDao dao = new LogDao(handle);
        dao.insertLog(log);
    }
}
