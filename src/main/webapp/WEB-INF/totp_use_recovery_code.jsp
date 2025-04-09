<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng ký xác thực</title>

    <!-- Reset CSS -->
    <link rel="stylesheet" href="/assets/css/reset.css" />

    <!-- Thêm favicon -->
    <link rel="icon" type="image/x-icon" href="/assets/icons/logo2_no_text.svg">


    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

    <!-- Font Awesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js"
            integrity="sha512-6sSYJqDreZRZGkJ3b+YfdhB3MzmuP9R7X1QZ6g5aIXhRvR1Y/N/P47jmnkENm7YL3oqsmI6AK+V6AD99uWDnIw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- Kiểu CSS -->
    <link rel="stylesheet" href="/assets/css/style.css" />
    <link rel="stylesheet" href="/assets/css/admin-ruleset.css">
    <link rel="stylesheet" href="/assets/css/basicinput.css">
    <link rel="stylesheet" href="/assets/css/UploadImg.css">
    <link rel="stylesheet" href="/assets/css/InputViaIcon.css">
    <link rel="stylesheet" href="/assets/css/admin-login.css">
    <link rel="stylesheet" href="/assets/css/navbar-basic.css">
    <link rel="stylesheet" href="assets/css/input-anim.css">

    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

</head>
<body>
<div class="login-header">
    <div class="container">
        <div class="child-container">
            <nav class="fui-navbar-basic fui-navbar">
                <a href="/" class="logo">
                    <img src="/assets/icons/logo2.svg" alt="Fast UI"/>
                </a>
                <ul class="nav-list">
                    <li class="nav-item">
                        <a href="/" title="Trang chủ" class="nav-link">Trang Chủ</a>
                    </li>
                    <li class="nav-item">
                        <a href="/introduction" title="Giới Thiệu" class="nav-link">Giới Thiệu</a>
                    </li>
                    <li class="nav-item">
                        <a href="/AboutController" title="Liên Hệ" class="nav-link">Liên Hệ</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<div class="login-form">
    <div class="alpha">
        <div id="qr" class="login-icon">
                <i class="fa-solid fa-hammer log-i"></i>
        </div>
    </div>
    <div class="omega">
        <form action="recovery_account" method="post" class="form">
            <p class="login-title-text f-s-30 f-cl-black f-regular">
                Sử dụng mã khôi phục
                <i class="fa-regular fa-hand fa-rotate-by" style="--fa-rotate-angle: 45deg;"></i>
            </p>
            <p class="totp_notice f-s-14 f-cl-black f-regular">
                Mã khôi phục chỉ có thể sử dụng một lần, hãy nhập một trong số 10 mã xác thực để mở khoá tài khoản.
            </p>
            <div class="fui-input-label-animation form-input-custom">
                <input type="text" name="code" class="form-input " id="totp_code" placeholder=" " required>
                <label for="totp_code" class="form-label">Nhập mã khôi phục</label>
            </div>
            <p class="totp_notice f-s-14 f-cl-red f-regular" id="error_message">
                <c:out value="${error}" />
            </p>
            <div class="login-button">
                <button class="btn">Khôi phục</button>
            </div>
        </form>
    </div>
</div>
<script>
    // fetch('/totp-check')
    //     .then(response => {
    //         return response.json();
    //     })
    //     .then(data => {
    //
    //     })
    $(document).ready(function() {
        // Validate form
        $('form').validate({
            rules: {
                code: {
                    required: true,
                    pattern: /^[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}$/
                }
            },
            messages: {
                code: {
                    required: "Vui lòng nhập mã khôi phục",
                    pattern: "Mã khôi phục phải có định dạng như hv61-636a-bp3w-kkcj"
                }
            },
            errorPlacement: function(error, element) {
                $('#error_message').text(error.text());
            },
            success: function(label, element) {
                $('#error_message').text('');
            }
        });

        $('#totp_code').on('blur', function() {
            $('#error_message').text('');
        });

        $('#totp_code').on('input', function() {
            let value = this.value.replace(/[^a-z0-9-]/g, ''); // Chỉ giữ chữ cái thường và số
            value = value.toLowerCase(); // Chuyển về chữ thường

            // Xóa tất cả dấu gạch ngang hiện có
            value = value.replace(/-/g, '');

            let formatted = '';
            for (let i = 0; i < value.length; i++) {
                formatted += value[i];
                if ((i + 1) % 4 === 0 && i < 15) { // i < 15 để không thêm dấu gạch ngang sau ký tự cuối
                    formatted += '-';
                }
            }

            this.value = formatted;

            if (this.value.length > 19) {
                this.value = this.value.slice(0, 19);
            }
        });
    });
</script>
</body>
</html>
