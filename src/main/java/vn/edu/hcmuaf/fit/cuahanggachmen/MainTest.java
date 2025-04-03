package vn.edu.hcmuaf.fit.cuahanggachmen;

import com.google.gson.JsonObject;
import dev.samstevens.totp.exceptions.QrGenerationException;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.TOTPUtils;

public class MainTest {
    public static void main(String[] args) throws QrGenerationException {
        String secretKey = TOTPUtils.getGenerateKey();
        String dataUri = TOTPUtils.getQRCode(secretKey, "tahoangphuc1901@gmail.com");
        System.out.println(secretKey);
        System.out.println(dataUri);
        JsonObject data = new JsonObject();
        data.addProperty("secretKey", secretKey);
        data.addProperty("dataUri", dataUri);
        String dataS = data.toString();
    }
}
