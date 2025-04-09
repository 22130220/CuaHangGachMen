package vn.edu.hcmuaf.fit.cuahanggachmen.dao;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.mapper.reflect.ConstructorMapper;
import vn.edu.hcmuaf.fit.cuahanggachmen.AppContextListenter;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Color;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Review;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper.ProductMapper;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public class ProductDao extends BaseDao {
    public ProductDao(Handle handle) {
        super(handle);
    }

    // Lấy tất cả sản phẩm
    public List<Product> findAll() {
            return handle.createQuery("SELECT * FROM products")
                        .mapToBean(Product.class)
                        .list();
    }
    public List<String> findImagesByColor(int productId, int colorId) {
            return handle.createQuery("SELECT Url FROM product_color_img WHERE ProductID = :productId AND ColorID = :colorId")
                        .bind("productId", productId)
                        .bind("colorId", colorId)
                        .mapTo(String.class)
                        .list();
    }

    public List<Product> findRelatedProducts(int manufacturerId, int currentProductId) {
            return handle.createQuery("SELECT * FROM products WHERE ManufacturerID = :manufacturerId AND ID != :currentProductId")
                        .bind("manufacturerId", manufacturerId)
                        .bind("currentProductId", currentProductId)
                        .mapToBean(Product.class)
                        .list();
    }
    public List<Product> findNameProduct(String productName) {
        String sql = "SELECT * FROM products WHERE name LIKE :productName";
        return handle.createQuery(sql)
                .bind("productName", "%" + productName + "%")  // dùng biến productName
                .mapToBean(Product.class)
                .list();
    }



    // Tìm sản phẩm theo ID
    public Product findById(int id) {
        Product product = handle.createQuery("SELECT * FROM products WHERE ID = :id AND status=1")
                        .bind("id", id)
                        .map(new ProductMapper())
                        .findFirst().orElse(null);

        List<Map<String, Object>> specs = handle.createQuery("SELECT st.Name, ps.Value\n FROM products p JOIN product_spec ps ON p.ID = ps.ProductID\n" +
                "JOIN spectype st ON ps.SpecID = st.ID\n" +
                "WHERE p.ID = :id;").bind("id", id).mapToMap().list();


        for(Map<String, Object> map : specs) {
            String key = (String) map.get("name");
            String value = (String) map.get("value");
            product.addSpec(key, value);

        }

        List<String> lsImg = handle.createQuery("Select pci.Url from product_color_img pci join products p on p.ID = pci.ProductID\n" +
                "WHERE p.ID = :id;").bind("id", id ).mapTo(String.class).list();


        assert product != null;
        product.setImgList(lsImg);

        ReviewDao rvDao = new ReviewDao(handle);

        List<Review> lsReview = rvDao.findReviewsByProductId(id);

        product.setLsReview(lsReview);

        ColorDao colorDao = new ColorDao(handle);

        List<Color> lsColor = colorDao.findColorByIds(id);

        product.setLsColor(lsColor);

        product.setCategory(new CategoryDao(handle).findById(product.getCategoryId()));

        return product;
    }

    public int countProduct() {
        return handle.createQuery("SELECT COUNT(id) as tongSo FROM products").mapTo(Integer.class).first();
    }

    // Thêm sản phẩm mới
    public int insert(Product product) {
            handle.createUpdate("INSERT INTO products (Name, PricePerBox, Stock, Description, Status, Rating, Discount, PromotionPrice, QuantityPerBox, CategoryID, SizeID, MaterialID, ManufacturerID, ImgThumbnail) " +
                                    "VALUES (:name, :pricePerBox, :stock, :description, :status, :rating, :discount, :promotionPrice, :quantityPerBox, :categoryId, :sizeId, :materialId, :manufacturerId, :imgThumbnail)")
                            .bindBean(product)
                            .execute();
                    return handle.createQuery("SELECT LAST_INSERT_ID()")
                    .mapTo(Integer.class)
                    .one();
                }


    // Cập nhật sản phẩm
    public int update(Product product) {
        return handle.createUpdate("UPDATE products SET Name = :name, PricePerBox = :pricePerBox, Stock = :stock, Discount = :discount, PromotionPrice = :promotionPrice, QuantityPerBox = :quantityPerBox, CategoryID = :categoryId, SizeID = :sizeId, MaterialID =:materialId, ManufacturerID = :manufacturerId, ImgThumbnail = :imgThumbnail WHERE ID = :id")
                        .bindBean(product)
                        .execute();
    }

    // Xóa sản phẩm theo ID
    public int deleteById(int id) {
        return handle.createUpdate("DELETE FROM products WHERE ID = :id")
                        .bind("id", id)
                        .execute();
    }

    public int updateActive(int id, boolean active) {
        return handle.createUpdate(
                                "UPDATE products SET status = :status WHERE Id = :id"
                        )
                        .bind("id", id)
                        .bind("status", active)
                        .execute();
    }

// TOP BÁN CHẠY
    public List<Product> findTopSellingProducts(int months, int limit) {
        String query = "SELECT p.id, p.name, p.imgThumbnail, p.pricePerBox, p.rating, COUNT(od.productID) AS ProductCount " +
                "FROM products p " +
                "JOIN orderdetail od ON p.id = od.productID " +
                "JOIN orders o ON od.orderID = o.id " +
                "WHERE o.status = 'Delivered' " +
                "AND TIMESTAMPDIFF(MONTH, o.orderDate, CURDATE()) <= :months " +
                "GROUP BY p.id, p.name " +
                "ORDER BY ProductCount DESC " +
                "LIMIT :limit";
        return handle.createQuery(query)
                        .bind("months", months)
                        .bind("limit", limit)
                        .mapToBean(Product.class)
                        .list();
    }

    public List<Product> findTopSellingProducts(int months, int limit, int amount) {
        String query = "SELECT p.id, p.name, p.imgThumbnail, p.pricePerBox, p.rating, COUNT(od.productID) AS ProductCount " +
                "FROM products p " +
                "JOIN orderdetail od ON p.id = od.productID " +
                "JOIN orders o ON od.orderID = o.id " +
                "WHERE o.status = 'Delivered' " +
                "AND TIMESTAMPDIFF(MONTH, o.orderDate, CURDATE()) <= :months " +
                "GROUP BY p.id, p.name " +
                "ORDER BY ProductCount DESC " +
                "LIMIT :limit OFFSET :amount";
        return handle.createQuery(query)
                .bind("amount", amount)
                .bind("months", months)
                .bind("limit", limit)
                .mapToBean(Product.class)
                .list();
    }


// CÁC MẪU MỚI NHẤT
    public List<Product> findLatestProducts() {
            return handle.createQuery(
                                "SELECT * FROM products " +
                                        "WHERE YEAR(CreateDate) = YEAR(CURDATE()) " +
                                        "AND MONTH(CreateDate) = MONTH(CURDATE()) " +
                                        "ORDER BY CreateDate DESC " +
                                        "LIMIT 3")
                        .mapToBean(Product.class)
                        .list();
    }

    public List<Product> findLatestProducts(int amount) {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery(
                                "SELECT * FROM products " +
                                        "WHERE YEAR(CreateDate) = YEAR(CURDATE()) " +
                                        "AND MONTH(CreateDate) = MONTH(CURDATE()) " +
                                        "ORDER BY CreateDate DESC " +
                                        "LIMIT 3 OFFSET :amount")
                        .bind("amount", amount)
                        .mapToBean(Product.class)
                        .list()
        );
    }

    // CẬP NHẬT VIEW
    public void updateProductView(int productId) {
            handle.createUpdate("INSERT INTO product_view (ProductID) VALUES (:productId)")
                        .bind("productId", productId)
                        .execute();
    }
