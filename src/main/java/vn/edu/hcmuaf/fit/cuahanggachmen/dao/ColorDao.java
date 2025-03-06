package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.result.RowView;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Color;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.ProductColorImg;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper.ColorMapper;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper.ColorNUrlMapper;

import java.sql.SQLException;
import java.util.List;

public class ColorDao extends BaseDao {
    public ColorDao(Handle handle) {
        super(handle);
    }

    // Thêm một color mới
    public int insertColor(Color color)  {
            return handle.createUpdate("INSERT INTO colors (Name) VALUES (:Name)")
                        .bind("Name", color.getName())
                        .execute();
    }

    public Color findById(int id) {
        return handle.createQuery("SELECT * FROM colors WHERE ID = :id")
                        .bind("id", id)
                        .mapToBean(Color.class)
                        .findOne() // trả về Optional<Color>
                        .orElse(null); // Nếu không có, trả về null
    }



    // Lấy tất cả các color
    public List<Color> getAllColors() {
        return handle.createQuery("SELECT * FROM colors")
                        .map(new ColorNUrlMapper()) // Sử dụng ColorMapper để ánh xạ
                        .list();
    }

    public List<Color> findByProductNotUsed(int productId) {
        return handle.createQuery("SELECT c.* FROM colors c LEFT JOIN product_color_img ps ON c.ID = ps.ColorId AND ps.ProductId = :productId WHERE ps.ColorId IS NULL;")
                        .bind("productId", productId)
                        .map(this::mapRow)
                        .list();
    }

    // Tìm color theo ID
    public Color findColorById(int id) {
        return handle.createQuery("SELECT \n" +
                                "    MIN(p.imgThumbnail) AS imgThumbnail, \n" +
                                "    c.`Name`\n" +
                                "FROM \n" +
                                "    colors c \n" +
                                "JOIN \n" +
                                "    product_color_img pci ON c.ID = pci.ColorID\n" +
                                "JOIN \n" +
                                "    products p ON p.id = pci.ProductID\n" +
                                "WHERE \n" +
                                "    p.id = :id\n" +
                                "GROUP BY \n" +
                                "    c.`Name`;")
                        .bind("id", id)
                        .map(new ColorMapper()) // Sử dụng ColorMapper
                        .one();
    }

    public List<Color> findColorByIds(int id) {
            return handle.createQuery("SELECT c.ID,MIN(pci.Url) AS Url, c.Name\n" +
                                "FROM colors c \n" +
                                "JOIN product_color_img pci ON c.ID = pci.ColorID\n" +
                                "JOIN products p ON p.id = pci.ProductID\n" +
                                "WHERE p.id = :id\n" +
                                "GROUP BY c.ID, c.Name")
                        .bind("id", id)
                        .map(new ColorMapper()) // Sử dụng ColorMapper
                        .list();
    }

    // Cập nhật color theo ID
    public int updateColor(Color color) {
            return handle.createUpdate("UPDATE colors SET Name = :Name WHERE ID = :ID")
                        .bind("ID", color.getID())
                        .bind("Name", color.getName())
                        .execute();
    }

    // Xóa color theo ID
    public int deleteColor(int id) {
            return handle.createUpdate("DELETE FROM colors WHERE ID = :ID")
                        .bind("ID", id)
                        .execute();
    }

    public List<Color> findAll() {
            return handle.createQuery("SELECT * FROM colors")
                        .map(this::mapRow)
                        .list();
    }
    private Color mapRow(RowView rowView) {
        Color p = new Color();
        p.setID(rowView.getColumn("ID", Integer.class));
        p.setName(rowView.getColumn("Name", String.class));
        return p;
    }
}
