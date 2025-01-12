package vn.edu.hcmuaf.fit.cuahanggachmen.mail;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.List;
import java.util.Properties;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.CartItem;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Order;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;

public class EmailService {
    // Phương thức gửi email
    public boolean send(String to, String subject, String messageContent) {
        // Cấu hình SMTP
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", EmailProperty.HOST_NAME);
        props.put("mail.smtp.port", String.valueOf(EmailProperty.TSL_PORT));
        props.put("mail.smtp.starttls.enable", "true");

        // Tạo session
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EmailProperty.APP_EMAIL, EmailProperty.APP_PASSWORD);
            }
        });

        try {
            // Tạo email
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EmailProperty.APP_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setContent(messageContent, "text/html; charset=UTF-8");

            // Gửi email
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Phương thức xây dựng nội dung email cho đơn hàng
    public String buildOrderEmailContent(Order order, List<CartItem> cartItems) {
        StringBuilder emailContent = new StringBuilder();

        // Phần mở đầu HTML và CSS
        emailContent.append("<!DOCTYPE html>")
                .append("<html lang='en'>")
                .append("<head>")
                .append("<meta charset='UTF-8'>")
                .append("<meta name='viewport' content='width=device-width, initial-scale=1.0'>")
                .append("<title>Xác nhận đơn hàng</title>")
                .append("<style>")
                .append("body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f9f9f9; color: #333; }")
                .append(".email-container { max-width: 600px; margin: 20px auto; background: #ffffff; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); overflow: hidden; }")
                .append(".email-header { background-color: #4caf50; color: #ffffff; padding: 20px; text-align: center; }")
                .append(".email-header h1 { margin: 0; font-size: 24px; }")
                .append(".email-body { padding: 20px; }")
                .append(".email-body h2 { color: #4caf50; margin-bottom: 10px; }")
                .append(".email-body p { line-height: 1.6; margin: 8px 0; }")
                .append(".product-list { margin: 20px 0; padding: 0; list-style: none; }")
                .append(".product-item { display: flex; align-items: center; margin-bottom: 15px; border-bottom: 1px solid #ddd; padding-bottom: 10px; }")
                .append(".product-item img { width: 80px; height: auto; margin-right: 15px; border-radius: 4px; }")
                .append(".product-item div { flex: 1; }")
                .append(".product-item p { margin: 5px 0; }")
                .append(".email-footer { background: #f1f1f1; text-align: center; padding: 15px; font-size: 12px; color: #666; }")
                .append("</style>")
                .append("</head>")
                .append("<body>")
                .append("<div class='email-container'>");

        // Phần header
        emailContent.append("<div class='email-header'>")
                .append("<h1>Xác nhận đơn hàng</h1>")
                .append("</div>");

        // Phần nội dung
        emailContent.append("<div class='email-body'>")
                .append("<h2>Thông tin đơn hàng</h2>")

                .append("<p><strong>Họ tên khách hàng:</strong> ").append(order.getFullName()).append("</p>")
                .append("<p><strong>Email:</strong> ").append(order.getEmail()).append("</p>")
                .append("<p><strong>Số điện thoại:</strong> ").append(order.getPhone()).append("</p>")
                .append("<p><strong>Địa chỉ:</strong> ").append(order.getAddress()).append("</p>")
                .append("<p><strong>Phương thức thanh toán:</strong> ").append(order.getPayment()).append("</p>")
                .append("<p><strong>Tổng tiền:</strong> ").append(order.getTotalPrice()).append("₫</p>")
                .append("<h3>Chi tiết sản phẩm</h3>");

        // Phần danh sách sản phẩm
        emailContent.append("<ul class='product-list'>");
        for (CartItem item : cartItems) {
            emailContent.append("<li class='product-item'>")
                    .append("<img src='").append(item.getProductImage()).append("' alt='").append(item.getProductName()).append("'>")
                    .append("<div>")
                    .append("<p><strong>").append(item.getProductName()).append("</strong></p>")
                    .append("<p>Số lượng: ").append(item.getQuantity()).append("</p>")
                    .append("<p>Màu sắc: ").append(item.getProductColor()).append("</p>")
                    .append("<p>Giá: ").append(item.getTotalPrice()).append("₫</p>")
                    .append("</div>")
                    .append("</li>");
        }
        emailContent.append("</ul>");

        // Phần kết thúc
        emailContent.append("<p>Cảm ơn bạn đã mua hàng tại Cửa hàng gạch men!</p>")
                .append("<p>Chúng tôi sẽ liên hệ bạn sớm để giao hàng.</p>")
                .append("</div>"); // Đóng email-body

        // Phần footer
        emailContent.append("<div class='email-footer'>")
                .append("<p>&copy; 2025 Cửa hàng gạch men. Mọi quyền được bảo lưu.</p>")
                .append("<p>Hotline: 0376273026 | Email: support@gachmen.com</p>")
                .append("</div>") // Đóng email-footer
                .append("</div>") // Đóng email-container
                .append("</body>")
                .append("</html>");

        return emailContent.toString();
    }

    // Phương thức xây dựng nội dung email xác thực
    public String buildVerificationEmailContent(User user, String verificationLink) {
        StringBuilder emailContent = new StringBuilder();

        emailContent.append("<!DOCTYPE html>")
                .append("<html lang='vi'>")
                .append("<head>")
                .append("<meta charset='UTF-8'>")
                .append("<meta name='viewport' content='width=device-width, initial-scale=1.0'>")
                .append("<title>Xác Thực Tài Khoản</title>")
                .append("<style>")
                .append("body { font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px; }")
                .append(".container { max-width: 600px; margin: auto; background: #fff; padding: 20px; border-radius: 5px; }")
                .append(".header { text-align: center; padding-bottom: 20px; }")
                .append(".content { line-height: 1.6; }")
                .append(".button { display: inline-block; padding: 10px 20px; color: #fff; background-color: #28a745; text-decoration: none; border-radius: 5px; }")
                .append("</style>")
                .append("</head>")
                .append("<body>")
                .append("<div class='container'>")
                .append("<div class='header'>")
                .append("<h2>Xin chào ").append(user.getFullname()).append(",</h2>")
                .append("</div>")
                .append("<div class='content'>")
                .append("<p>Cảm ơn bạn đã đăng ký tài khoản tại Cửa hàng gạch men.</p>")
                .append("<p>Vui lòng nhấp vào nút bên dưới để xác thực tài khoản của bạn:</p>")
                .append("<p><a href='").append(verificationLink).append("' class='button'>Xác Thực Tài Khoản</a></p>")
                .append("<p>Nếu bạn không đăng ký, vui lòng bỏ qua email này.</p>")
                .append("</div>")
                .append("<div class='footer' style='text-align:center; padding-top:20px; color:#777;'>")
                .append("<p>&copy; 2025 Cửa hàng gạch men. Mọi quyền được bảo lưu.</p>")
                .append("</div>")
                .append("</div>")
                .append("</body>")
                .append("</html>");

        return emailContent.toString();
    }


    public static void main(String[] args) {
        // Test gửi email
        EmailService emailService = new EmailService();
        String to = "example@gmail.com";
        String subject = "Xác nhận đơn hàng";
        String messageContent = "<h1>Chào bạn</h1><p>Đơn hàng của bạn đã được xác nhận!</p>";

        boolean result = emailService.send(to, subject, messageContent);
        System.out.println("Gửi email " + (result ? "thành công" : "thất bại"));
    }
}
