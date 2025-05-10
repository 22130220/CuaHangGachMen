package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.UnableToExecuteStatementException;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Resource;

import java.util.List;
import java.util.Optional;

public class ResourceDao extends BaseDao {
    public ResourceDao(Handle handle) {
        super(handle);
    }

    public ResourceDao(Handle handle, boolean cacheEnabled, long cacheExpirationSeconds, long cacheMaximumSize) {
        super(handle, cacheEnabled, cacheExpirationSeconds, cacheMaximumSize);
    }

    /**
     * Thêm mới một Resource
     */
    public int insertResource(String name) {
        try {
            handle.createUpdate("INSERT INTO resource (name) VALUES (:name)")
                    .bind("name", name)
                    .execute();
            int id = handle.createQuery("SELECT LAST_INSERT_ID()").mapTo(Integer.class).one();
            // Invalidate related cache keys
            invalidateCache("resources_all");
            return id;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể thêm resource: " + e.getMessage(), e);
        }
    }

    /**
     * Lấy danh sách tất cả Resource
     */
    public List<Resource> getAllResources() {
        String cacheKey = "resources_all";
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM resource")
                        .map((rs, ctx) -> new Resource(
                                rs.getInt("id"),
                                rs.getString("name")
                        ))
                        .list()
        );
    }

    /**
     * Tìm Resource theo ID
     */
    public Optional<Resource> getResourceById(int id) {
        String cacheKey = "resource_" + id;
        return getFromCacheOrCompute(cacheKey, Optional.class, () ->
                handle.createQuery("SELECT * FROM resource WHERE id = :id")
                        .bind("id", id)
                        .map((rs, ctx) -> new Resource(
                                rs.getInt("id"),
                                rs.getString("name")
                        ))
                        .findOne()
        );
    }

    /**
     * Cập nhật Resource
     */
    public int updateResource(int id, String newName) {
        try {
            int rowsAffected = handle.createUpdate("UPDATE resource SET name = :name WHERE id = :id")
                    .bind("name", newName)
                    .bind("id", id)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("resource_" + id);
            invalidateCache("resources_all");
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể cập nhật resource: " + e.getMessage(), e);
        }
    }

    /**
     * Xóa Resource theo ID
     */
    public int deleteResource(int id) {
        try {
            int rowsAffected = handle.createUpdate("DELETE FROM resource WHERE id = :id")
                    .bind("id", id)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("resource_" + id);
            invalidateCache("resources_all");
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể xóa resource: " + e.getMessage(), e);
        }
    }
}