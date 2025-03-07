package vn.edu.hcmuaf.fit.cuahanggachmen.service;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.view_model.ProductFilter;

import java.sql.SQLException;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class ProductService {

    public List<Product> findByFilter(ProductFilter filter) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
//        ProductStorage storage = new ProductStorage();
        Handle handle = DBConect.get().open();
        List<Product> products = new ProductDao(handle).findAll();

        //price
        if (filter.havePriceRangeFilter()) {
            products = products.parallelStream().filter(product -> filter.isPrice(product.getPricePerBox())).collect(Collectors.toList());
        }


        //Manufacturer
        if(filter.haveOriginsFilter()) {
            products = products.parallelStream().filter(product -> filter.isManufacturer(product.getManufacturerId())).collect(Collectors.toList());
        }

        //size
        if (filter.haveSizesFilter()) {
            products = products.parallelStream().filter(product -> filter.isSize(product.getSizeId())).collect(Collectors.toList());
        }

        //category
        if(filter.haveCategoryFilter()) {
            products = products.parallelStream().filter(product -> filter.isCategory(product.getCategoryId())).collect(Collectors.toList());
        }

        //material
        if(filter.haveMaterialFilter()) {
            products = products.parallelStream().filter(product -> filter.isMaterial(product.getMaterialId())).collect(Collectors.toList());
        }



        int getTotalPages = (int) Math.ceil((double) products.size() / filter.getPageSize());
        filter.setTotalPages(getTotalPages);
        int fromIndex = (filter.getPage() - 1) * filter.getPageSize();
        int toIndex = Math.min(fromIndex + filter.getPageSize(), products.size());

        products = products.subList(fromIndex, toIndex);
        handle.close();
        return sortItem(products, filter);
    }

    private List<Product> sortItem(List<Product> products, ProductFilter filter) {
        return switch (filter.getSort()) {
            case 1 -> products.parallelStream().sorted(Comparator.comparing(Product::getName)).collect(Collectors.toList());
            case 2 -> products.parallelStream().sorted(Comparator.comparing(Product::getPricePerBox)).collect(Collectors.toList());
            case 3 -> products.parallelStream().sorted(Comparator.comparing(Product::getPricePerBox).reversed()).collect(Collectors.toList());
            default -> products;
        };
    }
}
