package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Color;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.OutOfStockDetail;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.StockInDetail;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class OutOfStockDetailDao extends BaseDao {

    public OutOfStockDetailDao(Handle handle) {
        super(handle, false, 0, 0);
    }


    public int insert(OutOfStockDetail detail) {
        return handle.createUpdate("INSERT INTO outofstockdetail " +
                        "(outofstockId, productId, colorId, quantity, unitPrice, totalPrice) " +
                        "VALUES (:outofstockId, :productId, :colorId, :quantity, :unitPrice, :totalPrice)")
                .bind("outofstockId", detail.getOutOfStockId())
                .bind("productId", detail.getProductId())
                .bind("colorId", detail.getColorId())
                .bind("quantity", detail.getQuantity())
                .bind("unitPrice", detail.getUnitPrice())
                .bind("totalPrice", detail.getTotalPrice())
                .executeAndReturnGeneratedKeys("id")
                .mapTo(Integer.class)
                .one();
    }

    public List<OutOfStockDetail> findAllOutOfId(int outOfStockId) {
        List<OutOfStockDetail> outOfStockDetails = new ArrayList<>();

        try (Handle handle = DBConect.get().open()) {
            ProductDao productDao = new ProductDao(handle);
            ColorDao colorDao = new ColorDao(handle);

            String sql = "SELECT * FROM outofstockdetail  WHERE outofstockId = ?";
            try (PreparedStatement stmt = handle.getConnection().prepareStatement(sql)) {
                stmt.setInt(1, outOfStockId);  // bind đúng vị trí tham số

                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        int outofstockId1 = rs.getInt("outofstockId");
                        int productId = rs.getInt("productId");
                        int colorId = rs.getInt("colorId");
                        int quantity = rs.getInt("quantity");
                        double unitPrice = rs.getDouble("unitPrice");
                        double totalPrice = rs.getDouble("totalPrice");

                        // Lấy sản phẩm và màu
                        Product pd = productDao.findById1(productId);
                        Color cl = colorDao.findById1(colorId);

                        // Tạo đối tượng StockInDetail
                        OutOfStockDetail st = new OutOfStockDetail(
                               id,outofstockId1,productId,colorId,quantity,
                                unitPrice,totalPrice,pd.getName(),cl.getName()
                        );
                        outOfStockDetails.add(st);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(); // hoặc log.error(...)
        }

        return outOfStockDetails;
    }





}
