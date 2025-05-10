package vn.edu.hcmuaf.fit.cuahanggachmen.dao;

import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;
import org.jdbi.v3.core.Handle;

import java.util.concurrent.TimeUnit;
import java.util.function.Supplier;

public abstract class BaseDao implements AutoCloseable {
    protected Handle handle;
    protected Cache<String, Object> cache;
    protected boolean cacheEnabled;
    protected long cacheExpirationSeconds;
    protected long cacheMaximumSize;

    public BaseDao(Handle handle) {
        this(handle, true, 600, 1000); // Cache enabled, 10 minutes expiration, 1000 max size by default
    }

    public BaseDao(Handle handle, boolean cacheEnabled, long cacheExpirationSeconds, long cacheMaximumSize) {
//        if (cacheExpirationSeconds <= 0) {
//            throw new IllegalArgumentException("Cache expiration time must be positive");
//        }
//        if (cacheMaximumSize <= 0) {
//            throw new IllegalArgumentException("Cache maximum size must be positive");
//        }
        this.handle = handle;
        this.cacheEnabled = cacheEnabled;
        this.cacheExpirationSeconds = cacheExpirationSeconds;
        this.cacheMaximumSize = cacheMaximumSize;
        this.cache = cacheEnabled ? Caffeine.newBuilder()
                .expireAfterWrite(cacheExpirationSeconds, TimeUnit.SECONDS)
                .maximumSize(cacheMaximumSize)
                .build() : null;
    }


    protected <T> T getFromCacheOrCompute(String cacheKey, Class<T> type, Supplier<T> supplier) {
        if (cacheEnabled && cache != null) {
            return type.cast(cache.get(cacheKey, key -> supplier.get()));
        }
        return supplier.get();
    }


    protected void invalidateCache(String cacheKey) {
        if (cacheEnabled && cache != null) {
            cache.invalidate(cacheKey);
        }
    }


    protected void clearCache() {
        if (cacheEnabled && cache != null) {
            cache.invalidateAll();
        }
    }


    public void setCacheEnabled(boolean cacheEnabled) {
        this.cacheEnabled = cacheEnabled;
        if (!cacheEnabled && cache != null) {
            cache.invalidateAll();
            cache = null;
        } else if (cacheEnabled && cache == null) {
            cache = Caffeine.newBuilder()
                    .expireAfterWrite(cacheExpirationSeconds, TimeUnit.SECONDS)
                    .maximumSize(cacheMaximumSize)
                    .build();
        }
    }


    public void setCacheExpirationSeconds(long cacheExpirationSeconds) {
        if (cacheExpirationSeconds <= 0) {
            throw new IllegalArgumentException("Cache expiration time must be positive");
        }
        this.cacheExpirationSeconds = cacheExpirationSeconds;
        if (cacheEnabled && cache != null) {
            cache.invalidateAll();
            cache = Caffeine.newBuilder()
                    .expireAfterWrite(cacheExpirationSeconds, TimeUnit.SECONDS)
                    .maximumSize(cacheMaximumSize)
                    .build();
        }
    }

    public void setCacheMaximumSize(long cacheMaximumSize) {
        if (cacheMaximumSize <= 0) {
            throw new IllegalArgumentException("Cache maximum size must be positive");
        }
        this.cacheMaximumSize = cacheMaximumSize;
        if (cacheEnabled && cache != null) {
            cache.invalidateAll();
            cache = Caffeine.newBuilder()
                    .expireAfterWrite(cacheExpirationSeconds, TimeUnit.SECONDS)
                    .maximumSize(cacheMaximumSize)
                    .build();
        }
    }

    public boolean isCacheEnabled() {
        return cacheEnabled;
    }


    public long getCacheExpirationSeconds() {
        return cacheExpirationSeconds;
    }

    public long getCacheMaximumSize() {
        return cacheMaximumSize;
    }

    @Override
    public void close() throws Exception {
        if (handle != null && !handle.isClosed()) {
            handle.close();
        }
    }

    public Handle getHandle() {
        return handle;
    }
}