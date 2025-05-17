package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.StockIn;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.TypeOfReceipt;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class StockInDao extends BaseDao{

    public StockInDao(Handle handle) {
        super(handle, false, 0, 0);
    }

    // Thêm mới 1 phiếu nhập kho
    public int insertNhapMua(StockIn stockIn) {
        return handle.createUpdate("INSERT INTO StockIn (createDate, userId, updatedAt, isActive,typeId) " +
                        "VALUES (:createDate, :userId, :updateAt, 1,1)")
                .bind("createDate", stockIn.getCreateDate())
                .bind("userId", stockIn.getUserId())
                .bind("updateAt",stockIn.getCreateDate())
                .executeAndReturnGeneratedKeys("id")
                .mapTo(Integer.class)
                .one();
    }

    // Lấy tất cả phiếu nhập kho còn hoạt động
    public List<StockIn> findAll() {
        List<StockIn> stockInList = new ArrayList<>();

        try (Handle handle = DBConect.get().open()) {
            UserDao userDao = new UserDao(handle);
            TypeOfReceiptDao typeOfReceiptDao = new TypeOfReceiptDao(handle);

            String sql = "SELECT * FROM StockIn";
            try (PreparedStatement stmt = handle.getConnection().prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    int id = rs.getInt("id");
                    LocalDateTime createDate = rs.getObject("createDate", LocalDateTime.class);
                    int userId = rs.getInt("userId");
                    LocalDateTime updatedAt = rs.getObject("updatedAt", LocalDateTime.class);
                    int typeId = rs.getInt("typeId");
                    boolean isActive = rs.getBoolean("isActive");

                    // Lấy user và loại phiếu
                    User user = userDao.getUserByIds(userId);
                    TypeOfReceipt type = typeOfReceiptDao.findById(typeId);

                    // Tạo đối tượng StockIn
                    StockIn stockIn = new StockIn(
                            id, createDate, userId, updatedAt, typeId, isActive,
                            user != null ? user.getFullname() : null,
                            type != null ? type.getType() : null
                    );

                    stockInList.add(stockIn);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(); // hoặc dùng logger
        }

        return stockInList;
    }

    public List<StockIn> findAllIsActive() {
        return handle.createQuery("SELECT * FROM StockIn WHERE isActive = 1")
                .map((rs, ctx) -> new StockIn(
                        rs.getInt("id"),
                        rs.getObject("createDate", LocalDateTime.class),
                        rs.getInt("userId"),
                        rs.getObject("updatedAt", LocalDateTime.class),
                        rs.getInt("typeId"),
                        rs.getBoolean("isActive")
                ))
                .list();
    }

    // Tìm theo ID (chỉ phiếu còn hoạt động)
    public StockIn findById(int id) {
        return handle.createQuery("SELECT * FROM StockIn WHERE id = :id AND isActive = 1")
                .bind("id", id)
                .map((rs, ctx) -> new StockIn(
                        rs.getInt("id"),
                        rs.getObject("createDate", LocalDateTime.class),
                        rs.getInt("userId"),
                        rs.getObject("updatedAt", LocalDateTime.class),
                        rs.getInt("typeId"),
                        rs.getBoolean("isActive")
                ))
                .findOne()
                .orElse(null);
    }

    // Cập nhật phiếu nhập kho (cập nhật ngày sửa)
    public boolean update(StockIn stockIn) {
        int rowsAffected = handle.createUpdate(
                        "UPDATE StockIn SET userId = :userId, updatedAt = :updatedAt, typeId = :typeId, isActive = :isActive " +
                                "WHERE id = :id")
                .bind("userId", stockIn.getUserId())
                .bind("updatedAt", stockIn.getUpdateDate())
                .bind("typeId", stockIn.getTypeId())
                .bind("isActive", stockIn.isActive())
                .bind("id", stockIn.getId())
                .execute();
        return rowsAffected > 0;
    }

    public int updateActive(int id, boolean active) {
        return handle.createUpdate("UPDATE StockIn SET isActive = :isActive WHERE id = :id")
                .bind("id", id)
                .bind("isActive", active)
                .execute();
    }

    // Xoá mềm: đặt isActive = 0
    public boolean deleteById(int id) {
        int rowsAffected = handle.createUpdate(
                        "UPDATE StockIn SET isActive = 0, updatedAt = NOW() WHERE id = :id AND isActive = 1")
                .bind("id", id)
                .execute();
        return rowsAffected > 0;
    }

    public static void main(String[] args) {
        DBConect.mySqlDataSource();
        Handle handle1 = DBConect.get().open();
        StockInDao dao = new StockInDao(handle1);
        List<StockIn> lst = dao.findAll();
        for (StockIn stockIn : lst) {
            System.out.println(stockIn);
        }
    }





}
