package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class OutOfStockDao extends BaseDao {

    public OutOfStockDao(Handle handle) {
        super(handle, false, 0, 0);
    }

    public int insert(OutOfStock outOfStock) {
        return handle.createUpdate("INSERT INTO outofstock (createDate, userId, updateDate, isActive,typeId) " +
                        "VALUES (:createDate, :userId, :updateAt, 1,:typeId)")
                .bind("createDate", outOfStock.getCreatedDate())
                .bind("userId", outOfStock.getUserId())
                .bind("updateAt",outOfStock.getUpdatedDate())
                .bind("typeId", outOfStock.getTypeId())
                .executeAndReturnGeneratedKeys("id")
                .mapTo(Integer.class)
                .one();
    }

    // Tìm bản ghi outofstock dựa trên userId và thời gian gần với orderDate
    public OutOfStock findByUserIdAndDate(int userId, LocalDateTime orderDate) {
        return handle.createQuery("SELECT * FROM outofstock WHERE userId = :userId AND typeId = 1 " +
                        "AND createDate <= :orderDate " +
                        "ORDER BY ABS(TIMESTAMPDIFF(SECOND, createDate, :orderDate)) ASC LIMIT 1")
                .bind("userId", userId)
                .bind("orderDate", orderDate)
                .map((rs, ctx) -> {
                    OutOfStock outOfStock = new OutOfStock();
                    outOfStock.setId(rs.getInt("id"));
                    outOfStock.setCreatedDate(rs.getObject("createDate", LocalDateTime.class));
                    outOfStock.setUserId(rs.getInt("userId"));
                    outOfStock.setUpdatedDate(rs.getObject("updateDate", LocalDateTime.class));
                    outOfStock.setActive(rs.getBoolean("isActive"));
                    outOfStock.setTypeId(rs.getInt("typeId"));
                    return outOfStock;
                })
                .findOne()
                .orElse(null);
    }

    public List<OutOfStock> findAll() {
        List<OutOfStock> outOfStockList = new ArrayList<>();

        try (Handle handle = DBConect.get().open()) {
            UserDao userDao = new UserDao(handle);
            TypeOutOfStockDao typeDao = new TypeOutOfStockDao(handle);

            String sql = "SELECT * FROM outofstock";
            try (PreparedStatement stmt = handle.getConnection().prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    int id = rs.getInt("id");
                    LocalDateTime createDate = rs.getObject("createDate", LocalDateTime.class);
                    int userId = rs.getInt("userId");
                    LocalDateTime updatedAt = rs.getObject("updateDate", LocalDateTime.class);
                    boolean isActive = rs.getBoolean("isActive");
                    int typeId = rs.getInt("typeId");
                    // Lấy user và loại phiếu
                    User user = userDao.getUserByIds(userId);
                    TypeOutOfStock type = typeDao.findById(typeId);

                    // Tạo đối tượng StockIn
                    OutOfStock outOfStock = new OutOfStock(
                            id, createDate, userId, updatedAt, isActive,typeId,
                            user != null ? user.getFullname() : null,
                            type != null ? type.getName() : null
                    );

                    outOfStockList.add(outOfStock);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(); // hoặc dùng logger
        }

        return outOfStockList;
    }

    public boolean update(OutOfStock outOfStock) {
        int rowsAffected = handle.createUpdate(
                        "UPDATE outofstock SET userId = :userId, updateDate = :updatedAt,isActive = :isActive, typeId = :typeId  " +
                                "WHERE id = :id")
                .bind("userId", outOfStock.getUserId())
                .bind("updatedAt", outOfStock.getUpdatedDate())
                .bind("typeId", outOfStock.getTypeId())
                .bind("isActive", outOfStock.isActive())
                .bind("id", outOfStock.getId())
                .execute();
        return rowsAffected > 0;
    }

    public int updateActive(int id, boolean active) {
        return handle.createUpdate("UPDATE outofstock SET isActive = :isActive WHERE id = :id")
                .bind("id", id)
                .bind("isActive", active)
                .execute();
    }

    public static void main(String[] args) {
        DBConect.mySqlDataSource();
        Handle handle = DBConect.get().open();
        OutOfStockDao dao = new OutOfStockDao(handle);
        List<OutOfStock> outOfStockList = dao.findAll();
        for (OutOfStock outOfStock : outOfStockList) {
            System.out.println(outOfStock);
        }
    }





}