// CÁC SẢN PHẨM XEM NHIỀU
    public List<Product> findMostViewedProducts() {
            return handle.createQuery(
                                "SELECT p.id,p.imgThumbnail, p.name, p.pricePerBox, p.rating " +
                                        "FROM products p " +
                                        "JOIN product_view pv ON p.id = pv.ProductID " +
                                        "GROUP BY p.id " +
                                        "ORDER BY COUNT(pv.id) DESC " +
                                        "LIMIT 3")
                        .mapToBean(Product.class)
                        .list();
    }

    public List<Product> findMostViewedProducts(int amount) {
        return handle.createQuery(
                        "SELECT p.id,p.imgThumbnail, p.name, p.pricePerBox, p.rating " +
                                "FROM products p " +
                                "JOIN product_view pv ON p.id = pv.ProductID " +
                                "GROUP BY p.id " +
                                "ORDER BY COUNT(pv.id) DESC " +
                                "LIMIT 3 OFFSET :amount")
                .bind("amount", amount)
                .mapToBean(Product.class)
                .list();
    }


    public void updateProductRating(int productId, int newRating) {
            handle.createUpdate("UPDATE products SET Rating = :newRating WHERE ID = :productId")
                        .bind("newRating", newRating)
                        .bind("productId", productId)
                        .execute();
    }

}

