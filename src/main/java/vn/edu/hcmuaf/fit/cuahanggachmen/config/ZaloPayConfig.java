package vn.edu.hcmuaf.fit.cuahanggachmen.config;

import java.util.HashMap;
import java.util.Map;

public class ZaloPayConfig {


    public static final Map<String, String> config = new HashMap<>() {
        {
            put("app_id", "2554");
            put("key1", "sdngKKJmqEMzvh5QQcdD2A9XBSKUNaYn");
            put("key2", "trMrHtvjo6myautxDUiAcYsVtaeQ8nhf");
            put("endpoint", "https://sb-openapi.zalopay.vn/v2/create");
            put("orderstatus", "https://sb-openapi.zalopay.vn/v2/query");
//            put("orderstatus", "http://localhost:8080/callback");

        }
    };

}
