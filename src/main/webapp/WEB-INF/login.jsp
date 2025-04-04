<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập</title>


    <link rel="stylesheet" href="/assets/css/login.css">


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

    <!-- Font Awesome-->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
            integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js"
            integrity="sha512-6sSYJqDreZRZGkJ3b+YfdhB3MzmuP9R7X1QZ6g5aIXhRvR1Y/N/P47jmnkENm7YL3oqsmI6AK+V6AD99uWDnIw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    ></script>

    <script src="https://www.google.com/recaptcha/api.js" async defer></script>

    <style>
        /* Định dạng thông báo lỗi màu đỏ */
        label.error {
            color: red;
            font-size: 14px;
            margin-top: -11px;
            margin-bottom: 11px;
            display: block;
        }
    </style>
</head>
<body>


<!-- Thanh Header -->
<header>
    <a href="/">
        <div class="logo">
            <img src="../assets/icons/logo2.svg" alt="Logo Shop" />
        </div>
    </a>

</header>

<!-- Mục Lục -->
<nav class="breadcrumb">
    <a href="/">Home</a> > <a href="#!">Đăng nhập</a>
</nav>





<div class="login-container">
    <p class="welcome">Đăng Nhập Tài Khoản</p>
    <p>Tạo tài khoản để mua hàng và nhận ngay ưu đãi độc quyền khi mua sắm gạch tại cuahanggachmen.com.</p>

    <div class="error-message">
        <c:if test="${not empty error}">
            <p style="color: red; font-weight: bold;">${error}</p>
        </c:if>
    </div>

    <form action="login" method="post" id="login-form">
        <input type="text" id="email" name="email" value="${email}" placeholder="Vui lòng nhập email của bạn" required>
        <input type="password" id="password" name="password" placeholder="Mật khẩu" required>
        <div class="g-recaptcha"
             data-sitekey="6LcfgQArAAAAAHMpZPwzWzPKURK6ID6AAh2bnoFH"
             data-callback="recaptchaCallback"
             data-expired-callback="recaptchaExpired">va
        </div>
        <div class="options">
            <label><input type="checkbox" name="remember"> Ghi nhớ đăng nhập</label>
            <a href="forgetpassword">Quên mật khẩu?</a>
        </div>

<%--        <a href="./home.html"><div class="sign-in">Đăng Nhập</div></a>--%>
        <button type="submit" id="login-btn" class="sign-in" disabled>Đăng Nhập</button>

    </form>

    <div class="separator">
        <span>Bạn chưa có tài khoản? </span>
        <span><a href="register">Đăng ký ngay.</a></span>
    </div>

    <!-- Nút đăng nhập qua Google và Facebook -->
    <div class="social-login">
        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid
&redirect_uri=http://localhost:8080/googlelogin
&response_type=code
&client_id=233124927573-igpg8cdj1cigkg7mmkju7p8o8ms0j8v2.apps.googleusercontent.com
&approval_prompt=force" class="social-button google">
            <i class="fa-brands fa-google"></i> Đăng nhập với Google
        </a>
        <a href="https://www.facebook.com/v20.0/dialog/oauth?client_id=1294677724960043&redirect_uri=http://localhost:8080/facebooklogin&scope=public_profile" class="social-button facebook">
            <i class="fa-brands fa-facebook"></i> Đăng nhập với Facebook
        </a>
    </div>

    <div class="separator">
        <span>Bạn chưa có tài khoản? </span>
        <span><a href="register">Đăng ký ngay.</a></span>
    </div>



    <button class="create-account"><a href="register">Tạo Tài Khoản</a></button>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

<script>
    $(document).ready(function () {
        $.validator.addMethod("gmailFormat", function (value, element) {
            return /@/.test(value);
        }, "Email phải chứa ký tự @.");

        $.validator.addMethod("passwordFormat", function (value, element) {
            return /^(?=.*[A-Z])(?=.*\d).{8,}$/.test(value);
        }, "Mật khẩu phải có ít nhất 8 ký tự, chứa ít nhất một chữ cái viết hoa và có số.");

        $("#login-form").validate({
            rules: {
                email: {
                    required: true,
                    email: true,
                    gmailFormat: true
                },
                password: {
                    required: true,
                    minlength: 8,
                    passwordFormat: true
                }
            },
            messages: {
                email: {
                    required: "Vui lòng nhập email.",
                    email: "Email không hợp lệ.",
                },
                password: {
                    required: "Vui lòng nhập mật khẩu.",
                    minlength: "Mật khẩu phải có ít nhất 8 ký tự."
                }
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
            },
            submitHandler: function (form) {
                form.submit();
            }
        });

        // Kích hoạt nút đăng nhập khi hợp lệ
        $("#email, #password").on("keyup", function () {
            if ($("#login-form").valid()) {
                $("#login-btn").prop("disabled", false);
            } else {
                $("#login-btn").prop("disabled", true);
            }
        });
    });
</script>


<script>
    function recaptchaCallback() {
        document.getElementById("login-btn").disabled = false;
    }

    function recaptchaExpired() {
        document.getElementById("login-btn").disabled = true;
    }

    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("login-btn").disabled = true;
    });
</script>

</html>

