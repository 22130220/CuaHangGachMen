<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Cửa hàng gạch men</title>

    <!-- Reset CSS -->
    <link rel="stylesheet" href="/assets/css/reset.css"/>

    <!-- Thêm favicon -->
    <link
            rel="icon"
            type="image/x-icon"
            href="/assets/icons/logo2_no_text.svg"
    />

    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
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

    <%--    <!-- Kiểu CSS -->--%>
    <link rel="stylesheet" href="/assets/css/style.css"/>
    <link rel="stylesheet" href="/assets/css/banner.css"/>
    <link rel="stylesheet" href="/assets/css/danhmucgachmen.css"/>
    <link rel="stylesheet" href="/assets/css/popular.css"/>
    <link rel="stylesheet" href="/assets/css/cacthanhphancodinh.css"/>
    <link rel="stylesheet" href="/assets/css/dropdown_user_menu.css">

    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>

    <%--    <style><%@include file="assets/css/style.css"%></style>--%>
    <%--    <style><%@include file="assets/css/banner.css"%></style>--%>
    <%--    <style><%@include file="assets/css/danhmucgachmen.css"%></style>--%>
    <%--    <style><%@include file="assets/css/popular.css"%></style>--%>
    <%--    <style><%@include file="assets/css/cacthanhphancodinh.css"%></style>--%>
    <%--    <style><%@include file="assets/css/dropdown_user_menu.css"%></style>--%>
    <link rel="stylesheet" href="/assets/css/search.css"/>
</head>
<body>

<jsp:include page="../view_shared/header_footer/header.jsp"/>



<div class="slider">
    <div class="slides">
        <div class="slide">
            <img src="/assets/img/ceramic-india-1-1.jpg" alt="Ảnh 1"/>
        </div>
        <div class="slide">
            <img src="/assets/img/banner-home-1.png" alt="Ảnh 2"/>
        </div>
        <div class="slide">
            <img src="/assets/img/banner-home-2.png" alt="Ảnh 3"/>
        </div>
        <!-- Thêm ảnh tùy thích -->
    </div>
    <!-- Nút điều khiển bên trong ảnh -->
    <a class="prev" onclick="changeSlide(-1)">&#10094;</a>
    <a class="next" onclick="changeSlide(1)">&#10095;</a>
</div>

<div class="dots">
    <span class="dot" onclick="currentSlide(0)"></span>
    <span class="dot" onclick="currentSlide(1)"></span>
    <span class="dot" onclick="currentSlide(2)"></span>
    <!-- Thêm dấu chấm tương ứng với số ảnh -->
</div>


