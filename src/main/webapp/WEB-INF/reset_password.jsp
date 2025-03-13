<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt lại mật khẩu</title>
    <link rel="stylesheet" href="./assets/css/resetpassword.css">
    <!-- Thêm favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/icons/logo2_no_text.svg" />

    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900&display=swap"
            rel="stylesheet"
    />

    <style>
        body {
            font-family: 'Be Vietnam Pro', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }

        header {
            padding: 10px 20px;
            background-color: #ffffff;
            border-bottom: 1px solid #ddd;
        }

        header .logo img {
            height: 50px;
        }

        .breadcrumb {
            margin: 20px;
            font-size: 14px;
        }

        .breadcrumb a {
            color: #4caf50;
            text-decoration: none;
        }

        .breadcrumb a:hover {
            text-decoration: underline;
        }

        .reset-password-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .reset-password-container h1 {
            color: #4caf50;
            margin-bottom: 20px;
        }

        .reset-password-container p {
            margin-bottom: 20px;
            line-height: 1.6;
        }

        .password-box {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .password-box input {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .password-box button {
            padding: 10px;
            font-size: 16px;
            color: #ffffff;
            background-color: #4caf50;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .password-box button:hover {
            background-color: #43a047;
        }

        .login-text {
            margin-top: 20px;
        }

        .login-text a {
            color: #4caf50;
            text-decoration: none;
        }

        .login-text a:hover {
            text-decoration: underline;
        }

    </style>
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
    <a href="./index.html">Trang chủ</a> > <a href="#!">Đặt lại mật khẩu</a>
</nav>

<div class="reset-password-container">
    <h1>Đặt lại mật khẩu</h1>
    <p>Vui lòng nhập mật khẩu mới để thay đổi mật khẩu tài khoản của bạn.</p>
    <form class="password-box" method="post" action="/resetpassword">
        <input type="hidden" name="token" value="${token}">
        <input type="password" name="password" placeholder="Mật khẩu mới" id="password" required>
        <button type="submit">CẬP NHẬT MẬT KHẨU</button>
    </form>
    <p class="login-text"><a href="./login.html">Trở lại trang đăng nhập</a></p>
</div>
</body>
</html>
