package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.result.RowView;
import org.jdbi.v3.core.statement.Query;
import org.jdbi.v3.core.statement.Update;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.ProductColorImg;

import java.sql.SQLException;
import java.util.List;

public class ProductColorImgDao extends BaseDao {

    public ProductColorImgDao(Handle handle) {
        super(handle);
    }

    public int insert(int colorId, int productId, String url) {
            Update update = handle.createUpdate(
                    "INSERT INTO product_color_img (ColorId, ProductId, Url) VALUES (:colorId, :productId, :url)"
            );
            update.bind("colorId", colorId);
            update.bind("productId", productId);
            update.bind("url", url);
            update.execute();
            return handle.createQuery("SELECT LAST_INSERT_ID()").mapTo(Integer.class).one();
    }


    public ProductColorImg findById(int id) {
            Query query = handle.createQuery("SELECT * FROM product_color_img WHERE id = :id");
            query.bind("id", id);
            return query.mapToBean(ProductColorImg.class).one();
    }

    public List<ProductColorImg> findAll() {
            return handle.createQuery("SELECT * FROM product_color_img")
                        .mapToBean(ProductColorImg.class)
                        .list();
    }

    public List<ProductColorImg> findByProductId(int productId) {
            return handle.createQuery("SELECT * FROM product_color_img i JOIN colors c ON i.ColorId = c.ID WHERE ProductId = :productId")
                        .bind("productId", productId)
                        .map(this::mapRow)
                        .list();
    }

    public int update(int id, String url) {
        return handle.createUpdate("UPDATE product_color_img SET Url = :url WHERE id = :id")
            .bind("id", id)
            .bind("url", url)
            .execute();
    }

    public int deleteById(int id) {
        return handle.createUpdate("DELETE FROM product_color_img WHERE id = :id")
            .bind("id", id)
            .execute();
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
}

