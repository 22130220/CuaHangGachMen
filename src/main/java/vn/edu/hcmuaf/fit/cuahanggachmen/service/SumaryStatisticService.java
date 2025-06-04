package vn.edu.hcmuaf.fit.cuahanggachmen.service;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.StockInDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.RevenueByDay;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.RevenueByMonth;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SumaryStatisticService {

    public Map<String, Integer> queryParam(List<String> param, String month, String year) {
        int realMonth, realYear;
        // Get today
        LocalDateTime time =  LocalDateTime.now();
        if (month == null || month.isEmpty()) {
            realMonth = time.getMonthValue();
        } else {
            realMonth = Integer.parseInt(month);
        }
        if (year == null || year.isEmpty()) {
            realYear = time.getYear();
        } else {
            realYear = Integer.parseInt(year);
        }

        Handle handle = DBConect.get().open();
        Map<String, Integer> map = new HashMap<>();
        for (String s : param) {
            switch (s) {
                case "totalRevenue" -> {
                    map.put("totalRevenue", getTotalRevenue(handle, realMonth, realYear));
                }

                case "outStock" -> {
                    map.put("outStock", getSumOfOutProducts(handle, realMonth, realYear));
                }
                case "inStock" -> {
                    map.put("inStock", getSumOfInProducts(handle, realMonth, realYear));
                }
                case "profit" -> {
                    map.put("profit", getProfit(handle, realMonth, realYear));
                }
                default -> {

                }
            }
        }
        handle.close();
        return map;
    }

    private int getTotalRevenue(Handle handle, int month, int year) {
        OrderDao dao = new OrderDao(handle);
        return (int) dao.sumDoanhThuTheoThang(month, year);
    }

    private int getSumOfOutProducts(Handle handle, int month, int year) {
        OrderDao dao = new OrderDao(handle);
        return (int) dao.getTotalDeliveredByMonth(month, year);
    }

    private int getSumOfInProducts(Handle handle, int month, int year) {
        StockInDao dao = new StockInDao(handle);
        return (int) dao.getTotalStockInByMonth(month, year);
    }

    private int getProfit(Handle handle, int month, int year) {
        OrderDao dao = new OrderDao(handle);
        return (int) dao.getProfit(month, year);
    }
}
