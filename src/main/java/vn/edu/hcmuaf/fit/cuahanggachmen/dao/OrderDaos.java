package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.Query;
import org.jdbi.v3.core.statement.Update;
import org.jdbi.v3.core.result.ResultIterable;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Orders;

import java.util.List;

public class OrderDaos extends BaseDao{
    public OrderDaos(Handle handle) {
        super(handle);
    }

    //    // Insert Order
    public int insertOrder(Orders orders)  {
        Update update = handle.createUpdate("""
            jdbi.withHandle(handle -> {
            });
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
}

// Get Order By ID
public Orders getOrderById(int id)  {
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
}

// Get All Orders
public List<Orders> getAllOrders()  {
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
}

// Update Order
public int updateOrder(Orders orders)  {
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

        return update.execute();
}

public List<Orders> getOrdersWithFullNames()  {
            return handle.createQuery("""
            SELECT o.*
            FROM orders o;
        """).mapToBean(Orders.class)
                    .list();
}

// Delete Order
public int deleteOrder(int id)  {
        Update update = handle.createUpdate("""
                DELETE FROM orders WHERE ID = :id
            """).bind("id", id);

        return update.execute();
}

}





