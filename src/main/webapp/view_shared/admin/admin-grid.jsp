<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<body>
<div class="header grid-item header-grid">
    <div class="logo">
        <img src="/assets/icons/logo_2_white.svg" alt="">
    </div>
    <div class="search-func">
        <div class="fui-input-with-icon">
            <input class="input" type="text" placeholder="fastui@gmail.com" />
            <span class="icon f-s-12">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </span>
        </div>
    </div>
    <div class="signout">
        <div class="logout-icon icon-hover">
            <i class="fa-solid fa-table-list fa-2x"></i>
        </div>
        <div class="logout-icon icon-hover" onclick="toggleNotifi()">
            <i class="fa-regular fa-bell fa-2x"></i>
        </div>
        <div class="logout-icon icon-hover">
            <i class="fa-solid fa-arrow-right-from-bracket fa-2x"></i>
        </div>
    </div>
    <div class="acount-info">
        <i class="fa-regular fa-circle-user fa-2x"></i>
        <div class="account-label">
            <p class="text text-name"> Tạ Hoàng Phúc</p>
            <p class="text text-permission"> Admin</p>
        </div>
    </div>

</div>
<div class="sidebar grid-item sidebar-grid">
    <a href="/admin" class="sidebar-button .has-icon">
        <div class="sidebar-icon">
            <i class="fa-solid fa-house-user"></i>
        </div>
        <p class="text">
            Dashboard
        </p>
    </a>
    <a href="/admin/manage-product" class="sidebar-button">
        <div class="sidebar-icon">
            <i class="fa-solid fa-table-list"></i>
        </div>
        <p class="text">
            Quản lý sản phẩm
        </p>
    </a>
    <a href="/admin/addproduct" class="sidebar-button">
        <div class="sidebar-icon">
            <i class="fa-regular fa-square-plus"></i>
        </div>
        <p class="text">
            Thêm sản phẩm
        </p>
    </a>
    <a href="admin/admin_manageCategory.html" class="sidebar-button">
        <div class="sidebar-icon">
            <i class="fa-solid fa-layer-group"></i>
        </div>
        <p class="text">
            Quản lý danh mục
        </p>
    </a>
    <a href="admin_productelement.html" class="sidebar-button">
        <div class="sidebar-icon">
            <i class="fa-solid fa-circle-info"></i>
        </div>
        <p class="text">
            Quản lý thành phần
        </p>
    </a>
    <a href="admin_manageorder.html" class="sidebar-button">
        <div class="sidebar-icon">
            <i class="fa-solid fa-arrow-down-up-across-line"></i>
        </div>
        <p class="text">
            Quản lý đơn hàng
        </p>
    </a>
    <a href="admin_manageuser.html" class="item5 sidebar-button">
        <div class="sidebar-icon">
            <i class="fa-solid fa-user-tag"></i>
        </div>
        <p class="text">
            Quản lý khách hàng
        </p>
    </a>

</div>
</body>
</html>
