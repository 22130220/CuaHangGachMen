package vn.edu.hcmuaf.fit.cuahanggachmen.storage;

import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;

import java.sql.SQLException;
import java.util.List;

public class ProductStorage implements IServerStorage<Product> {
    private static List<Product> products;
    private static long updatePoint = 0;

    static {
        ProductDao dao = new ProductDao();
        try {
            products = dao.findAll();
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        updatePoint = System.currentTimeMillis();
    }

    @Override
    public void update() {
        long currentTime = System.currentTimeMillis();

        if(currentTime - updatePoint > 10000) {
            ProductDao pDao = new ProductDao();
            try {
                products = pDao.findAll();
                System.out.println("hon 10s");
                updatePoint = System.currentTimeMillis();
            } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public List<Product> getAll() {
        update();
        return products;
    }

    @Override
    public Product get(int id) {
        return products.stream().filter(product -> product.getId() == id).findFirst().orElse(null);
    }

}
