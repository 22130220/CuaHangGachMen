package vn.edu.hcmuaf.fit.cuahanggachmen.model;


import java.io.Serializable;
import java.util.List;
import java.util.Map;

public class UserPermission implements Serializable {
    private final Map<String, List<Integer>> userPermission;

    public UserPermission(Map<String, List<Integer>> userPermission) {
        this.userPermission = userPermission;
    }

    public boolean haveResource(String resource) {
        return userPermission.containsKey(resource);
    }

    public boolean havePermission(String resource, int permission) {
        return userPermission.containsKey(resource) && userPermission.get(resource).contains(permission);
    }

}
