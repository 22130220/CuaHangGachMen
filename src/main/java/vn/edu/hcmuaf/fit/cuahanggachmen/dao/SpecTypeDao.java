package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.UnableToExecuteStatementException;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.SpecType;

import java.util.List;

public class SpecTypeDao extends BaseDao {

    public SpecTypeDao(Handle handle) {
        super(handle, true, 60 * 3, 1000);
    }

    public SpecTypeDao(Handle handle, boolean cacheEnabled, long cacheExpirationSeconds, long cacheMaximumSize) {
        super(handle, cacheEnabled, cacheExpirationSeconds, cacheMaximumSize);
    }

    // Tìm tất cả SpecType
    public List<SpecType> findAll() {
        String cacheKey = "spectypes_all";
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM spectype")
                        .mapToBean(SpecType.class)
                        .list()
        );
    }

    // Tìm SpecType chưa được liên kết với sản phẩm cụ thể
    public List<SpecType> findByProduct(int productId) {
        String cacheKey = "spectypes_product_" + productId;
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT st.* FROM spectype st LEFT JOIN product_spec ps ON st.ID = ps.SpecID AND ps.ProductID = :productId WHERE ps.SpecID IS NULL")
                        .bind("productId", productId)
                        .mapToBean(SpecType.class)
                        .list()
        );
    }

    // Thêm mới một SpecType
    public int insert(SpecType specType) {
        try {
            int rowsAffected = handle.createUpdate("INSERT INTO spectype (Name) VALUES (:name)")
                    .bind("name", specType.getName())
                    .execute();
            // Invalidate related cache keys
            invalidateCache("spectypes_all");
            // Clear all findByProduct caches as a new SpecType can affect all products
            clearCache(); // Simplified: clear all to handle findByProduct changes
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể thêm spectype: " + e.getMessage(), e);
        }
    }

    // Cập nhật một SpecType
    public int update(SpecType specType) {
        try {
            int rowsAffected = handle.createUpdate("UPDATE spectype SET Name = :name WHERE ID = :id")
                    .bind("name", specType.getName())
                    .bind("id", specType.getId())
                    .execute();
            // Invalidate related cache keys
            invalidateCache("spectypes_all");
            // Clear all findByProduct caches as an updated SpecType can affect all products
            clearCache(); // Simplified: clear all to handle findByProduct changes
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể cập nhật spectype: " + e.getMessage(), e);
        }
    }

    // Xóa một SpecType theo ID
    public int deleteById(int id) {
        try {
            int rowsAffected = handle.createUpdate("DELETE FROM spectype WHERE ID = :id")
                    .bind("id", id)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("spectypes_all");
            // Clear all findByProduct caches as a deleted SpecType can affect all products
            clearCache(); // Simplified: clear all to handle findByProduct changes
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể xóa spectype: " + e.getMessage(), e);
        }
    }
}