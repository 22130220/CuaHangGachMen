package vn.edu.hcmuaf.fit.cuahanggachmen.utils;

import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;

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

    public String getText() {
        return text.toString();
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DBConect.mySqlDataSource();

        ProductDao dao = new ProductDao();

        List<Product> ls = dao.findAll();

        AjaxResponse ajaxResponse = new AjaxResponse();

        ajaxResponse.addInt("age", 34);
        ajaxResponse.addString("name", "phuc");
        ajaxResponse.addBool("sex", true);


        System.out.println(ajaxResponse.getText());


    }
}
