package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Size;

import java.sql.SQLException;
import java.util.List;

public class SizeDao {

    // Insert a new Size
    public int insert(Size size) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO Size (Name) VALUES (:name)")
                        .bind("name", size.getName())
                        .execute()
        );
    }

    // Find a Size by ID
    public Size findById(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM Size WHERE ID = :id")
                        .bind("id", id)
                        .mapToBean(Size.class)
                        .findOne()
                        .orElse(null)
        );
    }

    // Find all Sizes
    public List<Size> findAll() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM Size")
                        .mapToBean(Size.class)
                        .list()
        );
    }

    // Update a Size
    public int update(Size size) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE Size SET Name = :name WHERE ID = :id")
                        .bind("name", size.getName())
                        .bind("id", size.getId())
                        .execute()
        );
    }

    // Delete a Size by ID
    public int deleteById(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM Size WHERE ID = :id")
                        .bind("id", id)
                        .execute()
        );
    }
}

