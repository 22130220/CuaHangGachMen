package vn.edu.hcmuaf.fit.cuahanggachmen.db;

import org.yaml.snakeyaml.Yaml;

import java.io.InputStream;
import java.util.Map;

public class ResourceLoader {
    private static Map<String, String> resources;

    static {
        try (InputStream input = ResourceLoader.class.getClassLoader().getResourceAsStream("resources.yml")) {
            if (input == null) {
                throw new RuntimeException("resources.yml not found");
            }
            Yaml yaml = new Yaml();
            Map<String, Object> data = yaml.load(input);
            resources = (Map<String, String>) data.get("resources");
        } catch (Exception e) {
            throw new RuntimeException("Error loading resources.yml", e);
        }
    }

    public static String getResource(String key) {
        return resources.get(key);
    }

    public static Map<String, String> getAllResources() {
        return resources;
    }


    public static void main(String[] args) {
        Map<String, String> resources = ResourceLoader.getAllResources();
        for (String key : resources.keySet()) {
            System.out.println(key + ": " + resources.get(key));
        }
    }
}
