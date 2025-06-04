package vn.edu.hcmuaf.fit.cuahanggachmen.mail;

import vn.edu.hcmuaf.fit.cuahanggachmen.mail.EmailConfig;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.CartItem;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Order;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.logging.Logger;

public class EmailService implements IJavaMail {
    private static final Logger LOGGER = Logger.getLogger(EmailService.class.getName());
    private static final ExecutorService EMAIL_EXECUTOR = Executors.newFixedThreadPool(5);
    private static final int MAX_RETRIES = 3;
    private static final long RETRY_DELAY_MS = 2000;

    private final Session session;

    public EmailService() {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", EmailConfig.getHostName());
        props.put("mail.smtp.port", String.valueOf(EmailConfig.getTslPort()));
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.debug", "true");

        this.session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EmailConfig.getEmail(), EmailConfig.getPassword());
            }
        });
    }

    @Override
    public boolean send(String to, String subject, String messageContent) {
        EMAIL_EXECUTOR.submit(() -> {
            for (int attempt = 1; attempt <= MAX_RETRIES; attempt++) {
                try {
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(EmailConfig.getEmail()));
                    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
                    message.setSubject(subject, "UTF-8");
                    message.setContent(messageContent, "text/html; charset=UTF-8");

                    Transport.send(message);
                    LOGGER.info("Gửi email thành công tới: " + to);
                    return;
                } catch (MessagingException e) {
                    LOGGER.warning("Lỗi khi gửi email tới " + to + " (lần " + attempt + "): " + e.getMessage());
                    if (attempt == MAX_RETRIES) {
                        LOGGER.severe("Thất bại sau " + MAX_RETRIES + " lần thử gửi email tới: " + to);
                        return;
                    }
                    try {
                        Thread.sleep(RETRY_DELAY_MS);
                    } catch (InterruptedException ie) {
                        Thread.currentThread().interrupt();
                        return;
                    }
                }
            }
        });
        return true;
    }

    public String buildOrderEmailContent(Order order, List<CartItem> cartItems) {
        StringBuilder emailContent = new StringBuilder();
        emailContent.append("<!DOCTYPE html>")
                .append("<html lang='vi'>")
                .append("<head>")
                .append("<meta charset='UTF-8'>")
                .append("<meta name='viewport' content='width=device-width, initial-scale=1.0'>")
                .append("<title>Xác nhận đơn hàng</title>")
                .append("<style>")
                .append("body { font-family: 'Segoe UI', Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4; }")
                .append(".email-container { max-width: 600px; margin: 20px auto; background: #ffffff; border-radius: 10px; }")
                .append(".email-header { background: linear-gradient(135deg, #4caf50, #81c784); color: #ffffff; padding: 30px; text-align: center; }")
                .append(".email-body { padding: 20px 30px; }")
                .append(".product-list { margin: 20px 0; padding: 0; list-style: none; }")
                .append(".product-item { display: flex; align-items: center; margin-bottom: 20px; border-bottom: 1px solid #eee; }")
                .append(".product-item img { width: 90px; height: auto; margin-right: 20px; border-radius: 6px; }")
                .append(".email-footer { background: #f9f9f9; text-align: center; padding: 20px; font-size: 13px; }")
                .append("</style>")
                .append("</head>")
                .append("<body>")
                .append("<div class='email-container'>")
                .append("<div class='email-header'>")
                .append("<h1>Xác nhận đơn hàng</h1>")
                .append("</div>")
                .append("<div class='email-body'>")
                .append("<h2>Thông tin đơn hàng</h2>")
                .append("<p><strong>Họ tên:</strong> ").append(escapeHtml(order.getFullName())).append("</p>")
                .append("<p><strong>Email:</strong> ").append(escapeHtml(order.getEmail())).append("</p>")
                .append("<p><strong>Số điện thoại:</strong> ").append(escapeHtml(order.getPhone())).append("</p>")
                .append("<p><strong>Địa chỉ:</strong> ").append(escapeHtml(order.getAddress())).append("</p>")
                .append("<p><strong>Phương thức thanh toán:</strong> ").append(escapeHtml(order.getPayment())).append("</p>")
                .append("<p><strong>Tổng tiền:</strong> ").append(order.getTotalPrice()).append("₫</p>")
                .append("<h3>Chi tiết sản phẩm</h3>")
                .append("<ul class='product-list'>");

        for (CartItem item : cartItems) {
            emailContent.append("<li class='product-item'>")
                    .append("<img src='").append(escapeHtml(item.getProductImage())).append("' alt='").append(escapeHtml(item.getProductName())).append("'>")
                    .append("<div>")
                    .append("<p><strong>").append(escapeHtml(item.getProductName())).append("</strong></p>")
                    .append("<p>Số lượng: ").append(item.getQuantity()).append("</p>")
                    .append("<p>Màu sắc: ").append(escapeHtml(item.getProductColor())).append("</p>")
                    .append("<p>Giá: ").append(item.getTotalPrice()).append("₫</p>")
                    .append("</div>")
                    .append("</li>");
        }
        emailContent.append("</ul>")
                .append("<p>Cảm ơn bạn đã mua hàng tại <strong>Cửa hàng gạch men</strong>!</p>")
                .append("</div>")
                .append("<div class='email-footer'>")
                .append("<p>© 2025 Cửa hàng gạch men.</p>")
                .append("</div>")
                .append("</body>")
                .append("</html>");

        return emailContent.toString();
    }

    public String buildVerificationEmailContent(User user, String verificationLink) {
        StringBuilder emailContent = new StringBuilder();
        emailContent.append("<!DOCTYPE html>")
                .append("<html lang='vi'>")
                .append("<head>")
                .append("<meta charset='UTF-8'>")
                .append("<meta name='viewport' content='width=device-width, initial-scale=1.0'>")
                .append("<title>Xác thực tài khoản</title>")
                .append("<style>")
                .append("body { font-family: 'Segoe UI', Arial, sans-serif; background-color: #f4f4f4; padding: 20px; }")
                .append(".container { max-width: 600px; margin: auto; background: #ffffff; border-radius: 10px; }")
                .append(".header { background: linear-gradient(135deg, #4caf50, #81c784); color: #ffffff; padding: 30px; text-align: center; }")
                .append(".content { padding: 30px; line-height: 1.8; }")
                .append(".button { display: inline-block; padding: 12px 24px; color: #ffffff; background: #4caf50; text-decoration: none; border-radius: 6px; }")
                .append(".footer { text-align: center; padding: 20px; color: #666; font-size: 12px; }")
                .append("</style>")
                .append("</head>")
                .append("<body>")
                .append("<div class='container'>")
                .append("<div class='header'>")
                .append("<h2>Xin chào, ").append(escapeHtml(user.getFullname())).append("</h2>")
                .append("</div>")
                .append("<div class='content'>")
                .append("<p>Cảm ơn bạn đã đăng ký tại <strong>Cửa hàng gạch men</strong>.</p>")
                .append("<p>Vui lòng nhấp vào nút bên dưới để xác thực tài khoản:</p>")
                .append("<p style='text-align: center;'><a href='").append(escapeHtml(verificationLink)).append("' class='button'>Xác thực tài khoản</a></p>")
                .append("<p>Liên kết này sẽ hết hạn sau <strong>24 giờ</strong>.</p>")
                .append("</div>")
                .append("<div class='footer'>")
                .append("<p>© 2025 Cửa hàng gạch men.</p>")
                .append("</div>")
                .append("</body>")
                .append("</html>");

        return emailContent.toString();
    }

    private String escapeHtml(String input) {
        if (input == null) return "";
        return input.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#x27;");
    }
}