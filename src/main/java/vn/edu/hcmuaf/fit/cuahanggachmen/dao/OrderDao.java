package vn.edu.hcmuaf.fit.cuahanggachmen.dao;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.result.RowView;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Order;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
public class OrderDao extends BaseDao {
    public OrderDao(Handle handle) {
        super(handle);
    }

    // Insert a new Order
    public int insert(Order order)  {
            var update = handle.createUpdate(
                    "INSERT INTO orders (UserID, OrderDate, Address, TotalPrice, Des, FullName, Email, Phone, Payment) " +
                            "VALUES (:userId, :orderDate, :address, :totalPrice, :description, :fullName, :email, :phone, :payment)"
            );
            update.bind("userId", order.getUserId())
                    .bind("orderDate", order.getOrderDate())
                    .bind("address", order.getAddress())
                    .bind("totalPrice", order.getTotalPrice())
                    .bind("description", order.getDescription())
                    .bind("fullName", order.getFullName())
                    .bind("email", order.getEmail())
                    .bind("phone", order.getPhone())
                    .bind("payment", order.getPayment());
            update.execute();
            return handle.createQuery("SELECT LAST_INSERT_ID()")
                    .mapTo(Integer.class)
                    .one();
    }




    // Find Order by ID
    public Optional<Order> findById(int id)  {
        return handle.createQuery("SELECT * FROM orders WHERE ID = :id")
                        .bind("id", id)
                        .map(this::mapRow)
                        .findFirst();
    }

    // Find all Orders
    public List<Order> findAll()  {
        return handle.createQuery("SELECT * FROM orders")
                        .map(this::mapRow)
                        .list();
    }

    // Update an Order
    public int update(Order order)  {
        return handle.createUpdate(
                            "UPDATE orders SET UserID = :userId, OrderDate = :orderDate, Address = :address, " +
                                    "Status = :status, TotalPrice = :totalPrice, Des = :description, CreateDate = :createDate, " +
                                    "FullName = :fullName, Email = :email, Phone = :phone, Payment = :payment WHERE ID = :id"
                    )
                    .bind("id", order.getId())
                    .bind("userId", order.getUserId())
                    .bind("orderDate", order.getOrderDate())
                    .bind("address", order.getAddress())
                    .bind("status", order.getStatus())
                    .bind("totalPrice", order.getTotalPrice())
                    .bind("description", order.getDescription())
                    .bind("createDate", order.getCreateDate())
                    .bind("fullName", order.getFullName())
                    .bind("email", order.getEmail())
                    .bind("phone", order.getPhone())
                    .bind("payment", order.getPayment())
                    .execute();
    }

    // Update an Order
    public int updateStatus(int orderId, String active)  {
        if(active.equals("Delivered")){
            return handle.createUpdate(
                                    "UPDATE orders SET Status = :status WHERE ID = :id"
                            )
                            .bind("id", orderId)
                            .bind("status", active)
                            .execute();
        } else {
            return handle.createUpdate(
                                    "UPDATE orders SET Status = :status, TotalPrice = :price WHERE ID = :id"
                            )
                            .bind("id", orderId)
                            .bind("status", active)
                            .bind("price", 0.0)
                            .execute();
        }

    }

    // Delete an Order
    public int delete(int id) {
        return handle.createUpdate("DELETE FROM orders WHERE ID = :id")
                        .bind("id", id)
                        .execute();
    }

    public double sumDoanhThu()  {
        return handle.createQuery("SELECT SUM(TotalPrice) FROM orders").mapTo(Double.class).one();
    }

    public List<Order> backToOrder()  {
        return handle.createQuery("SELECT ID,Status, TotalPrice, UserID FROM orders LIMIT 10;").mapToBean(Order.class).list();
    }

    public int transcPerDay()  {
        return handle.createQuery("SELECT COUNT(*) FROM orders WHERE DATE(OrderDate) = :targetDate;").bind("targetDate", LocalDate.now()).mapTo(Integer.class).one();
    }

    // Map database row to Order object
    private Order mapRow(RowView rowView) {
        Order order = new Order();
        order.setId(rowView.getColumn("ID", Integer.class));
        order.setUserId(rowView.getColumn("UserID", Integer.class));
        order.setOrderDate(rowView.getColumn("OrderDate", LocalDateTime.class));
        order.setAddress(rowView.getColumn("Address", String.class));
        order.setStatus(rowView.getColumn("Status", String.class));
        order.setTotalPrice(rowView.getColumn("TotalPrice", BigDecimal.class));
        order.setDescription(rowView.getColumn("Des", String.class));
        order.setCreateDate(rowView.getColumn("CreateDate", LocalDateTime.class));
        order.setFullName(rowView.getColumn("FullName", String.class));
        order.setEmail(rowView.getColumn("Email", String.class));
        order.setPhone(rowView.getColumn("Phone", String.class));
        order.setPayment(rowView.getColumn("Payment", String.class));
        return order;
    }
}
