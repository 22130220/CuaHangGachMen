package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Material;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.ProductSpec;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.SpecType;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper.ProductSpecMapper;

import java.sql.SQLException;
import java.util.List;

public class SpecTypeDao {

    public List<SpecType> findAll() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM spectype;")
                        .mapToBean(SpecType.class)
                        .list()
        );
    }

    public List<SpecType> findByProduct(int productId) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT st.* FROM spectype st LEFT JOIN product_spec ps ON st.ID = ps.SpecID AND ps.ProductID = :productId WHERE ps.SpecID IS NULL;")
                        .bind("productId", productId)
                        .mapToBean(SpecType.class)
                        .list()
        );
    }


    public int insert(SpecType c) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO spectype (Name) VALUES (:name)")
                        .bind("name", c.getName())
                        .execute()
        );
    }

    public int update(SpecType c) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE spectype SET Name = :name WHERE ID = :id")
                        .bind("name", c.getName())
                        .bind("id", c.getId())
                        .execute()
        );
    }

    public int deleteById(int i) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM spectype WHERE ID = :id")
                        .bind("id", i)
                        .execute()
        );
    }
}
