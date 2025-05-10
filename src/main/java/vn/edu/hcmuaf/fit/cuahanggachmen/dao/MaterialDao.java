package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Category;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Material;

import java.util.List;

public class MaterialDao extends BaseDao {

    public MaterialDao(Handle handle) {
        super(handle, true, 3 * 60, 1000);
    }

    public int insert(Material material)  {
        return handle.createUpdate("INSERT INTO material (Name) VALUES (:name)")
                        .bind("name", material.getName())
                        .execute();
    }
    public List<Material> findAllWithStatus()  {
        String cacheKey = "materials_active";
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM material WHERE status=1")
                        .mapToBean(Material.class)
                        .list()
        );

    }

    public Material findById(int id)  {
        String cacheKey = "material_" + id;
        return getFromCacheOrCompute(cacheKey, Material.class, () ->
                handle.createQuery("SELECT * FROM material WHERE ID = :id")
                        .bind("id", id)
                        .mapToBean(Material.class)
                        .findOne()
                        .orElse(null)
        );
    }

    public List<Material> findAll()  {
        String cacheKey = "materials_all";
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM material")
                        .mapToBean(Material.class)
                        .list()
        );
    }


    public int update(Material material)  {
        int result =  handle.createUpdate("UPDATE material SET Name = :name WHERE ID = :id")
                        .bind("name", material.getName())
                        .bind("id", material.getId())
                        .execute();
        clearCache();
        return result;
    }


    public int deleteById(int id)  {

        int result = handle.createUpdate("DELETE FROM material WHERE ID = :id")
                        .bind("id", id)
                        .execute();

        clearCache();
        return result;
    }
}
