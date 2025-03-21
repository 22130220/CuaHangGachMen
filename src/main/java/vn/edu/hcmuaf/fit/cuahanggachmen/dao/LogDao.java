package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Log;

import java.time.LocalDateTime;

public class LogDao extends BaseDao{
    public LogDao(Handle handle) {
        super(handle);
    }

    public int insert(Log log) {
        return handle.createUpdate("INSERT INTO log (level,userid,location,beforedata,afterdata) " +
                        "VALUES (:level, :userid, :location, :beforedata, :afterdata)")
                .bind("level", log.getLevel())
                .bind("userid", log.getUserId())
                .bind("location",log.getWhere())
                .bind("beforedata",log.getBeforeData())
                .bind("afterdata",log.getAfterData())
                .execute();
    }

}
