package vn.edu.hcmuaf.fit.cuahanggachmen.utils;

import vn.edu.hcmuaf.fit.cuahanggachmen.model.Product;

import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

public class AjaxParseRequest {
    public static String[] parse(String object) {
        if(object == null) return null;
        object = object.trim();
        if (object.startsWith("[") && object.endsWith("]")) {
            object = object.substring(1, object.length() - 1);
        }

        String[] elements = object.split(",(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$)");

        List<String> result = new ArrayList<>();
        for (String element : elements) {
            result.add(element.trim().replaceAll("^\"|\"$", ""));
        }

        return result.toArray(new String[0]);
    }

    public static int parseInt(String object) {
        if(object == null) return 0;
        object = object.trim();
        try{
            return Integer.parseInt(object);
        } catch(NumberFormatException e){
            return 0;
        }
    }
}
