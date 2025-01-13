package vn.edu.hcmuaf.fit.cuahanggachmen.dao;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.result.RowView;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.OrderDetail;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.OrderDetailWithName;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
public class OrderDetailDao {


    // Insert a new OrderDetail
    public int insert(OrderDetail orderDetail) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
            handle.createUpdate(
                            "INSERT INTO orderdetail (OrderID, ProductID, Quantity, Price, Color) " +
                                    "VALUES (:orderId, :productId, :quantity, :price, :color)"
                    )
                    .bind("orderId", orderDetail.getOrderId())
                    .bind("productId", orderDetail.getProductId())
                    .bind("quantity", orderDetail.getQuantity())
                    .bind("price", orderDetail.getPrice())
                    .bind("color", orderDetail.getColor())
                    .execute()
        );
    }

    // Find OrderDetail by OrderID and ProductID
    public Optional<OrderDetail> findByOrderAndProduct(int orderId, int productId) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM orderdetail WHERE OrderID = :orderId AND ProductID = :productId")
                        .bind("orderId", orderId)
                        .bind("productId", productId)
                        .map(this::mapRow)
                        .findFirst()
        );
    }

    // Find all OrderDetails by OrderID
    public List<OrderDetail> findByOrderId(int orderId) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM orderdetail WHERE OrderID = :orderId")
                        .bind("orderId", orderId)
                        .map(this::mapRow)
                        .list()
        );
    }

    // Find all OrderDetails by OrderID
    public List<OrderDetailWithName> findByOrderIdWithName(int orderId) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT od.*, p.imgThumbnail as img, p.name as name FROM orderdetail od JOIN products p ON od.ProductID = p.id WHERE OrderID = :orderId")
                        .bind("orderId", orderId)
                        .mapToBean(OrderDetailWithName.class)
                        .list()
        );
    }

    // Update an OrderDetail
    public void update(OrderDetail orderDetail) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        jdbi.useHandle(handle -> {
            handle.createUpdate(
                            "UPDATE orderdetail SET Quantity = :quantity, Price = :price, CreateDate = :createDate " +
                                    "WHERE OrderID = :orderId AND ProductID = :productId"
                    )
                    .bind("orderId", orderDetail.getOrderId())
                    .bind("productId", orderDetail.getProductId())
                    .bind("quantity", orderDetail.getQuantity())
                    .bind("price", orderDetail.getPrice())
                    .bind("createDate", orderDetail.getCreateDate())
                    .execute();
        });
    }

    // Delete an OrderDetail by OrderID and ProductID
    public void delete(int orderId, int productId) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        jdbi.useHandle(handle ->
                handle.createUpdate("DELETE FROM orderdetail WHERE OrderID = :orderId AND ProductID = :productId")
                        .bind("orderId", orderId)
                        .bind("productId", productId)
                        .execute()
        );
    }

    public List<OrderDetail> findDeliveredOrderDetailsByUserId(int userId) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery(
                                "SELECT od.OrderID, od.ProductID, od.Quantity, od.Price, od.Color, od.CreateDate, p.imgThumbnail, p.name " +

                                        "FROM orderdetail od " +
                                        "JOIN products p ON p.id = od.ProductID " +
                                        "JOIN orders o ON od.OrderID = o.ID " +
                                        "WHERE o.UserID = :userId AND o.Status = 'Delivered'")
                        .bind("userId", userId)
                        .map(this::mapRow)
                        .list()
        );
    }

    // Map database row to OrderDetail object
    private OrderDetail mapRow(RowView rowView) {
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setOrderId(rowView.getColumn("OrderID", Integer.class));
        orderDetail.setProductId(rowView.getColumn("ProductID", Integer.class));
        orderDetail.setQuantity(rowView.getColumn("Quantity", Integer.class));
        orderDetail.setPrice(rowView.getColumn("Price", Integer.class));
        orderDetail.setCreateDate(rowView.getColumn("CreateDate", LocalDateTime.class));
        orderDetail.setColor(rowView.getColumn("Color", String.class));
        orderDetail.setProductName(rowView.getColumn("name", String.class));
        orderDetail.setProductImg(rowView.getColumn("imgThumbnail", String.class));
        return orderDetail;
    }
}
