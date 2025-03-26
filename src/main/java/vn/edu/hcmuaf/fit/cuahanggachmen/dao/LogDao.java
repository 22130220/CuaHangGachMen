package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.LogModel;

public class LogDao extends BaseDao{
    public LogDao(Handle handle) {
        super(handle);
    }


    // Insert Log
    public int insertLog(LogModel log) {
        return handle.createUpdate("INSERT INTO log (level, userId, message, requestId, location, beforeData, afterData, type) " +
                        "VALUES (:level, :userId, :message, :requestId, :location, :beforeData, :afterData, :type)")
                        .bindBean(log)
                        .executeAndReturnGeneratedKeys("id") // Lấy ID vừa chèn
                        .mapTo(Integer.class)
                        .one();
    }
}
