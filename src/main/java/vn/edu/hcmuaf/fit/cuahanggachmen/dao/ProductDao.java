package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.UnableToExecuteStatementException;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Color;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Review;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper.ProductMapper;

import java.util.List;
import java.util.Map;

public class ProductDao extends BaseDao {
    public ProductDao(Handle handle) {
        super(handle, true, 3 * 60, 1000);
    }

    public ProductDao(Handle handle, boolean cacheEnabled, long cacheExpirationSeconds, long cacheMaximumSize) {
        super(handle, cacheEnabled, cacheExpirationSeconds, cacheMaximumSize);
    }

    // Lấy tất cả sản phẩm
    public List<Product> findAll() {
        String cacheKey = "products_all";
        return getFromCacheOrCompute(cacheKey, List.class, () -> {
            return handle.createQuery("SELECT * FROM products")
                    .mapToBean(Product.class)
                    .list();
                }

        );
    }
    public List<Product> search(String keyword) {
        String cacheKey = "products_search_" + keyword.toLowerCase();

        return getFromCacheOrCompute(cacheKey, List.class, () -> {
            return handle.createQuery("SELECT * FROM products WHERE name LIKE :keyword")
                    .bind("keyword", "%" + keyword + "%")
                    .mapToBean(Product.class)
                    .list();
        });
    }

