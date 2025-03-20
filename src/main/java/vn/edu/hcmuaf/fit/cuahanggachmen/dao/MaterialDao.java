package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Material;

import java.util.List;

public class MaterialDao extends BaseDao {

    public MaterialDao(Handle handle) {
        super(handle);
    }

    public int insert(Material material)  {
        return handle.createUpdate("INSERT INTO material (Name) VALUES (:name)")
                        .bind("name", material.getName())
                        .execute();
    }
    public List<Material> findAllWithStatus()  {
        return handle.createQuery("SELECT * FROM material WHERE status=1")
                .mapToBean(Material.class)
                .list();
    }

    public Material findById(int id)  {
        return handle.createQuery("SELECT * FROM material WHERE ID = :id")
                        .bind("id", id)
                        .mapToBean(Material.class)
                        .findOne()
                        .orElse(null);
    }

    public List<Material> findAll()  {
        return handle.createQuery("SELECT * FROM material")
                        .mapToBean(Material.class)
                        .list();
    }


    public int update(Material material)  {
        return handle.createUpdate("UPDATE material SET Name = :name WHERE ID = :id")
                        .bind("name", material.getName())
                        .bind("id", material.getId())
                        .execute();
    }


    public int deleteById(int id)  {
        return handle.createUpdate("DELETE FROM material WHERE ID = :id")
                        .bind("id", id)
                        .execute();
    }
}
