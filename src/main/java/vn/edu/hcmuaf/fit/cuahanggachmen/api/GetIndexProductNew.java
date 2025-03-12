package vn.edu.hcmuaf.fit.cuahanggachmen.api;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "GetIndexProduct", value = "/loadmore")
public class GetIndexProductNew extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Locale userLocale = request.getLocale();
//        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(userLocale);
        DecimalFormatSymbols symbols = new DecimalFormatSymbols();
        symbols.setGroupingSeparator('.'); // Dùng dấu chấm thay vì dấu phẩy

        DecimalFormat currencyFormat = new DecimalFormat("#,###đ", symbols);
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String amount = request.getParameter("exist");
        int iamount = Integer.parseInt(amount);
        Handle handle = DBConect.get().open();
        ProductDao pd = new ProductDao(handle);
        List<Product> list = null;
        list = pd.findLatestProducts(iamount);
        if(list.size() > 0) {
            PrintWriter out = response.getWriter();
            // Bắt đầu khối popular mới
            out.println("<div class=\"popular\" id=\"popular\">");
            out.println("<div class=\"main-content\">");
            out.println("<div class=\"course-list\">");

// Thêm các sản phẩm
            for (Product p : list) {
                out.println("<!-- Course item -->");
                out.println("<div class=\"course-item cc\">");
                out.println("<a href=\"/pdetail?pid=" + p.getId() + "\">");
                out.println("<img src=\"" + p.getImgThumbnail() + "\" alt=\"" + p.getName() + "\" class=\"thumb\"/>");
                out.println("</a>");
                out.println("<div class=\"info\">");
                out.println("<div class=\"head\">");
                out.println("<div class=\"title\">");
                out.println("<a href=\"#!\" class=\"line-clamp break-all\">" + p.getName() + "</a>");
                out.println("</div>");
                out.println("<div class=\"rating\">");
                out.println("<img src=\"/assets/img/star.svg\" alt=\"Star\" class=\"star\"/>");
                out.println("<span class=\"value\">" + p.getRating() + "</span>");
                out.println("</div></div>");
                out.println("<div class=\"foot\">");
                out.println("<span class=\"price\">" + currencyFormat.format(p.getPricePerBox()) + "</span>");
                out.println("<form action=\"" + request.getContextPath() + "/add-to-cart\" method=\"post\" class=\"add-to-cart-form\">");
                out.println("<input type=\"hidden\" name=\"productId\" value=\"" + p.getId() + "\">");
                out.println("<input type=\"hidden\" name=\"colorId\" value=\"1\">");
                out.println("<input type=\"hidden\" name=\"quantity\" value=\"1\">");
                out.println("<a href=\"javascript:void(0)\" class=\"add-to-cart-btn\">");
                out.println("<svg class=\"icon\" width=\"30\" height=\"30\" viewBox=\"0 0 24 24\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">");
                out.println("<path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z\" fill=\"#2e2100ff\"/>");
                out.println("<path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z\" fill=\"#2e2100ff\"/>");
                out.println("<path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z\" fill=\"#2e2100ff\"/>");
                out.println("</svg>");
                out.println("</a>");
                out.println("</form>");  // Đóng thẻ form
                out.println("<form action=\""+request.getContextPath() + "/buynow\" method=\"get\">");
                out.println("<input type=\"hidden\" name=\"pid\" value=\"" + p.getId() + "\">");
                out.println("<input type=\"hidden\" name=\"colorId\" value=\"1\">");
                out.println("<input type=\"hidden\" name=\"quantity\" value=\"1\">");
                out.println("<button type=\"submit\" class=\"btn book-btn\">Đặt ngay</button>");
                out.println("</form>");
                out.println("</div>");  // Đóng thẻ foot
                out.println("</div>");  // Đóng thẻ info
                out.println("</div>");  // Đóng thẻ course-item
            }

// Kết thúc khối popular
            out.println("</div></div></div>");
        }

        handle.close();

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        String defaultShow = request.getParameter("defaultshow");
        String funcProduct = request.getParameter("func_product");
        List<Product> ls = new ArrayList<>();
        ProductDao dao = new ProductDao(handle);
        if (funcProduct.equals("nw_product")) {
            ls = dao.findLatestProducts(Integer.parseInt(defaultShow));
        }

        AjaxResponse resp = new AjaxResponse();
        resp.addBool("success", true);
        resp.addProductList(ls);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
        handle.close();
    }
}
