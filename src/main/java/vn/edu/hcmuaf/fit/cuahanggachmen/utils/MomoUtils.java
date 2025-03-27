package vn.edu.hcmuaf.fit.cuahanggachmen.utils;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

public class MomoUtils {
    public static String hmacSHA256(String data, String key) {
        try {
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(new SecretKeySpec(key.getBytes(), "HmacSHA256"));
            return bytesToHex(mac.doFinal(data.getBytes()));
        } catch (Exception e) {
            throw new RuntimeException("Failed to calculate HMAC SHA256", e);
        }
    }

    public static String bytesToHex(byte[] bytes) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0'); // Thêm số 0 nếu cần
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }
}
