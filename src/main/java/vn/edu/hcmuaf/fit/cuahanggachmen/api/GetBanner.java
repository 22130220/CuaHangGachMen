package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.BannerDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Banner;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "GetBanner", value = "/admin/get-banner")
public class GetBanner extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Handle handle = DBConect.get().open()) {
            BannerDao bannerDao = new BannerDao(handle);
            List<Banner> banners = bannerDao.getAllBanners();

            AjaxResponse resp = new AjaxResponse();
            resp.addBannerList(banners);

            response.setStatus(HttpServletResponse.SC_OK);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(resp.getText());
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String title = req.getParameter("title");
        String imageUrl = req.getParameter("image_url");
        String link = req.getParameter("link");
        String position = req.getParameter("position");
        String isActive = req.getParameter("is_active");
        String priority = req.getParameter("priority");
        String startDate = req.getParameter("start_date");
        String endDate = req.getParameter("end_date");

        JsonObject json = new JsonObject();

        try (Handle handle = DBConect.get().open()) {
            BannerDao bannerDao = new BannerDao(handle);
            Banner banner = new Banner();
            banner.setId(Integer.parseInt(id));
            banner.setTitle(title);
            banner.setImageUrl(imageUrl);
            banner.setLink(link);
            banner.setPosition(position);
            banner.setActive(Boolean.parseBoolean(isActive));
            banner.setPriority(Integer.parseInt(priority));
            banner.setStartDate(startDate.isEmpty() ? null : LocalDateTime.parse(startDate));
            banner.setEndDate(endDate.isEmpty() ? null : LocalDateTime.parse(endDate));
            banner.setUpdatedAt(LocalDateTime.now());

            int success = bannerDao.updateBanner(banner);
            json.addProperty("success", success > 0);

            resp.setStatus(HttpServletResponse.SC_OK);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            PrintWriter out = resp.getWriter();
            out.print(json.toString());
        } catch (NumberFormatException e) {
            json.addProperty("success", false);
            json.addProperty("message", "Dữ liệu không hợp lệ");
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            PrintWriter out = resp.getWriter();
            out.print(json.toString());
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String active = req.getParameter("update_active_id");
        boolean realActive = Boolean.parseBoolean(active);
        String jsonData = readPartToString(req.getParameter("setActive"));
        int success = 0;
        Gson gson = new Gson();
        JsonArray setActiveArray = gson.fromJson(jsonData, JsonArray.class);

        JsonArray activated = new JsonArray();

        try (Handle handle = DBConect.get().open()) {
            BannerDao bannerDao = new BannerDao(handle);
            for (JsonElement s : setActiveArray) {
                int bannerId = Integer.parseInt(s.getAsString());
                Banner banner = bannerDao.getBannerById(bannerId);
                if (banner != null) {
                    banner.setActive(realActive);
                    banner.setUpdatedAt(LocalDateTime.now());
                    int updated = bannerDao.updateBanner(banner);
                    if (updated > 0) {
                        activated.add(bannerId);
                        success++;
                    }
                }
            }
        }

        JsonObject json = new JsonObject();
        json.addProperty("success", success > 0);
        json.addProperty("active", realActive);
        if (success > 0) {
            json.add("activated", activated);
        }

        resp.setStatus(HttpServletResponse.SC_OK);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.print(json.toString());
    }

    private String readPartToString(String data) {
        return data;
    }
}
