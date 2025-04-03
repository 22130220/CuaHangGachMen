package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Cart;
import org.json.JSONObject;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "UpdateController", value = "/UpdateController")
public class UpdateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");
        System.out.println("start");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }


        String rs="";
        String line;
        try {
            BufferedReader reader = request.getReader();
            while ((line = reader.readLine()) != null) {
                rs+=line;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }


        JSONObject bodyJson = new JSONObject(rs);
        int fee = bodyJson.getInt("fee");


        JSONObject jsonObject = new JSONObject();
        if (cart != null) {
            session.setAttribute("cart", cart);
            jsonObject.put("success", true);
            jsonObject.put("totalPrice", cart.getTotal()+fee);


        }

        // Gửi phản hồi
        response.setContentType("application/json");
        response.getWriter().write(jsonObject.toString());
    }
    }
