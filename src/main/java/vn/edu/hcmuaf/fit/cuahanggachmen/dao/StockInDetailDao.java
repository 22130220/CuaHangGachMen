package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.StockInDetail;

import java.util.List;

public class StockInDetailDao extends BaseDao{
    public StockInDetailDao(Handle handle) {
        super(handle);
    }

    // Thêm dòng chi tiết
    public int insert(StockInDetail detail) {
        return handle.createUpdate("INSERT INTO StockInDetail " +
                        "(stockId, productId, colorId, quantity, unitPrice, totalPrice) " +
                        "VALUES (:stockId, :productId, :colorId, :quantity, :unitPrice, :totalPrice)")
                .bind("stockId", detail.getStockId())
                .bind("productId", detail.getProductId())
                .bind("colorId", detail.getColorId())
                .bind("quantity", detail.getQuantity())
                .bind("unitPrice", detail.getUnitPrice())
                .bind("totalPrice", detail.getTotalPrice())
                .executeAndReturnGeneratedKeys("id")
                .mapTo(Integer.class)
                .one();
    }

    // Lấy tất cả dòng theo stockId
    public List<StockInDetail> findByStockId(int stockId) {
        return handle.createQuery("SELECT * FROM StockInDetail WHERE stockId = :stockId")
                .bind("stockId", stockId)
                .map((rs, ctx) -> new StockInDetail(
                        rs.getInt("id"),
                        rs.getInt("stockId"),
                        rs.getInt("productId"),
                        rs.getInt("colorId"),
                        rs.getInt("quantity"),
                        rs.getDouble("unitPrice"),
                        rs.getDouble("totalPrice")
                ))
                .list();
    }

    // Tìm theo ID
    public StockInDetail findById(int id) {
        return handle.createQuery("SELECT * FROM StockInDetail WHERE id = :id")
                .bind("id", id)
                .map((rs, ctx) -> new StockInDetail(
                        rs.getInt("id"),
                        rs.getInt("stockId"),
                        rs.getInt("productId"),
                        rs.getInt("colorId"),
                        rs.getInt("quantity"),
                        rs.getDouble("unitPrice"),
                        rs.getDouble("totalPrice")
                ))
                .findOne()
                .orElse(null);
    }

    // Cập nhật
    public boolean update(StockInDetail detail) {
        int rowsAffected = handle.createUpdate(
                        "UPDATE StockInDetail SET " +
                                "stockId = :stockId, productId = :productId, colorId = :colorId, " +
                                "quantity = :quantity, unitPrice = :unitPrice, totalPrice = :totalPrice " +
                                "WHERE id = :id")
                .bind("stockId", detail.getStockId())
                .bind("productId", detail.getProductId())
                .bind("colorId", detail.getColorId())
                .bind("quantity", detail.getQuantity())
                .bind("unitPrice", detail.getUnitPrice())
                .bind("totalPrice", detail.getTotalPrice())
                .bind("id", detail.getId())
                .execute();
        return rowsAffected > 0;
    }

    // Xoá theo ID
    public boolean deleteById(int id) {
        int rowsAffected = handle.createUpdate("DELETE FROM StockInDetail WHERE id = :id")
                .bind("id", id)
                .execute();
        return rowsAffected > 0;
    }

    public static void main(String[] args) {
        DBConect.mySqlDataSource();
        Handle handle1=DBConect.get().open();
        StockInDetailDao dao = new StockInDetailDao(handle1);
        StockInDetail detail = dao.findById(1);
        System.out.println(detail);
    }



}
