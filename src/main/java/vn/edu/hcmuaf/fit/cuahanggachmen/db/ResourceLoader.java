package vn.edu.hcmuaf.fit.cuahanggachmen.db;

import org.yaml.snakeyaml.Yaml;

import java.io.InputStream;
import java.util.Map;

public class ResourceLoader {
    private Map<String, String> resources;

    public ResourceLoader() {
        try (InputStream input = getClass().getClassLoader().getResourceAsStream("resources.yml")) {
            if (input == null) {
                throw new RuntimeException("resources.yml not found");
            }
            Yaml yaml = new Yaml();
            Map<String, Object> data = yaml.load(input);
            this.resources = (Map<String, String>) data.get("resources");
        } catch (Exception e) {
            throw new RuntimeException("Error loading resources.yml", e);
        }
    }

    public String getResource(String key) {
        return resources.get(key);
    }

    public Map<String, String> getAllResources() {
        return resources;
    }


    public static void main(String[] args) {
        ResourceLoader resourceLoader = new ResourceLoader();
        Map<String, String> resources = resourceLoader.getAllResources();
        for (String key : resources.keySet()) {
            System.out.println(key + ": " + resources.get(key));
        }
    }
}
