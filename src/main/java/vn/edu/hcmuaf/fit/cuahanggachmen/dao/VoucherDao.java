package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

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

public class VoucherDao {


    // Insert a new Voucher
    public int insert(Voucher Voucher) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle -> {
            Update update = handle.createUpdate(
                    "INSERT INTO vouchers (Code, VoucherValue, ExpireDate, IsActive, CreateDate) " +
                            "VALUES (:code, :VoucherValue, :expireDate, :isActive, :createDate)"
            );
            update.bind("code", Voucher.getCode())
                    .bind("VoucherValue", Voucher.getDiscountValue())
                    .bind("expireDate", Voucher.getExpireDate())
                    .bind("isActive", Voucher.isActive())
                    .bind("createDate", Voucher.getCreateDate());
            update.execute();
            return handle.createQuery("SELECT LAST_INSERT_ID()")
                    .mapTo(Integer.class)
                    .one();
        });
    }

    // Find Voucher by ID
    public Optional<Voucher> findById(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM vouchers WHERE ID = :id")
                        .bind("id", id)
                        .map(this::mapRow)
                        .findFirst()
        );
    }

    // Find Voucher by ID
    public Optional<Voucher> findByName(String name) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM vouchers WHERE Code = :name AND isActive = 1")
                        .bind("name", name)
                        .map(this::mapRow)
                        .findFirst()
        );
    }



    // Update a Voucher
    public void update(Voucher Voucher) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        jdbi.useHandle(handle -> {
            handle.createUpdate(
                            "UPDATE vouchers SET Code = :code, VoucherValue = :VoucherValue, " +
                                    "ExpireDate = :expireDate, IsActive = :isActive, CreateDate = :createDate " +
                                    "WHERE ID = :id"
                    )
                    .bind("id", Voucher.getId())
                    .bind("code", Voucher.getCode())
                    .bind("VoucherValue", Voucher.getDiscountValue())
                    .bind("expireDate", Voucher.getExpireDate())
                    .bind("isActive", Voucher.isActive())
                    .bind("createDate", Voucher.getCreateDate())
                    .execute();
        });
    }

    // Delete Voucher by ID
    public void delete(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        jdbi.useHandle(handle ->
                handle.createUpdate("DELETE FROM vouchers WHERE ID = :id")
                        .bind("id", id)
                        .execute()
        );
    }

    // Find all Vouchers
    public List<Voucher> findAll() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM vouchers")
                        .map(this::mapRow)
                        .list()
        );
    }

    public List<Voucher> findByUser(int userId) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT v.* FROM vouchers v LEFT JOIN voucherUsage vu ON v.ID = vu.VoucherID AND vu.UserID = :userId WHERE vu.VoucherID IS NULL AND v.IsActive = 1;")
                        .bind("userId", userId)
                        .map(this::mapRow)
                        .list()
        );
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

    public static void main(String[] args) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DBConect.mySqlDataSource();

        List<Voucher> vs = new VoucherDao().findAll();
        vs.forEach(System.out::println);
    }
}

