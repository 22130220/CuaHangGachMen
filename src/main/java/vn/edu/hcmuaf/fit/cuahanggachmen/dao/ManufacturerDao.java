package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Manufacturer;

import java.util.List;

public class ManufacturerDao extends BaseDao {

    public ManufacturerDao(Handle handle) {
        super(handle);
    }

    public int insert(Manufacturer manufacturer)  {
            return handle.createUpdate("INSERT INTO manufacturer (Name) VALUES (:name)")
                        .bind("name", manufacturer.getName())
                        .execute();
    }
    public List<Manufacturer> findAllWithStatus()  {
        return handle.createQuery("SELECT * FROM manufacturer WHERE status=1")
                .mapToBean(Manufacturer.class)
                .list();
    }

    public Manufacturer findById(int id)  {
            return handle.createQuery("SELECT * FROM manufacturer WHERE ID = :id")
                        .bind("id", id)
                        .mapToBean(Manufacturer.class)
                        .findOne()
                        .orElse(null);
    }

    public List<Manufacturer> findAll()  {
            return handle.createQuery("SELECT * FROM manufacturer")
                        .mapToBean(Manufacturer.class)
                        .list();
    }


    public int update(Manufacturer manufacturer)  {
            return handle.createUpdate("UPDATE manufacturer SET Name = :name WHERE ID = :id")
                        .bind("name", manufacturer.getName())
                        .bind("id", manufacturer.getId())
                        .execute();
    }


    public int deleteById(int id)  {
            return handle.createUpdate("DELETE FROM manufacturer WHERE ID = :id")
                        .bind("id", id)
                        .execute();
    }
}
