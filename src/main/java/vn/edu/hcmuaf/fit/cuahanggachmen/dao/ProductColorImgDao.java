package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.result.RowView;
import org.jdbi.v3.core.statement.Query;
import org.jdbi.v3.core.statement.Update;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.ProductColorImg;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Voucher;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

public class ProductColorImgDao {

    public int insert(int colorId, int productId, String url) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle -> {
            Update update = handle.createUpdate(
                    "INSERT INTO product_color_img (ColorId, ProductId, Url) VALUES (:colorId, :productId, :url)"
            );
            update.bind("colorId", colorId);
            update.bind("productId", productId);
            update.bind("url", url);
            update.execute();
            return handle.createQuery("SELECT LAST_INSERT_ID()").mapTo(Integer.class).one();
        });
    }


    public ProductColorImg findById(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle -> {
            Query query = handle.createQuery("SELECT * FROM product_color_img WHERE id = :id");
            query.bind("id", id);
            return query.mapToBean(ProductColorImg.class).one();
        });
    }

    public List<ProductColorImg> findAll() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM product_color_img")
                        .mapToBean(ProductColorImg.class)
                        .list()
        );
    }

    public List<ProductColorImg> findByProductId(int productId) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM product_color_img i JOIN colors c ON i.ColorId = c.ID WHERE ProductId = :productId")
                        .bind("productId", productId)
                        .map(this::mapRow)
                        .list()
        );
    }

    public int update(int id, String url) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle -> handle.createUpdate("UPDATE product_color_img SET Url = :url WHERE id = :id")
            .bind("id", id)
            .bind("url", url)
            .execute()
        );
    }

    public int deleteById(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
            handle.createUpdate("DELETE FROM product_color_img WHERE id = :id")
            .bind("id", id)
            .execute()
        );
    }

    private ProductColorImg mapRow(RowView rowView) {
        ProductColorImg p = new ProductColorImg();
        p.setId(rowView.getColumn("id", Integer.class));
        p.setProductId(rowView.getColumn("ProductId", Integer.class));
        p.setColorId(rowView.getColumn("ColorId", Integer.class));
        p.setColorName(rowView.getColumn("Name",String.class));
        p.setUrl(rowView.getColumn("Url", String.class));
        return p;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DBConect.mySqlDataSource();
        List<ProductColorImg> ls = new ProductColorImgDao().findByProductId(1);
        ls.forEach(System.out::println);
    }
}

