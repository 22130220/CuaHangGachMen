package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Category;

import java.sql.SQLException;
import java.util.List;

public class CategoryDao extends BaseDao{

    public CategoryDao(Handle handle) {
        super(handle);
    }

    public int insert(Category category) {
        return handle.createUpdate("INSERT INTO category (Name, Status) VALUES (:name, :status)")
                        .bind("name", category.getName())
                        .bind("status", category.isStatus())
                        .execute();
    }
    public List<Category> findAllWithStatus() {
        return handle.createQuery("SELECT * FROM category WHERE Status=1")
                .mapToBean(Category.class)
                .list();
    }

    public Category findById(int id) {
            return handle.createQuery("SELECT * FROM category WHERE ID = :id")
                        .bind("id", id)
                        .mapToBean(Category.class)
                        .findOne()
                        .orElse(null);
    }


    public List<Category> findAll() {
            return handle.createQuery("SELECT * FROM category")
                        .mapToBean(Category.class)
                        .list();
    }

    public int update(Category category) {
            return handle.createUpdate("UPDATE category SET Name = :name, Status = :status WHERE ID = :id")
                        .bind("name", category.getName())
                        .bind("status", category.isStatus())
                        .bind("id", category.getId())
                        .execute();
    }

    public int updateActive(int id, boolean active) {
            return handle.createUpdate("UPDATE category SET status = :status WHERE Id = :id")
                        .bind("id", id)
                        .bind("status", active)
                        .execute();
    }

    public int deleteById(int id) {
            return handle.createUpdate("DELETE FROM category WHERE ID = :id")
                        .bind("id", id)
                        .execute();
    }
}