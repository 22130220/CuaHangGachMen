package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Material;

import java.sql.SQLException;
import java.util.List;

public class MaterialDao {

    public int insert(Material material) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO material (Name) VALUES (:name)")
                        .bind("name", material.getName())
                        .execute()
        );
    }

    public Material findById(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM material WHERE ID = :id")
                        .bind("id", id)
                        .mapToBean(Material.class)
                        .findOne()
                        .orElse(null)
        );
    }

    public List<Material> findAll() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM material")
                        .mapToBean(Material.class)
                        .list()
        );
    }


    public int update(Material material) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE material SET Name = :name WHERE ID = :id")
                        .bind("name", material.getName())
                        .bind("id", material.getId())
                        .execute()
        );
    }


    public int deleteById(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM material WHERE ID = :id")
                        .bind("id", id)
                        .execute()
        );
    }
}
