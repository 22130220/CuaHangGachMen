package vn.edu.hcmuaf.fit.cuahanggachmen.service;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SumaryStatisticService {
    private static List<String> param = new ArrayList<>(List.of("totalRevenue"));

    public Map<String, Integer> queryParam(List<String> param) {
        Handle handle = DBConect.get().open();
        Map<String, Integer> map = new HashMap<>();
        for (String s : param) {
            switch (s) {
                case "totalRevenue":
                    map.put("totalRevenue", getTotalRevenue(handle));
                    break;
            }
        }
        handle.close();
        return map;
    }

    private int getTotalRevenue(Handle handle) {
        OrderDao dao = new OrderDao(handle);
        return (int) dao.sumDoanhThu();
    }
}
