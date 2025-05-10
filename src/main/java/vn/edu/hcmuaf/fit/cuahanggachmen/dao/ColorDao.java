package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.result.RowView;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Color;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper.ColorMapper;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper.ColorNUrlMapper;

import java.util.List;

public class ColorDao extends BaseDao {
    public ColorDao(Handle handle) {
        super(handle);
    }

    public ColorDao(Handle handle, boolean cacheEnabled, long cacheExpirationSeconds, long cacheMaximumSize) {
        super(handle, cacheEnabled, cacheExpirationSeconds, cacheMaximumSize);
    }

    // Thêm một color mới
    public int insertColor(Color color) {
        int result = handle.createUpdate("INSERT INTO colors (Name) VALUES (:Name)")
                .bind("Name", color.getName())
                .execute();
        // Invalidate related cache keys
        invalidateCache("colors_all");
        return result;
    }

    // Tìm color theo ID (truy vấn đơn giản)
    public Color findById(int id) {
        String cacheKey = "color_" + id;
        return getFromCacheOrCompute(cacheKey, Color.class, () ->
                handle.createQuery("SELECT * FROM colors WHERE ID = :id")
                        .bind("id", id)
                        .mapToBean(Color.class)
                        .findOne()
                        .orElse(null)
        );
    }

    // Lấy tất cả các color
    public List<Color> getAllColors() {
        String cacheKey = "colors_all";
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM colors")
                        .map(new ColorNUrlMapper())
                        .list()
        );
    }

    // Tìm các color chưa được sử dụng bởi product
    public List<Color> findByProductNotUsed(int productId) {
        String cacheKey = "colors_not_used_product_" + productId;
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT c.* FROM colors c LEFT JOIN product_color_img ps ON c.ID = ps.ColorId AND ps.ProductId = :productId WHERE ps.ColorId IS NULL")
                        .bind("productId", productId)
                        .map(this::mapRow)
                        .list()
        );
    }

    // Tìm color theo ID sản phẩm (sửa truy vấn)
    public Color findColorById(int id) {
        String cacheKey = "color_" + id;
        return getFromCacheOrCompute(cacheKey, Color.class, () ->
                handle.createQuery("SELECT MIN(p.imgThumbnail) AS imgThumbnail, c.Name " +
                                "FROM colors c " +
                                "JOIN product_color_img pci ON c.ID = pci.ColorID " +
                                "JOIN products p ON p.id = pci.ProductID " +
                                "WHERE c.ID = :id " +  // Sửa từ p.id thành c.ID
                                "GROUP BY c.Name")
                        .bind("id", id)
                        .map(new ColorMapper())
                        .findOne()
                        .orElse(null)
        );
    }

    // Tìm danh sách color theo ID sản phẩm
    public List<Color> findColorByIds(int id) {
        String cacheKey = "colors_by_product_" + id;
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT c.ID, MIN(pci.Url) AS Url, c.Name " +
                                "FROM colors c " +
                                "JOIN product_color_img pci ON c.ID = pci.ColorID " +
                                "JOIN products p ON p.id = pci.ProductID " +
                                "WHERE p.id = :id " +
                                "GROUP BY c.ID, c.Name")
                        .bind("id", id)
                        .map(new ColorMapper())
                        .list()
        );
    }

    // Cập nhật color theo ID
    public int updateColor(Color color) {
        int result = handle.createUpdate("UPDATE colors SET Name = :Name WHERE ID = :ID")
                .bind("ID", color.getID())
                .bind("Name", color.getName())
                .execute();
        // Invalidate related cache keys
        invalidateCache("color_" + color.getID());
        invalidateCache("colors_all");
        return result;
    }

    // Xóa color theo ID
    public int deleteColor(int id) {
        int result = handle.createUpdate("DELETE FROM colors WHERE ID = :ID")
                .bind("ID", id)
                .execute();
        // Invalidate related cache keys
        invalidateCache("color_" + id);
        invalidateCache("colors_all");
        return result;
    }


    public List<Color> findAll() {
        String cacheKey = "colors_all";
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM colors")
                        .map(this::mapRow)
                        .list()
        );
    }

    private Color mapRow(RowView rowView) {
        Color p = new Color();
        p.setID(rowView.getColumn("ID", Integer.class));
        p.setName(rowView.getColumn("Name", String.class));
        return p;
    }
}