package vn.edu.hcmuaf.fit.cuahanggachmen.model.builder;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.LogDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.LoginDeviceLogDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.LogModel;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.LoginDeviceLog;

public class GoogleLoginBuilder extends LoginDeviceBuilder {

    public GoogleLoginBuilder() {
        super();
    }

    @Override
    public void build(Handle handle) {
        LogModel log = getLog();
        LoginDeviceLog loginDeviceLog = getLoginDeviceLog();

        log.setMessage(log.getMessage() + " - " + loginDeviceLog.getDeviceId() + " - " + loginDeviceLog.getDeviceIp());
        int logId = new LogDao(handle).insertLog(log);
        new LoginDeviceLogDao(handle).insertLog(loginDeviceLog);

        if(loginDeviceLog.getLoginLevel().equals("REGISTERED")) {
            LogModel loginGoogleLog = getLog();
            LoginDeviceLog loginGoogleDeviceLog = getLoginDeviceLog();

            log.setMessage("Đăng nhập google thành công");
            log.setMessage(log.getMessage() + " - " + loginDeviceLog.getDeviceId() + " - " + loginDeviceLog.getDeviceIp());
            log.setLevel("INFO");

            loginGoogleLog.setLevel("LOGIN");

            int loginGoogleId = new LogDao(handle).insertLog(log);
            new LoginDeviceLogDao(handle).insertLog(loginDeviceLog);
        }
    }
}
