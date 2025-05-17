package vn.edu.hcmuaf.fit.cuahanggachmen;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface RequirePermission {
    String[] value();
}
