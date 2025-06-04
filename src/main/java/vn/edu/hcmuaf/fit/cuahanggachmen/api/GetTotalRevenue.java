package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.controller.ContactManagerDetailController;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.RevenueByDay;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.SumaryStatisticService;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.LocalDateTimeAdapter;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@MultipartConfig
@WebServlet(name = "GetTotalRevenue", value = "/admin/total-revenue")
public class GetTotalRevenue extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String month = request.getParameter("month");
        String year = request.getParameter("year");
        Handle handle = DBConect.get().open();

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

        Map<String, String[]> params = request.getParameterMap();
        List<String> paramRequest = new ArrayList<String>();
        for (Map.Entry<String, String[]> entry : params.entrySet()) {
            String key = entry.getKey();
            String[] values = entry.getValue();

            for (String value : values) {
                paramRequest.add(key);
            }
        }

        SumaryStatisticService service = new SumaryStatisticService();
        Map<String, Integer> sumary = service.queryParam(paramRequest, month, year);
        Map<String, List<RevenueByDay>> revenueDay = Map.of(
                "revenueByDay",getRevenueByDay(handle, realMonth, realYear));
        Map<String , List<Product>> topSellingProduct = Map.of(
          "topSelling", getTopSellingProduct(handle, realMonth, realYear)
        );


        Map<String, Object> result = new HashMap<>();
        result.putAll(sumary);
        result.putAll(revenueDay);
        result.putAll(topSellingProduct);

        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                .create();
        String json = gson.toJson(result);


        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json);
        handle.close();

    }

    private List<RevenueByDay> getRevenueByDay(Handle handle, int month, int year) {
        OrderDao dao = new OrderDao(handle);
        return dao.getRevenueByDay(month, year);
    }

    private List<Product> getTopSellingProduct(Handle handle, int month, int year) {
        ProductDao dao = new ProductDao(handle);
        return dao.findTopSellingProducts(month, 5, 0);
    }
}