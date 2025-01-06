
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin giao hàng</title>
    <link rel="stylesheet" href="./assets/css/delivery_information.css">
    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />

    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>

    <!--Notyf-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
</head>
<body>
<div class="container">
    <div class="main-content">
        <h1>Cửa hàng gạch men</h1>
        <nav class="breadcrumb">
            <a href="#">Giỏ hàng</a> >
            <span>Thông tin giao hàng</span>
        </nav>
        <h2>Thông tin giao hàng</h2>
        <p>Dưới đây là thông tin nhận hàng của bạn! <a href="#"><b>Thay đổi thông tin</b></a></p>
        <form class="checkout-form">
            <div class="form-group">
                <label for="name">Họ và tên</label>
                <input type="text" id="name" placeholder="Họ và tên" required style="width: 700px;">

            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" placeholder="Email">
                </div>
                <div class="form-group sdt">
                    <label for="phone">Số điện thoại</label>
                    <input type="tel" id="phone" placeholder="Số điện thoại" required>

                </div>
            </div>
            <div class="form-group">
                <label for="address">Địa chỉ</label>
                <input type="text" id="address" placeholder="Địa chỉ" style="width: 700px;">
            </div>

            <a href="./payment_method.html"  class="btn-primary">Tiếp tục đến phương thức thanh toán</a>
        </form>
    </div>
    <aside class="sidebar">
        <ul class="cart-items">
            <c:forEach var="item" items="${cart.items}">
                <li class="chitietsanphamthanhtoan">
                    <div class="image-wrapper">
                        <img class="img_small" src="${item.productImage}" alt="">
                        <span class="badge">${item.quantity}</span>
                    </div>
                    <span>
                ${item.productName} <br>
                Màu: ${item.productColor} <br>
                Số lượng: ${item.quantity}
            </span>
                    <span>
                <fmt:formatNumber value="${item.totalPrice}" type="number" maxFractionDigits="0"/>₫
            </span>
                </li>
            </c:forEach>
        </ul>
        <div class="discount">

            <input type="text" id="discount" placeholder="Nhập mã giảm giá">
            <div class="btn-secondary" id="btn_usage">Sử dụng</div>
        </div>
        <hr>
        <div class="price-summary">
            <p>Tạm tính:
                <fmt:formatNumber value="${cart.total}" type="number" maxFractionDigits="0"/>₫
            </p>
            <p>Phí vận chuyển:
                <fmt:formatNumber value="${shippingFee}" type="number" maxFractionDigits="0"/>₫
            </p>
            <p id="dis_val"></p>
            <hr>
            <h3>Tổng cộng:
                <span id="totalPrice"><fmt:formatNumber value="${cart.total + shippingFee}" type="number" maxFractionDigits="0"/></span>₫
            </h3>
        </div>
    </aside>
</div>
<script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
<script src="/assets/js/ajaxVoucher.js"></script>
</body>
</html>

