package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.*;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

@MultipartConfig
@WebServlet(name = "get-product", value = "/admin/get-product")
public class GetProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        ProductDao pDao = new ProductDao(handle);
        CategoryDao cDao = new CategoryDao(handle);
        ManufacturerDao mDao = new ManufacturerDao(handle);
        SizeDao sDao = new SizeDao(handle);
        MaterialDao mtDao = new MaterialDao(handle);
        List<Product> ls = null;
        ls = pDao.findAll();
        List<Category> cs = cDao.findAll();
        List<Manufacturer> ms = mDao.findAll();
        List<Size> ss = sDao.findAll();
        List<Material> materials = mtDao.findAll();


        AjaxResponse resp = new AjaxResponse();
        resp.addProductList(ls);
        resp.addCategoryList(cs);
        resp.addManufacturerList(ms);
        resp.addSizeList(ss);
        resp.addMaterialList(materials);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());

        handle.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String size = request.getParameter("size");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");
        String category = request.getParameter("category");
        String material = request.getParameter("material");
        String manufacturer = request.getParameter("manufacturer");
        String promotion = request.getParameter("price_promotion");
        Part imgThumbnail = request.getPart("img_thumbnail");
        String[] colorId = request.getParameterValues("color_id");
        String[] specId = request.getParameterValues("spec_id");
        String[] spec = request.getParameterValues("spec");
        Collection<Part> parts = request.getParts();
        List<Part> partColor = new ArrayList<Part>();
        String editor = request.getParameter("editor");

        String uploadPath = getServletContext().getRealPath("/upload_image");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            boolean isCreatedFile = uploadDir.mkdir();
            if(!isCreatedFile) {
                JsonObject ob = new JsonObject();
                ob.addProperty("success", false);
                ob.addProperty("message", "Không thể tạo đuoc file");
                response.setStatus(HttpServletResponse.SC_OK);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print(ob);
                return;
            }
        }

        String filePath = null;
        String fileContextPath = null;

        if(imgThumbnail.getSize() > 0) {
            String thumbnailName = imgThumbnail.getSubmittedFileName();
            if (!thumbnailName.isEmpty() && !thumbnailName.endsWith(".jpg") && !thumbnailName.endsWith(".jpeg") && !thumbnailName.endsWith(".png")) {
                JsonObject ob = new JsonObject();
                ob.addProperty("success", false);
                ob.addProperty("message", "Chỉ hỗ trợ .jpg, .jpeg, .png");
                response.setStatus(HttpServletResponse.SC_OK);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print(ob);
                return;
            }

            String imgThumbnailNameRand = generateFileName();
            String thumbnailExtension = getFileExtension(thumbnailName);

            filePath = uploadPath + File.separator + imgThumbnailNameRand + thumbnailExtension;
            fileContextPath = "/" + "upload_image" + "/" + imgThumbnailNameRand + thumbnailExtension;
            writeImg(imgThumbnail, filePath);
        }

        String fileDesName = null;
        String fileDesPath =  null;

        if(editor != null) {
            String descriptionDir = getServletContext().getRealPath("/descriptions");
            File dir = new File(descriptionDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            fileDesName = "product_" + generateFileName() + ".html";
            fileDesPath = descriptionDir + "/" + fileDesName;

            // Lưu nội dung CKEditor vào file
            try (FileWriter fileWriter = new FileWriter(fileDesPath)) {
                fileWriter.write(editor);
            } catch (IOException e) {
                JsonObject ob = new JsonObject();
                ob.addProperty("success", false);
                ob.addProperty("message", "Không tạo được mô tả sản phẩm");
                response.setStatus(HttpServletResponse.SC_OK);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print(ob);
                return;
            }
        }
        Handle handle = DBConect.get().open();
        handle.begin();
        int success = 0;
        ProductDao dao = new ProductDao(handle);
        ProductColorImgDao daoColorImg = new ProductColorImgDao(handle);
        ProductSpecDao specDao = new ProductSpecDao(handle);
        Product c = new Product();

        c.setName(name);
        c.setSizeId(Integer.parseInt(size));
        c.setCategoryId(Integer.parseInt(category));
        c.setManufacturerId(Integer.parseInt(manufacturer));
        c.setMaterialId(Integer.parseInt(material));
        c.setPricePerBox(Integer.parseInt(price.replaceAll("[^0-9]", "")));
        c.setStatus(true);
        c.setDescription("/descriptions/" + fileDesName);
        promotion = promotion.replaceAll("[^0-9]", "");
        boolean isDiscount = !(promotion.isEmpty() || promotion.equals("0"));
        c.setDiscount(isDiscount);
        if(isDiscount) {
            c.setPromotionPrice(BigDecimal.valueOf(Double.parseDouble(promotion)));
        }
        c.setQuantityPerBox(Integer.parseInt(quantity.replaceAll("[^0-9]", "")));
        c.setImgThumbnail(fileContextPath);

       int productRowId = dao.insert(c);
       if (productRowId <= 0) {
           handle.rollback();
           JsonObject ob = new JsonObject();
           ob.addProperty("success", false);
           ob.addProperty("message", "Không tạo được sản phẩm");
           response.setStatus(HttpServletResponse.SC_OK);
           response.setContentType("application/json");
           response.setCharacterEncoding("UTF-8");
           PrintWriter out = response.getWriter();
           out.print(ob);
           handle.close();
           return;
       }
        AjaxResponse resp = new AjaxResponse();

        for (Part part : parts) {
            if (part.getName().equals("color") && part.getSize() > 0) {
                String fileName = part.getSubmittedFileName();
                if (checkFileEndPrefix(part)) {
                    partColor.add(part);
                } else {
                    handle.rollback();
                    handle.close();
                    JsonObject ob = new JsonObject();
                    ob.addProperty("success", false);
                    ob.addProperty("message", "Chỉ hỗ trợ .jpg, .jpeg, .png");
                    response.setStatus(HttpServletResponse.SC_OK);
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    PrintWriter out = response.getWriter();
                    out.print(ob);
                    return;
                }
            }
        }
        if (colorId != null) {
            for (int i = 0; i < colorId.length; i++) {
                Part part = partColor.get(i);
                String fileName = part.getSubmittedFileName();
                String partName = generateFileName();
                String partExtension = getFileExtension(fileName);
                String fileColorName = "/" + "upload_image" + "/" + partName + partExtension;
                String realFilePath = uploadPath + File.separator + partName + partExtension;
                ProductColorImg colorImg = new ProductColorImg();
                colorImg.setColorId(Integer.parseInt(colorId[i]));
                colorImg.setUrl(fileColorName);
                colorImg.setProductId(productRowId);
                int rowId = daoColorImg.insert(colorImg.getColorId(), colorImg.getProductId(), colorImg.getUrl());
                if (rowId > 0) {
                    writeImg(part, realFilePath);
                } else {
                    handle.rollback();
                    handle.close();
                    JsonObject ob = new JsonObject();
                    ob.addProperty("success", false);
                    ob.addProperty("message", "Không thể tạo màu sản phẩm");
                    response.setStatus(HttpServletResponse.SC_OK);
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    PrintWriter out = response.getWriter();
                    out.print(ob);
                    return;
                }

            }
        }

        if (specId != null) {
           for (int i = 0; i < specId.length; i++) {
                ProductSpec sp = new ProductSpec();
                sp.setSpecId(Integer.parseInt(specId[i]));
                sp.setProcuctId(productRowId);
                sp.setValue(spec[i]);
                int row = specDao.insert(sp);
                if (row <= 0) {
                    handle.rollback();
                    handle.close();
                    JsonObject ob = new JsonObject();
                    ob.addProperty("success", false);
                    ob.addProperty("message", "Không thể thêm thông số sản phẩm");
                    response.setStatus(HttpServletResponse.SC_OK);
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    PrintWriter out = response.getWriter();
                    out.print(ob);
                    return;
                }
           }

        }


        handle.commit();
        handle.close();

        JsonObject ob = new JsonObject();
        ob.addProperty("success", true);
        ob.addProperty("message", "Thêm sản phẩm thành công");
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(ob);

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productName = req.getParameter("name");
        String productPrice = req.getParameter("price");
        String size = req.getParameter("size");
        String category = req.getParameter("category");
        String manufacturer = req.getParameter("manufacturer");
        String quantity = req.getParameter("quantity");
        String material  = req.getParameter("material");
        String promotion = req.getParameter("promotion");
        String img = req.getParameter("img");
        String vid = req.getParameter("vid");

        JsonObject json = new JsonObject();

        Handle handle = DBConect.get().open();
        int success = 0;
        ProductDao dao = new ProductDao(handle);
        Product c = new Product();

        try {
            c.setId(Integer.parseInt(vid));
            c.setName(productName);
            c.setSizeId(Integer.parseInt(size));
            c.setCategoryId(Integer.parseInt(category));
            c.setManufacturerId(Integer.parseInt(manufacturer));
            c.setMaterialId(Integer.parseInt(material));
            c.setPricePerBox(Integer.parseInt(productPrice.replaceAll("[^0-9]", "")));
            promotion = promotion.replaceAll("[^0-9]", "");
            boolean isDiscount = !(promotion.equals("") || promotion.equals("0"));
            c.setDiscount(isDiscount);
            if(isDiscount) {
                c.setPromotionPrice(BigDecimal.valueOf(Double.parseDouble(promotion)));
            }
            c.setQuantityPerBox(Integer.parseInt(quantity.replaceAll("[^0-9]", "")));
            c.setImgThumbnail(img);
            success = dao.update(c);

            json.addProperty("success", success > 0);

            resp.setStatus(HttpServletResponse.SC_OK);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");

            PrintWriter out = resp.getWriter();
            out.print(json.toString());
        } catch (NumberFormatException e) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String active = req.getParameter("update_active_id");
        boolean realActive = getBoolVal(active);
        String jsonData = readPartToString(req.getPart("setActive"));
        int success = 0;
        Gson gson = new Gson();
        JsonArray setActiveArray = gson.fromJson(jsonData, JsonArray.class);

        JsonArray activated = new JsonArray();

        try(Handle handle = DBConect.get().open()) {
            for (JsonElement s : setActiveArray) {
                int parseIntergerIndex = Integer.parseInt(s.getAsString());
                int indexUpdated = new ProductDao(handle).updateActive(parseIntergerIndex, realActive);
                if (indexUpdated > 0) {
                   activated.add(parseIntergerIndex);
                   success++;
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

    private String readPartToString(Part part) throws IOException {
        if (part == null) return null;

        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(part.getInputStream(), "UTF-8"))) {
            StringBuilder stringBuilder = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                stringBuilder.append(line);
            }
            return stringBuilder.toString();
        }
    }

    private boolean getBoolVal(String value) {
        if(value.equalsIgnoreCase("true")) return true;
        else if(value.equalsIgnoreCase("false")) return false;
        return false;
    }

    private void writeImg(Part part, String filePath) throws ServletException {

        try (InputStream input = part.getInputStream()) {
            try (FileOutputStream output = new FileOutputStream(filePath)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = input.read(buffer)) != -1) {
                    output.write(buffer, 0, bytesRead);
                }
            }
        } catch (IOException e) {
            throw new ServletException(e);
        }
    }

    private boolean checkFileEndPrefix(Part part) {
        String fileName = part.getSubmittedFileName();
        return fileName.endsWith(".jpg") || fileName.endsWith(".jpeg") || fileName.endsWith(".png");
    }

    private String generateFileName() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmss");
        String timestamp = dateFormat.format(new Date());
        String uuid = UUID.randomUUID().toString();

        return timestamp + "_" + uuid;
    }

    public String getFileExtension(String fileName) {
        if (fileName == null || fileName.isEmpty()) {
            return "";
        }
        int lastDotIndex = fileName.lastIndexOf(".");
        if (lastDotIndex == -1 || lastDotIndex == fileName.length() - 1) {
            return "";
        }
        return fileName.substring(lastDotIndex);
    }
}