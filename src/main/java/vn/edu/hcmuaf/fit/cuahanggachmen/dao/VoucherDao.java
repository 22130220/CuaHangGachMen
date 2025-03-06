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

public class VoucherDao extends BaseDao {


    public VoucherDao(Handle handle) {
        super(handle);
    }

    // Insert a new Voucher
    public int insert(Voucher Voucher) {
        return handle.createUpdate("INSERT INTO vouchers (code, discountValue, expireDate, isActive) VALUES (:code, :VoucherValue, :expireDate, :isActive)")
                     .bind("code", Voucher.getCode())
                    .bind("VoucherValue", Voucher.getDiscountValue())
                    .bind("expireDate", Voucher.getExpireDate())
                    .bind("isActive", Voucher.isActive()).execute();
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



    // Update a Voucher
    public int update(Voucher Voucher) {
        return handle.createUpdate("UPDATE vouchers SET code = :code, discountValue = :VoucherValue, expireDate = :expireDate, isActive = :isActive WHERE Id = :id")
                    .bind("id", Voucher.getId())
                    .bind("code", Voucher.getCode())
                    .bind("VoucherValue", Voucher.getDiscountValue())
                    .bind("expireDate", Voucher.getExpireDate())
                    .bind("isActive", Voucher.isActive())
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

    // RowMapper for mapping database rows to Voucher objects
    private Voucher mapRow(RowView rowView) {
        Voucher Voucher = new Voucher();
        Voucher.setId(rowView.getColumn("ID", Integer.class));
        Voucher.setCode(rowView.getColumn("Code", String.class));
        Voucher.setDiscountValue(rowView.getColumn("DiscountValue", BigDecimal.class));
        Voucher.setExpireDate(rowView.getColumn("ExpireDate", LocalDateTime.class));
        Voucher.setActive(rowView.getColumn("IsActive", Boolean.class));
        Voucher.setCreateDate(rowView.getColumn("CreateDate", LocalDateTime.class));
        return Voucher;
    }

}

