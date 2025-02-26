package vn.edu.hcmuaf.fit.cuahanggachmen.controller;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ProductDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.ReviewDao;
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
        String pid = request.getParameter("productId");
        Integer id = Integer.parseInt(pid);
        ReviewDao dao = new ReviewDao();
        List<Review> rv = null;
        try {
           rv = dao.findReviewsByProductId(id);
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }

        AjaxResponse resp =  new AjaxResponse();
        resp.addReviewList(rv);
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resp.getText());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("auth");

        if(session == null || user == null) {
            //response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"redirectUrl\": \"/login\"}");
            return;
        }

        String comment_text = request.getParameter("comment_text");
        String productId = request.getParameter("productId");
        String rating = request.getParameter("rating");
        ReviewDao dao = new ReviewDao();
        ProductDao productDao = new ProductDao();
        Review review = new Review();
        review.setUserId(user.getId());
        review.setProductId(Integer.parseInt(productId));
        review.setRating(rating != null ? Integer.parseInt(rating) : 5);
        review.setReviewDate(LocalDateTime.now());
        review.setOrderId(1);
        review.setReviewText(comment_text);

        int rowAffect = 0;
        rowAffect =  dao.insertReview(review);


        if(rowAffect > 0) {
            try {
                // Tính toán và cập nhật rating trung bình
                double averageRating = dao.calculateAverageRatingForProduct(Integer.parseInt(productId));
                productDao.updateProductRating(Integer.parseInt(productId), (int) averageRating);
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.setStatus(HttpServletResponse.SC_OK);
            AjaxResponse resp = new AjaxResponse();
            resp.addBool("sucess", true);
            response.getWriter().write(resp.getText());
        } else {
            response.setStatus(HttpServletResponse.SC_OK);
            AjaxResponse resp = new AjaxResponse();
            resp.addBool("sucess", false);
            response.getWriter().write(resp.getText());
        }
    }
}
