package vn.edu.hcmuaf.fit.cuahanggachmen.utils;

import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;

import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

public class AjaxParseRequest {
    public static String[] parse(String object) {
        if(object == null) return null;
        object = object.trim();
        if (object.startsWith("[") && object.endsWith("]")) {
            object = object.substring(1, object.length() - 1);
        }

        String[] elements = object.split(",(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$)");

        List<String> result = new ArrayList<>();
        for (String element : elements) {
            result.add(element.trim().replaceAll("^\"|\"$", ""));
        }

        return result.toArray(new String[0]);
    }

    public static String productListToJson(List<Product> productList) {
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
}