<!-- Popular -->
<div class="popular tile-sell" id="popular1">
    <div class="main-content">
        <div class="popular-top">
            <div class="info">
                <h2 class="heading lv2">
                    CÁC MẪU GẠCH BÁN CHẠY
                </h2>
            </div>
        </div>

        <div class="course-list">
            <c:forEach var="product" items="${productList}">
                <!-- Course item -->
                <div class="course-item">
                    <a href="/pdetail?pid=${product.id}">
                        <img
                                src="${product.imgThumbnail}"
                                alt="${product.name}"
                                class="thumb"
                        />
                    </a>
                    <div class="info">
                        <div class="head">
                            <div class="title">
                                <a href="#!" class="line-clamp break-all">
                                        ${product.name}
                                </a>
                            </div>
                            <div class="rating">
                                <img
                                        src="/assets/img/star.svg"
                                        alt="Star"
                                        class="star"
                                />
                                <span class="value">${product.rating}</span>
                            </div>
                        </div>

                        <div class="foot">
                            <span class="price"><f:formatNumber value="${product.pricePerBox}" type="number"
                                                                maxFractionDigits="0"/>₫</span>

                            <!-- Modified cart button with form -->
                            <form action="${pageContext.request.contextPath}/add-to-cart" method="post" class="add-to-cart-form">
                                <input type="hidden" name="productId" value="${product.id}">
                                <input type="hidden" name="colorId" value="1"> <!-- Default color ID = 1 -->
                                <input type="hidden" name="quantity" value="1"> <!-- Default quantity = 1 -->

                                <a href="javascript:void(0)" class="add-to-cart-btn">
                                    <svg
                                            class="icon"
                                            width="30"
                                            height="30"
                                            viewBox="0 0 24 24"
                                            fill="none"
                                            xmlns="http://www.w3.org/2000/svg"
                                    >
                                        <path
                                                fill-rule="evenodd"
                                                clip-rule="evenodd"
                                                d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                                fill="#2e2100ff"
                                        />
                                        <path
                                                fill-rule="evenodd"
                                                clip-rule="evenodd"
                                                d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                                fill="#2e2100ff"
                                        />
                                        <path
                                                fill-rule="evenodd"
                                                clip-rule="evenodd"
                                                d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                                fill="#2e2100ff"
                                        />
                                    </svg>
                                </a>
                            </form>

                            <form action="${pageContext.request.contextPath}/buynow" method="get">
                                <input type="hidden" name="pid" value="${product.id}">
                                <input type="hidden" name="colorId" value="1">
                                <input type="hidden" name="quantity" value="1">
                                <button type="submit" class="btn book-btn">Đặt ngay</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<div class="load-more" style="text-align: center; margin-top: 30px;">
    <div id="load-more-btn1" class="btn" onclick="loadMoreSell()">Xem thêm</div>
</div>

<script>
    var amount1 = 3;
    function loadMoreSell() {
        $.ajax({
            url: "/loadmoresell",
            type: "GET",
            data: {
                exist: amount1
            },
            success: function(data) {
                // Thêm khối popular mới trước nút "Xem thêm"
                $(".tile-sell").last().append(data);
            },
            error: function(xhr) {
                console.error("Có lỗi xảy ra khi thêm dữ liệu:", xhr);
            }
        });
        amount1 += 3;
    }
</script>

<!-- Popular -->
<div class="popular tile-new" id="popular">
    <div class="main-content">
        <div class="popular-top">
            <div class="info">
                <h2 class="heading lv2">
                    CÁC MẪU GẠCH MỚI NHẤT
                </h2>
            </div>
        </div>

        <div class="course-list" id="course_list">
            <c:forEach var="product" items="${latestProducts}">
                <!-- Course item 1 -->
                <div class="course-item cc">
                    <a href="/pdetail?pid=${product.id}">
                        <img
                                src="${product.imgThumbnail}"
                                alt="Basic web design"
                                class="thumb"
                        />
                    </a>
                    <div class="info">
                        <div class="head">
                            <div class="title">
                                <a href="#!" class="line-clamp break-all">
                                        ${product.name}
                                </a>
                            </div>
                            <div class="rating">
                                <img
                                        src="/assets/img/star.svg"
                                        alt="Star"
                                        class="star"
                                />
                                <span class="value">${product.rating}</span>
                            </div>
                        </div>

                        <div class="foot">
                            <span class="price"><f:formatNumber value="${product.pricePerBox}" type="number"
                                                                maxFractionDigits="0"/>₫</span>

                            <!-- Modified cart button with form -->
                            <form action="${pageContext.request.contextPath}/add-to-cart" method="post" class="add-to-cart-form">
                                <input type="hidden" name="productId" value="${product.id}">
                                <input type="hidden" name="colorId" value="1"> <!-- Default color ID = 1 -->
                                <input type="hidden" name="quantity" value="1"> <!-- Default quantity = 1 -->

                                <a href="javascript:void(0)" class="add-to-cart-btn">
                                    <svg
                                            class="icon"
                                            width="30"
                                            height="30"
                                            viewBox="0 0 24 24"
                                            fill="none"
                                            xmlns="http://www.w3.org/2000/svg"
                                    >
                                        <path
                                                fill-rule="evenodd"
                                                clip-rule="evenodd"
                                                d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                                fill="#2e2100ff"
                                        />
                                        <path
                                                fill-rule="evenodd"
                                                clip-rule="evenodd"
                                                d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                                fill="#2e2100ff"
                                        />
                                        <path
                                                fill-rule="evenodd"
                                                clip-rule="evenodd"
                                                d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                                fill="#2e2100ff"
                                        />
                                    </svg>
                                </a>
                            </form>

                            <form action="${pageContext.request.contextPath}/buynow" method="get">
                                <input type="hidden" name="pid" value="${product.id}">
                                <input type="hidden" name="colorId" value="1">
                                <input type="hidden" name="quantity" value="1">
                                <button type="submit" class="btn book-btn">Đặt ngay</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>


    </div>
