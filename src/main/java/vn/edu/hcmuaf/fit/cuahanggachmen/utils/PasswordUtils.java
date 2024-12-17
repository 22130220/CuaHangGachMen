package vn.edu.hcmuaf.fit.cuahanggachmen.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Scanner;

public class PasswordUtils {
    private static final int ITERATIONS = 10;

    public static String generateSalt() {
        SecureRandom random = new SecureRandom();
        byte[] saltBytes = new byte[16];
        random.nextBytes(saltBytes);
        StringBuilder sb = new StringBuilder();
        for (byte b : saltBytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }

    public static String hashPassword(String password, String salt) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            String input = salt + password;
            byte[] hash = input.getBytes();

            for (int i = 0; i < ITERATIONS; i++) {
                hash = md.digest(hash);
            }

            StringBuilder sb = new StringBuilder();
            for (byte b : hash) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("SHA-256 algorithm not found!", e);
        }
    }

    public static boolean verifyPassword(String inputPassword, String storedSalt, String storedHashedPassword) {
        String hashedInputPassword = null;
        hashedInputPassword = hashPassword(inputPassword, storedSalt);
        return hashedInputPassword.equals(storedHashedPassword);
    }

    public static void main(String[] args) throws NoSuchAlgorithmException {
        // Khi người dùng đăng ký
        String password = "Nhaquynh1901";
        String salt = generateSalt(); // Tạo salt ngẫu nhiên

        String hashedPassword = hashPassword(password, salt);

        // Người dùng nhập mật khẩu
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter your password: ");
        String inputPassword = scanner.nextLine();

        // Kiểm tra mật khẩu
        if (verifyPassword(inputPassword, salt, hashedPassword)) {
            System.out.println("Password matches! Login successful.");
        } else {
            System.out.println("Invalid password! Login failed.");
        }
    }
}
