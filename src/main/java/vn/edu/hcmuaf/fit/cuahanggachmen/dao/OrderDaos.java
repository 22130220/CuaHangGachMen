package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;
import org.jdbi.v3.core.statement.Update;
import org.jdbi.v3.core.result.ResultIterable;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Orders;

import java.sql.SQLException;
import java.util.List;

public class OrderDaos {
    // Insert Order
    public int insertOrder(Orders orders) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle -> {
            Update update = handle.createUpdate("""
                INSERT INTO orders (UserID, OrderDate, Address, Status, TotalPrice, Des, CreateDate)
                VALUES (:userId, :orderDate, :address, :status, :totalPrice, :description, CURRENT_TIMESTAMP)
            """).bind("userId", orders.getUserId())
                    .bind("orderDate", orders.getOrderDate())
                    .bind("address", orders.getAddress())
                    .bind("status", orders.getStatus())
                    .bind("totalPrice", orders.getTotalPrice())
                    .bind("description", orders.getDescription());

            update.execute(); // Execute insert
            return handle.createQuery("SELECT LAST_INSERT_ID()").mapTo(int.class).one(); // Return generated ID
        });
    }

    // Get Order By ID
    public Orders getOrderById(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle -> {
            Query query = handle.createQuery("""
                SELECT * FROM orders WHERE ID = :id
            """).bind("id", id);

            return query.map((rs, ctx) -> {
                Orders orders = new Orders();
                orders.setId(rs.getInt("ID"));
                orders.setUserId(rs.getInt("UserID"));
                orders.setOrderDate(rs.getTimestamp("OrderDate").toLocalDateTime());
                orders.setAddress(rs.getString("Address"));
                orders.setStatus(rs.getString("Status"));
                orders.setTotalPrice(rs.getBigDecimal("TotalPrice"));
                orders.setDescription(rs.getString("Des"));
                orders.setCreateDate(rs.getTimestamp("CreateDate").toLocalDateTime());
                return orders;
            }).one();
        });
    }

    // Get All Orders
    public List<Orders> getAllOrders() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle -> {
            Query query = handle.createQuery("SELECT * FROM orders");

            ResultIterable<Orders> result = query.map((rs, ctx) -> {
                Orders orders = new Orders();
                orders.setId(rs.getInt("ID"));
                orders.setUserId(rs.getInt("UserID"));
                orders.setOrderDate(rs.getTimestamp("OrderDate").toLocalDateTime());
                orders.setAddress(rs.getString("Address"));
                orders.setStatus(rs.getString("Status"));
                orders.setTotalPrice(rs.getBigDecimal("TotalPrice"));
                orders.setDescription(rs.getString("Des"));
                orders.setCreateDate(rs.getTimestamp("CreateDate").toLocalDateTime());
                return orders;
            });

            return result.list();
        });
    }

    // Update Order
    public void updateOrder(Orders orders) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        jdbi.useHandle(handle -> {
            Update update = handle.createUpdate("""
                UPDATE orders
                SET UserID = :userId,
                    OrderDate = :orderDate,
                    Address = :address,
                    Status = :status,
                    TotalPrice = :totalPrice,
                    Des = :description
                WHERE ID = :id
            """).bind("id", orders.getId())
                    .bind("userId", orders.getUserId())
                    .bind("orderDate", orders.getOrderDate())
                    .bind("address", orders.getAddress())
                    .bind("status", orders.getStatus())
                    .bind("totalPrice", orders.getTotalPrice())
                    .bind("description", orders.getDescription());

            update.execute();
        });
    }

    public List<Orders> getOrdersWithFullNames() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("""
            SELECT o.*, u.fullname AS fullName
            FROM orders o
            JOIN users u ON o.UserID = u.id
        """).mapToBean(Orders.class)
                        .list()
        );
    }

    // Delete Order
    public void deleteOrder(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        jdbi.useHandle(handle -> {
            Update update = handle.createUpdate("""
                DELETE FROM orders WHERE ID = :id
            """).bind("id", id);

            update.execute();
        });
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DBConect.mySqlDataSource();
        new OrderDaos().getAllOrders().forEach(System.out::println);
    }
}

