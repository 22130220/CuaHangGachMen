package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.ProductSpec;
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


    public static void main(String[] args) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DBConect.mySqlDataSource();
        ProductSpecDao dao = new ProductSpecDao();
        List<ProductSpec> ls = dao.findByProductId(2);
        ls.forEach(System.out::println);
    }
}
