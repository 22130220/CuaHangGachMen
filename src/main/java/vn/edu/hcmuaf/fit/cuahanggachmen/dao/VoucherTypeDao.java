package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.StockIn;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.VoucherType;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public class VoucherTypeDao extends BaseDao{

    public VoucherTypeDao(Handle handle) {
        super(handle, true, 60 * 3, 1000);
    }
    // Thêm mới
    public int insert(VoucherType type) {
        // xoá cache khi thêm mới
        invalidateCache("voucher_types_all");
        invalidateCache("voucher_type_" + type.getId());
        return handle.createUpdate("INSERT INTO voucher_type (Type, isActive) VALUES (:name, :isActive)")
                .bind("name", type.getName())
                .bind("isActive", type.isActive() ? 1 : 0) // nếu dùng boolean thì chuyển thành 1 hoặc 0
                .execute();
    }

    // Cập nhật
    public int update(VoucherType type) {
        // xoá cache khi cập nhật
        invalidateCache("voucher_types_all");
        invalidateCache("voucher_type_" + type.getId());
        return handle.createUpdate("UPDATE voucher_type SET Type = :name ,isActive = :isactive WHERE ID = :id")
                .bind("name", type.getName())
                .bind("isactive", type.isActive() ? 1 : 0)
                .bind("id", type.getId())
                .execute();
    }

    // Xóa
    public int delete(int id) {
        // xoá cache khi xóa
        invalidateCache("voucher_types_all");
        invalidateCache("voucher_type_" + id);
        return handle.createUpdate("DELETE FROM voucher_type WHERE ID = :id")
                .bind("id", id)
                .execute();
    }

    // Lấy tất cả
    public List<VoucherType> getList() {
        // Sử dụng cache để tăng tốc độ truy vấn
        String cacheKey = "voucher_types_all";
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM voucher_type")
                        .map((rs, ctx) -> new VoucherType(
                                rs.getInt("ID"),
                                rs.getBoolean("IsActive"),
                                rs.getString("Type")
                        ))
                        .list()
        );

    }
    public List<VoucherType> getListActive() {
        // Sử dụng cache để tăng tốc độ truy vấn
        String cacheKey = "voucher_types_all";
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM voucher_type where isActive = 1")
                        .map((rs, ctx) -> new VoucherType(
                                rs.getInt("ID"),
                                rs.getBoolean("IsActive"),
                                rs.getString("Type")
                        ))
                        .list()
        );

    }

    // Lấy theo ID
    public Optional<VoucherType> getById(int id) {
        // Sử dụng cache để tăng tốc độ truy vấn
        String cacheKey = "voucher_type_" + id;
        return Optional.ofNullable(getFromCacheOrCompute(cacheKey, VoucherType.class, () ->
                handle.createQuery("SELECT * FROM voucher_type WHERE ID = :id")
                        .bind("id", id)
                        .map((rs, ctx) -> new VoucherType(
                                rs.getInt("ID"),
                                rs.getBoolean("IsActive"),
                                rs.getString("Type")
                        ))
                        .findOne().orElse(null)
        ));
    }

    public VoucherType findById(int id) {
        return handle.createQuery("SELECT * FROM voucher_type WHERE ID = :id")
                .bind("id", id)
                .map((rs, ctx) -> new VoucherType(
                        rs.getInt("ID"),
                        rs.getBoolean("isActive"),
                        rs.getString("Type")
                ))
                .findOne()
                .orElse(null);
    }

    public int updateActive(int id, boolean active) {
        // xoá cache khi cập nhật
        invalidateCache("voucher_types_all");
        invalidateCache("voucher_type_" + id);
        return handle.createUpdate("UPDATE voucher_type SET isActive = :isActive WHERE ID = :id")
                .bind("id", id)
                .bind("isActive", active)
                .execute();
    }

    public static void main(String[] args) {
        DBConect.mySqlDataSource();
        Handle handle1 = DBConect.get().open();
        VoucherTypeDao dao = new VoucherTypeDao(handle1);
        List<VoucherType> list=dao.getListActive();
        for (VoucherType voucherType : list) {
            System.out.println(voucherType);
        }
    }

}
