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
            <a href="/logout">
            <i class="fa-solid fa-arrow-right-from-bracket fa-2x"></i>
            </a>
        </div>
    </div>
    <div class="acount-info">
        <i class="fa-regular fa-circle-user fa-2x"></i>
        <div class="account-label">
            <p class="text text-name"> ${sessionScope.auth.fullname} </p>
            <p class="text text-permission"> Admin</p>
        </div>
    </div>

</div>
<div class="sidebar grid-item sidebar-grid">
    <div class="overflow-content">
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
        <a href="/admin/productcrud" class="sidebar-button">
            <div class="sidebar-icon">
                <i class="fa-regular fa-square-plus"></i>
            </div>
            <p class="text">
                Thêm sản phẩm
            </p>
        </a>
        <a href="/admin/manage-category" class="sidebar-button">
            <div class="sidebar-icon">
                <i class="fa-solid fa-layer-group"></i>
            </div>
            <p class="text">
                Quản lý danh mục
            </p>
        </a>
        <a href="/admin/element" class="sidebar-button">
            <div class="sidebar-icon">
                <i class="fa-solid fa-circle-info"></i>
            </div>
            <p class="text">
                Quản lý thành phần
            </p>
        </a>
        <a href="/admin/manage-order" class="sidebar-button">
            <div class="sidebar-icon">
                <i class="fa-solid fa-arrow-down-up-across-line"></i>
            </div>
            <p class="text">
                Quản lý đơn hàng
            </p>
        </a>
        <a href="/admin/manage-user" class="item5 sidebar-button">
            <div class="sidebar-icon">
                <i class="fa-solid fa-user-tag"></i>
            </div>
            <p class="text">
                Quản lý khách hàng
            </p>
        </a>

        <a href="/admin/manage-voucher" class="item5 sidebar-button">
            <div class="sidebar-icon">
                <i class="fa-solid fa-user-tag"></i>
            </div>
            <p class="text">
                Quản lý Voucher
            </p>
        </a>

        <!-- Accounts with collapsible sub-items -->
        <div class="sidebar-button has-subitems">
            <div class="sidebar-icon">
                <i class="fa-solid fa-users"></i>
            </div>
            <p class="text">
                Accounts
            </p>
            <div class="toggle-icon">
                <i class="fa-solid fa-chevron-down"></i>
            </div>
        </div>
        <div class="subitems" style="display: none;">
            <a href="/admin/manage-user" class="sub-sidebar-button subitem">
                <div class="sidebar-icon">
                    <i class="fa-solid fa-user"></i>
                </div>
                <p class="text">
                    User
                </p>
            </a>
            <a href="/admin/role" class="sub-sidebar-button subitem">
                <div class="sidebar-icon">
                    <i class="fa-solid fa-user-shield"></i>
                </div>
                <p class="text">
                    Role
                </p>
            </a>
            <a href="/admin/resource-group" class="sub-sidebar-button subitem">
                <div class="sidebar-icon">
                    <i class="fa-solid fa-users-rectangle"></i>
                </div>
                <p class="text">
                    Resource Group
                </p>
            </a>
            <a href="/admin/identity" class="sub-sidebar-button subitem">
                <div class="sidebar-icon">
                    <i class="fa-solid fa-id-card"></i>
                </div>
                <p class="text">
                    Identity
                </p>
            </a>

            <a href="/admin/privacy-role" class="sub-sidebar-button subitem">
                <div class="sidebar-icon">
                    <i class="fa-solid fa-id-card"></i>
                </div>
                <p class="text">
                   Quản lý quyền và hạng mục
                </p>
            </a>
    </div>
    </div>

</div>
</body>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const parentItem = document.querySelector('.sidebar-button.has-subitems');
        const subItems = document.querySelector('.subitems');
        const toggleIcon = parentItem.querySelector('.toggle-icon');

        const isMenuOpen = localStorage.getItem('accountsMenuOpen') === 'true';
        if (isMenuOpen) {
            subItems.style.display = 'block';
            toggleIcon.classList.add('active');
        } else {
            subItems.style.display = 'none';
            toggleIcon.classList.remove('active');
        }

        parentItem.addEventListener('click', function (event) {
            if (subItems.style.display === 'none' || subItems.style.display === '') {
                subItems.style.display = 'block';
                toggleIcon.classList.add('active');
                localStorage.setItem('accountsMenuOpen', 'true'); // Lưu trạng thái mở
            } else {
                subItems.style.display = 'none';
                toggleIcon.classList.remove('active');
                localStorage.setItem('accountsMenuOpen', 'false'); // Lưu trạng thái đóng
            }
        });

        const subItemLinks = document.querySelectorAll('.subitems .sidebar-button.subitem');
        subItemLinks.forEach(function (subItem) {
            subItem.addEventListener('click', function (event) {
                event.stopPropagation();
            });
        });
    });
</script>

</html>
