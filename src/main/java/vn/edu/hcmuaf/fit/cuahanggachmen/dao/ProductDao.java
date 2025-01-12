package vn.edu.hcmuaf.fit.cuahanggachmen.dao;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.mapper.reflect.ConstructorMapper;
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

public class ProductDao {
    // Lấy tất cả sản phẩm
    public List<Product> findAll() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM products")
                        .mapToBean(Product.class)
                        .list()
        );
    }
    public List<String> findImagesByColor(int productId, int colorId) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT Url FROM product_color_img WHERE ProductID = :productId AND ColorID = :colorId")
                        .bind("productId", productId)
                        .bind("colorId", colorId)
                        .mapTo(String.class)
                        .list()
        );
    }

    public List<Product> findRelatedProducts(int manufacturerId, int currentProductId) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM products WHERE ManufacturerID = :manufacturerId AND ID != :currentProductId")
                        .bind("manufacturerId", manufacturerId)
                        .bind("currentProductId", currentProductId)
                        .mapToBean(Product.class)
                        .list()
        );
    }


    // Tìm sản phẩm theo ID
    public Product findById(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();

        Handle handle = jdbi.open();
        Product product = handle.createQuery("SELECT * FROM products WHERE ID = :id")
                        .bind("id", id)
                        .map(new ProductMapper())
                        .first();

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

        product.setImgList(lsImg);

        ReviewDao rvDao = new ReviewDao();

        List<Review> lsReview = rvDao.findReviewsByProductId(id);

        product.setLsReview(lsReview);

        ColorDao colorDao = new ColorDao();

        List<Color> lsColor = colorDao.findColorByIds(id);

        product.setLsColor(lsColor);

        product.setCategory(new CategoryDao().findById(product.getCategoryId()));

        handle.close();
        return product;
    }

    // Thêm sản phẩm mới
    public int insert(Product product) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle -> {
                    handle.createUpdate("INSERT INTO products (Name, PricePerBox, Stock, Description, Status, Rating, Discount, PromotionPrice, QuantityPerBox, CategoryID, SizeID, MaterialID, ManufacturerID, ImgThumbnail) " +
                                    "VALUES (:name, :pricePerBox, :stock, :description, :status, :rating, :discount, :promotionPrice, :quantityPerBox, :categoryId, :sizeId, :materialId, :manufacturerId, :imgThumbnail)")
                            .bindBean(product)
                            .execute();
                    return handle.createQuery("SELECT LAST_INSERT_ID()")
                    .mapTo(Integer.class)
                    .one();
                }
        );
    }

    // Cập nhật sản phẩm
    public int update(Product product) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE products SET Name = :name, PricePerBox = :pricePerBox, Stock = :stock, Discount = :discount, PromotionPrice = :promotionPrice, QuantityPerBox = :quantityPerBox, CategoryID = :categoryId, SizeID = :sizeId, MaterialID = :materialId, ManufacturerID = :manufacturerId, ImgThumbnail = :imgThumbnail WHERE ID = :id")
                        .bindBean(product)
                        .execute()
        );
    }

    // Xóa sản phẩm theo ID
    public int deleteById(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM products WHERE ID = :id")
                        .bind("id", id)
                        .execute()
        );
    }

    public int updateActive(int id, boolean active) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate(
                                "UPDATE products SET status = :status WHERE Id = :id"
                        )
                        .bind("id", id)
                        .bind("status", active)
                        .execute()
        );
    }

// TOP BÁN CHẠY
    public List<Product> findTopSellingProducts(int months, int limit) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        String query = "SELECT p.id, p.name, p.imgThumbnail, p.pricePerBox, p.rating, COUNT(od.productID) AS ProductCount " +
                "FROM products p " +
                "JOIN orderdetail od ON p.id = od.productID " +
                "JOIN orders o ON od.orderID = o.id " +
                "WHERE o.status = 'Delivered' " +
                "AND TIMESTAMPDIFF(MONTH, o.orderDate, CURDATE()) <= :months " +
                "GROUP BY p.id, p.name " +
                "ORDER BY ProductCount DESC " +
                "LIMIT :limit";
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("months", months)
                        .bind("limit", limit)
                        .mapToBean(Product.class)
                        .list());
    }
// CÁC MẪU MỚI NHẤT
    public List<Product> findLatestProducts() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery(
                                "SELECT * FROM products " +
                                        "WHERE YEAR(CreateDate) = YEAR(CURDATE()) " +
                                        "AND MONTH(CreateDate) = MONTH(CURDATE()) " +
                                        "ORDER BY CreateDate DESC " +
                                        "LIMIT 3")
                        .mapToBean(Product.class)
                        .list()
        );
    }

    // CẬP NHẬT VIEW
    public void updateProductView(int productId) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        jdbi.useHandle(handle ->
                handle.createUpdate("INSERT INTO product_view (ProductID) VALUES (:productId)")
                        .bind("productId", productId)
                        .execute()
        );
    }
// CÁC SẢN PHẨM XEM NHIỀU
    public List<Product> findMostViewedProducts() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery(
                                "SELECT p.imgThumbnail, p.name, p.pricePerBox, p.rating " +
                                        "FROM products p " +
                                        "JOIN product_view pv ON p.id = pv.ProductID " +
                                        "GROUP BY p.id " +
                                        "ORDER BY COUNT(pv.id) DESC " +
                                        "LIMIT 3")
                        .mapToBean(Product.class)
                        .list()
        );
    }


    public void updateProductRating(int productId, double newRating) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        jdbi.useHandle(handle ->
                handle.createUpdate("UPDATE products SET Rating = :newRating WHERE ID = :productId")
                        .bind("newRating", newRating)
                        .bind("productId", productId)
                        .execute()
        );
    }

}

