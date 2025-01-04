<%--
  Created by IntelliJ IDEA.
  User: MikeJohnP
  Date: 1/4/2025
  Time: 4:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý thành phần</title>

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
                    <div class="back-button button "></div>
                    <div class="breadcumb">
                        <div class="breadcumb-icon f-s-25">
                            <i class="fa-solid fa-circle-info"></i>
                        </div>
                        <a href="#" class="f-bold f-s-25 breadcumb-text">Quản lý thành phần</a>
                    </div>
                </div>
            </nav>
            <div class="product-table table _4c">
                <div class="title-icon">
                    <p class="text_entry_title"> Màu sắc</p>
                    <div class="button bg_green f-cl-white" onclick="showModifyItem()">Thêm</div>
                </div>
                <table id="example3" class="display" style="width:100%">
                    <tbody id="table-data3"></tbody>
                </table>
            </div>
            <div class="product-table table _2c">
                <div class="title-icon">
                    <p class="text_entry_title"> Chất liệu</p>
                    <div class="button bg_green f-cl-white" onclick="showModifyItem()">Thêm</div>
                </div>
                <table id="example" class="display" style="width:100%">
                    <tbody id="table-data"></tbody>
                </table>
            </div>
            <div class="product-table table _2c">
                <div class="title-icon">
                    <p class="text_entry_title"> Nhà cung cấp</p>
                    <div class="button bg_green f-cl-white" onclick="showModifyItem()">Thêm</div>
                </div>
                <table id="example2" class="display" style="width:100%">
                    <tbody id="table-data2"></tbody>
                </table>
            </div>

        </div>
    </div>
    <div class="notifi-box" id="box">
        <h2>Có <span>3 thông báo mới</span></h2>
        <div class="notifi-item">
            <i class="fa-solid fa-user-tag fa-2x"></i>
            <div class="text">
                <h4>Có 4 khách hàng mới</h4>
            </div>
        </div>
        <div class="notifi-item">
            <i class="fa-solid fa-bookmark fa-2x"></i>
            <div class="text">
                <h4>Đã có thêm 4 đơn đặt hàng mới</h4>
            </div>
        </div>
        <div class="notifi-item">
            <i class="fa-solid fa-thumbs-up fa-2x"></i>
            <div class="text">
                <h4>Hôm qua làm việc tốt lắm</h4>
            </div>
        </div>
    </div>
    <div class="modify-item-sm" id="show_content">
        <div class="title-icon">
            <p class="text_entry_title"></p>
            <i class="fa-solid fa-xmark fa-lg" onclick="exitModifyItem()"></i>
        </div>
        <form action="" class="main-grid">
            <div class="product-name _4c">
                <div class="fui-basic-input flex-column gap-6">
                    <label for="categoryname" class="f-bold f-s-14 f-cl-black">Tên</label>
                    <input type="text" name="name" placeholder="" class="input input-bordered f-s-14" id="categoryname" autocomplete="off"/>
                </div>
            </div>
            <div class="_1c">
                <div class="button bg_green f-cl-white" onclick="exitModifyItem()">Thêm</div>
            </div>
        </form>
    </div>
</div>
<script src="/assets/js/notification.js"></script>
<script src="/assets/js/accordion.js"></script>
<script src="/assets/js/exitfFunc.js"></script>

<script>
    $(document).ready(function () {
        const materialSample = ["Gốm", "Gỗ", "Thuỷ tinh", "Nhựa"];
        const manufacturerSample = ["Cattalan", "Vitto", "Mikado", "Xsmart-Cattalan"];
        const colorSample = ["Xanh ngọc", "Xanh dương", "Trắng", "Cam"];
        // Hàm tạo dữ liệu ngẫu nhiên
        function generateRandomDataForMaterial() {

            const data = [];

            for (let i = 0; i < materialSample.length; i++) {
                const checkBox = "<input type=\"checkbox\"></input>";
                const materialCode = "<a onclick='showModifyItem()'>" + i  + "</a>";
                const materialName = materialSample[i];
                const date = new Date(2024, Math.floor(Math.random() * 12), Math.ceil(Math.random() * 28));
                const formattedDate = date.toISOString().split('T')[0];
                const modifyRecord = " <div class='table-icon-label'>  <a href=\"#\" onclick='showModifyItem()'><i class=\"fa-solid fa-note-sticky\"></i></a>" + "<a href=\"#\"><i class=\"fa-solid fa-eraser\"></i></a> </div>";
                data.push([
                    checkBox,
                    materialCode,
                    materialName,
                    modifyRecord,
                ]);
            }
            return data;
        }

        function generateRandomDataForManufacturer() {

            const data = [];

            for (let i = 0; i < manufacturerSample.length; i++) {
                const checkBox = "<input type=\"checkbox\"></input>";
                const manufacturerCode = "<a onclick='showModifyItem()'>" + i  + "</a>";
                const manufacturerName = manufacturerSample[i];
                const date = new Date(2024, Math.floor(Math.random() * 12), Math.ceil(Math.random() * 28));
                const formattedDate = date.toISOString().split('T')[0];
                const modifyRecord = " <div class='table-icon-label'>  <a href=\"#\" onclick='showModifyItem()'><i class=\"fa-solid fa-note-sticky\"></i></a>" + "<a href=\"#\"><i class=\"fa-solid fa-eraser\"></i></a> </div>";
                data.push([
                    checkBox,
                    manufacturerCode,
                    manufacturerName,
                    modifyRecord,
                ]);
            }
            return data;
        }

        function generateRandomDataForColor() {

            const data = [];

            for (let i = 0; i < colorSample.length; i++) {
                const checkBox = "<input type=\"checkbox\"></input>";
                const colorCode = "<a onclick='showModifyItem()'>" + i  + "</a>";
                const colorName = colorSample[i];
                const date = new Date(2024, Math.floor(Math.random() * 12), Math.ceil(Math.random() * 28));
                const formattedDate = date.toISOString().split('T')[0];
                const modifyRecord = " <div class='table-icon-label'>  <a href=\"#\" onclick='showModifyItem()'><i class=\"fa-solid fa-note-sticky\"></i></a>" + "<a href=\"#\"><i class=\"fa-solid fa-eraser\"></i></a> </div>";

                data.push([
                    checkBox,
                    colorCode,
                    colorName,
                    modifyRecord,
                ]);
            }
            return data;
        }
        // Thêm dữ liệu vào bảng
        const table = $('#example').DataTable({
            data: generateRandomDataForMaterial(),
            dom: '<"clear">',
            columns: [
                { title: " " },
                { title: "ID" },
                { title: "Tên chất liệu" },
                { title: "Chỉnh sửa" }
            ],
        });

        const table2 = $('#example2').DataTable({
            data: generateRandomDataForManufacturer(),
            dom: '<"clear">',
            columns: [
                { title: " " },
                { title: "ID" },
                { title: "Tên NSX" },
                { title: "Chỉnh sửa" }
            ],
        });

        const table3 = $('#example3').DataTable({
            data: generateRandomDataForColor(),
            dom: '<"clear">',
            columns: [
                { title: " " },
                { title: "ID" },
                { title: "Tên Màu" },
                { title: "Chỉnh sửa" }
            ],
        });
    });
</script>
</body>

</html>
