<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý đơn hàng</title>

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
    <link rel="stylesheet" href="https://cdn.datatables.net/searchpanes/2.3.3/css/searchPanes.dataTables.css">

    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.datatables.net/2.2.2/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/responsive/3.0.3/js/dataTables.responsive.js"></script>
    <script src="https://cdn.datatables.net/responsive/3.0.3/js/responsive.dataTables.js"></script>
    <script src="https://cdn.datatables.net/fixedheader/4.0.1/js/dataTables.fixedHeader.js"></script>
    <script src="https://cdn.datatables.net/fixedheader/4.0.1/js/fixedHeader.dataTables.js"></script>
    <script src="https://cdn.datatables.net/v/dt/jszip-3.10.1/dt-2.2.2/b-3.2.2/b-html5-3.2.2/b-print-3.2.2/datatables.min.js" integrity="sha384-XFeEEcuPa4foNB0cSctNhsnIdsGaxO8S8pGQmzblvpAIsSCNawP7jDpSeSI6+YuI" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/buttons/3.2.0/js/dataTables.buttons.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.2.0/js/buttons.dataTables.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.2.0/js/buttons.colVis.min.js"></script>
    <script src="https://cdn.datatables.net/select/3.0.0/js/dataTables.select.js"></script>
    <script src="https://cdn.datatables.net/select/3.0.0/js/select.dataTables.js"></script>
    <script src="https://cdn.datatables.net/searchpanes/2.3.3/js/dataTables.searchPanes.js"></script>
    <script src="https://cdn.datatables.net/searchpanes/2.3.3/js/searchPanes.dataTables.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js" integrity="sha384-VFQrHzqBh5qiJIU0uGU5CIW3+OWpdGGJM9LBnGbuIH2mkICcFZ7lPd/AAtI7SNf7" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js" integrity="sha384-/RlQG9uf0M2vcTw3CX7fbqgbj/h8wKxw7C3zu9/GxcBPRKOEcESxaxufwRXqzq6n" crossorigin="anonymous"></script>

    <!-- Jquery UI-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/jquery-ui.min.js" integrity="sha512-MSOo1aY+3pXCOCdGAYoBZ6YGI0aragoQsg1mKKBHXCYPIWxamwOE7Drh+N5CPgGI5SA9IEKJiPjdfqWFWmZtRA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/themes/base/jquery-ui.min.css" integrity="sha512-TFee0335YRJoyiqz8hA8KV3P0tXa5CpRBSoM0Wnkn7JoJx1kaq1yXL/rb8YFpWXkMOjRcv5txv+C6UluttluCQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/themes/base/theme.min.css" integrity="sha512-lfR3NT1DltR5o7HyoeYWngQbo6Ec4ITaZuIw6oAxIiCNYu22U5kpwHy9wAaN0vvBj3U6Uy2NNtAfiaKcDxfhTg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Jquery validate -->
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

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
                        <a href="#" class="f-bold f-s-25 breadcumb-text">Quản lý đơn hàng</a>
                    </div>
                </div>
                <div class="funcproduct">
                </div>
            </nav>
            <div class="product-table table _4c _6r">
                <table id="orders" class="display" style="width:100%">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên Người dùng</th>
                        <th>Ngày đặt</th>
                        <th>Địa chỉ</th>
                        <th>Trạng thái</th>
                        <th>Tổng giá</th>
                        <th>Chỉnh sửa</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>

    <div class="modal micromodal-slide" id="detail" aria-hidden="true">
        <div class="modal__overlay" tabindex="-1" data-micromodal-close>
            <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                <header class="modal__header">
                    <h2 class="modal__title">
                        Chi tiết đơn hàng
                    </h2>
                    <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                </header>
                <div class="modal-content-content">
                    <div class="modal__content">

                    </div>
                    <footer class="modal__footer">
                    </footer>
                </div>
            </div>
        </div>
    </div>


    <div class="modal micromodal-slide" id="update_modal" aria-hidden="true">
        <div class="modal__overlay" tabindex="-1" data-micromodal-close>
            <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                <header class="modal__header">
                    <h2 class="modal__title">
                        Cập nhật trạng thái
                    </h2>
                    <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                </header>
                <div class="modal-content-content">
                    <div class="modal__content">
                        <form id="update_form" class="main-grid">
                            <div class="user-name _4c">
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="update_fullname" class="f-bold f-s-14 f-cl-black">Tên người dùng</label>
                                    <input type="text" name="update_fullname" placeholder="" class="input input-bordered f-s-14" id="update_fullname" autocomplete="off"/>
                                </div>
                            </div>
                            <div class="poduct-material _2c">
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="update_status" class="f-bold f-s-14 f-cl-black"> Trạng thái</label>
                                    <select name="update_status" id="update_status" class="input input-bordered f-s-14">
                                        <option value="true">Hiển thị</option>
                                        <option value="false">Ẩn</option>
                                    </select>
                                </div>
                            </div>
                            <div class="user-sex _2c">
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="update_sex" class="f-bold f-s-14 f-cl-black">Giới tính</label>
                                    <select name="update_sex" id="update_sex" class="input input-bordered f-s-14">
                                        <option value="0">Nam</option>
                                        <option value="1">Nữ</option>
                                    </select>
                                </div>
                            </div>
                            <div class="user-phone _2c">
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="update_userphone" class="f-bold f-s-14 f-cl-black">Số điện thoại</label>
                                    <input type="number" name="update_userphone" placeholder="" class="input input-bordered f-s-14" id="update_userphone" autocomplete="off"/>
                                </div>
                            </div>
                            <div class="user-email _2c">
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="update_birth" class="f-bold f-s-14 f-cl-black">Ngày sinh</label>
                                    <input type="datetime-local" name="update_birth" placeholder="" class="input input-bordered f-s-14" id="update_birth" autocomplete="off"/>
                                </div>
                            </div>

                            <div class="user-email _4c">
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="update_email" class="f-bold f-s-14 f-cl-black">Email</label>
                                    <input type="email" name="update_email" placeholder="" class="input input-bordered f-s-14" id="update_email" autocomplete="off"/>
                                </div>
                            </div>
                            <div class="user-address _4c">
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="update_address" class="f-bold f-s-14 f-cl-black">Địa chỉ</label>
                                    <input type="text" name="update_address" placeholder="" class="input input-bordered f-s-14" id="update_address" autocomplete="off"/>
                                </div>
                            </div>
                        </form>
                    </div>
                    <footer class="modal__footer">
                        <button class="button bg_green f-cl-white" id="update_btn">Cập nhật</button>
                    </footer>
                </div>
            </div>
        </div>
    </div>

    <div class="modal micromodal-slide" id="show_detail" aria-hidden="true">
        <div class="modal__overlay" tabindex="-1" data-micromodal-close>
            <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                <header class="modal__header">
                    <h2 class="modal__title">
                        Chi tiết đơn hàng
                    </h2>
                    <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                </header>
                <div class="modal-content-content">
                    <div class="modal__content">
                        <table id="orderdetail" class="display" style="width:100%">
                            <thead>
                            <tr>
                                <th>Img</th>
                                <th>Tên SP</th>
                                <th>Số lượng</th>
                                <th>Tổng giá</th>
                                <th>Màu</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <footer class="modal__footer">
                    </footer>
                </div>
            </div>
        </div>
    </div>

    <div class="modal micromodal-slide" id="update_status_modal" aria-hidden="true">
        <div class="modal__overlay" tabindex="-1" data-micromodal-close>
            <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                <header class="modal__header">
                    <h2 class="modal__title">
                        Cập nhật trạng thái
                    </h2>
                    <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                </header>
                <div class="modal-content-content">
                    <div class="modal__content">
                        <div class="fui-basic-input" style="width: 100%">
                            <label for="update_active_id" class="f-bold f-s-14 f-cl-black">Kích hoạt</label>
                            <select name="update_active_id" id="update_active_id" class="input input-bordered f-s-14" required>
                                <option value="Delivered">Đã vận chuyển</option>
                                <option value="Cancelled">Đã huỷ</option>
                            </select>
                        </div>
                    </div>
                    <footer class="modal__footer">
                        <button class="button bg_green f-cl-white" id="update_id_btn">Cập nhật</button>
                    </footer>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
<script src="/assets/js/script.js"></script>
<script src="/assets/js/adminDatatable.js"></script>
<script src="/assets/js/orderDatatable.js"></script>
<script src="/assets/js/exitfFunc.js"></script>
</body>

</html>

