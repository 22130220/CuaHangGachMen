package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.UnableToExecuteStatementException;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Size;

import java.util.List;

public class SizeDao extends BaseDao {

    public SizeDao(Handle handle) {
        super(handle, true, 60 * 3, 1000); // Cache enabled, 60 seconds expiration, 1000 max size by default
    }

    public SizeDao(Handle handle, boolean cacheEnabled, long cacheExpirationSeconds, long cacheMaximumSize) {
        super(handle, cacheEnabled, cacheExpirationSeconds, cacheMaximumSize);
    }

    // Insert a new Size
    public int insert(Size size) {
        try {
            int rowsAffected = handle.createUpdate("INSERT INTO size (Name) VALUES (:name)")
                    .bind("name", size.getName())
                    .execute();
            // Invalidate related cache keys
            invalidateCache("sizes_all");
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể thêm size: " + e.getMessage(), e);
        }
    }

    // Find a Size by ID
    public Size findById(int id) {
        String cacheKey = "size_" + id;
        return getFromCacheOrCompute(cacheKey, Size.class, () ->
                handle.createQuery("SELECT * FROM size WHERE ID = :id")
                        .bind("id", id)
                        .mapToBean(Size.class)
                        .findOne()
                        .orElse(null)
        );
    }

    // Find all Sizes
    public List<Size> findAll() {
        String cacheKey = "sizes_all";
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM size")
                        .mapToBean(Size.class)
                        .list()
        );
    }

    // Update a Size
    public int update(Size size) {
        try {
            int rowsAffected = handle.createUpdate("UPDATE size SET Name = :name WHERE ID = :id")
                    .bind("name", size.getName())
                    .bind("id", size.getId())
                    .execute();
            // Invalidate related cache keys
            invalidateCache("size_" + size.getId());
            invalidateCache("sizes_all");
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể cập nhật size: " + e.getMessage(), e);
        }
    }

    // Delete a Size by ID
    public int deleteById(int id) {
        try {
            int rowsAffected = handle.createUpdate("DELETE FROM size WHERE ID = :id")
                    .bind("id", id)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("size_" + id);
            invalidateCache("sizes_all");
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể xóa size: " + e.getMessage(), e);
        }
    }
}