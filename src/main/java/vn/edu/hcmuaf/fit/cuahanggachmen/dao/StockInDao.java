package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.StockIn;

import java.time.LocalDateTime;
import java.util.List;

public class StockInDao extends BaseDao{

    public StockInDao(Handle handle) {
        super(handle);
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
        return handle.createQuery("SELECT * FROM StockIn")
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
        StockIn stockIn = dao.findById(1);
        System.out.println(stockIn);
    }





}