    // Lấy danh sách URL hình ảnh theo color và product
    public List<String> findImagesByColor(int productId, int colorId) {
        String cacheKey = "product_images_color_" + productId + "_" + colorId;
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT Url FROM product_color_img WHERE ProductID = :productId AND ColorID = :colorId")
                        .bind("productId", productId)
                        .bind("colorId", colorId)
                        .mapTo(String.class)
                        .list()
        );
    }

    // Lấy sản phẩm liên quan
    public List<Product> findRelatedProducts(int manufacturerId, int currentProductId) {
        String cacheKey = "products_related_" + manufacturerId + "_" + currentProductId;
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM products WHERE ManufacturerID = :manufacturerId AND ID != :currentProductId")
                        .bind("manufacturerId", manufacturerId)
                        .bind("currentProductId", currentProductId)
                        .mapToBean(Product.class)
                        .list()
        );
    }

    // Tìm sản phẩm theo tên
    public List<Product> findNameProduct(String productName) {
        String cacheKey = "products_name_" + productName;
        return getFromCacheOrCompute(cacheKey, List.class, () -> {
            return handle.createQuery("SELECT * FROM products WHERE name LIKE :productName")
                    .bind("productName", "%" + productName + "%")
                    .mapToBean(Product.class)
                    .list();
        }
        );
    }
    public Product findById1(int id){
        return handle.createQuery("SELECT * FROM products WHERE ID = :id")
                .bind("id",id)
                .map((rs, ctx) -> new Product(
                        rs.getInt("id"),
                        rs.getString("name")
                ))
                .findOne()
                .orElse(null);
    }


    // Tìm sản phẩm theo ID
    public Product findById(int id) {
        String cacheKey = "product_" + id;
        return getFromCacheOrCompute(cacheKey, Product.class, () -> {
            Product product = handle.createQuery("SELECT * FROM products WHERE ID = :id AND status=1")
                    .bind("id", id)
                    .map(new ProductMapper())
                    .findOne()
                    .orElse(null);

            if (product == null) {
                return null;
            }

            List<Map<String, Object>> specs = handle.createQuery("SELECT st.Name, ps.Value " +
                            "FROM products p JOIN product_spec ps ON p.ID = ps.ProductID " +
                            "JOIN spectype st ON ps.SpecID = st.ID " +
                            "WHERE p.ID = :id")
                    .bind("id", id)
                    .mapToMap()
                    .list();

            for (Map<String, Object> map : specs) {
                String key = (String) map.get("Name");
                String value = (String) map.get("Value");
                product.addSpec(key, value);
            }

            List<String> lsImg = handle.createQuery("SELECT pci.Url FROM product_color_img pci JOIN products p ON p.ID = pci.ProductID " +
                            "WHERE p.ID = :id")
                    .bind("id", id)
                    .mapTo(String.class)
                    .list();
            product.setImgList(lsImg);

            ReviewDao rvDao = new ReviewDao(handle);
            List<Review> lsReview = rvDao.findReviewsByProductId(id);
            product.setLsReview(lsReview);

            ColorDao colorDao = new ColorDao(handle);
            List<Color> lsColor = colorDao.findColorByIds(id);
            product.setLsColor(lsColor);

            product.setCategory(new CategoryDao(handle).findById(product.getCategoryId()));

            return product;
        });
    }

    // Đếm số lượng sản phẩm
    public int countProduct() {
        String cacheKey = "products_count";
        return getFromCacheOrCompute(cacheKey, Integer.class, () ->
                handle.createQuery("SELECT COUNT(id) as tongSo FROM products")
                        .mapTo(Integer.class)
                        .one()
        );
    }

    // Thêm sản phẩm mới
    public int insert(Product product) {
        try {
            handle.createUpdate("INSERT INTO products (Name, PricePerBox, Stock, Description, Status, Rating, Discount, PromotionPrice, QuantityPerBox, CategoryID, SizeID, MaterialID, ManufacturerID, ImgThumbnail) " +
                            "VALUES (:name, :pricePerBox, :stock, :description, :status, :rating, :discount, :promotionPrice, :quantityPerBox, :categoryId, :sizeId, :materialId, :manufacturerId, :imgThumbnail)")
                    .bindBean(product)
                    .execute();
            int id = handle.createQuery("SELECT LAST_INSERT_ID()")
                    .mapTo(Integer.class)
                    .one();
            // Invalidate related cache keys
            invalidateCache("products_all");
            invalidateCache("products_count");
            return id;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể thêm sản phẩm: " + e.getMessage(), e);
        }
    }

    // Cập nhật sản phẩm
    public int update(Product product) {
        try {
            int rowsAffected = handle.createUpdate("UPDATE products SET Name = :name, PricePerBox = :pricePerBox, Stock = :stock, Discount = :discount, PromotionPrice = :promotionPrice, QuantityPerBox = :quantityPerBox, CategoryID = :categoryId, SizeID = :sizeId, MaterialID = :materialId, ManufacturerID = :manufacturerId, ImgThumbnail = :imgThumbnail WHERE ID = :id")
                    .bindBean(product)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("product_" + product.getId());
            invalidateCache("products_all");
            invalidateCache("products_count");
            // Invalidate related products cache (simplified: clear all related caches)
            clearCache(); // Clear all to handle manufacturerId changes
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể cập nhật sản phẩm: " + e.getMessage(), e);
        }
    }

    // Xóa sản phẩm theo ID
    public int deleteById(int id) {
        try {
            int rowsAffected = handle.createUpdate("DELETE FROM products WHERE ID = :id")
                    .bind("id", id)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("product_" + id);
            invalidateCache("products_all");
            invalidateCache("products_count");
            // Invalidate related products cache (simplified: clear all related caches)
            clearCache(); // Clear all to handle manufacturerId changes
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể xóa sản phẩm: " + e.getMessage(), e);
        }
    }

    // Cập nhật trạng thái active
    public int updateActive(int id, boolean active) {
        try {
            int rowsAffected = handle.createUpdate("UPDATE products SET status = :status WHERE Id = :id")
                    .bind("id", id)
                    .bind("status", active)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("product_" + id);
            invalidateCache("products_all");
            invalidateCache("products_count");
            return rowsAffected;
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể cập nhật trạng thái sản phẩm: " + e.getMessage(), e);
        }
    }

    // Tìm sản phẩm bán chạy
    public List<Product> findTopSellingProducts(int months, int limit) {
        String cacheKey = "products_top_selling_" + months + "_" + limit;
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT p.id, p.name, p.imgThumbnail, p.pricePerBox, p.rating, COUNT(od.productID) AS ProductCount " +
                                "FROM products p " +
                                "JOIN orderdetail od ON p.id = od.productID " +
                                "JOIN orders o ON od.orderID = o.id " +
                                "WHERE o.status = 'Delivered' " +
                                "AND TIMESTAMPDIFF(MONTH, o.orderDate, CURDATE()) <= :months " +
                                "GROUP BY p.id, p.name " +
                                "ORDER BY ProductCount DESC " +
                                "LIMIT :limit")
                        .bind("months", months)
                        .bind("limit", limit)
                        .mapToBean(Product.class)
                        .list()
        );
    }

    public List<Product> findTopSellingProducts(int months, int limit, int amount) {
        String cacheKey = "products_top_selling_" + months + "_" + limit + "_" + amount;
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT p.id, p.name, p.imgThumbnail, p.pricePerBox, p.rating, COUNT(od.productID) AS ProductCount " +
                                "FROM products p " +
                                "JOIN orderdetail od ON p.id = od.productID " +
                                "JOIN orders o ON od.orderID = o.id " +
                                "WHERE o.status = 'Delivered' " +
                                "AND TIMESTAMPDIFF(MONTH, o.orderDate, CURDATE()) <= :months " +
                                "GROUP BY p.id, p.name " +
                                "ORDER BY ProductCount DESC " +
                                "LIMIT :limit OFFSET :amount")
                        .bind("amount", amount)
                        .bind("months", months)
                        .bind("limit", limit)
                        .mapToBean(Product.class)
                        .list()
        );
    }

    // Tìm sản phẩm mới nhất
    public List<Product> findLatestProducts() {
        String cacheKey = "products_latest";
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM products " +
                                "WHERE YEAR(CreateDate) = YEAR(CURDATE()) " +
                                "AND MONTH(CreateDate) = MONTH(CURDATE()) " +
                                "ORDER BY CreateDate DESC " +
                                "LIMIT 3")
                        .mapToBean(Product.class)
                        .list()
        );
    }

    public List<Product> findLatestProducts(int amount) {
        String cacheKey = "products_latest_" + amount;
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM products " +
                                "WHERE YEAR(CreateDate) = YEAR(CURDATE()) " +
                                "AND MONTH(CreateDate) = MONTH(CURDATE()) " +
                                "ORDER BY CreateDate DESC " +
                                "LIMIT 3 OFFSET :amount")
                        .bind("amount", amount)
                        .mapToBean(Product.class)
                        .list()
        );
    }

    // Cập nhật lượt xem sản phẩm
    public void updateProductView(int productId) {
        try {
            handle.createUpdate("INSERT INTO product_view (ProductID) VALUES (:productId)")
                    .bind("productId", productId)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("products_most_viewed");
            invalidateCache("products_most_viewed_0"); // Default amount for findMostViewedProducts()
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể cập nhật lượt xem sản phẩm: " + e.getMessage(), e);
        }
    }

    // Tìm sản phẩm xem nhiều
    public List<Product> findMostViewedProducts() {
        String cacheKey = "products_most_viewed";
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT p.id, p.imgThumbnail, p.name, p.pricePerBox, p.rating " +
                                "FROM products p " +
                                "JOIN product_view pv ON p.id = pv.ProductID " +
                                "GROUP BY p.id " +
                                "ORDER BY COUNT(pv.id) DESC " +
                                "LIMIT 3")
                        .mapToBean(Product.class)
                        .list()
        );
    }

    public List<Product> findMostViewedProducts(int amount) {
        String cacheKey = "products_most_viewed_" + amount;
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT p.id, p.imgThumbnail, p.name, p.pricePerBox, p.rating " +
                                "FROM products p " +
                                "JOIN product_view pv ON p.id = pv.ProductID " +
                                "GROUP BY p.id " +
                                "ORDER BY COUNT(pv.id) DESC " +
                                "LIMIT 3 OFFSET :amount")
                        .bind("amount", amount)
                        .mapToBean(Product.class)
                        .list()
        );
    }

    // Cập nhật đánh giá sản phẩm
    public void updateProductRating(int productId, int newRating) {
        try {
            handle.createUpdate("UPDATE products SET Rating = :newRating WHERE ID = :productId")
                    .bind("newRating", newRating)
                    .bind("productId", productId)
                    .execute();
            // Invalidate related cache keys
            invalidateCache("product_" + productId);
            invalidateCache("products_all");
            // Invalidate top selling and most viewed caches as rating affects them
            clearCache(); // Simplified: clear all to handle rating changes
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Không thể cập nhật đánh giá sản phẩm: " + e.getMessage(), e);
        }
    }
}