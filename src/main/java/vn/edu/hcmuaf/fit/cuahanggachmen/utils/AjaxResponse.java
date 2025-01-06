package vn.edu.hcmuaf.fit.cuahanggachmen.utils;

import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ReviewDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.*;

import java.sql.SQLException;
import java.util.List;
import java.util.StringJoiner;

public class AjaxResponse {
    private StringJoiner text;

    public AjaxResponse() {
       this.text = new StringJoiner(",", "{", "}");
    }

    public void addProductList(List<Product> productList) {
        this.text.add(String.format("\"products\":%s", productListToJson(productList)));
    }

    public void addReviewList(List<Review> reviewList) {
        this.text.add(String.format("\"review\":%s", reviewListToJson(reviewList)));
    }

    public void addColorList(List<Color> colorList) {
        this.text.add(String.format("\"colors\":%s", colorListToJson(colorList)));
    }

    public void addMaterialList(List<Material> materialList) {
        this.text.add(String.format("\"materials\":%s", materialListToJson(materialList)));
    }

    public void addSizeList(List<Size> sizeList) {
        this.text.add(String.format("\"sizes\":%s", sizesListToJson(sizeList)));
    }

    public void addSpecTypeList(List<SpecType> specTypeList) {
        this.text.add(String.format("\"specTypes\":%s", specTypeListToJson(specTypeList)));
    }

    public void addManufacturerList(List<Manufacturer> manufacturerList) {
        this.text.add(String.format("\"manufacturers\":%s", manufacturersListToJson(manufacturerList)));
    }

    public void addProductSpecList(List<ProductSpec> productSpecList) {
        this.text.add(String.format("\"productSpecs\":%s", productSpecListToJson(productSpecList)));
    }
    public void addInt(String fieldName, int value) {
        this.text.add(String.format("\"%s\":%d", fieldName, value));
    }

    public void addString(String fieldName, String value) {
        this.text.add(String.format("\"%s\":%s", fieldName, value));
    }

    public void addBool(String fieldName, boolean value) {
        this.text.add(String.format("\"%s\":%b", fieldName, value));
    }

    private String productListToJson(List<Product> productList) {
        StringJoiner jsonArrayJoiner = new StringJoiner(",", "[", "]");

        for (Product product : productList) {
            StringJoiner jsonProductJoiner = new StringJoiner(",", "{", "}");

            jsonProductJoiner.add(String.format("\"id\":%d", product.getId()))
                    .add(String.format("\"name\":\"%s\"", product.getName()))
                    .add(String.format("\"pricePerBox\":%d", product.getPricePerBox()))
                    .add(String.format("\"stock\":%d", product.getStock()))
                    .add(String.format("\"description\":\"%s\"", product.getDescription()))
                    .add(String.format("\"status\":%b", product.isStatus()))
                    .add(String.format("\"rating\":%d", product.getRating()))
                    .add(String.format("\"discount\":%b", product.isDiscount()))
                    .add(String.format("\"promotionPrice\":\"%s\"", product.getPromotionPrice()))
                    .add(String.format("\"quantityPerBox\":%d", product.getQuantityPerBox()))
                    .add(String.format("\"createDate\":\"%s\"", product.getCreateDate()))
                    .add(String.format("\"categoryId\":%d", product.getCategoryId()))
                    .add(String.format("\"sizeId\":%d", product.getSizeId()))
                    .add(String.format("\"materialId\":%d", product.getMaterialId()))
                    .add(String.format("\"manufacturerId\":%d", product.getManufacturerId()))
                    .add(String.format("\"imgThumbnail\":\"%s\"", product.getImgThumbnail()));

            // Thêm đối tượng product vào mảng JSON
            jsonArrayJoiner.add(jsonProductJoiner.toString());
        }

        return jsonArrayJoiner.toString();
    }

    private String reviewListToJson(List<Review> reviewList) {
        StringJoiner jsonArrayJoiner = new StringJoiner(",", "[", "]");

        for (Review review : reviewList) {
            StringJoiner jsonReviewJoiner = new StringJoiner(",", "{", "}");

            jsonReviewJoiner.add(String.format("\"userId\":%d", review.getUserId()))
                    .add(String.format("\"userName\":\"%s\"", review.getUserName()))
                    .add(String.format("\"productId\":%d", review.getProductId()))
                    .add(String.format("\"rating\":%d", review.getRating()))
                    .add(String.format("\"reviewText\":\"%s\"", review.getReviewText()))
                    .add(String.format("\"reviewDate\":\"%s\"", review.getReviewDate()))
                    .add(String.format("\"orderId\":%d", review.getOrderId()))
                    .add(String.format("\"avatar\":\"%s\"", review.getAvatar()));

            // Thêm đối tượng review vào mảng JSON
            jsonArrayJoiner.add(jsonReviewJoiner.toString());
        }

        return jsonArrayJoiner.toString();
    }

