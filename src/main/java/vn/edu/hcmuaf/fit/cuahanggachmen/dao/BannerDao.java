package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.UnableToExecuteStatementException;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.ActionResult;
import vn.edu.hcmuaf.fit.cuahanggachmen.action.Result;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Banner;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.mapper.BannerMapper;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.time.LocalDateTime;
import java.util.List;

public class BannerDao extends BaseDao {

    public BannerDao(Handle handle) {
        super(handle);
    }

    // Lấy tất cả banner
    public List<Banner> getAllBanners() {
        return handle.createQuery("SELECT * FROM banners")
                .map(new BannerMapper())
                .list();
    }

    // Lấy banner theo ID
    public Banner getBannerById(int id) {
        return handle.createQuery("SELECT * FROM banners WHERE id = :id")
                .bind("id", id)
                .map(new BannerMapper())
                .findOne()
                .orElse(null);
    }

    // Thêm banner mới
    public ActionResult insertBanner(String title, String imageUrl, String link, String position,
                                     boolean isActive, LocalDateTime startDate, LocalDateTime endDate, int priority) {
        try {
            handle.createUpdate("INSERT INTO banners (title, image_url, link, position, is_active, start_date, end_date, priority) " +
                            "VALUES (:title, :imageUrl, :link, :position, :isActive, :startDate, :endDate, :priority)")
                    .bind("title", title)
                    .bind("imageUrl", imageUrl)
                    .bind("link", link)
                    .bind("position", position)
                    .bind("isActive", isActive)
                    .bind("startDate", startDate)
                    .bind("endDate", endDate)
                    .bind("priority", priority)
                    .execute();
            return Result.Ok();
        } catch (UnableToExecuteStatementException e) {
            Throwable cause = e.getCause();
            if (cause instanceof SQLIntegrityConstraintViolationException) {
                return Result.BadRequest("Dữ liệu không hợp lệ (các trường bắt buộc không được để trống).");
            }
            return Result.BadRequest(null);
        }
    }

    // Cập nhật banner
    public int updateBanner(Banner banner) {
        return handle.createUpdate("UPDATE banners SET title = :title, image_url = :imageUrl, link = :link, " +
                        "position = :position, is_active = :isActive, start_date = :startDate, end_date = :endDate, priority = :priority " +
                        "WHERE id = :id")
                .bind("title", banner.getTitle())
                .bind("imageUrl", banner.getImageUrl())
                .bind("link", banner.getLink())
                .bind("position", banner.getPosition())
                .bind("isActive", banner.isActive())
                .bind("startDate", banner.getStartDate())
                .bind("endDate", banner.getEndDate())
                .bind("priority", banner.getPriority())
                .bind("id", banner.getId())
                .execute();
    }

    // Xóa banner theo ID
    public void deleteBanner(int id) {
        handle.createUpdate("DELETE FROM banners WHERE id = :id")
                .bind("id", id)
                .execute();
    }

    // Đếm số lượng banner
    public int countBanners() {
        return handle.createQuery("SELECT COUNT(id) as total FROM banners WHERE is_active = true")
                .mapTo(Integer.class)
                .one();
    }

    // Lấy danh sách banner theo vị trí
    public List<Banner> getBannersByPosition(String position) {
        return handle.createQuery("SELECT * FROM banners WHERE position = :position AND is_active = true " +
                        "AND (start_date IS NULL OR start_date <= NOW()) " +
                        "AND (end_date IS NULL OR end_date >= NOW()) " +
                        "ORDER BY priority ASC")
                .bind("position", position)
                .map(new BannerMapper())
                .list();
    }
}