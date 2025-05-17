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

public class StockInDetailDao extends BaseDao{
    public StockInDetailDao(Handle handle) {
        super(handle, false, 0, 0);
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
//    public List<StockInDetail> findByStockId(int stockId) {
//        return handle.createQuery("SELECT * FROM StockInDetail WHERE stockId = :stockId")
//                .bind("stockId", stockId)
//                .map((rs, ctx) -> new StockInDetail(
//                        rs.getInt("id"),
//                        rs.getInt("stockId"),
//                        rs.getInt("productId"),
//                        rs.getInt("colorId"),
//                        rs.getInt("quantity"),
//                        rs.getDouble("unitPrice"),
//                        rs.getDouble("totalPrice")
//                ))
//                .list();
//    }
    public List<StockInDetail> findAllStockId(int stockId) {
        List<StockInDetail> stockInList = new ArrayList<>();

        try (Handle handle = DBConect.get().open()) {
            ProductDao productDao = new ProductDao(handle);
            ColorDao colorDao = new ColorDao(handle);

            String sql = "SELECT * FROM StockInDetail WHERE stockId = ?";
            try (PreparedStatement stmt = handle.getConnection().prepareStatement(sql)) {
                stmt.setInt(1, stockId);  // bind đúng vị trí tham số

                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        int stockId1 = rs.getInt("stockId");
                        int productId = rs.getInt("productId");
                        int colorId = rs.getInt("colorId");
                        int quantity = rs.getInt("quantity");
                        double unitPrice = rs.getDouble("unitPrice");
                        double totalPrice = rs.getDouble("totalPrice");

                        // Lấy sản phẩm và màu
                        Product pd = productDao.findById1(productId);
                        Color cl = colorDao.findById1(colorId);

                        // Tạo đối tượng StockInDetail
                        StockInDetail st = new StockInDetail(
                                id, stockId1, productId, colorId, quantity,
                                cl != null ? cl.getName() : null,
                                pd != null ? pd.getName() : null,
                                unitPrice, totalPrice
                        );

                        stockInList.add(st);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(); // hoặc log.error(...)
        }

        return stockInList;
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
        List<StockInDetail> ls = dao.findAllStockId(1);
        for (StockInDetail s : ls) {
            System.out.println(s);
        }
    }



}
