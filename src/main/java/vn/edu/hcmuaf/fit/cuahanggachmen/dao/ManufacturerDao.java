package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Manufacturer;

import java.sql.SQLException;
import java.util.List;

public class ManufacturerDao {

    public int insert(Manufacturer manufacturer) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO manufacturer (Name) VALUES (:name)")
                        .bind("name", manufacturer.getName())
                        .execute()
        );
    }

    public Manufacturer findById(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM manufacturer WHERE ID = :id")
                        .bind("id", id)
                        .mapToBean(Manufacturer.class)
                        .findOne()
                        .orElse(null)
        );
    }

    public List<Manufacturer> findAll() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM manufacturer")
                        .mapToBean(Manufacturer.class)
                        .list()
        );
    }


    public int update(Manufacturer manufacturer) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE manufacturer SET Name = :name WHERE ID = :id")
                        .bind("name", manufacturer.getName())
                        .bind("id", manufacturer.getId())
                        .execute()
        );
    }


    public int deleteById(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM manufacturer WHERE ID = :id")
                        .bind("id", id)
                        .execute()
        );
    }
}
