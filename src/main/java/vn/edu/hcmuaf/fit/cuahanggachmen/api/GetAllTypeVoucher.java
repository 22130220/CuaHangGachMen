package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.TypeOutOfStockDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.VoucherTypeDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.TypeOutOfStock;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.VoucherType;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetAllTypeVoucher", value = "/GetAllTypeVoucher")
public class GetAllTypeVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        VoucherTypeDao voucherTypeDao = new VoucherTypeDao(handle);
        List<VoucherType> voucherTypes = voucherTypeDao.getListActive();
        Gson gson = new Gson();
        String json = gson.toJson(voucherTypes);
        response.setContentType("application/json");
        response.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}