package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Color;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper.ColorMapper;

import java.sql.SQLException;
import java.util.List;

public class ColorDao {
    // Thêm một color mới
    public void insertColor(Color color) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        jdbi.useHandle(handle ->
                handle.createUpdate("INSERT INTO color (ID, Name, Url) VALUES (:ID, :Name, :Url)")
                        .bind("ID", color.getID())
                        .bind("Name", color.getName())
                        .bind("Url", color.getUrl())
                        .execute()
        );
    }

    public Color findById(int id)
            throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();


        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM colors WHERE ID = :id")
                        .bind("id", id)
                        .mapToBean(Color.class)
                        .findOne() // trả về Optional<Color>
                        .orElse(null) // Nếu không có, trả về null
        );
    }



    // Lấy tất cả các color
    public List<Color> getAllColors() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM color")
                        .map(new ColorMapper()) // Sử dụng ColorMapper để ánh xạ
                        .list()
        );
    }

    // Tìm color theo ID
    public Color findColorById(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT \n" +
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
                        .one()
        );
    }

    public List<Color> findColorByIds(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT c.ID,MIN(pci.Url) AS Url, c.Name\n" +
                                "FROM colors c \n" +
                                "JOIN product_color_img pci ON c.ID = pci.ColorID\n" +
                                "JOIN products p ON p.id = pci.ProductID\n" +
                                "WHERE p.id = :id\n" +
                                "GROUP BY c.ID, c.Name")
                        .bind("id", id)
                        .map(new ColorMapper()) // Sử dụng ColorMapper
                        .list()
        );
    }

    // Cập nhật color theo ID
    public void updateColor(Color color) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        jdbi.useHandle(handle ->
                handle.createUpdate("UPDATE color SET Name = :Name, Url = :Url WHERE ID = :ID")
                        .bind("ID", color.getID())
                        .bind("Name", color.getName())
                        .bind("Url", color.getUrl())
                        .execute()
        );
    }

    // Xóa color theo ID
    public void deleteColor(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Jdbi jdbi = DBConect.get();
        jdbi.useHandle(handle ->
                handle.createUpdate("DELETE FROM color WHERE ID = :ID")
                        .bind("ID", id)
                        .execute()
        );
    }
}
