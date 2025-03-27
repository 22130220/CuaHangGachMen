package vn.edu.hcmuaf.fit.cuahanggachmen.service;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.cuahanggachmen.config.MoMoConfig;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.MomoUtils;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class MoMoService {

    public String createPayment(String amount, String redirectUrl, String ipnUrl) throws IOException {
        String orderId = UUID.randomUUID().toString();
        String requestId = orderId;
        String orderInfo = "Thanh toán qua ATM MoMo";
        String requestType = "payWithATM"; //captureWithWallet,payWithATM
        String extraData = "";


        String rawHash = "accessKey=" + MoMoConfig.ACCESS_KEY + "&amount=" + amount + "&extraData=" + extraData
                + "&ipnUrl=" + ipnUrl + "&orderId=" + orderId + "&orderInfo=" + orderInfo
                + "&partnerCode=" + MoMoConfig.PARTNER_CODE + "&redirectUrl=" + redirectUrl
                + "&requestId=" + requestId + "&requestType=" + requestType;
        System.out.println("Raw Hash: " + rawHash);
        String signature = MomoUtils.hmacSHA256(rawHash, MoMoConfig.SECRET_KEY);

        System.out.println("partnerCode: " + MoMoConfig.PARTNER_CODE);
        System.out.println("amount: " + amount);
        System.out.println("orderId: " + orderId);
        System.out.println("requestId: " + requestId);
        System.out.println("orderInfo: " + orderInfo);
        System.out.println("redirectUrl: " + redirectUrl);
        System.out.println("ipnUrl: " + ipnUrl);
        System.out.println("requestType: " + requestType);
        System.out.println("signature: " + signature);


        Map<String, String> data = new HashMap<>();
        data.put("partnerCode", MoMoConfig.PARTNER_CODE);
        data.put("partnerName", "Test");
        data.put("storeId", "MomoTestStore");
        data.put("requestId", requestId);
        data.put("amount", amount);
        data.put("orderId", orderId);
        data.put("orderInfo", orderInfo);
        data.put("redirectUrl", redirectUrl);
        data.put("ipnUrl", ipnUrl);
        data.put("lang", "vi");
        data.put("extraData", extraData);
        data.put("requestType", requestType);
        data.put("signature", signature);
        Gson gson = new Gson();
        String jsonData = gson.toJson(data);
        System.out.println("Request JSON: " + jsonData);
        String jsonResponse = sendPostRequest(MoMoConfig.ENDPOINT,  gson.toJson(data));
        Map<String, Object> result =  gson.fromJson(jsonResponse, Map.class);
        return (String) result.get("payUrl");
    }

    private String sendPostRequest(String url, String jsonInputString) throws IOException {
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        con.setDoOutput(true);

        try (OutputStream os = con.getOutputStream()) {
            byte[] input = jsonInputString.getBytes(StandardCharsets.UTF_8);
            os.write(input, 0, input.length);
        }

        int responseCode = con.getResponseCode();
        String responseMessage = con.getResponseMessage();
        if (responseCode == 200) { // Thành công
            return new String(con.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
        } else { // Lỗi 400, 500, v.v.
            String errorResponse = new String(con.getErrorStream().readAllBytes(), StandardCharsets.UTF_8);
            throw new IOException("Error response from server: " + errorResponse);
        }
    }


}
