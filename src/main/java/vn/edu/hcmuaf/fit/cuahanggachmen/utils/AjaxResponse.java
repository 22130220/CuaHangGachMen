package vn.edu.hcmuaf.fit.cuahanggachmen.utils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ReviewDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.*;

import java.sql.SQLException;
import java.util.List;
import java.util.StringJoiner;

public class AjaxResponse {
    private StringJoiner text;
    private HttpServletRequest request;

    public AjaxResponse() {
       this.text = new StringJoiner(",", "{", "}");
    }

    public void addProductList(List<Product> productList) {
        this.text.add(String.format("\"products\":%s", productListToJson(productList)));
    }

    public void addUserList(List<User> userList) {
        this.text.add(String.format("\"users\":%s", userListToJson(userList)));
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

    public void addCategoryList(List<Category> categoryList) {
        this.text.add(String.format("\"categories\":%s", categoryListToJson(categoryList)));
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

    public void addProductColorList(List<ProductColorImg> productColorList) {
        this.text.add(String.format("\"productColors\":%s", productColorListToJson(productColorList)));
    }

    public void addVoucherList(List<Voucher> voucherList) {
        this.text.add(String.format("\"vouchers\":%s", voucherListToJson(voucherList)));
    }

    public void addOrderList(List<Orders> ordersList) {
        this.text.add(String.format("\"orders\":%s", orderListToJson(ordersList)));
    }

    public void addOrderDetailList(List<OrderDetailWithName> ordersList) {
        this.text.add(String.format("\"orderdetail\":%s", orderDetailListToJson(ordersList)));
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

    public void addDouble(String fieldName, double value) {
        this.text.add(String.format("\"%s\":%f", fieldName, value));
    }
    
    public void addCartItem(List<CartItem> cartItemList) {
        this.text.add(String.format("\"cart_item\":%s", cartItemListToJson(cartItemList)));
    }

    public void setRequest(HttpServletRequest req) {
        this.request = req;
    }

    private String cartItemListToJson(List<CartItem> cartItemList) {
        StringJoiner jsonArrayJoiner = new StringJoiner(",", "[", "]");

        for (CartItem cartItem : cartItemList) {
            StringJoiner jsonCartItemJoiner = new StringJoiner(",", "{", "}");

            jsonCartItemJoiner.add(String.format("\"productId\":%d", cartItem.getProductId()))
                    .add(String.format("\"productName\":\"%s\"", cartItem.getProductName()))
                    .add(String.format("\"productColor\":\"%s\"", cartItem.getProductColor()))
                    .add(String.format("\"productImage\":\"%s\"", cartItem.getProductImage()))
                    .add(String.format("\"pricePerBox\":%d", cartItem.getPricePerBox()))
                    .add(String.format("\"quantity\":%d", cartItem.getQuantity()))
                    .add(String.format("\"quantityPerBox\":%d", cartItem.getQuantityPerBox()))
                    .add(String.format("\"totalPrice\":%d", cartItem.getTotalPrice()));

            // Thêm đối tượng cartItem vào mảng JSON
            jsonArrayJoiner.add(jsonCartItemJoiner.toString());
        }

        return jsonArrayJoiner.toString();
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

    private String voucherListToJson(List<Voucher> voucherList) {
        StringJoiner jsonArrayJoiner = new StringJoiner(",", "[", "]");

        for (Voucher vou : voucherList) {
            StringJoiner jsonReviewJoiner = new StringJoiner(",", "{", "}");

            jsonReviewJoiner.add(String.format("\"id\":%d", vou.getId()))
                    .add(String.format("\"code\":\"%s\"", vou.getCode()))
                    .add(String.format("\"discountValue\":%f", vou.getDiscountValue()))
                    .add(String.format("\"expireDate\":\"%s\"", vou.getExpireDate()))
                    .add(String.format("\"isActive\":%b", vou.isActive()));

            // Thêm đối tượng review vào mảng JSON
            jsonArrayJoiner.add(jsonReviewJoiner.toString());
        }

        return jsonArrayJoiner.toString();
    }

    private String categoryListToJson(List<Category> categoryList) {
        StringJoiner jsonArrayJoiner = new StringJoiner(",", "[", "]");

        for (Category cat : categoryList) {
            StringJoiner jsonReviewJoiner = new StringJoiner(",", "{", "}");

            jsonReviewJoiner.add(String.format("\"id\":%d", cat.getId()))
                    .add(String.format("\"name\":\"%s\"", cat.getName()))
                    .add(String.format("\"status\":%b", cat.isStatus()));

            jsonArrayJoiner.add(jsonReviewJoiner.toString());
        }

        return jsonArrayJoiner.toString();
    }

    private String productColorListToJson(List<ProductColorImg> pcList) {
        StringJoiner jsonArrayJoiner = new StringJoiner(",", "[", "]");

        for (ProductColorImg p : pcList) {
            StringJoiner jsonReviewJoiner = new StringJoiner(",", "{", "}");

            jsonReviewJoiner.add(String.format("\"id\":%d", p.getId()))
                    .add(String.format("\"productId\":%d", p.getProductId()))
                    .add(String.format("\"colorId\":%d", p.getColorId()))
                    .add(String.format("\"colorName\":\"%s\"", p.getColorName()))
                    .add(String.format("\"url\":\"%s\"",p.getUrl()));

            jsonArrayJoiner.add(jsonReviewJoiner.toString());
        }

        return jsonArrayJoiner.toString();
    }

    private String userListToJson(List<User> userList) {
        StringJoiner jsonArrayJoiner = new StringJoiner(",", "[", "]");

        for (User user : userList) {
            StringJoiner jsonUserJoiner = new StringJoiner(",", "{", "}");

            jsonUserJoiner.add(String.format("\"id\":%d", user.getId()))
                    .add(String.format("\"fullname\":\"%s\"", user.getFullname()))
                    .add(String.format("\"email\":\"%s\"", user.getEmail()))
                    .add(String.format("\"phone\":\"%s\"", user.getPhone()))
                    .add(String.format("\"avatar\":\"%s\"", user.getAvatar()))
                    .add(String.format("\"address\":\"%s\"", user.getAddress()))
                    .add(String.format("\"birthtime\":\"%s\"", user.getBirthtime() != null ? user.getBirthtime().toString() : null))
                    .add(String.format("\"status\":%b", user.isStatus()))
                    .add(String.format("\"createtime\":\"%s\"", user.getCreatetime() != null ? user.getCreatetime().toString() : null))
                    .add(String.format("\"salt\":\"%s\"", user.getSalt()))
                    .add(String.format("\"role\":%d", user.getRole()))
                    .add(String.format("\"password\":\"%s\"", user.getPassword()))
                    .add(String.format("\"sex\":%d", user.getSex()));

            // Thêm đối tượng user vào mảng JSON
            jsonArrayJoiner.add(jsonUserJoiner.toString());
        }

        return jsonArrayJoiner.toString();
    }


    private String orderListToJson(List<Orders> ordersList) {
        StringJoiner jsonArrayJoiner = new StringJoiner(",", "[", "]");

        for (Orders orders : ordersList) {
            StringJoiner jsonOrderJoiner = new StringJoiner(",", "{", "}");

            jsonOrderJoiner.add(String.format("\"id\":%d", orders.getId()))
                    .add(String.format("\"userId\":%d", orders.getUserId()))
                    .add(String.format("\"orderDate\":\"%s\"", orders.getOrderDate() != null ? orders.getOrderDate().toString() : null))
                    .add(String.format("\"address\":\"%s\"", orders.getAddress()))
                    .add(String.format("\"status\":\"%s\"", orders.getStatus()))
                    .add(String.format("\"totalPrice\":%.2f", orders.getTotalPrice() != null ? orders.getTotalPrice() : 0.0))
                    .add(String.format("\"description\":\"%s\"", orders.getDescription() != null ? orders.getDescription() : ""))
                    .add(String.format("\"createDate\":\"%s\"", orders.getCreateDate() != null ? orders.getCreateDate().toString() : null))
                     .add(String.format("\"fullName\":\"%s\"", orders.getFullName()));

            // Add the JSON object for this order to the array
            jsonArrayJoiner.add(jsonOrderJoiner.toString());
        }

        return jsonArrayJoiner.toString();
    }

    public String orderDetailListToJson(List<OrderDetailWithName> orderDetailList) {
        // Sử dụng StringJoiner để xây dựng mảng JSON
        StringJoiner jsonArrayJoiner = new StringJoiner(",", "[", "]");

        for (OrderDetailWithName detail : orderDetailList) {
            // Sử dụng StringJoiner để xây dựng từng đối tượng JSON
            StringJoiner jsonOrderJoiner = new StringJoiner(",", "{", "}");

            jsonOrderJoiner.add(String.format("\"orderId\":%d", detail.getOrderId()))
                    .add(String.format("\"productId\":%d", detail.getProductId()))
                    .add(String.format("\"quantity\":%d", detail.getQuantity()))
                    .add(String.format("\"price\":%d", detail.getPrice()))
                    .add(String.format("\"createDate\":\"%s\"", detail.getCreateDate() != null ? detail.getCreateDate().toString() : null))
                    .add(String.format("\"color\":\"%s\"", detail.getColor() != null ? detail.getColor() : ""))
                    .add(String.format("\"name\":\"%s\"", detail.getName() != null ? detail.getName() : ""))
                    .add(String.format("\"img\":\"%s\"", detail.getImg() != null ? detail.getImg() : ""));

            // Thêm đối tượng JSON này vào mảng JSON
            jsonArrayJoiner.add(jsonOrderJoiner.toString());
        }

        // Trả về chuỗi JSON hoàn chỉnh
        return jsonArrayJoiner.toString();
    }


    public String getText() {
        return text.toString();
    }

}
