package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.BannerDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Banner;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "get-banner", value = "/admin/get-banner")
public class GetBanner extends HttpServlet {
    private Gson gson = new GsonBuilder()
            .registerTypeAdapter(LocalDateTime.class, new TypeAdapter<LocalDateTime>() {
                @Override
                public void write(JsonWriter jsonWriter, LocalDateTime localDateTime) throws IOException {
                    if (localDateTime != null) {
                        jsonWriter.value(localDateTime.toString());
                    } else {
                        jsonWriter.nullValue();
                    }
                }

                @Override
                public LocalDateTime read(JsonReader jsonReader) throws IOException {
                    String dateStr = jsonReader.nextString();
                    return dateStr != null && !dateStr.isEmpty() ? LocalDateTime.parse(dateStr) : null;
                }
            })
            .create();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        BannerDao bannerDao = new BannerDao(handle);

        List<Banner> banners = bannerDao.getAllBanners();
        List<String> positions = Arrays.asList("Home", "Category", "Cart", "Checkout", "Blog");

        JsonObject resp = new JsonObject();
        resp.add("banners", gson.toJsonTree(banners));
        resp.add("positions", gson.toJsonTree(positions));

        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.toString());

        handle.close();
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String imageUrl = request.getParameter("image_url");
        String link = request.getParameter("link");
        String position = request.getParameter("position");
        String startDateStr = request.getParameter("start_date");
        String endDateStr = request.getParameter("end_date");
        String priorityStr = request.getParameter("priority");
        String id = request.getParameter("id");

        JsonObject json = new JsonObject();
        Handle handle = DBConect.get().open();
        try {
            // Kiểm tra hợp lệ
            if (title == null || title.trim().isEmpty() || imageUrl == null || imageUrl.trim().isEmpty() ||
                    priorityStr == null || priorityStr.trim().isEmpty() || id == null || id.trim().isEmpty()) {
                json.addProperty("success", false);
                json.addProperty("message", "Tiêu đề, URL hình ảnh, mức ưu tiên và ID là bắt buộc");
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write(json.toString());
                return;
            }

            int priority = Integer.parseInt(priorityStr);
            if (priority < 0) {
                json.addProperty("success", false);
                json.addProperty("message", "Mức ưu tiên không được âm");
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write(json.toString());
                return;
            }

            List<String> validPositions = Arrays.asList("Home", "Category", "Cart", "Checkout", "Blog");
            if (!validPositions.contains(position)) {
                json.addProperty("success", false);
                json.addProperty("message", "Vị trí không hợp lệ");
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write(json.toString());
                return;
            }

            Banner banner = new Banner();
            banner.setId(Integer.parseInt(id));
            banner.setTitle(title);
            banner.setImageUrl(imageUrl);
            banner.setLink(link);
            banner.setPosition(position);
            banner.setStartDate(startDateStr != null && !startDateStr.isEmpty() ? LocalDateTime.parse(startDateStr) : null);
            banner.setEndDate(endDateStr != null && !endDateStr.isEmpty() ? LocalDateTime.parse(endDateStr) : null);
            banner.setPriority(priority);

            BannerDao bannerDao = new BannerDao(handle);
            int success = bannerDao.updateBannerDetails(banner); // Sử dụng phương thức mới
            json.addProperty("success", success > 0);
            if (success == 0) {
                json.addProperty("message", "Không tìm thấy banner hoặc không có thay đổi");
            }

            response.setStatus(HttpServletResponse.SC_OK);
        } catch (NumberFormatException e) {
            json.addProperty("success", false);
            json.addProperty("message", "ID hoặc mức ưu tiên không hợp lệ");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        } catch (Exception e) {
            json.addProperty("success", false);
            json.addProperty("message", "Lỗi khi cập nhật banner: " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } finally {
            handle.close();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(json.toString());
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String active = request.getParameter("update_active_id");
        boolean realActive = getBoolVal(active);
        String jsonData = readPartToString(request.getParameter("setActive"));
        int success = 0;
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDateTime.class, new TypeAdapter<LocalDateTime>() {
                    @Override
                    public void write(JsonWriter jsonWriter, LocalDateTime localDateTime) throws IOException {
                        if (localDateTime != null) jsonWriter.value(localDateTime.toString());
                        else jsonWriter.nullValue();
                    }
                    @Override
                    public LocalDateTime read(JsonReader jsonReader) throws IOException {
                        String dateStr = jsonReader.nextString();
                        return dateStr != null && !dateStr.isEmpty() ? LocalDateTime.parse(dateStr) : null;
                    }
                })
                .create();
        JsonArray setActiveArray = gson.fromJson(jsonData, JsonArray.class);

        if (setActiveArray == null || setActiveArray.isEmpty()) {
            JsonObject json = new JsonObject();
            json.addProperty("success", false);
            json.addProperty("message", "Không có banner nào được chọn");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json.toString());
            return;
        }

        JsonArray activated = new JsonArray();
        try (Handle handle = DBConect.get().open()) {
            BannerDao bannerDao = new BannerDao(handle);
            for (JsonElement s : setActiveArray) {
                int bannerId = Integer.parseInt(s.getAsString());
                int indexUpdated = bannerDao.updateBannerStatus(bannerId, realActive); // Sử dụng phương thức mới
                if (indexUpdated > 0) {
                    activated.add(bannerId);
                    success++;
                }
            }
        } catch (NumberFormatException e) {
            JsonObject json = new JsonObject();
            json.addProperty("success", false);
            json.addProperty("message", "ID banner không hợp lệ");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json.toString());
            return;
        } catch (Exception e) {
            JsonObject json = new JsonObject();
            json.addProperty("success", false);
            json.addProperty("message", "Lỗi khi cập nhật trạng thái: " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json.toString());
            return;
        }

        JsonObject json = new JsonObject();
        json.addProperty("success", success > 0);
        json.addProperty("active", realActive);
        if (success > 0) json.add("activated", activated);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json.toString());
    }

    private String readPartToString(String data) throws IOException {
        if (data == null) return null;
        return data;
    }

    private boolean getBoolVal(String value) {
        if (value.equalsIgnoreCase("true")) return true;
        else if (value.equalsIgnoreCase("false")) return false;
        return false;
    }
}