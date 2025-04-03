package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Resource;

import java.util.List;
import java.util.Optional;

public class ResourceDao extends BaseDao {
    public ResourceDao(Handle handle) {
        super(handle);
    }

    /**
     * Thêm mới một Resource
     */
    public int insertResource(String name) {
        handle.createUpdate("INSERT INTO resource (name) VALUES (:name)")
                .bind("name", name)
                .execute();
        return handle.createQuery("SELECT LAST_INSERT_ID()").mapTo(Integer.class).one();
    }

    /**
     * Lấy danh sách tất cả Resource
     */
    public List<Resource> getAllResources() {
        return handle.createQuery("SELECT * FROM resource")
                .map((rs, ctx) -> new Resource(
                        rs.getInt("id"),
                        rs.getString("name")
                ))
                .list();
    }

    /**
     * Tìm Resource theo ID
     */
    public Optional<Resource> getResourceById(int id) {
        return handle.createQuery("SELECT * FROM resource WHERE id = :id")
                .bind("id", id)
                .map((rs, ctx) -> new Resource(
                        rs.getInt("id"),
                        rs.getString("name")
                ))
                .findOne();
    }

    /**
     * Cập nhật Resource
     */
    public boolean updateResource(int id, String newName) {
        int rowsAffected = handle.createUpdate("UPDATE resource SET name = :name WHERE id = :id")
                .bind("name", newName)
                .bind("id", id)
                .execute();
        return rowsAffected > 0;
    }

    /**
     * Xóa Resource theo ID
     */
    public boolean deleteResource(int id) {
        int rowsAffected = handle.createUpdate("DELETE FROM Resource WHERE id = :id")
                .bind("id", id)
                .execute();
        return rowsAffected > 0;
    }
}
