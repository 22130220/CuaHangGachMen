package vn.edu.hcmuaf.fit.cuahanggachmen.dao;


import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.LoginDeviceLog;

import java.util.List;

public class LoginDeviceLogDao extends BaseDao {
    public LoginDeviceLogDao(Handle handle) {
        super(handle);
    }

    // Thêm một bản ghi mới
    public int insertLog(LoginDeviceLog log) {
        
        return handle.createUpdate("INSERT INTO login_device_log (deviceId, deviceIp, userAgent,isLocked, userId, loginLevel, os, browser) " +
                                "VALUES (:deviceId, :deviceIp, :userAgent, :isLocked, :userId, :loginLevel, :os, :browser)")
                        .bindBean(log)
                        .executeAndReturnGeneratedKeys("id") // Lấy ID vừa chèn
                        .mapTo(Integer.class)
                        .one();
    }

    // Lấy một bản ghi theo ID
    public LoginDeviceLog findLogById(int id) {
                return handle.createQuery("SELECT * FROM login_device_log WHERE id = :id")
                        .bind("id", id)
                        .mapToBean(LoginDeviceLog.class)
                        .findOne()
                        .orElse(null);
    }



    // Lấy tất cả logs của một `logId`
    public List<LoginDeviceLog> findLogsByUser(int userId) {
                return handle.createQuery("SELECT *\n" +
                                "FROM login_device_log\n" +
                                "WHERE loginLevel = 'LOGIN'\n" +
                                "AND userId = :userId\n" +
                                "  AND deviceId NOT IN (\n" +
                                "      SELECT deviceId\n" +
                                "      FROM login_device_log\n" +
                                "      WHERE loginLevel = 'LOGOUT'\n" +
                                "      AND userId = :userId\n" +
                                "        AND time > (\n" +
                                "            SELECT MAX(time)\n" +
                                "            FROM login_device_log\n" +
                                "            WHERE loginLevel = 'LOGIN'\n" +
                                "            AND userId = :userId\n" +
                                "              AND deviceId = login_device_log.deviceId\n" +
                                "        )\n" +
                                "  )\n" +
                                "ORDER BY time DESC;")
                        .bind("userId", userId)
                        .mapToBean(LoginDeviceLog.class)
                        .list();
    }

    // Xóa log theo ID
    public void deleteLog(int id) {
       handle.createUpdate("DELETE FROM login_device_log WHERE id = :id")
                        .bind("id", id)
                        .execute();
    }

    public boolean hasSessionAndLogin(String sessionId) {
        
        return handle.createQuery("SELECT * FROM login_device_log WHERE deviceId = :deviceId and logLevel = :logLevel")
                .bind("deviceId", sessionId)
                .bind("logLevel", "LOGIN")
                .mapToBean(LoginDeviceLog.class)
                .findFirst().orElse(null) != null;
    }

    public boolean isRegisterdDevice(String deviceId, String UserId) {
        return false;
    }

    public int registerdDevice(String deviceId, String deviceIp, String userAgent, String UserId) {
        return 1;
    }
}
