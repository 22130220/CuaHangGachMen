package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Contact;

import java.util.List;

public class ContactDAO extends BaseDao{

    public ContactDAO(Handle handle) {
        super(handle);
    }

    public void insert(Contact ct) {
        String sql = "INSERT INTO contact (Fullname, Email, Title, Content, SendDate) VALUES (?, ?, ?, ?, ?)";
                handle.createUpdate(sql)
                        .bind(0, ct.getFullname())
                        .bind(1, ct.getEmail())
                        .bind(2, ct.getTitle())
                        .bind(3, ct.getContent())
                        .bind(4, ct.getDate())
                        .execute();

    }

    public void update(Contact ct) {
        String sql = "UPDATE Feedback SET Fullname = ?, Email = ?, Title = ?, Content = ?, SendDate = ?, IsReply = ? WHERE ID = ?";
                handle.createUpdate(sql)
                        .bind(0, ct.getFullname())
                        .bind(1, ct.getEmail())
                        .bind(2, ct.getTitle())
                        .bind(3, ct.getContent())
                        .bind(4, ct.getDate())
                        .bind(5, ct.isReply())
                        .bind(6, ct.getId())
                        .execute();
    }

    public void delete(int id) {
        String sql = "DELETE FROM Feedback WHERE ID = ?";
                handle.createUpdate(sql)
                        .bind(0, id)
                        .execute();

    }

    public Contact getById(int id) {
        String sql = "SELECT * FROM Feedback WHERE ID = ?";
            return    handle.createQuery(sql)
                        .bind(0, id)
                        .mapToBean(Contact.class)
                        .findOne()
                        .orElse(null);

    }

    public List<Contact> getList() {
        String sql = "SELECT * FROM Feedback ORDER BY SendDate DESC";
        return handle.createQuery(sql)
                        .mapToBean(Contact.class)
                        .list();

    }




}
