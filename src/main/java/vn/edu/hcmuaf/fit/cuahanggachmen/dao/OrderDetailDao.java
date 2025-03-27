package vn.edu.hcmuaf.fit.cuahanggachmen.dao;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.result.RowView;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.OrderDetail;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.OrderDetailWithName;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
public class OrderDetailDao extends BaseDao {
    public OrderDetailDao(Handle handle) {
        super(handle);
    }

    public boolean hasUserPurchasedProduct(int userId, int productId) {
        String query = "SELECT COUNT(*) FROM orderdetail od " +
                "JOIN orders o ON od.OrderID = o.ID " +
                "WHERE o.UserID = :userId AND od.ProductID = :productId AND o.Status = 'Delivered'";
        int count = handle.createQuery(query)
                .bind("userId", userId)
                .bind("productId", productId)
                .mapTo(Integer.class)
                .one();
        return count > 0;
    }
    // Insert a new OrderDetail
    public int insert(OrderDetail orderDetail)  {
            return handle.createUpdate(
                            "INSERT INTO orderdetail (OrderID, ProductID, Quantity, Price, Color) " +
                                    "VALUES (:orderId, :productId, :quantity, :price, :color)"
                    )
                    .bind("orderId", orderDetail.getOrderId())
                    .bind("productId", orderDetail.getProductId())
                    .bind("quantity", orderDetail.getQuantity())
                    .bind("price", orderDetail.getPrice())
                    .bind("color", orderDetail.getColor())
                    .execute();
    }

    // Find OrderDetail by OrderID and ProductID
    public Optional<OrderDetail> findByOrderAndProduct(int orderId, int productId)  {
            return handle.createQuery("SELECT * FROM orderdetail WHERE OrderID = :orderId AND ProductID = :productId")
                        .bind("orderId", orderId)
                        .bind("productId", productId)
                        .map(this::mapRow)
                        .findFirst();
    }

    // Find all OrderDetails by OrderID
    public List<OrderDetail> findByOrderId(int orderId)  {
            return handle.createQuery("SELECT * FROM orderdetail WHERE OrderID = :orderId")
                        .bind("orderId", orderId)
                        .map(this::mapRow)
                        .list();
    }

    // Find all OrderDetails by OrderID
    public List<OrderDetailWithName> findByOrderIdWithName(int orderId)  {
            return handle.createQuery("SELECT od.*, p.imgThumbnail as img, p.name as name FROM orderdetail od JOIN products p ON od.ProductID = p.id WHERE OrderID = :orderId")
                        .bind("orderId", orderId)
                        .mapToBean(OrderDetailWithName.class)
                        .list();
    }

    // Update an OrderDetail
    public int update(OrderDetail orderDetail)  {
            return handle.createUpdate(
                            "UPDATE orderdetail SET Quantity = :quantity, Price = :price, CreateDate = :createDate " +
                                    "WHERE OrderID = :orderId AND ProductID = :productId"
                    )
                    .bind("orderId", orderDetail.getOrderId())
                    .bind("productId", orderDetail.getProductId())
                    .bind("quantity", orderDetail.getQuantity())
                    .bind("price", orderDetail.getPrice())
                    .bind("createDate", orderDetail.getCreateDate())
                    .execute();
    }

    // Delete an OrderDetail by OrderID and ProductID
    public int delete(int orderId, int productId)  {
            return handle.createUpdate("DELETE FROM orderdetail WHERE OrderID = :orderId AND ProductID = :productId")
                        .bind("orderId", orderId)
                        .bind("productId", productId)
                        .execute();
    }

    public List<OrderDetail> findDeliveredOrderDetailsByUserId(int userId)  {
            return handle.createQuery(
                                "SELECT od.OrderID, od.ProductID, od.Quantity, od.Price, od.Color, od.CreateDate, p.imgThumbnail, p.name " +
                                        "FROM orderdetail od " +
                                        "JOIN products p ON p.id = od.ProductID " +
                                        "JOIN orders o ON od.OrderID = o.ID " +
                                        "WHERE o.UserID = :userId AND o.Status = 'Delivered'")
                        .bind("userId", userId)
                        .map(this::mapRow)
                        .list();
    }
    public List<OrderDetail> findAllOrderDetailsByUserId(int userId) {
        return handle.createQuery(
                        "SELECT od.OrderID, od.ProductID, od.Quantity, od.Price, od.Color, od.CreateDate, p.imgThumbnail, p.name " +
                                "FROM orderdetail od " +
                                "JOIN products p ON p.id = od.ProductID " +
                                "JOIN orders o ON od.OrderID = o.ID " +
                                "WHERE o.UserID = :userId")
                .bind("userId", userId)
                .map(this::mapRow)
                .list();
    }
    public List<OrderDetail> findOrderDetailsByUserIdAndStatus(int userId, String status) {
        return handle.createQuery(
                        "SELECT od.OrderID, od.ProductID, od.Quantity, od.Price, od.Color, od.CreateDate, p.imgThumbnail, p.name " +
                                "FROM orderdetail od " +
                                "JOIN products p ON p.id = od.ProductID " +
                                "JOIN orders o ON od.OrderID = o.ID " +
                                "WHERE o.UserID = :userId AND o.Status = :status")
                .bind("userId", userId)
                .bind("status", status)
                .map(this::mapRow)
                .list();
    }

    // Thêm phương thức để lấy trạng thái đơn hàng từ bảng orders
    public String getOrderStatus(int orderId) {
        return handle.createQuery("SELECT Status FROM orders WHERE ID = :orderId")
                .bind("orderId", orderId)
                .mapTo(String.class)
                .one();
    }

    // Thêm phương thức để lấy ngày tạo đơn hàng
    public LocalDateTime getOrderCreateDate(int orderId) {
        return handle.createQuery("SELECT CreateDate FROM orders WHERE ID = :orderId")
                .bind("orderId", orderId)
                .mapTo(LocalDateTime.class)
                .one();
    }

    // Thêm phương thức để lấy TotalPrice từ bảng orders
    public Integer getOrderTotalPrice(int orderId) {
        return handle.createQuery("SELECT TotalPrice FROM orders WHERE ID = :orderId")
                .bind("orderId", orderId)
                .mapTo(Integer.class)
                .one();
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
