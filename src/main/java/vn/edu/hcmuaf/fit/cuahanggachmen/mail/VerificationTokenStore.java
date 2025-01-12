package vn.edu.hcmuaf.fit.cuahanggachmen.mail;

import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.util.concurrent.ConcurrentHashMap;

public class VerificationTokenStore {
    // Map lưu trữ token và người dùng tương ứng
    private static ConcurrentHashMap<String, User> tokenUserMap = new ConcurrentHashMap<>();

    // Thêm token và người dùng
    public static void addToken(String token, User user) {
        tokenUserMap.put(token, user);
    }

    // Lấy người dùng theo token
    public static User getUserByToken(String token) {
        return tokenUserMap.get(token);
    }

    // Xóa token sau khi xác thực
    public static void removeToken(String token) {
        tokenUserMap.remove(token);
    }
}
