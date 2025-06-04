<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.UUID" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập</title>

    <link rel="stylesheet" href="/assets/css/login.css">

    <!-- Thêm favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/icons/logo2_no_text.svg" />

    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />

    <!-- Font Awesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js" integrity="sha512-6sSYJqDreZRZGkJ3b+YfdhB3MzmuP9R7X1QZ6g5aIXhRvR1Y/N/P47jmnkENm7YL3oqsmI6AK+V6AD99uWDnIw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

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

        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.6);
            backdrop-filter: blur(2px);
        }

        .modal-content {
            background-color: white;
            margin: 15% auto;
            padding: 30px;
            border-radius: 12px;
            width: 90%;
            max-width: 400px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
            text-align: center;
            font-family: 'Be Vietnam Pro', sans-serif;
            animation: slideIn 0.3s ease-out;
        }

        .modal-content img {
            width: 50px;
            margin-bottom: 15px;
        }

        .modal-content h3 {
            color: #333;
            font-size: 22px;
            margin-bottom: 15px;
        }

        .modal-content p {
            color: #666;
            font-size: 15px;
            margin-bottom: 25px;
        }

        .modal-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        .modal-buttons button {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 15px;
            transition: transform 0.2s ease, background-color 0.3s ease;
        }

        .continue-btn {
            background-color: #0068ff; /* Màu Zalo */
            color: white;
        }

        .continue-btn:hover {
            background-color: #005ce6;
            transform: scale(1.05);
        }

        .cancel-btn {
            background-color: #e0e0e0;
            color: #333;
        }

        .cancel-btn:hover {
            background-color: #d0d0d0;
            transform: scale(1.05);
        }
        #login-btn:disabled{
            background-color: #aaa;
            cursor: not-allowed;
        }

        @keyframes slideIn {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* Responsive modal */
        @media (max-width: 480px) {
            .modal-content {
                width: 95%;
                padding: 20px;
            }

            .modal-buttons {
                flex-direction: column;
            }

            .modal-buttons button {
                width: 100%;
            }
        }

        /* Định dạng biểu tượng Zalo */
        .social-button.zalo img {
            width: 20px;
            height: 20px;
            margin-right: 0px;
            vertical-align: middle;
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
             data-expired-callback="recaptchaExpired">
        </div>
        <div class="options">
            <label><input type="checkbox" name="remember"> Ghi nhớ đăng nhập</label>
            <a href="forgetpassword">Quên mật khẩu?</a>
        </div>

        <button type="submit" id="login-btn" class="sign-in" disabled>Đăng Nhập</button>
    </form>

    <div class="separator">
        <span>Bạn chưa có tài khoản? </span>
        <span><a href="register">Đăng ký ngay.</a></span>
    </div>

    <!-- Tạo state ngẫu nhiên và lưu vào session -->
    <%
        if (session.getAttribute("zaloState") == null) {
            String state = UUID.randomUUID().toString();
            session.setAttribute("zaloState", state);
        }
    %>

    <!-- Nút đăng nhập qua Google, Facebook và Zalo -->
    <div class="social-login">
        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid
&redirect_uri=https://webtmdt.site/googlelogin
&response_type=code
&client_id=233124927573-igpg8cdj1cigkg7mmkju7p8o8ms0j8v2.apps.googleusercontent.com
&approval_prompt=force" class="social-button google">
            <i class="fa-brands fa-google"></i> Đăng nhập với Google
        </a>

        <a href="https://www.facebook.com/v20.0/dialog/oauth?client_id=1294677724960043&redirect_uri=https://webtmdt.site/facebooklogin&scope=public_profile" class="social-button facebook">
            <i class="fa-brands fa-facebook"></i> Đăng nhập với Facebook
        </a>
        <a href="#" class="social-button zalo" onclick="showZaloConfirmModal()">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMDg68zSJU2TpKyMFJwkWpuGsXF_FTMJguqA&s" alt="Zalo Logo"> Đăng nhập với Zalo
        </a>
    </div>

    <div class="separator">
        <span>Bạn chưa có tài khoản? </span>
        <span><a href="register">Đăng ký ngay.</a></span>
    </div>

    <button class="create-account"><a href="register">Tạo Tài Khoản</a></button>
</div>

<!-- Zalo Confirmation Modal -->
<div id="zaloConfirmModal" class="modal">
    <div class="modal-content">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.flaticon.com%2Ffree-icon%2Fzalo_8739499&psig=AOvVaw2X2oYc-1oL7e1I3n4nK3sG&ust=1730987777752000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCMiW_5a5y4kDFQAAAAAdAAAAABAE" alt="Zalo Logo">
        <h3>Xác nhận đăng nhập Zalo</h3>
        <p>Bạn đang đăng nhập qua Zalo. Tiếp tục để trải nghiệm dịch vụ tốt hơn!</p>
        <div class="modal-buttons">
            <button class="continue-btn" onclick="continueZaloLogin()">Tiếp tục</button>
            <button class="cancel-btn" onclick="closeZaloConfirmModal()">Hủy</button>
        </div>
    </div>
</div>

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

        $("#email, #password").on("keyup", function () {
            const isFormValid = $("#login-form").valid();
            const isCaptchaFilled = grecaptcha.getResponse().length > 0;

            $("#login-btn").prop("disabled", !(isFormValid && isCaptchaFilled));
        });
    });

    function showZaloConfirmModal() {
        document.getElementById("zaloConfirmModal").style.display = "block";
    }

    function closeZaloConfirmModal() {
        document.getElementById("zaloConfirmModal").style.display = "none";
    }

    const zaloState = '<%= session.getAttribute("zaloState") %>';
    const REDIRECT_URI = 'https://webtmdt.site/zalologin';

    function generateCodeVerifier() {
        const charset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';
        let verifier = '';
        for (let i = 0; i < 43; i++) {
            verifier += charset.charAt(Math.floor(Math.random() * charset.length));
        }
        return verifier;
    }

    async function generateCodeChallenge(verifier) {
        const encoder = new TextEncoder();
        const data = encoder.encode(verifier);
        const hash = await crypto.subtle.digest('SHA-256', data);
        const base64 = btoa(String.fromCharCode(...new Uint8Array(hash)))
            .replace(/\+/g, '-')
            .replace(/\//g, '_')
            .replace(/=+$/, '');
        return base64;
    }

    async function continueZaloLogin() {
        const codeVerifier = generateCodeVerifier();
        const codeChallenge = await generateCodeChallenge(codeVerifier);
        sessionStorage.setItem('code_verifier', codeVerifier);
        const redirectUri = encodeURIComponent(REDIRECT_URI);
        window.location.href = `https://oauth.zaloapp.com/v4/permission?app_id=3385901349907197462&redirect_uri=${redirectUri}&state=${zaloState}&code_challenge=${codeChallenge}&prompt=consent`;
    }

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
</body>
</html>