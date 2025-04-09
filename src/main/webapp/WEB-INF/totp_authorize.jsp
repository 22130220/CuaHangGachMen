<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Xác thưc hai lớp</title>

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
              <i class="fa-solid fa-user-tie log-i"></i>
        </div>
    </div>
    <div class="omega">
        <form action="totp_auth" method="post" class="form">
            <p class="login-title-text f-s-30 f-cl-black f-regular">
                Xác thực hai lớp
                <i class="fa-regular fa-hand fa-rotate-by" style="--fa-rotate-angle: 45deg;"></i>
            </p>
            <p class="totp_notice f-s-14 f-cl-black f-regular">
               Nhập mã xác thực trên thiết bị của bạn
            </p>

            <div class="fui-input-label-animation form-input-custom">
                <input type="text" name="code" class="form-input " id="totp_code" placeholder=" " required>
                <label for="totp_code" class="form-label">Nhập mã xác thực</label>
            </div>

            <p class="totp_notice f-s-14 f-cl-red f-regular">
                <c:out value="${error}" />
            </p>
            <div class="login-button">
                <button class="btn">Xác thực</button>
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
        $('form').validate({
            rules: {
                code: {
                    required: true,
                    digits: true,
                    minlength: 6,
                    maxlength: 6
                }
            },
            messages: {
                code: {
                    required: "Vui lòng nhập mã xác thực",
                    digits: "Mã xác thực chỉ được chứa số",
                    minlength: "Mã xác thực phải có đúng 6 số",
                    maxlength: "Mã xác thực phải có đúng 6 số"
                }
            },
            errorPlacement: function(error, element) {
                $('.totp_notice.f-cl-red').text(error.text());
            },
            success: function(label, element) {
                $('.totp_notice.f-cl-red').text('');
            }
        });

        $('#totp_code').on('blur', function() {
            $('.totp_notice.f-cl-red').text('');
        });

        $('#totp_code').on('input', function() {
            if (this.value.length > 6) {
                this.value = this.value.slice(0, 6);
            }
            this.value = this.value.replace(/[^0-9]/g, '');
        }).on('keypress', function(e) {
            var charCode = (e.which) ? e.which : e.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                e.preventDefault();
                return false;
            }
            return true;
        });
    });
</script>
</body>
</html>
