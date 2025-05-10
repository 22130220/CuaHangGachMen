package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Category;

import java.util.List;

public class CategoryDao extends BaseDao {

    public CategoryDao(Handle handle) {
        super(handle, true, 5, 1000);
    }

    public int insert(Category category) {
        int result = handle.createUpdate("INSERT INTO category (Name, Status) VALUES (:name, :status)")
                .bind("name", category.getName())
                .bind("status", category.isStatus())
                .execute();
        clearCache();
        return result;
    }

    public List<Category> findAllWithStatus() {
        String cacheKey = "categories_active";
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM category WHERE Status=1")
                        .mapToBean(Category.class)
                        .list()
        );
    }

    public Category findById(int id) {
        String cacheKey = "category_" + id;
        return getFromCacheOrCompute(cacheKey, Category.class, () ->
                handle.createQuery("SELECT * FROM category WHERE ID = :id")
                        .bind("id", id)
                        .mapToBean(Category.class)
                        .findOne()
                        .orElse(null)
        );
    }

    public List<Category> findAll() {
        String cacheKey = "categories_all";
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM category")
                        .mapToBean(Category.class)
                        .list()
        );
    }

    public int update(Category category) {
        int result = handle.createUpdate("UPDATE category SET Name = :name, Status = :status WHERE ID = :id")
                .bind("name", category.getName())
                .bind("status", category.isStatus())
                .bind("id", category.getId())
                .execute();

        invalidateCache("category_" + category.getId());
        clearCache();
        return result;
    }

    public int updateActive(int id, boolean active) {
        int result = handle.createUpdate("UPDATE category SET status = :status WHERE Id = :id")
                .bind("id", id)
                .bind("status", active)
                .execute();
        invalidateCache("category_" + id);
        clearCache();
        return result;
    }

    public int deleteById(int id) {
        int result = handle.createUpdate("DELETE FROM category WHERE ID = :id")
                .bind("id", id)
                .execute();
        invalidateCache("category_" + id);
        clearCache();
        return result;
    }
}