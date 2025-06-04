package vn.edu.hcmuaf.fit.cuahanggachmen.dao;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.result.RowView;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Order;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.RevenueByDay;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.RevenueByMonth;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
public class OrderDao extends BaseDao {
    public OrderDao(Handle handle) {
        super(handle, false, 0, 0);
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

    public double sumDoanhThuTheoThang(int month, int year)  {
        return handle.createQuery("SELECT \n" +
                "    -- Tổng doanh thu - Tổng tiền nhập trả\n" +
                "    IFNULL(SUM(o.TotalPrice), 0) - IFNULL((\n" +
                "        SELECT SUM(sid.totalPrice)\n" +
                "        FROM StockInDetail sid\n" +
                "        JOIN StockIn si ON sid.stockId = si.id\n" +
                "        WHERE si.typeId = 2\n" +
                "          AND MONTH(si.createDate) = :month\n" +
                "          AND YEAR(si.createDate) = :year\n" +
                "    ), 0) AS NetRevenue\n" +
                "FROM orders o\n" +
                "WHERE MONTH(o.OrderDate) = :month AND YEAR(o.OrderDate) = :year;\n").bind("month", month).bind("year", year).mapTo(Double.class).one();
    }

    public List<Order> backToOrder()  {
        return handle.createQuery("SELECT ID,Status, TotalPrice, UserID FROM orders LIMIT 10;").mapToBean(Order.class).list();
    }

    public int transcPerDay()  {
        return handle.createQuery("SELECT COUNT(*) FROM orders WHERE DATE(OrderDate) = :targetDate;").bind("targetDate", LocalDate.now()).mapTo(Integer.class).one();
    }

    public List<RevenueByMonth> getMonthlRevenue() {
        return handle.createQuery(" SELECT\n" +
                "                YEAR(OrderDate) AS year,\n" +
                "                MONTH(OrderDate) AS month,\n" +
                "                SUM(TotalPrice) AS total\n" +
                "                FROM `orders`\n" +
                "                GROUP BY YEAR(OrderDate), MONTH(OrderDate)\n" +
                "                ORDER BY YEAR(OrderDate), MONTH(OrderDate)").mapToBean(RevenueByMonth.class).list();
    }

    public int getTotalDeliveredByMonth(int month, int year) {
        return handle.createQuery("SELECT SUM(od.Quantity) AS total_sold\n" +
                "FROM orders o\n" +
                "JOIN orderdetail od ON o.ID = od.OrderID\n" +
                "WHERE MONTH(o.OrderDate) = :month AND YEAR(o.OrderDate) = :year AND o.Status = 'Delivered';")
                .bind("month", month)
                .bind("year", year)
                .mapTo(Integer.class).findFirst().orElse(0);
    }

    public List<RevenueByDay> getRevenueByDay(int month, int year) {
        return handle.createQuery("SELECT DATE(o.OrderDate) AS revenueDay, SUM(od.price * od.quantity) AS revenue\n" +
                "FROM orders o\n" +
                "JOIN orderdetail od ON o.id = od.OrderID\n" +
                "WHERE MONTH(o.OrderDate) = :month AND YEAR(o.OrderDate) = :year AND o.status = 'Delivered'\n" +
                "GROUP BY DATE(o.OrderDate)\n" +
                "ORDER BY revenueDay;")
                .bind("month", month)
                .bind("year", year)
                .mapToBean(RevenueByDay.class).list();
    }

    public int getProfit(int month, int year) {
        return handle.createQuery("SELECT \n" +
                "SUM((od.Price - s.unitPrice) * od.Quantity)\n" +
                "    - IFNULL(SUM(CASE WHEN si.typeId = 2 THEN sid.unitPrice * sid.quantity ELSE 0 END), 0)\n" +
                "    AS profit\n" +
                "\n" +
                "FROM \n" +
                "    orders o\n" +
                "JOIN \n" +
                "    orderdetail od ON o.ID = od.OrderID\n" +
                "\n" +
                "JOIN (\n" +
                "    SELECT productId, MIN(unitPrice) AS unitPrice\n" +
                "    FROM StockInDetail\n" +
                "    GROUP BY productId\n" +
                ") s ON od.ProductID = s.productId\n" +
                "\n" +
                "LEFT JOIN StockInDetail sid ON sid.colorId = od.Color AND sid.productId = od.ProductID\n" +
                "LEFT JOIN StockIn si ON si.id = sid.stockId\n" +
                "\n" +
                "WHERE \n" +
                "    MONTH(o.OrderDate) = :month AND YEAR(o.OrderDate) = :year;")
                .bind("month", month)
                .bind("year", year)
                .mapTo(Integer.class).findFirst().orElse(0);
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
