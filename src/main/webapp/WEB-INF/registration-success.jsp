<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng Ký Thành Công</title>
    <link rel="stylesheet" href="/assets/css/verification.css">
    <link rel="icon" type="image/x-icon" href="../assets/icons/logo2_no_text.svg"/>
    <!-- Nhúng các nguồn khác như phông chữ và Font Awesome nếu cần -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />
    <!-- Font Awesome-->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
            integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />

    <style>
        /* /assets/css/verification.css */

        /* Reset một số kiểu mặc định */
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Be Vietnam Pro', sans-serif;
            background-color: #f9f9f9;
            color: #333;
        }

        /* Container để căn giữa nội dung */
        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 20px;
        }

        /* Box nội dung */
        .content {
            background: #ffffff;
            padding: 40px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
            text-align: center;
        }

        /* Tiêu đề */
        .content h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #4caf50;
        }

        /* Đoạn văn */
        .content p {
            font-size: 16px;
            margin-bottom: 20px;
            line-height: 1.6;
        }

        /* Liên kết / Nút */
        .content a {
            display: inline-block;
            padding: 12px 24px;
            background-color: #4caf50;
            color: #ffffff;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .content a:hover {
            background-color: #45a049;
        }

        /* Tùy chọn: Thêm kiểu cho các icon nếu sử dụng Font Awesome */
        .content .fa {
            font-size: 40px;
            color: #4caf50;
            margin-bottom: 15px;
        }

        /* Điều chỉnh cho các thiết bị nhỏ */
        @media (max-width: 600px) {
            .content {
                padding: 30px 20px;
            }

            .content h2 {
                font-size: 24px;
            }

            .content p {
                font-size: 14px;
            }

            .content a {
                font-size: 14px;
                padding: 10px 20px;
            }
        }

    </style>
</head>
<body>
<div class="container">
    <div class="content">
        <i class="fa-solid fa-check-circle"></i> <!-- Thêm icon nếu muốn -->
        <h2>Đăng ký thành công!</h2>
        <p>Chúng tôi đã gửi một email xác thực đến <strong>${email}</strong>. Vui lòng kiểm tra email của bạn và nhấp vào liên kết xác thực để hoàn tất đăng ký.</p>
        <a href="/login">Quay lại trang đăng nhập</a>
    </div>
</div>
</body>
</html>
