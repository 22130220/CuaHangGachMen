package vn.edu.hcmuaf.fit.cuahanggachmen.controller;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.OrderDetailDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ReviewDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Review;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.AjaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "comment", value = "/comment")
public class CommentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Handle handle = DBConect.get().open();
        String pid = request.getParameter("productId");
        Integer id = Integer.parseInt(pid);
        ReviewDao dao = new ReviewDao(handle);
        List<Review> rv = null;
       rv = dao.findReviewsByProductId(id);

        AjaxResponse resp =  new AjaxResponse();
        resp.addReviewList(rv);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
        handle.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        if (session == null || user == null) {
            response.getWriter().write("{\"redirectUrl\": \"/login\"}");
            return;
        }

        String comment_text = request.getParameter("comment_text");
        String productId = request.getParameter("productId");
        String rating = request.getParameter("rating");

        Handle handle = DBConect.get().open();
        ReviewDao reviewDao = new ReviewDao(handle);
        OrderDetailDao orderDetailDao = new OrderDetailDao(handle);
        ProductDao productDao = new ProductDao(handle);

        int userId = user.getId();
        int productIdInt = Integer.parseInt(productId);

        // Kiểm tra xem người dùng đã mua sản phẩm chưa
        if (!orderDetailDao.hasUserPurchasedProduct(userId, productIdInt)) {
            response.getWriter().write("{\"error\": \"Vui lòng mua sản phẩm trước khi bình luận\"}");
            handle.close();
            return;
        }

        // Kiểm tra xem người dùng đã bình luận trước đó chưa
        if (reviewDao.hasUserReviewedProduct(userId, productIdInt)) {
            response.getWriter().write("{\"error\": \"Bạn đã bình luận trước đó rồi\"}");
            handle.close();
            return;
        }

        Review review = new Review();
        review.setUserId(userId);
        review.setProductId(productIdInt);
        review.setRating(rating != null ? Integer.parseInt(rating) : 5);
        review.setReviewDate(LocalDateTime.now());
        review.setOrderId(1); // Giả sử orderId là 1, bạn cần thay đổi logic này nếu cần
        review.setReviewText(comment_text);

        int rowAffect = reviewDao.insertReview(review);

        if (rowAffect > 0) {
            try {
                // Tính toán và cập nhật rating trung bình
                double averageRating = reviewDao.calculateAverageRatingForProduct(productIdInt);
                productDao.updateProductRating(productIdInt, (int) averageRating);
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.setStatus(HttpServletResponse.SC_OK);
            AjaxResponse resp = new AjaxResponse();
            resp.addBool("success", true);
            response.getWriter().write(resp.getText());
        } else {
            response.setStatus(HttpServletResponse.SC_OK);
            AjaxResponse resp = new AjaxResponse();
            resp.addBool("success", false);
            response.getWriter().write(resp.getText());
        }
        handle.close();
    }
}
