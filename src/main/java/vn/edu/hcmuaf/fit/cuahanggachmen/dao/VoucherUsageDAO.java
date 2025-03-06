package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.result.RowView;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.VoucherUsage;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public class VoucherUsageDAO extends BaseDao {

    public VoucherUsageDAO(Handle handle) {
        super(handle);
    }

    // Insert a new VoucherUsage
    public void insert(VoucherUsage voucherUsage) {
        handle.createUpdate("INSERT INTO voucherusage (VoucherID, UserID, OrderID, UsageDate) " +
                            "VALUES (:voucherId, :userId, :orderId, :usageDate)")
                    .bind("voucherId", voucherUsage.getVoucherId())
                    .bind("userId", voucherUsage.getUserId())
                    .bind("orderId", voucherUsage.getOrderId())
                    .bind("usageDate", voucherUsage.getUsageDate())
                    .execute();
    }

    // Find VoucherUsage by VoucherID and UserID
    public Optional<VoucherUsage> findByVoucherAndUser(int voucherId, int userId) {
        return handle.createQuery("SELECT * FROM voucherusage WHERE VoucherID = :voucherId AND UserID = :userId")
                        .bind("voucherId", voucherId)
                        .bind("userId", userId)
                        .map(this::mapRow)
                        .findFirst();
    }

    // Find VoucherUsage by VoucherID and UserID
    public Optional<VoucherUsage> findByCodeAndUser(String code, int userId) {
        return handle.createQuery("SELECT * FROM voucherusage vcur JOIN vouchers v on vcur.VoucherID = v.ID WHERE v.`Code` = :code AND vcur.UserID = :userId AND v.isActive = 1;")
                        .bind("code", code)
                        .bind("userId", userId)
                        .map(this::mapRow)
                        .findFirst();
    }

    // Update a VoucherUsage
    public void update(VoucherUsage voucherUsage) {
        handle.createUpdate("UPDATE voucherusage SET OrderID = :orderId, UsageDate = :usageDate " +
                            "WHERE VoucherID = :voucherId AND UserID = :userId")
                    .bind("voucherId", voucherUsage.getVoucherId())
                    .bind("userId", voucherUsage.getUserId())
                    .bind("orderId", voucherUsage.getOrderId())
                    .bind("usageDate", voucherUsage.getUsageDate())
                    .execute();
    }

    // Delete VoucherUsage by VoucherID and UserID
    public void delete(int voucherId, int userId) {
        handle.createUpdate("DELETE FROM voucherusage WHERE VoucherID = :voucherId AND UserID = :userId")
                    .bind("voucherId", voucherId)
                    .bind("userId", userId)
                    .execute();
    }

    // Find all VoucherUsage records
    public List<VoucherUsage> findAll() {
        return handle.createQuery("SELECT * FROM voucherusage")
                        .map(this::mapRow)
                        .list();
    }

    // RowMapper to map database rows to VoucherUsage objects
    private VoucherUsage mapRow(RowView rowView) {
        VoucherUsage voucherUsage = new VoucherUsage();
        voucherUsage.setVoucherId(rowView.getColumn("VoucherID", Integer.class));
        voucherUsage.setUserId(rowView.getColumn("UserID", Integer.class));
        voucherUsage.setOrderId(rowView.getColumn("OrderID", Integer.class));
        voucherUsage.setUsageDate(rowView.getColumn("UsageDate", LocalDateTime.class));
        return voucherUsage;
    }

}

