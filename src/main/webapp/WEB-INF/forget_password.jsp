
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quên mật khẩu</title>
  <link rel="stylesheet" href="../assets/css/quenmatkhau.css">
  <!-- Thêm favicon -->
  <link
          rel="icon"
          type="image/x-icon"
          href="../assets/icons/logo2_no_text.svg"
  />

  <!-- Nhúng phông chữ -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
          href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet"
  />
</head>
<body>
<!-- Thanh Header -->
<header>
  <a href="./index.html">
    <div class="logo">
      <img src="../assets/icons/logo2.svg" alt="Logo Shop" />
    </div>
  </a>

</header>

<!-- Mục Lục -->
<nav class="breadcrumb">
  <a href="/">Trang chủ</a> > <a href="#!">Quên mật khẩu</a>
</nav>

<div class="forgot-password-container">
  <h1>Quên mật khẩu?</h1>
  <p>Vui lòng nhập địa chỉ email bạn đã sử dụng khi tạo tài khoản. Sau khi gửi, bạn sẽ nhận được email với hướng dẫn để đặt lại mật khẩu của mình.</p>
  <form class="email-box" method="post" action="/forgetpassword">
    <input type="email" name="email" placeholder="Địa chỉ Email" required>
    <button type="submit">GỬI EMAIL ĐẶT LẠI</button>
  </form>
  <p class="login-text"> <a href="/">Trở lại trang đăng nhập</a></p>
</div>
</body>
</html>

