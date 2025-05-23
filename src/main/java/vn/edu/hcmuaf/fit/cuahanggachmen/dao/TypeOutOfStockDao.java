package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.TypeOfReceipt;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.TypeOutOfStock;

import java.util.List;

public class TypeOutOfStockDao extends BaseDao {

    public TypeOutOfStockDao(Handle handle) { super(handle, false, 0, 0);}


    public int insert(TypeOutOfStock typeOfOutStock) {
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
    public int update(TypeOutOfStock type) {
        return handle.createUpdate("UPDATE typeoutofstock SET name = :type, isActive = :isActive WHERE id = :id")
                .bind("type", type.getName())
                .bind("isActive", type.isActive())
                .bind("id", type.getId())
                .execute();
    }
    public List<TypeOutOfStock> findAll() {
        return handle.createQuery("SELECT * FROM typeoutofstock")
                .map((rs, ctx) -> {
                    TypeOutOfStock receipt = new TypeOutOfStock();
                    receipt.setId(rs.getInt("id"));
                    receipt.setName(rs.getString("name"));
                    receipt.setActive(rs.getBoolean("isActive"));
                    return receipt;
                })
                .list();
    }

    public List<TypeOutOfStock> findAllisActive() {
        return handle.createQuery("SELECT * FROM typeoutofstock where isActive = 1")
                .map((rs, ctx) -> {
                    TypeOutOfStock receipt = new TypeOutOfStock();
                    receipt.setId(rs.getInt("id"));
                    receipt.setName(rs.getString("name"));
                    receipt.setActive(rs.getBoolean("isActive"));
                    return receipt;
                })
                .list();
    }


    public TypeOutOfStock findById(int id) {
        return handle.createQuery("SELECT * FROM typeoutofstock WHERE id = :id")
                .bind("id", id)
                .map((rs, ctx) -> {
                    TypeOutOfStock receipt = new TypeOutOfStock();
                    receipt.setId(rs.getInt("id"));
                    receipt.setName(rs.getString("name"));
                    receipt.setActive(rs.getBoolean("isActive"));
                    return receipt;
                })
                .findOne()
                .orElse(null);
    }

    public static void main(String[] args) {
        DBConect.mySqlDataSource();
        Handle handle = DBConect.get().open();
        TypeOutOfStockDao dao = new TypeOutOfStockDao(handle);
        List<TypeOutOfStock> list = dao.findAll();
        for (TypeOutOfStock t : list) {
            System.out.println(t.toString());
        }
    }

}
