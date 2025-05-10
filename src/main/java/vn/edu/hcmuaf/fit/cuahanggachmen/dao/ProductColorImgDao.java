package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.result.RowView;
import org.jdbi.v3.core.statement.Query;
import org.jdbi.v3.core.statement.UnableToExecuteStatementException;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.ProductColorImg;

import java.util.List;

public class ProductColorImgDao extends BaseDao {

    public ProductColorImgDao(Handle handle) {
        super(handle, true, 3 * 60, 1000);
    }

    public ProductColorImgDao(Handle handle, boolean cacheEnabled, long cacheExpirationSeconds, long cacheMaximumSize) {
        super(handle, cacheEnabled, cacheExpirationSeconds, cacheMaximumSize);
    }

    // Thêm một bản ghi product_color_img mới
    public int insert(int colorId, int productId, String url) {
        try {
            handle.createUpdate("INSERT INTO product_color_img (ColorId, ProductId, Url) " +
                            "VALUES (:colorId, :productId, :url)")
                    .bind("colorId", colorId)
                    .bind("productId", productId)
                    .bind("url", url)
                    .execute();
            int id = handle.createQuery("SELECT LAST_INSERT_ID()").mapTo(Integer.class).one();
            invalidateCache("product_color_imgs_all");
            invalidateCache("product_color_imgs_product_" + productId);
            return id;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể thêm bản ghi product_color_img: " + e.getMessage(), e);
        }
    }

    // Tìm bản ghi theo ID
    public ProductColorImg findById(int id) {
        String cacheKey = "product_color_img_" + id;
        return getFromCacheOrCompute(cacheKey, ProductColorImg.class, () ->
                handle.createQuery("SELECT * FROM product_color_img WHERE id = :id")
                        .bind("id", id)
                        .mapToBean(ProductColorImg.class)
                        .findOne()
                        .orElse(null)
        );
    }

    // Lấy tất cả bản ghi
    public List<ProductColorImg> findAll() {
        String cacheKey = "product_color_imgs_all";
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM product_color_img")
                        .mapToBean(ProductColorImg.class)
                        .list()
        );
    }

    // Tìm bản ghi theo ProductId
    public List<ProductColorImg> findByProductId(int productId) {
        String cacheKey = "product_color_imgs_product_" + productId;
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT i.*, c.Name FROM product_color_img i " +
                                "JOIN colors c ON i.ColorId = c.ID WHERE i.ProductId = :productId")
                        .bind("productId", productId)
                        .map(this::mapRow)
                        .list()
        );
    }

    // Cập nhật bản ghi
    public int update(int id, String url) {
        try {
            // Lấy ProductId trước khi cập nhật để xóa cache
            ProductColorImg existing = findById(id);
            int rowsAffected = handle.createUpdate("UPDATE product_color_img SET Url = :url WHERE id = :id")
                    .bind("id", id)
                    .bind("url", url)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("product_color_img_" + id);
            invalidateCache("product_color_imgs_all");
            if (existing != null) {
                invalidateCache("product_color_imgs_product_" + existing.getProductId());
            }
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể cập nhật bản ghi product_color_img: " + e.getMessage(), e);
        }
    }

    // Xóa bản ghi theo ID
    public int deleteById(int id) {
        try {
            // Lấy ProductId trước khi xóa để xóa cache
            ProductColorImg existing = findById(id);
            int rowsAffected = handle.createUpdate("DELETE FROM product_color_img WHERE id = :id")
                    .bind("id", id)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("product_color_img_" + id);
            invalidateCache("product_color_imgs_all");
            if (existing != null) {
                invalidateCache("product_color_imgs_product_" + existing.getProductId());
            }
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể xóa bản ghi product_color_img: " + e.getMessage(), e);
        }
    }

    private ProductColorImg mapRow(RowView rowView) {
        ProductColorImg p = new ProductColorImg();
        p.setId(rowView.getColumn("id", Integer.class));
        p.setProductId(rowView.getColumn("ProductId", Integer.class));
        p.setColorId(rowView.getColumn("ColorId", Integer.class));
        p.setColorName(rowView.getColumn("Name", String.class));
        p.setUrl(rowView.getColumn("Url", String.class));
        return p;
    }
}