package vn.edu.hcmuaf.fit.cuahanggachmen;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.RoleResourcePermissionDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.*;

import java.util.List;
import java.util.Map;

public class MainTest {
    public static void main(String[] args) {
        DBConect.mySqlDataSource();

        Handle handle = DBConect.get().open();
        RoleResourcePermissionDao dao = new RoleResourcePermissionDao(handle);
        List<RoleResourcePermission> list = dao.getAll();


//        // Tạo Gson instance
//        Gson gson = new GsonBuilder()
//                .setPrettyPrinting()
//                .disableHtmlEscaping()
//                .create();
//
//        // Chuyển Map thành JSON
//        String json = gson.toJson(ls);
//        System.out.println("JSON output:");
//        System.out.println(json);

        handle.close();
    }
}
