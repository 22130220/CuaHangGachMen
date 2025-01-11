<%--
  Created by IntelliJ IDEA.
  User: MikeJohnP
  Date: 1/11/2025
  Time: 9:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý người dùng</title>

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
    <link rel="stylesheet" href="/assets/css/admin-ruleset.css">
    <link rel="stylesheet" href="/assets/css/basicinput.css">
    <link rel="stylesheet" href="/assets/css/InputViaIcon.css">
    <link rel="stylesheet" href="/assets/css/admin-manageproduct.css">
    <link rel="stylesheet" href="/assets/css/notification.css">
    <link rel="stylesheet" href="/assets/css/arccordion.css">
    <link rel="stylesheet" href="/assets/css/product-detail.css">

    <!-- Thêm Datatable-->
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/3.0.3/css/responsive.dataTables.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/4.0.1/css/fixedHeader.dataTables.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/3.2.0/css/buttons.dataTables.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/select/2.1.0/css/select.dataTables.css">

    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/responsive/3.0.3/js/dataTables.responsive.js"></script>
    <script src="https://cdn.datatables.net/responsive/3.0.3/js/responsive.dataTables.js"></script>
    <script src="https://cdn.datatables.net/fixedheader/4.0.1/js/dataTables.fixedHeader.js"></script>
    <script src="https://cdn.datatables.net/fixedheader/4.0.1/js/fixedHeader.dataTables.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.2.0/js/dataTables.buttons.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.2.0/js/buttons.dataTables.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.2.0/js/buttons.colVis.min.js"></script>
    <script src="https://cdn.datatables.net/select/2.1.0/js/dataTables.select.js"></script>
    <script src="https://cdn.datatables.net/select/2.1.0/js/select.dataTables.js"></script>

    <!-- Jquery UI-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/jquery-ui.min.js" integrity="sha512-MSOo1aY+3pXCOCdGAYoBZ6YGI0aragoQsg1mKKBHXCYPIWxamwOE7Drh+N5CPgGI5SA9IEKJiPjdfqWFWmZtRA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/themes/base/jquery-ui.min.css" integrity="sha512-TFee0335YRJoyiqz8hA8KV3P0tXa5CpRBSoM0Wnkn7JoJx1kaq1yXL/rb8YFpWXkMOjRcv5txv+C6UluttluCQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/themes/base/theme.min.css" integrity="sha512-lfR3NT1DltR5o7HyoeYWngQbo6Ec4ITaZuIw6oAxIiCNYu22U5kpwHy9wAaN0vvBj3U6Uy2NNtAfiaKcDxfhTg==" crossorigin="anonymous" referrerpolicy="no-referrer" />


    <!--Micromodal.js-->
    <script src="https://cdn.jsdelivr.net/npm/micromodal/dist/micromodal.min.js"></script>
    <link rel="stylesheet" href="/assets/css/micromodal.css">

    <!--Notyf-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">

    <style>
        div.container {
            max-width: 1200px;
        }
    </style>
</head>

<body>
<div class="admin-container grid-layout">
    <jsp:include page="../view_shared/admin/admin-grid.jsp"/>
    <div class="content grid-item content-grid">
        <div class="main-grid">
            <nav class="navbar tag-line _4c _1r">
                <div class="nav-back-prev">
                    <div class="breadcumb">
                        <div class="breadcumb-icon f-s-25">
                            <i class="fa-solid fa-user-tag"></i>
                        </div>
                        <a href="#" class="f-bold f-s-25 breadcumb-text">Quản lý người dùng</a>
                    </div>
                </div>
                <div class="funcproduct">
                    <div class="button bg_green f-cl-white">Thêm người dùng</div>
                </div>
            </nav>
            <div class="product-table table _4c _6r">
                <table id="user" class="display" style="width:100%">
                    <thead>
                    <tr>
                        <th>Tên người dùng</th>
                        <th>Trạng thái</th>
                        <th>Email</th>
                        <th>Ngày sinh</th>
                        <th>Giới tính</th>
                        <th>Ngày đăng ký</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
    <div class="modify-item-sm" id="show_content">
        <div class="title-icon">
            <p class="text_entry_title"> Thêm Nguời dùng</p>
            <i class="fa-solid fa-xmark fa-lg" onclick="exitModifyItem()"></i>
        </div>
        <form action="" class="main-grid">
            <div class="user-name _4c">
                <div class="fui-basic-input flex-column gap-6">
                    <label for="categoryname" class="f-bold f-s-14 f-cl-black">Tên người dùng</label>
                    <input type="text" name="name" placeholder="" class="input input-bordered f-s-14" id="categoryname" autocomplete="off"/>
                </div>
            </div>
            <div class="user-role _2c">
                <div class="fui-basic-input flex-column gap-6">
                    <label for="userrole" class="f-bold f-s-14 f-cl-black">Quyền</label>
                    <select name="userrole" id="userrole" class="input input-bordered f-s-14">
                        <option value=""></option>
                        <option value="1">Customer</option>
                        <option value="2">Admin</option>
                    </select>
                </div>
            </div>
            <div class="poduct-material _2c">
                <div class="fui-basic-input flex-column gap-6">
                    <label for="status" class="f-bold f-s-14 f-cl-black"> Trạng thái</label>
                    <select name="" id="status" class="input input-bordered f-s-14">
                        <option value="1">Hiển thị</option>
                        <option value="2">Ẩn</option>
                    </select>
                </div>
            </div>
            <div class="user-email _2c">
                <div class="fui-basic-input flex-column gap-6">
                    <label for="useremail" class="f-bold f-s-14 f-cl-black">Email</label>
                    <input type="text" name="name" placeholder="" class="input input-bordered f-s-14" id="useremail" autocomplete="off"/>
                </div>
            </div>
            <div class="user-phone _2c">
                <div class="fui-basic-input flex-column gap-6">
                    <label for="userphone" class="f-bold f-s-14 f-cl-black">Số điện thoại</label>
                    <input type="text" name="name" placeholder="" class="input input-bordered f-s-14" id="userphone" autocomplete="off"/>
                </div>
            </div>

            <div class="user-password _4c">
                <div class="fui-basic-input flex-column gap-6">
                    <label for="userpassword" class="f-bold f-s-14 f-cl-black">Mật khẩu</label>
                    <input type="password" name="name" placeholder="" class="input input-bordered f-s-14" id="userpassword" autocomplete="off"/>
                </div>
            </div>

            <div class="_1c">
                <div class="button bg_green f-cl-white" onclick="exitModifyItem()">Thêm</div>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
<script src="/assets/js/script.js"></script>
<script src="/assets/js/userDatatable.js"></script>
<script src="/assets/js/exitfFunc.js"></script>
</body>

</html>
