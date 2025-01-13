<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link rel="stylesheet" href="/assets/css/lichsudonhangthanhcong.css">
    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />

    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/cacthanhphancodinh.css">
    <link rel="stylesheet" href="/assets/css/giohang.css">
    <link rel="stylesheet" href="/assets/css/dropdown_user_menu.css">
    <!-- Thêm favicon -->
    <link
            rel="icon"
            type="image/x-icon"
            href="/assets/icons/logo2_no_text.svg"
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
</head>
<body>
<jsp:include page="../view_shared/header_footer/header.jsp"/>

<div class="container">
    <!-- Sidebar -->
    <aside class="sidebar">
        <ul>
            <li><b>Tài Khoản Của Tôi</b></li>
            <a href="/hoso.html"><li>Hồ Sơ</li></a>
            <hr>
            <li class="active">Đơn Mua</li>
            <hr>
            <a href="/home.html"><li>Quay về trang chủ</li></a>
        </ul>
    </aside>

    <!-- Main Profile Section -->
    <main class="profile">
        <div class="danhmucdautien">
            <a href=""><div class="DH active"> Đơn đã giao thành công</div></a>
            <a href="/Cancelled_Order_History.html"><div class="DH"> Đơn đã hủy</div></a>
        </div>

        <div class="noidungcacdonhang">
            <div class="cacsanpham">
                <div class="hoanthanh"><b>HOÀN THÀNH</b></div>
                <hr>

                <c:if test="${not empty deliveredOrderDetails}">
                    <c:forEach var="order" items="${deliveredOrderDetails}">
                        <div class="sanpham">
                            <div class="hinhanhcuacaigach">
                                <img class="img-donhang" src="${order.productImg}" alt="">
                            </div>

                            <div class="chitietsanpham">
                                <div class="tengachmen1">${order.productName}</div>

                                <div class="soluong1">SỐ LƯỢNG ${order.quantity}</div>
                            </div>

                            <div>₫${order.price}</div>

                            <a class="mualaine" href="/pdetail?pid=${order.productId}" style="display: inline-block;">
                                <div class="mualai">Đánh giá</div>
                            </a>
                            <a class="mualaine" href="/pdetail?pid=${order.productId}" style="display: inline-block;">
                                <div class="mualai">Mua lại</div>
                            </a>
                        </div>
                        <hr>
                    </c:forEach>
                </c:if>

                <c:if test="${empty deliveredOrderDetails}">
                    <p>Không có đơn hàng nào đã giao thành công.</p>
                </c:if>
            </div>
        </div>
    </main>
</div>

<jsp:include page="../view_shared/header_footer/footer.jsp"/>

</body>
</html>
