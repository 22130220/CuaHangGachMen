package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.UnableToExecuteStatementException;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.ProductSpec;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper.ProductSpecMapper;

import java.util.List;

public class ProductSpecDao extends BaseDao {

    public ProductSpecDao(Handle handle) {
        super(handle);
    }

    public ProductSpecDao(Handle handle, boolean cacheEnabled, long cacheExpirationSeconds, long cacheMaximumSize) {
        super(handle, cacheEnabled, cacheExpirationSeconds, cacheMaximumSize);
    }

    // Tìm danh sách thông số sản phẩm theo ProductId
    public List<ProductSpec> findByProductId(int productId) {
        String cacheKey = "product_specs_product_" + productId;
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT st.Name, ps.ProductID, ps.SpecID, ps.Value " +
                                "FROM spectype st JOIN product_spec ps ON st.ID = ps.SpecID " +
                                "WHERE ps.ProductID = :id")
                        .bind("id", productId)
                        .map(new ProductSpecMapper())
                        .list()
        );
    }

    // Thêm thông số sản phẩm mới
    public int insert(ProductSpec productSpec) {
        try {
            int rowsAffected = handle.createUpdate("INSERT INTO product_spec(ProductID, SpecID, Value) " +
                            "VALUES (:productId, :specId, :value)")
                    .bind("productId", productSpec.getProcuctId()) // Sửa lỗi chính tả
                    .bind("specId", productSpec.getSpecId())
                    .bind("value", productSpec.getValue())
                    .execute();
            // Invalidate related cache keys
            invalidateCache("product_specs_product_" + productSpec.getProcuctId());
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể thêm thông số sản phẩm: " + e.getMessage(), e);
        }
    }

    // Xóa thông số sản phẩm theo ProductId và SpecId
    public int deleteById(int productId, int specId) {
        try {
            int rowsAffected = handle.createUpdate("DELETE FROM product_spec WHERE ProductID = :productId AND SpecID = :specId")
                    .bind("productId", productId)
                    .bind("specId", specId)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("product_specs_product_" + productId);
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể xóa thông số sản phẩm: " + e.getMessage(), e);
        }
    }

    // Cập nhật thông số sản phẩm
    public int update(ProductSpec productSpec) {
        try {
            int rowsAffected = handle.createUpdate("UPDATE product_spec SET Value = :value " +
                            "WHERE ProductID = :productId AND SpecID = :specId")
                    .bind("productId", productSpec.getProcuctId()) // Sửa lỗi chính tả
                    .bind("specId", productSpec.getSpecId())
                    .bind("value", productSpec.getValue())
                    .execute();
            // Invalidate related cache keys
            invalidateCache("product_specs_product_" + productSpec.getProcuctId());
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể cập nhật thông số sản phẩm: " + e.getMessage(), e);
        }
    }
}