package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.LoginDeviceLog;

import java.util.List;

public class LoginDeviceLogDao extends BaseDao{
    public LoginDeviceLogDao(Handle handle) {
        super(handle);
    }

    // Thêm một bản ghi mới
    public int insertLog(LoginDeviceLog log) {
           return handle.createUpdate("INSERT INTO login_device_log (deviceId, deviceIp, userAgent,isLocked, userId, loginLevel, time) " +
                            "VALUES (:deviceId, :deviceIp, :userAgent, :isLocked, :userId, :loginLevel, :time)")
                    .bindBean(log)
                    .executeAndReturnGeneratedKeys("id") // Lấy ID vừa chèn
                    .mapTo(Integer.class)
                    .one();
    }

    public LoginDeviceLog findLogById(int id) {
        return handle.createQuery("SELECT * FROM login_device_log WHERE id = :id")
                        .bind("id", id)
                        .mapToBean(LoginDeviceLog.class)
                        .findOne()
                        .orElse(null);
    }

    public List<LoginDeviceLog> findLogsByLogId(int logId) {
            return handle.createQuery("SELECT * FROM login_device_log WHERE logId = :logId ORDER BY id DESC")
                        .bind("logId", logId)
                        .mapToBean(LoginDeviceLog.class)
                        .list();
    }

    // Xóa log theo ID
    public int deleteLog(int id) {
            return handle.createUpdate("DELETE FROM login_device_log WHERE id = :id")
                        .bind("id", id)
                        .execute();
    }

    public boolean isRegisterdDevice(String deviceId, String UserId) {
        return false;
    }

    public int registerdDevice(String deviceId, String deviceIp, String userAgent, String UserId) {
        return 1;
    }
}
