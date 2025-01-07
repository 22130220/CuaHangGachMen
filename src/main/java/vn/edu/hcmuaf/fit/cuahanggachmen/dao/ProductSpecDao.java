package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.ProductSpec;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.SpecType;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper.ProductSpecMapper;

import java.sql.SQLException;
import java.util.List;

public class ProductSpecDao {

    public List<ProductSpec> findByProductId(int productId) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        Handle handle = jdbi.open();

        List<ProductSpec> ls = handle.createQuery("SELECT st.Name, ps.ProductID, ps.SpecID, ps.Value\n" +
                                    "FROM spectype st join product_spec ps on st.ID = ps.SpecID\n" +
                                    "WHERE ps.ProductID = :id;")
                .bind("id" , productId)
                .map(new ProductSpecMapper())
                .list();

        return ls;
    }

    public int insert(ProductSpec productSpec) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO product_spec(ProductID, SpecID, Value) VALUES (:productId, :specId, :value)")
                        .bind("productId", productSpec.getProcuctId())
                        .bind("specId", productSpec.getSpecId())
                        .bind("value", productSpec.getValue())
                        .execute()
        );
    }

    public int deleteById(int productId, int specId) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM product_spec WHERE ProductID = :productId AND SpecID = :specId")
                        .bind("productId", productId)
                        .bind("specId", specId)
                        .execute()
        );
    }
    public int update(ProductSpec c) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE product_spec SET Value = :value WHERE ProductID = :productId AND SpecID = :specId;")
                        .bind("productId", c.getProcuctId())
                        .bind("specId", c.getSpecId())
                        .bind("value", c.getValue())
                        .execute()
        );
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DBConect.mySqlDataSource();
        ProductSpecDao dao = new ProductSpecDao();
        List<ProductSpec> ls = dao.findByProductId(2);
        ls.forEach(System.out::println);
    }
}
