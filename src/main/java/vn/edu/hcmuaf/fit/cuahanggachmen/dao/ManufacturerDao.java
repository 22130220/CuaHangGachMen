package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Category;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Manufacturer;

import java.util.List;

public class ManufacturerDao extends BaseDao {

    public ManufacturerDao(Handle handle) {
        super(handle, true, 3 * 60, 1000);
    }

    public int insert(Manufacturer manufacturer)  {
        int result = handle.createUpdate("INSERT INTO manufacturer (Name) VALUES (:name)")
                        .bind("name", manufacturer.getName())
                        .execute();
        clearCache();
        return result;
    }
    public List<Manufacturer> findAllWithStatus()  {
        String cacheKey = "manufacturers_active";
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM manufacturer WHERE status=1")
                        .mapToBean(Manufacturer.class)
                        .list()
        );
    }

    public Manufacturer findById(int id)  {
        String cacheKey = "manufacturer_" + id;
        return getFromCacheOrCompute(cacheKey, Manufacturer.class, () ->
                handle.createQuery("SELECT * FROM manufacturer WHERE ID = :id")
                        .bind("id", id)
                        .mapToBean(Manufacturer.class)
                        .findOne()
                        .orElse(null)
        );
    }

    public List<Manufacturer> findAll()  {
        String cacheKey = "manufacturers_all";
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM manufacturer")
                        .mapToBean(Manufacturer.class)
                        .list()
        );
    }


    public int update(Manufacturer manufacturer)  {
        int result = handle.createUpdate("UPDATE manufacturer SET Name = :name, Status = :status WHERE ID = :id")
                .bind("name", manufacturer.getName())
                .bind("status", manufacturer.isStatus())
                .bind("id", manufacturer.getId())
                .execute();
        clearCache();
        return result;
    }


    public int deleteById(int id)  {
        int result = handle.createUpdate("DELETE FROM manufacturer WHERE ID = :id")
                .bind("id", id)
                .execute();
        clearCache();
        return result;
    }
}