    private String productSpecListToJson(List<ProductSpec> productSpecList) {
        StringJoiner jsonArrayJoiner = new StringJoiner(",", "[", "]");

        for (ProductSpec pSpec : productSpecList) {
            StringJoiner jsonReviewJoiner = new StringJoiner(",", "{", "}");

            jsonReviewJoiner.add(String.format("\"productId\":%d", pSpec.getProcuctId()))
                    .add(String.format("\"specId\":%d", pSpec.getSpecId()))
                    .add(String.format("\"specName\":\"%s\"", pSpec.getSpecName()))
                    .add(String.format("\"value\":\"%s\"", pSpec.getValue()));

            // Thêm đối tượng review vào mảng JSON
            jsonArrayJoiner.add(jsonReviewJoiner.toString());
        }

        return jsonArrayJoiner.toString();
    }

    private String colorListToJson(List<Color> colorSpecList) {
        StringJoiner jsonArrayJoiner = new StringJoiner(",", "[", "]");

        for (Color cl : colorSpecList) {
            StringJoiner jsonColorJoiner = new StringJoiner(",", "{", "}");

            jsonColorJoiner.add(String.format("\"Id\":%d", cl.getID()))
                    .add(String.format("\"Name\":\"%s\"", cl.getName()));

            jsonArrayJoiner.add(jsonColorJoiner.toString());
        }

        return jsonArrayJoiner.toString();
    }

    private String materialListToJson(List<Material> matList) {
        StringJoiner jsonArrayJoiner = new StringJoiner(",", "[", "]");

        for (Material mat : matList) {
            StringJoiner jsonColorJoiner = new StringJoiner(",", "{", "}");

            jsonColorJoiner.add(String.format("\"Id\":%d", mat.getId()))
                    .add(String.format("\"Name\":\"%s\"", mat.getName()));

            jsonArrayJoiner.add(jsonColorJoiner.toString());
        }

        return jsonArrayJoiner.toString();
    }

    private String manufacturersListToJson(List<Manufacturer> manuList) {
        StringJoiner jsonArrayJoiner = new StringJoiner(",", "[", "]");

        for (Manufacturer manu : manuList) {
            StringJoiner jsonColorJoiner = new StringJoiner(",", "{", "}");

            jsonColorJoiner.add(String.format("\"Id\":%d", manu.getId()))
                    .add(String.format("\"Name\":\"%s\"", manu.getName()));

            jsonArrayJoiner.add(jsonColorJoiner.toString());
        }

        return jsonArrayJoiner.toString();
    }

    private String sizesListToJson(List<Size> sizeList) {
        StringJoiner jsonArrayJoiner = new StringJoiner(",", "[", "]");

        for (Size size : sizeList) {
            StringJoiner jsonColorJoiner = new StringJoiner(",", "{", "}");

            jsonColorJoiner.add(String.format("\"Id\":%d", size.getId()))
                    .add(String.format("\"Name\":\"%s\"", size.getName()));

            jsonArrayJoiner.add(jsonColorJoiner.toString());
        }

        return jsonArrayJoiner.toString();
    }

    private String specTypeListToJson(List<SpecType> specTypeList) {
        StringJoiner jsonArrayJoiner = new StringJoiner(",", "[", "]");

        for (SpecType spec : specTypeList) {
            StringJoiner jsonColorJoiner = new StringJoiner(",", "{", "}");

            jsonColorJoiner.add(String.format("\"Id\":%d", spec.getId()))
                    .add(String.format("\"Name\":\"%s\"", spec.getName()));

            jsonArrayJoiner.add(jsonColorJoiner.toString());
        }

        return jsonArrayJoiner.toString();
    }


    public String getText() {
        return text.toString();
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DBConect.mySqlDataSource();

        ProductDao dao = new ProductDao();

        ReviewDao rvDao = new ReviewDao();

        List<Product> ls = dao.findAll();

        List<Review> rv = rvDao.findReviewsByProductId(1);

        AjaxResponse ajaxResponse = new AjaxResponse();

//        ajaxResponse.addInt("age", 34);
//        ajaxResponse.addString("name", "phuc");
//        ajaxResponse.addBool("sex", true);

       // ajaxResponse.addProductList(ls);

        ajaxResponse.addReviewList(rv);
        System.out.println(ajaxResponse.getText());


    }
}
