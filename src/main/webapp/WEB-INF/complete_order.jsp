
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Thông tin giao hàng</title>
  <link rel="stylesheet" href="../assets/css/complete_order.css">
  <!-- Nhúng phông chữ -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
          href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet"
  />
</head>
<body>
<div class="container">
  <div class="main-content">
    <div class="confirmation">
      <div class="icon">
        <span>✔</span>
      </div>

      <h2>Đặt hàng thành công</h2>
      <p>Mã đơn hàng <strong>#${orderId}</strong></p>
      <p>Cảm ơn bạn đã mua hàng!</p>
      <p>Chúng tôi đã gửi mail đơn hàng cho bạn</p>
    </div>
    <div class="order-details">
      <h3>Thông tin đơn hàng</h3>
      <div class="details">
        <p><strong>Thông tin giao hàng</strong></p>
        <p>Họ tên khách hàng: ${name}</p>
        <p>Số điện thoại: ${phone}</p>
        <p>Email: ${email}</p>

        <p>Địa chỉ: ${address}</p>
        <br>
        <p><strong>Phương thức thanh toán</strong></p>
        <p>${payment}</p>
        <br>
        <p><strong>Tổng tiền:  ${totalPrice}₫</strong></p>

      </div>
    </div>
    <div class="actions">
      <p class="help-text">Cần hỗ trợ? <a href="#">Liên hệ chúng tôi</a></p>
      <a href="/" class="continue-btn">Tiếp tục mua hàng</a>

    </div>
  </div>

</div>
</body>
</html>

