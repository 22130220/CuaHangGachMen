package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Size;

import java.sql.SQLException;
import java.util.List;

public class SizeDao extends BaseDao {

    public SizeDao(Handle handle) {
        super(handle);
    }

    // Insert a new Size
    public int insert(Size size) {
        return handle.createUpdate("INSERT INTO size (Name) VALUES (:name)")
                        .bind("name", size.getName())
                        .execute();
    }

    // Find a Size by ID
    public Size findById(int id) {
        return handle.createQuery("SELECT * FROM size WHERE ID = :id")
                        .bind("id", id)
                        .mapToBean(Size.class)
                        .findOne()
                        .orElse(null);
    }

    // Find all Sizes
    public List<Size> findAll() {
        return handle.createQuery("SELECT * FROM size")
                        .mapToBean(Size.class)
                        .list();
    }

    // Update a Size
    public int update(Size size) {
        return handle.createUpdate("UPDATE size SET Name = :name WHERE ID = :id")
                        .bind("name", size.getName())
                        .bind("id", size.getId())
                        .execute();
    }

    // Delete a Size by ID
    public int deleteById(int id) {
        return handle.createUpdate("DELETE FROM size WHERE ID = :id")
                        .bind("id", id)
                        .execute();
    }
}

