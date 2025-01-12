<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard</title>

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
    <link rel="stylesheet" href="/assets/css/grid-layout.css">
    <link rel="stylesheet" href="/assets/css/admin-ruleset.css">
    <link rel="stylesheet" href="/assets/css/InputViaIcon.css">
    <link rel="stylesheet" href="/assets/css/admin-dashboard.css">
    <link rel="stylesheet" href="/assets/css/notification.css">
</head>

<body>
    <div class="admin-container grid-layout">
        <jsp:include page="../view_shared/admin/admin-grid.jsp"/>
        <div class="content grid-item content-grid">
            <div class="main-grid">
                <div class="card _1c _2r">
                    <div class="title-icon">
                        <p class="text_entry_title">Tổng doanh thu</p>
                        <i class="fa-solid fa-money-bill text_entry_title fa-lg"></i>
                    </div>
                    <div class="content-entry">
                        <p class="big-title f-cl-black f-bold f-s-30">
                            <f:formatNumber value="${doanhThu}" type="number" maxFractionDigits="0"/>
                        </p>
                        <p class="less-title f-cl-black f-bold f-s-16">
                            VNĐ
                        </p>
                    </div>

                </div>
                <div class="card _1c _2r">
                    <div class="title-icon">
                        <p class="text_entry_title">Khách hàng</p>
                        <i class="fa-solid fa-user text_entry_title fa-lg"></i>
                    </div>
                    <div class="content-entry">
                        <p class="big-title f-cl-black f-bold f-s-30">
                            <f:formatNumber value="${khachHang}" type="number" maxFractionDigits="0"/>
                        </p>
                        <p class="less-title f-cl-black f-bold f-s-16">
                            người
                        </p>
                    </div>
                </div>
                <div class="card _1c _2r">
                    <div class="title-icon">
                        <p class="text_entry_title">Tổng sản phẩm</p>
                        <i class="fa-solid fa-bookmark fa-lg"></i>
                    </div>
                    <div class="content-entry">
                        <p class="big-title f-cl-black f-bold f-s-30">
                            <f:formatNumber value="${TongSanPham}" type="number" maxFractionDigits="0"/>
                        </p>
                        <p class="less-title f-cl-black f-bold f-s-16">
                            sản phẩm
                        </p>
                    </div>
                </div>
                <div class="card _1c _2r">
                    <div class="title-icon">
                        <p class="text_entry_title">Giao dịch trong ngày</p>
                        <i class="fa-solid fa-van-shuttle fa-lg"></i>
                    </div>
                    <div class="content-entry">
                        <p class="big-title f-cl-black f-bold f-s-30">
                            <f:formatNumber value="${GDMotNgay}" type="number" maxFractionDigits="0"/>
                        </p>
                        <p class="less-title f-cl-black f-bold f-s-16">
                            giao dịch
                        </p>
                    </div>
                </div>
                <div class="table _4c _5r">
                    <div class="title-icon">
                        <p class="text_entry_title">Tình trạng đơn hàng</p>
                        <i class="fa-solid fa-money-bill text_entry_title fa-lg"></i>
                    </div>
                    <div class="fui-table-ui-basic-linh table-wrap">
                        <table>
                            <thead>
                                <tr>
                                    <th>Mã đơn hàng</th>
                                    <th>Tình trạng</th>
                                    <th>Tổng giá</th>
                                    <th>Người đặt</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="dh" items="${DonHang}">
                                <tr>
                                    <td>${dh.id}</td>
                                    <td class="pcs">${dh.status}</td>
                                    <td >  <f:formatNumber value="${dh.totalPrice}" type="number" maxFractionDigits="0"/> đ </td>
                                    <td class="per">${dh.userId}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
<%--                <div class="table _2c _4r">--%>
<%--                    <div class="title-icon">--%>
<%--                        <p class="text_entry_title">Sản phẩm hết hàng</p>--%>
<%--                        <i class="fa-solid fa-money-bill text_entry_title fa-lg"></i>--%>
<%--                    </div>--%>
<%--                    <div class="fui-table-ui-basic-linh table-wrap">--%>
<%--                        <table>--%>
<%--                            <thead>--%>
<%--                            <tr>--%>
<%--                                <th>Mã Sản phẩm</th>--%>
<%--                                <th>Loại Sản phẩm</th>--%>
<%--                                <th>Ngày hết</th>--%>
<%--                            </tr>--%>
<%--                            </thead>--%>
<%--                            <tbody>--%>
<%--                            <tr>--%>
<%--                                <td>432524</td>--%>
<%--                                <td>Gạch ốp caitlyn</td>--%>
<%--                                <td>31-10-2024</td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td>54324</td>--%>
<%--                                <td>Gạch ốp ceramic</td>--%>
<%--                                <td>30-10-2024</td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td>432523</td>--%>
<%--                                <td>Gạch bóng</td>--%>
<%--                                <td>12-10-2024</td>--%>
<%--                            </tr>--%>
<%--                            </tbody>--%>
<%--                        </table>--%>
<%--                    </div>--%>
<%--                </div>--%>

            </div>
        </div>
    </div>

    <script src="/assets/js/notification.js"></script>
</body>

</html>