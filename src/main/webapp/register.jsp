<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>
    <style><%@include file="assets/css/register.css"%></style>

    <!-- Thêm favicon -->
    <link
            rel="icon"
            type="image/x-icon"
            href="./assets/icons/logo2_no_text.svg"
    />

    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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


</head>
<body>

<c:set value="${register.data}" var="res"/>

<!-- Thanh Header -->
<header>
    <a href="/">
        <div class="logo">
            <img src="./assets/icons/logo2.svg" alt="Logo Shop" />
        </div>
    </a>

</header>

<!-- Mục Lục -->
<nav class="breadcrumb">
    <a href="/">Trang chủ</a> > <a href="#!">Đăng kí</a>
</nav>

<div class="container">

    <div class="content">
        <div class="left-section">
            <img src="https://s7d1.scene7.com/is/image/TileShop/SplendoursPicket_Texture_Detail:Asset_Grid_All_V2?fmt=webp" alt="Gạch Trang Trí">
            <div class="left-text">
                <h2>Tạo tài khoản cá nhân để đặt hàng thuận tiện hơn</h2>
                <ul>
                    <li>Tiết kiệm thời gian khi thanh toán.</li>
                    <li>Dễ dàng tổ chức các dự án của bạn.</li>
                    <li>Xem lịch sử đơn hàng, báo giá và phiếu chọn sản phẩm.</li>
                    <li>Đăng ký nhận email để nhận cảm hứng và thông tin sản phẩm.</li>
                </ul>
            </div>
        </div>
        <div class="right-section">
            <h2><span>🏠</span> Tài Khoản Cá Nhân</h2>
            <form action="register" method="post">
                <input type="text" placeholder="Họ tên" id="name" name="name" value="${register.data.name}" required maxlength="50">
                <input type="email" placeholder="Email" id="email" name="email" value="${register.data.email}" required>
                <div class="message" id="email_message">

                        <c:if test="${res.checkEmail.message != null}">
                            <div>
                                <i class="fa-solid fa-xmark" style="color: #ff0000;"></i>
                                <c:out value="${res.checkEmail.message}"/>
                            </div>
                        </c:if>

                </div>
                <input type="tel" id="tel" name="tel" value="${register.data.phone}" placeholder="Số Điện Thoại">
                <div class="message" id="tel-message"></div>
                <input type="password" id="password" value="${register.data.password}" name="password" placeholder="Mật khẩu" required>
                <div id="message" class="message">
                    <c:forEach items="${res.checkPassword.list}" var="pCheck">
                            <c:if test="${pCheck != null}">
                                <div>
                                    <i class="fa-solid fa-xmark" style="color: #ff0000;"></i>
                                    <c:out value="${pCheck}"/>
                                </div>
                            </c:if>
                    </c:forEach>
                </div>
                <input type="password" id="confirm_password" value="${register.data.confirmPassword}" name="confirm_password" placeholder="Nhập lại mật khẩu" required>
                <div id="confirmPasswordMessage" class="message">

                        <c:if test="${res.checkConfirm.message != null}">
                            <div>
                                <i class="fa-solid fa-xmark" style="color: #ff0000;"></i>
                                <c:out value="${res.checkConfirm.message}"/>
                             </div>
                        </c:if>

                </div>
                <input type="text" id="address" name="address" value="${register.data.address}" placeholder="Địa chỉ" >
                <div class="form-group radio-group">
                    <label>Giới tính: </label>
                    <div class="radio-options">
                        <label><input type="radio" name="gender" value="0" /> Nam</label>
                        <label><input type="radio" name="gender" value="1" checked /> Nữ</label>
                    </div>
                </div>

                <div class="form-group radio-group ckc">
                    <label>Ngày sinh: </label>
                    <input type="date" id="birthday" name="birthday" value="${register.data.birthday}" placeholder="Ngày sinh" style="width: 70%;" required>
                </div>
                <button type="submit" id="register_btn">Tạo Tài Khoản Cá Nhân</button>
                <p class="login-text">Bạn đã có tài khoản? <a href="login">Đăng nhập tại đây</a></p>
            </form>
        </div>
    </div>
</div>

<script src="./assets/js/validate.js"></script>
</body>
</html>

