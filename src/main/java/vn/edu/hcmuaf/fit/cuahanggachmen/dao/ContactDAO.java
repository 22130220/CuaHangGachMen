package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Contact;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper.ColorNUrlMapper;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper.ContactMapper;

import java.util.List;

public class ContactDAO extends BaseDao{

    public ContactDAO(Handle handle) {
        super(handle, true, 3 * 60, 1000);
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
        invalidateCache("contact_" + ct.getId());
        invalidateCache("contact_all");

    }

    public void update(Contact ct) {
        String sql = "UPDATE contact SET Fullname = ?, Email = ?, Title = ?, Content = ?, SendDate = ?, IsReply = ?, Response = ? WHERE ID = ?";
                handle.createUpdate(sql)
                        .bind(0, ct.getFullname())
                        .bind(1, ct.getEmail())
                        .bind(2, ct.getTitle())
                        .bind(3, ct.getContent())
                        .bind(4, ct.getDate())
                        .bind(5, ct.isReply())
                        .bind(6, ct.getResponse())
                        .bind(7, ct.getId())
                        .execute();
        invalidateCache("contact_" + ct.getId());
        invalidateCache("contact_all");
    }

    public void delete(int id) {
        String sql = "DELETE FROM contact WHERE ID = ?";
        handle.createUpdate(sql).bind(0, id).execute();
        invalidateCache("contact_" + id);
        invalidateCache("contact_all");
    }

    public Contact getById(int id) {
        String cacheKey = "contact_" + id;
        return getFromCacheOrCompute(cacheKey, Contact.class, () ->
                handle.createQuery("SELECT * FROM contact WHERE ID = ?;")
                        .bind(0, id)
                        .map(new ContactMapper())
                        .findOne()
                        .orElse(null)
        );
    }

    public List<Contact> getList() {
        String cacheKey = "contact_all";
        return getFromCacheOrCompute(cacheKey, List.class, () ->
                handle.createQuery("SELECT * FROM contact")
                        .map(new ContactMapper())
                        .list()
        );
    }

    public static void main(String[] args) {
        DBConect.mySqlDataSource();
        Handle handle = DBConect.get().open();
        ContactDAO dao = new ContactDAO(handle);
        List<Contact> list = dao.getList();
        for (Contact ct : list) {
            System.out.println(ct);
        }
    }




}
