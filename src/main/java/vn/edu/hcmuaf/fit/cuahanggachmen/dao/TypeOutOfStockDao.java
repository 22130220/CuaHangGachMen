package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.TypeOfOutStock;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.TypeOfReceipt;

import java.util.List;

public class TypeOutOfStockDao extends BaseDao {

    public TypeOutOfStockDao(Handle handle) { super(handle, false, 0, 0);}


    public int insert(TypeOfOutStock typeOfOutStock) {
        return handle.createUpdate("INSERT INTO typeoutofstock (name, isActive) VALUES (:type, :isActive)")
                .bind("type", typeOfOutStock.getName())
                .bind("isActive", typeOfOutStock.isActive())
                .executeAndReturnGeneratedKeys("id")
                .mapTo(int.class)
                .one();
    }
    public int updateActive(int id, boolean active) {
        return handle.createUpdate("UPDATE typeoutofstock SET isActive = :isActive WHERE id = :id")
                .bind("id", id)
                .bind("isActive", active)
                .execute();
    }

    public List<TypeOfOutStock> findAll() {
        return handle.createQuery("SELECT * FROM typeoutofstock")
                .map((rs, ctx) -> {
                    TypeOfOutStock receipt = new TypeOfOutStock();
                    receipt.setId(rs.getInt("id"));
                    receipt.setName(rs.getString("name"));
                    receipt.setActive(rs.getBoolean("isActive"));
                    return receipt;
                })
                .list();
    }
    public TypeOfOutStock findById(int id) {
        return handle.createQuery("SELECT * FROM typeoutofstock WHERE id = :id")
                .bind("id", id)
                .map((rs, ctx) -> {
                    TypeOfOutStock receipt = new TypeOfOutStock();
                    receipt.setId(rs.getInt("id"));
                    receipt.setName(rs.getString("name"));
                    receipt.setActive(rs.getBoolean("isActive"));
                    return receipt;
                })
                .findOne()
                .orElse(null);
    }


}
