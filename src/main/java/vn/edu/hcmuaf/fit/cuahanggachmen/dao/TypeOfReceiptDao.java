package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.TypeOfReceipt;

import java.util.List;

public class TypeOfReceiptDao extends BaseDao{
    public TypeOfReceiptDao(Handle handle) {
        super(handle, false, 0, 0);
    }
    public int insert(TypeOfReceipt receipt) {
        return handle.createUpdate("INSERT INTO TypeOfReceipt (Name, isActive) VALUES (:type, :isActive)")
                .bind("type", receipt.getType())
                .bind("isActive", receipt.isActive())
                .executeAndReturnGeneratedKeys("id")
                .mapTo(int.class)
                .one();
    }
    public void update(TypeOfReceipt receipt) {
        handle.createUpdate("UPDATE TypeOfReceipt SET Name = :type, isActive = :isActive WHERE id = :id")
                .bind("type", receipt.getType())
                .bind("isActive", receipt.isActive())
                .bind("id", receipt.getId())
                .execute();
    }

    public void deactivate(int id) {
        handle.createUpdate("UPDATE TypeOfReceipt SET isActive = false WHERE id = :id")
                .bind("id", id)
                .execute();
    }

    public List<TypeOfReceipt> findAllActive() {
        return handle.createQuery("SELECT * FROM TypeOfReceipt WHERE isActive = 1")
                .map((rs, ctx) -> {
                    TypeOfReceipt receipt = new TypeOfReceipt();
                    receipt.setId(rs.getInt("id"));
                    receipt.setType(rs.getString("Name"));
                    receipt.setActive(rs.getBoolean("isActive"));
                    return receipt;
                })
                .list();
    }

    public List<TypeOfReceipt> findAll() {
        return handle.createQuery("SELECT * FROM TypeOfReceipt")
                .map((rs, ctx) -> {
                    TypeOfReceipt receipt = new TypeOfReceipt();
                    receipt.setId(rs.getInt("id"));
                    receipt.setType(rs.getString("Name"));
                    receipt.setActive(rs.getBoolean("isActive"));
                    return receipt;
                })
                .list();
    }



    public TypeOfReceipt findById(int id) {
        return handle.createQuery("SELECT * FROM TypeOfReceipt WHERE id = :id")
                .bind("id", id)
                .map((rs, ctx) -> {
                    TypeOfReceipt receipt = new TypeOfReceipt();
                    receipt.setId(rs.getInt("id"));
                    receipt.setType(rs.getString("Name"));
                    receipt.setActive(rs.getBoolean("isActive"));
                    return receipt;
                })
                .findOne()
                .orElse(null);
    }

    public static void main(String[] args) {
        DBConect.mySqlDataSource();
        Handle handle=DBConect.get().open();
        TypeOfReceiptDao dao = new TypeOfReceiptDao(handle);
        List<TypeOfReceipt> list = dao.findAllActive();
        for (TypeOfReceipt receipt : list) {
            System.out.println(receipt);
        }
    }







}