</div>


<div class="load-more" style="text-align: center; margin-top: 30px; margin-bottom: 30px">
    <div id="load-more-btn2" class="btn" onclick="loadMore()">Xem thêm</div>
</div>

<script>
    var amount = 3;
    function loadMore() {
        $.ajax({
            url: "/loadmore",
            type: "GET",
            data: {
                exist: amount
            },
            success: function(data) {
                // Thêm khối popular mới
                $(".tile-new").last().append(data);
            },
            error: function(xhr) {
                console.error("Có lỗi xảy ra khi thêm dữ liệu:", xhr);
            }
        });
        amount += 3;
    }
</script>

<!-- Popular -->
<div class="popular tile-view" id="popular3">
    <div class="main-content">
        <div class="popular-top">
            <div class="info">
                <h2 class="heading lv2">
                    CÁC MẪU GẠCH ĐƯỢC XEM NHIỀU
                </h2>
            </div>
        </div>

        <div class="course-list">
            <c:forEach items="${mostViewedProducts}" var="product">
                <!-- Course item 1 -->
                <div class="course-item">
                    <a href="/pdetail?pid=${product.id}">
                        <img
                                src="${product.imgThumbnail}"
                                alt="${product.name}"
                                class="thumb"
                        />
                    </a>
                    <div class="info">
                        <div class="head">
                            <div class="title">
                                <a href="/pdetail?pid=${product.id}" class="line-clamp break-all">
                                        ${product.name}
                                </a>
                            </div>
                            <div class="rating">
                                <img
                                        src="/assets/img/star.svg"
                                        alt="Star"
                                        class="star"
                                />
                                <span class="value">${product.rating}</span>
                            </div>
                        </div>

                        <div class="foot">
                            <span class="price"><f:formatNumber value="${product.pricePerBox}" type="number"
                                                                maxFractionDigits="0"/>₫</span>

                            <!-- Modified cart button with form -->
                            <form action="${pageContext.request.contextPath}/add-to-cart" method="post" class="add-to-cart-form">
                                <input type="hidden" name="productId" value="${product.id}">
                                <input type="hidden" name="colorId" value="1"> <!-- Default color ID = 1 -->
                                <input type="hidden" name="quantity" value="1"> <!-- Default quantity = 1 -->

                                <a href="javascript:void(0)" class="add-to-cart-btn">
                                    <svg
                                            class="icon"
                                            width="30"
                                            height="30"
                                            viewBox="0 0 24 24"
                                            fill="none"
                                            xmlns="http://www.w3.org/2000/svg"
                                    >
                                        <path
                                                fill-rule="evenodd"
                                                clip-rule="evenodd"
                                                d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                                fill="#2e2100ff"
                                        />
                                        <path
                                                fill-rule="evenodd"
                                                clip-rule="evenodd"
                                                d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                                fill="#2e2100ff"
                                        />
                                        <path
                                                fill-rule="evenodd"
                                                clip-rule="evenodd"
                                                d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                                fill="#2e2100ff"
                                        />
                                    </svg>
                                </a>
                            </form>

                            <form action="${pageContext.request.contextPath}/buynow" method="get">
                                <input type="hidden" name="pid" value="${product.id}">
                                <input type="hidden" name="colorId" value="1">
                                <input type="hidden" name="quantity" value="1">
                                <button type="submit" class="btn book-btn">Đặt ngay</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>


    </div>
