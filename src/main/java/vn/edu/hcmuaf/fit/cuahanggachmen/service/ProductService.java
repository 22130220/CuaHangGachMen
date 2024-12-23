package vn.edu.hcmuaf.fit.cuahanggachmen.service;

import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.view_model.ProductFilter;
import vn.edu.hcmuaf.fit.cuahanggachmen.storage.ProductStorage;

import java.util.Comparator;
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

        int getTotalPages = (int) Math.ceil((double) products.size() / filter.getPageSize());
        filter.setTotalPages(getTotalPages);
        int fromIndex = (filter.getPage() - 1) * filter.getPageSize();
        int toIndex = Math.min(fromIndex + filter.getPageSize(), products.size());

        products = products.subList(fromIndex, toIndex);

        return sortItem(products, filter);
    }

    private List<Product> sortItem(List<Product> products, ProductFilter filter) {
        return switch (filter.getSort()) {
            case 1 -> products.stream().sorted(Comparator.comparing(Product::getName)).collect(Collectors.toList());
            case 2 -> products.stream().sorted(Comparator.comparing(Product::getPricePerBox)).collect(Collectors.toList());
            case 3 -> products.stream().sorted(Comparator.comparing(Product::getPricePerBox).reversed()).collect(Collectors.toList());
            default -> products;
        };
    }
}
