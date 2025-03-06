package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.SpecType;

import java.util.List;

public class SpecTypeDao extends BaseDao {

    public SpecTypeDao(Handle handle) {
        super(handle);
    }

    public List<SpecType> findAll() {
        return handle.createQuery("SELECT * FROM spectype;")
                        .mapToBean(SpecType.class)
                        .list();
    }

    public List<SpecType> findByProduct(int productId) {
        return handle.createQuery("SELECT st.* FROM spectype st LEFT JOIN product_spec ps ON st.ID = ps.SpecID AND ps.ProductID = :productId WHERE ps.SpecID IS NULL;")
                        .bind("productId", productId)
                        .mapToBean(SpecType.class)
                        .list();
    }


    public int insert(SpecType c) {
        return handle.createUpdate("INSERT INTO spectype (Name) VALUES (:name)")
                        .bind("name", c.getName())
                        .execute();
    }

    public int update(SpecType c) {
        return handle.createUpdate("UPDATE spectype SET Name = :name WHERE ID = :id")
                        .bind("name", c.getName())
                        .bind("id", c.getId())
                        .execute();
    }

    public int deleteById(int i) {
        return handle.createUpdate("DELETE FROM spectype WHERE ID = :id")
                        .bind("id", i)
                        .execute();
    }
}
