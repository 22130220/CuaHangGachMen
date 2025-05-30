package vn.edu.hcmuaf.fit.cuahanggachmen.mail;

import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import java.time.LocalDateTime;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class VerificationTokenStore {
    private static class TokenData {
        User user;
        LocalDateTime expiryTime;

        TokenData(User user, LocalDateTime expiryTime) {
            this.user = user;
            this.expiryTime = expiryTime;
        }
    }

    private static final ConcurrentHashMap<String, TokenData> tokenStore = new ConcurrentHashMap<>();
    private static final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

    static {
        scheduler.scheduleAtFixedRate(VerificationTokenStore::cleanupExpiredTokens, 0, 1, TimeUnit.HOURS);
    }

    public static void addToken(String token, User user) {
        LocalDateTime expiryTime = LocalDateTime.now().plusHours(24);
        tokenStore.put(token, new TokenData(user, expiryTime));
    }

    public static User getUserByToken(String token) {
        TokenData data = tokenStore.get(token);
        if (data == null || data.expiryTime.isBefore(LocalDateTime.now())) {
            if (data != null) {
                tokenStore.remove(token);
            }
            return null;
        }
        return data.user;
    }

    public static void removeToken(String token) {
        tokenStore.remove(token);
    }

    private static void cleanupExpiredTokens() {
        LocalDateTime now = LocalDateTime.now();
        tokenStore.entrySet().removeIf(entry -> entry.getValue().expiryTime.isBefore(now));
    }
}