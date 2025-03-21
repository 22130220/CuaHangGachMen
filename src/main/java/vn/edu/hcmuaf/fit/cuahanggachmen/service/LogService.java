package vn.edu.hcmuaf.fit.cuahanggachmen.service;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.LogDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Log;

import java.sql.Date;

public class LogService {

    public LogService() {
    }
    public void alert(Log log) {
        Handle handle = DBConect.get().open();
        LogDao logDao= new LogDao(handle);
        logDao.insert(log);
    }
    public void info(Log log) {
        Handle handle = DBConect.get().open();
        LogDao logDao= new LogDao(handle);
        logDao.insert(log);
    }
    public void warning(Log log) {
        Handle handle = DBConect.get().open();
        LogDao logDao= new LogDao(handle);
        logDao.insert(log);
    }
    public void danger(Log log) {
        Handle handle = DBConect.get().open();
        LogDao logDao= new LogDao(handle);
        logDao.insert(log);
    }



}