</div>



<div class="load-more" style="text-align: center; margin-top: 30px;">
    <div id="load-more-btn3" class="btn" onclick="loadMoreView()">Xem thêm</div>
</div>
<script>
    var amount = 3;
    function loadMoreView() {
        $.ajax({
            url: "/loadmoreview",
            type: "GET",
            data: {
                exist: amount
            },
            success: function(data) {
                // Thêm khối popular mới
                $(".tile-view").last().append(data);
            },
            error: function(xhr) {
                console.error("Có lỗi xảy ra khi thêm dữ liệu:", xhr);
            }
        });
        amount += 3;
    }
</script>


<jsp:include page="../view_shared/header_footer/footer.jsp"/>

<!-- Thêm Notyf  -->
<script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
<script src="../assets/js/search.js"></script>
<%--<script>--%>
<%--    document.addEventListener('DOMContentLoaded', function() {--%>
<%--        const searchBar = document.querySelector('.search-bar');--%>
<%--        const input     = document.getElementById('searchInput');--%>
<%--        const box       = document.getElementById('suggestionsBox');--%>
<%--        const boxproduct = document.getElementById('productbox1');--%>
<%--        // TTL = 7 ngày (ms)--%>
<%--        const TTL = 7 * 24 * 60 * 60 * 1000;--%>

<%--        // 1. Lấy history, lọc TTL--%>
<%--        function getHistory() {--%>
<%--            const now = Date.now();--%>
<%--            const raw = JSON.parse(localStorage.getItem('searchHistory') || '[]');--%>
<%--            const fresh = raw.filter(item => (now - item.time) < TTL);--%>
<%--            localStorage.setItem('searchHistory', JSON.stringify(fresh));--%>
<%--            return fresh.map(item => item.text);--%>
<%--        }--%>

<%--        // 2. Lưu mới kèm timestamp--%>
<%--        function saveHistory(q) {--%>
<%--            const now = Date.now();--%>
<%--            let history = JSON.parse(localStorage.getItem('searchHistory') || '[]');--%>
<%--            history = history.filter(item => item.text !== q);--%>
<%--            history.unshift({ text: q, time: now });--%>
<%--            if (history.length > 10) history.pop();--%>
<%--            localStorage.setItem('searchHistory', JSON.stringify(history));--%>
<%--        }--%>

<%--        // 3. Hiển thị history--%>
<%--        function showHistory() {--%>
<%--            const items = getHistory();--%>
<%--            box.innerHTML = '';--%>
<%--            if (!items.length) { box.style.display = 'none'; return; }--%>
<%--            items.forEach(text => {--%>
<%--                const div = document.createElement('div');--%>
<%--                div.textContent = text;--%>
<%--                div.className = 'suggestion-item';--%>
<%--                div.addEventListener('click', () => {--%>
<%--                    input.value = text;--%>
<%--                    box.style.display = 'none';--%>
<%--                });--%>
<%--                box.appendChild(div);--%>
<%--            });--%>
<%--            box.style.display = 'block';--%>
<%--        }--%>

<%--        // 4. Lưu khi cần (chỉ gọi từ mouseleave)--%>
<%--        function handleSave() {--%>
<%--            const q = input.value.trim();--%>
<%--            if (!q) return;--%>
<%--            saveHistory(q);--%>
<%--            showHistory();--%>
<%--        }--%>

<%--        // Sự kiện hiển thị history khi focus hoặc click vào input--%>
<%--        input.addEventListener('focus', showHistory);--%>
<%--        input.addEventListener('click', showHistory);--%>

<%--        // **Chỉ lưu** khi chuột rời khỏi toàn bộ vùng search-bar--%>
<%--        input.addEventListener('mouseleave', handleSave);--%>

<%--        // Ẩn suggestion khi click ngoài vùng search-bar--%>
<%--        document.addEventListener('click', e => {--%>
<%--            if (!input.contains(e.target)) {--%>
<%--                box.style.display = 'none';--%>
<%--                boxproduct.style.display='none';--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>

<%--<script>--%>
<%--    function searchProducts(q) {--%>
<%--        if (!q) return;--%>

<%--        $.ajax({--%>
<%--            url: '/searchProducts',--%>
<%--            method: 'GET',--%>
<%--            data: { q: q },--%>
<%--            dataType: 'json',--%>
<%--            success: function(data) {--%>
<%--                console.log('Kết quả từ server:', data);--%>

<%--                const boxproduct = document.getElementById('productbox1');--%>
<%--                boxproduct.innerHTML = '';--%>

<%--                const products = data.products;--%>
<%--                products.forEach(item => {--%>
<%--                    const div = document.createElement('div');--%>
<%--                    div.className = 'suggestion-item';--%>

<%--                    const a = document.createElement('a');--%>
<%--                    a.href = '/pdetail?pid=' + item.id;--%>
<%--                    a.textContent = item.name;--%>

<%--                    div.appendChild(a);--%>
<%--                    boxproduct.appendChild(div);--%>
<%--                });--%>

<%--                $('#productbox1').css('display', 'block');--%>
<%--            },--%>
<%--            error: function(xhr, status, err) {--%>
<%--                console.error('Lỗi AJAX:', err);--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>


<%--    document.addEventListener('DOMContentLoaded', function() {--%>
<%--        const input = document.getElementById('searchInput');--%>
<%--        const box       = document.getElementById('suggestionsBox');--%>

<%--        // 1. Log mỗi khi thay đổi nội dung--%>
<%--        input.addEventListener('input', function(e) {--%>
<%--            console.log('Đang gõ:', e.target.value.trim());--%>
<%--            const q = input.value.trim();--%>
<%--            if (!q) return;--%>
<%--            $('#suggestionsBox').hide();--%>
<%--            searchProducts(q);--%>
<%--        });--%>

<%--        // 2. Hoặc chỉ log khi nhấn Enter--%>
<%--        input.addEventListener('keydown', function(e) {--%>
<%--            if (e.key === 'Enter') {--%>
<%--                e.preventDefault();--%>
<%--                const q = input.value.trim();--%>
<%--                if (!q) return;--%>
<%--                $('#suggestionsBox').hide();--%>
<%--                searchProducts(q);--%>
<%--            }--%>
<%--        });--%>

<%--    });--%>
<%--</script>--%>


<script>
    var notyf = new Notyf();
    $(document).ready(function() {
        // Sử dụng event delegation cho .add-to-cart-btn
        $(document).on('click', '.add-to-cart-btn', function(e) {
            e.preventDefault();

            var form = $(this).closest('.add-to-cart-form');
            var formData = form.serialize();

            $.ajax({
                url: '${pageContext.request.contextPath}/add-to-cart',
                type: 'POST',
                data: formData,
                dataType: 'json',
                success: function(response) {
                    if (response.status === 'success') {
                        $('.cart-count').text(response.quantity);
                        notyf.success('Đã thêm sản phẩm vào giỏ hàng!');
                    } else {
                        notyf.error(response.message);
                    }
                },
                error: function(xhr, status, error) {
                    notyf.error('Có lỗi xảy ra khi thêm vào giỏ hàng');
                }
            });
        });
    });
</script>
<script src="../assets/js/chuyendoicacnut.js"></script>
<script src="../assets/js/left_right.js"></script>
<script src="../assets/js/slider.js"></script>
<script src="../assets/js/scrollTop.js"></script>
<script src="../assets/js/index_ajax.js"></script>
</body>
</html>
