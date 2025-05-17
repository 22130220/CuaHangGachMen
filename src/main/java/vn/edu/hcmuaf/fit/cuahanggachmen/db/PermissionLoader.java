package vn.edu.hcmuaf.fit.cuahanggachmen.db;

import org.yaml.snakeyaml.Yaml;

import java.io.InputStream;
import java.util.Map;

public class PermissionLoader {
    private static Map<String, Integer> permissions;

    static {
        try (InputStream input = PermissionLoader.class.getClassLoader().getResourceAsStream("permissions.yml")) {
            if (input == null) {
                throw new RuntimeException("resources.yml not found");
            }
            Yaml yaml = new Yaml();
            Map<String, Object> data = yaml.load(input);
            permissions = (Map<String, Integer>) data.get("permissions");
        } catch (Exception e) {
            throw new RuntimeException("Error loading permissions.yml", e);
        }
    }

    public static Integer getPermission(String key) {
        return permissions.get(key);
    }

    public static Map<String, Integer> getAllPermissions() {
        return permissions;
    }


    public static void main(String[] args) {

        Map<String, Integer> permissions = PermissionLoader.getAllPermissions();
        for (String key : permissions.keySet()) {
            System.out.println(key + ": " + permissions.get(key));
        }
    }
}
