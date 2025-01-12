package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Category;

import java.sql.SQLException;
import java.util.List;

public class CategoryDao {

    public int insert(Category category) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi  = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO category (Name, Status) VALUES (:name, :status)")
                        .bind("name", category.getName())
                        .bind("status", category.isStatus())
                        .execute()
        );
    }


    public Category findById(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi  = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM category WHERE ID = :id")
                        .bind("id", id)
                        .mapToBean(Category.class)
                        .findOne()
                        .orElse(null)
        );
    }


    public List<Category> findAll() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi  = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM category")
                        .mapToBean(Category.class)
                        .list()
        );
    }

    public int update(Category category) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi  = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE category SET Name = :name, Status = :status WHERE ID = :id")
                        .bind("name", category.getName())
                        .bind("status", category.isStatus())
                        .bind("id", category.getId())
                        .execute()
        );
    }

    public int updateActive(int id, boolean active) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate(
                                "UPDATE category SET status = :status WHERE Id = :id"
                        )
                        .bind("id", id)
                        .bind("status", active)
                        .execute()
        );
    }

    public int deleteById(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi  = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM category WHERE ID = :id")
                        .bind("id", id)
                        .execute()
        );
    }
}