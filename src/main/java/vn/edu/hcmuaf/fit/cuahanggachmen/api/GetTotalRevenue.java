package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.service.SumaryStatisticService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
        Map<String, Integer> result = service.queryParam(paramRequest);

        Gson gson = new Gson();
        String json = gson.toJson(result);

        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json);

    }
}