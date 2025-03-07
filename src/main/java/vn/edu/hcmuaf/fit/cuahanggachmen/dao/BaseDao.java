package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Handles;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;

public abstract class BaseDao implements AutoCloseable{
    protected Handle handle;

    public BaseDao(Handle handle) {
       this.handle = handle;
    }

    @Override
    public void close() throws Exception {
        handle.close();
    }

    public Handle getHandle() {
        return handle;
    }
}
