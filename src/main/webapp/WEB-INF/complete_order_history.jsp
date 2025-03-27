<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch sử đơn hàng </title>
    <link rel="stylesheet" href="/assets/css/lichsudonhangthanhcong.css">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/cacthanhphancodinh.css">
    <link rel="stylesheet" href="/assets/css/giohang.css">
    <link rel="stylesheet" href="/assets/css/dropdown_user_menu.css">
    <link rel="icon" type="image/x-icon" href="/assets/icons/logo2_no_text.svg" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <style>
        .order-group {
            border: 1px solid #ddd;
            margin-bottom: 20px;
            padding: 10px;
            background-color: #f9f9f9;
        }
        .order-header {
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
    </style>
</head>
<body>
<jsp:include page="../view_shared/header_footer/header.jsp"/>

<div class="container">
    <aside class="sidebar">
        <ul>
            <li><b>Tài Khoản Của Tôi</b></li>
            <a href="profile"><li>Hồ Sơ</li></a>
            <hr>
            <li class="active">Đơn Mua</li>
            <hr>
            <a href="/"><li>Quay về trang chủ</li></a>
        </ul>
    </aside>

    <main class="profile">
        <div class="danhmucdautien">
            <div class="DH active" onclick="loadOrders('all')">Tất cả</div>
            <div class="DH" onclick="loadOrders('Processing')">Đang xử lý</div>
            <div class="DH" onclick="loadOrders('Shipping')">Chờ giao hàng</div>
            <div class="DH" onclick="loadOrders('Delivered')">Đơn đã giao</div>
            <div class="DH" onclick="loadOrders('Cancelled')">Đơn đã hủy</div>
        </div>

        <div class="noidungcacdonhang" id="orderContent">
            <div class="cacsanpham">
                <div class="hoanthanh"><b>TẤT CẢ ĐƠN HÀNG</b></div>
                <hr>
                <c:if test="${not empty orderDetails}">
                    <!-- Nhóm các sản phẩm theo OrderID -->
                    <c:forEach var="entry" items="${orderGroups}">
                        <div class="order-group">
                            <div class="order-header">
                                <span>Đơn hàng #${entry.key} - Ngày tạo: ${orderCreateDates[entry.key]} - Trạng thái: ${orderStatusMap[entry.key]}</span>
                                <c:set var="orderStatus" value="${orderStatusMap[entry.key]}" />
                                <c:if test="${orderStatus == 'Processing' || orderStatus == 'Shipping'}">
                                    <a class="mualaine" href="/cancelOrder?orderId=${entry.key}" style="display: inline-block;">
                                        <div class="mualai">Hủy đơn</div>
                                    </a>
                                </c:if>
                            </div>
                            <c:forEach var="order" items="${entry.value}">
                                <div class="sanpham">
                                    <div class="hinhanhcuacaigach">
                                        <img class="img-donhang" src="${order.productImg}" alt="">
                                    </div>
                                    <div class="chitietsanpham">
                                        <div class="tengachmen1">${order.productName}</div>
                                        <div class="soluong1">Số lượng ${order.quantity}</div>
                                    </div>
                                    <div>₫${order.price}</div>
                                    <c:set var="orderStatus" value="${orderStatusMap[order.orderId]}" />
                                    <c:choose>
                                        <c:when test="${orderStatus == 'Processing' || orderStatus == 'Shipping'}">
                                            <a class="mualaine" href="/pdetail?pid=${order.productId}" style="display: inline-block;">
                                                <div class="mualai">Xem chi tiết</div>
                                            </a>
                                        </c:when>
                                        <c:when test="${orderStatus == 'Cancelled'}">
                                            <a class="mualaine" href="/reorder?orderId=${order.orderId}" style="display: inline-block;">
                                                <div class="mualai">Đặt lại</div>
                                            </a>
                                            <a class="mualaine" href="/pdetail?pid=${order.productId}" style="display: inline-block;">
                                                <div class="mualai">Xem chi tiết</div>
                                            </a>
                                        </c:when>
                                        <c:when test="${orderStatus == 'Delivered'}">
                                            <a class="mualaine" href="/pdetail?pid=${order.productId}" style="display: inline-block;">
                                                <div class="mualai">Đánh giá</div>
                                            </a>
                                            <a class="mualaine" href="/pdetail?pid=${order.productId}" style="display: inline-block;">
                                                <div class="mualai">Mua lại</div>
                                            </a>
                                        </c:when>
                                    </c:choose>
                                </div>
                                <hr>
                            </c:forEach>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty orderDetails}">
                    <p>Không có đơn hàng nào.</p>
                </c:if>
            </div>
        </div>
    </main>
</div>

<jsp:include page="../view_shared/header_footer/footer.jsp"/>

<script>
    function loadOrders(status) {
        $.ajax({
            url: "/completeorderhistory",
            type: "GET",
            data: {
                status: status,
                ajax: "true" // Thêm tham số để phân biệt yêu cầu AJAX
            },
            success: function(data) {
                $("#orderContent").html(data);
                $(".DH").removeClass("active");
                $(`div[onclick="loadOrders('${status}')"]`).addClass("active");
            },
            error: function(xhr) {
                console.error("Có lỗi xảy ra khi tải dữ liệu:", xhr);
                $("#orderContent").html("<p>Có lỗi xảy ra khi tải đơn hàng.</p>");
            }
        });
    }
</script>
</body>
</html>