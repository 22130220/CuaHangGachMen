package vn.edu.hcmuaf.fit.cuahanggachmen.service;

import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.view_model.ProductFilter;
import vn.edu.hcmuaf.fit.cuahanggachmen.storage.ProductStorage;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ProductService {

    public List<Product> findByFilter(ProductFilter filter) {
        ProductStorage storage = new ProductStorage();
        List<Product> products = storage.getAll();

        //Manufacturer
        if(filter.haveOriginsFilter()) {
            products = products.stream().filter(product -> filter.isManufacturer(product.getManufacturerId())).collect(Collectors.toList());
        }

//        //size
//        if (filter.haveSizesFilter()) {
//            products = products.stream().filter(product -> filter.isSize(product.getSizeId())).collect(Collectors.toList());
//
//        }
//
//        //price
//        if (filter.havePriceRangeFilter()) {
//            products = products.stream().filter(product -> filter.isPrice(product.getPricePerBox())).collect(Collectors.toList());
//        }

        return products;
    }
}
