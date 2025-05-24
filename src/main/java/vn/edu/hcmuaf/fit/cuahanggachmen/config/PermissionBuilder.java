package vn.edu.hcmuaf.fit.cuahanggachmen.config;

import vn.edu.hcmuaf.fit.cuahanggachmen.db.PermissionLoader;

public class PermissionBuilder {

    public static int excute() {
        return PermissionLoader.getPermission("excute");
    }
    public static int excuteAndWrite() {
        return PermissionLoader.getPermission("write, excute");
    }
    public static int readAndExcute() {
        return PermissionLoader.getPermission("read, excute");
    }

    public static int readWriteAndExcute() {
        return PermissionLoader.getPermission("read, write, excute");
    }
    public static int write() {
        return PermissionLoader.getPermission("write");
    }

    public static int writeAndRead() {
        return PermissionLoader.getPermission("write, read");
    }
    public static int read() {
        return PermissionLoader.getPermission("read");
    }
}
