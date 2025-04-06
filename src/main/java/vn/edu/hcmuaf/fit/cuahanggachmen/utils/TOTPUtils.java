package vn.edu.hcmuaf.fit.cuahanggachmen.utils;

import dev.samstevens.totp.code.DefaultCodeGenerator;
import dev.samstevens.totp.code.DefaultCodeVerifier;
import dev.samstevens.totp.code.HashingAlgorithm;
import dev.samstevens.totp.exceptions.QrGenerationException;
import dev.samstevens.totp.qr.QrData;
import dev.samstevens.totp.qr.ZxingPngQrGenerator;
import dev.samstevens.totp.recovery.RecoveryCodeGenerator;
import dev.samstevens.totp.secret.DefaultSecretGenerator;
import dev.samstevens.totp.time.SystemTimeProvider;
import dev.samstevens.totp.time.TimeProvider;

import static dev.samstevens.totp.util.Utils.getDataUriForImage;

public class TOTPUtils {
    public static final String ISSUER = "CuaHangGachMen";

    public static String getGenerateKey() {
        DefaultSecretGenerator secretGenerator = new DefaultSecretGenerator();
        return secretGenerator.generate();
    }

    public static String getQRCode(String secret, String label) throws QrGenerationException {
        QrData data = new QrData.Builder()
                .label("tahoangphuc@gmail.com")
                .secret(secret)
                .issuer(ISSUER)
                .algorithm(HashingAlgorithm.SHA1)
                .digits(6)
                .period(30)
                .build();

        // Tạo mã QR dưới dạng PNG
        ZxingPngQrGenerator qrGenerator = new ZxingPngQrGenerator();
        byte[] qrImage = qrGenerator.generate(data);
        String mimeType = qrGenerator.getImageMimeType();

        return getDataUriForImage(qrImage, mimeType);
    }

    public static boolean verifyCode(String secret, String userEnteredCode) {
        TimeProvider timeProvider = new SystemTimeProvider();
        DefaultCodeGenerator codeGenerator = new DefaultCodeGenerator();
        DefaultCodeVerifier verifier = new DefaultCodeVerifier(codeGenerator, timeProvider);

        verifier.setTimePeriod(30);
        verifier.setAllowedTimePeriodDiscrepancy(1);

        return verifier.isValidCode(secret, userEnteredCode);
    }

    public static String[] getRecoveryCode() {
        RecoveryCodeGenerator recoveryCodes = new RecoveryCodeGenerator();
        String[] codes = recoveryCodes.generateCodes(10);
        return codes;
    }
}
