package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Update;
import org.jdbi.v3.core.result.RowView;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Voucher;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class VoucherDao extends BaseDao {


    public VoucherDao(Handle handle) {
        super(handle);
    }

    // Insert a new Voucher
    public int insert(Voucher voucher) {
        return handle.createUpdate("INSERT INTO vouchers (code, discountValue, expireDate, isActive, VoucherTypeId) VALUES (:code, :VoucherValue, :expireDate, :isActive, :VoucherTypeId)")
                .bind("code", voucher.getCode())
                .bind("VoucherValue", voucher.getDiscountValue())
                .bind("expireDate", voucher.getExpireDate())
                .bind("isActive", voucher.isActive())
                .bind("VoucherTypeId", voucher.getVoucherType())
                .execute();
    }

    // Find Voucher by ID
    public Optional<Voucher> findById(int id) {
        return handle.createQuery("SELECT * FROM vouchers WHERE ID = :id")
                .bind("id", id)
                .map(this::mapRow)
                .findFirst();
    }

    // Find Voucher by ID
    public Optional<Voucher> findByName(String name) {
        return handle.createQuery("SELECT * FROM vouchers WHERE Code = :name AND isActive = 1")
                .bind("name", name)
                .map(this::mapRow)
                .findFirst();
    }

    public Voucher findByID(String id) {
        return handle.createQuery("SELECT * FROM vouchers WHERE ID = :name AND isActive = 1")
                .bind("name", id)
                .map(this::mapRow)
                .findFirst()
                .orElse(null);
    }




    // Update a Voucher
    public int update(Voucher voucher) {
        return handle.createUpdate(
                        "UPDATE vouchers SET code = :code, discountValue = :VoucherValue, expireDate = :expireDate, isActive = :isActive, VoucherTypeId = :VoucherTypeId WHERE Id = :id")
                .bind("id", voucher.getId())
                .bind("code", voucher.getCode())
                .bind("VoucherValue", voucher.getDiscountValue())
                .bind("expireDate", voucher.getExpireDate())
                .bind("isActive", voucher.isActive())
                .bind("VoucherTypeId", voucher.getVoucherType())
                .execute();
    }

    public int updateActive(int id, boolean active) {
        return handle.createUpdate("UPDATE vouchers SET isActive = :isActive WHERE Id = :id")
                .bind("id", id)
                .bind("isActive", active)
                .execute();
    }

    // Delete Voucher by ID
    public int delete(int id) {
        return handle.createUpdate("DELETE FROM vouchers WHERE ID = :id")
                .bind("id", id)
                .execute();
    }

    // Find all Vouchers
    public List<Voucher> findAll() {
        return handle.createQuery("SELECT * FROM vouchers")
                .map(this::mapRow)
                .list();
    }

    public List<Voucher> findByUser(int userId) {
        return handle.createQuery("SELECT v.* FROM vouchers v LEFT JOIN voucherUsage vu ON v.ID = vu.VoucherID AND vu.UserID = :userId WHERE vu.VoucherID IS NULL AND v.IsActive = 1;")
                .bind("userId", userId)
                .map(this::mapRow)
                .list();
    }

    public List<Voucher> findAllUnusedVouchersByUser(int userId) {
        // Bước 1: Lấy tất cả voucher còn hiệu lực và loại voucher còn hoạt động
        List<Voucher> allValidVouchers = handle.createQuery(
                        "SELECT v.* " +
                                "FROM vouchers v " +
                                "JOIN voucher_type vt ON v.VoucherTypeId = vt.ID " +
                                "WHERE v.IsActive = 1 AND vt.isActive = 1"
                ).map(this::mapRow)
                .list();

        // Bước 2: Lấy danh sách các voucher đã dùng bởi user
        List<Integer> usedVoucherIds = handle.createQuery(
                        "SELECT VoucherID FROM voucherusage WHERE UserID = :userId"
                ).bind("userId", userId)
                .mapTo(Integer.class)
                .list();

        // Bước 3: Trả về các voucher chưa được dùng
        return allValidVouchers.stream()
                .filter(v -> !usedVoucherIds.contains(v.getId()))
                .collect(Collectors.toList());
    }




    // RowMapper for mapping database rows to Voucher objects
    private Voucher mapRow(RowView rowView) {
        Voucher Voucher = new Voucher();
        Voucher.setId(rowView.getColumn("ID", Integer.class));
        Voucher.setCode(rowView.getColumn("Code", String.class));
        Voucher.setDiscountValue(rowView.getColumn("DiscountValue", BigDecimal.class));
        Voucher.setExpireDate(rowView.getColumn("ExpireDate", LocalDateTime.class));
        Voucher.setActive(rowView.getColumn("IsActive", Boolean.class));
        Voucher.setCreateDate(rowView.getColumn("CreateDate", LocalDateTime.class));
        Voucher.setVoucherType(rowView.getColumn("VoucherTypeId", Integer.class));
        return Voucher;
    }

    public static void main(String[] args) {
        DBConect.mySqlDataSource();
        Handle handle = DBConect.get().open();
        VoucherDao dao = new VoucherDao(handle);
//        Optional<Voucher> vs= dao.findByID("1");
//        System.out.println(vs);
    }

}

