package vn.edu.hcmuaf.fit.cuahanggachmen;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.RoleResourcePermissionDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.UserPermission;

import java.util.List;

public class PermissionCheck {
    public static boolean check(String resourceName, HttpServletRequest request, HttpServletResponse response) {
        UserPermission rMap = (UserPermission) request.getSession().getAttribute("userRole");
        if (rMap == null) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            return false;
        }
        Handle handle = DBConect.get().open();
        RoleResourcePermissionDao dao = new RoleResourcePermissionDao(handle);
        List<Integer> per = dao.getResourcePermissions(resourceName);
        if(!per.isEmpty()){
            for (int i : per) {
                if(rMap.havePermission(resourceName, i)) {
                    return true;
                }
            }
        }

        response.setStatus(HttpServletResponse.SC_FORBIDDEN);
        return false;
    }

    public static boolean checkResource(String resourceName, HttpServletRequest request, HttpServletResponse response) {
        UserPermission rMap = (UserPermission) request.getSession().getAttribute("userRole");
        if (rMap == null) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            return false;
        }

        if(!rMap.haveResource(resourceName)) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            return false;
        }

        return true;

    }
}
