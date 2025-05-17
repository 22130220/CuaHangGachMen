package vn.edu.hcmuaf.fit.cuahanggachmen.db;

import org.yaml.snakeyaml.Yaml;

import java.io.InputStream;
import java.util.Map;

public class PermissionLoader {
    private Map<String, Integer> permissions;

    public PermissionLoader() {
        try (InputStream input = getClass().getClassLoader().getResourceAsStream("permissions.yml")) {
            if (input == null) {
                throw new RuntimeException("resources.yml not found");
            }
            Yaml yaml = new Yaml();
            Map<String, Object> data = yaml.load(input);
            this.permissions = (Map<String, Integer>) data.get("permissions");
        } catch (Exception e) {
            throw new RuntimeException("Error loading permissions.yml", e);
        }
    }

    public Integer getPermission(String key) {
        return permissions.get(key);
    }

    public Map<String, Integer> getAllPermissions() {
        return permissions;
    }


    public static void main(String[] args) {
        PermissionLoader loader = new PermissionLoader();
        Map<String, Integer> permissions = loader.getAllPermissions();
        for (String key : permissions.keySet()) {
            System.out.println(key + ": " + permissions.get(key));
        }
    }
}
