<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Quản lý banner</title>

    <!-- Reset CSS -->
    <link rel="stylesheet" href="/assets/css/reset.css"/>

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/assets/icons/logo2_no_text.svg">

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js" integrity="sha512-6sSYJqDreZRZGkJ3b+YfdhB3MzmuP9R7X1QZ6g5aIXhRvR1Y/N/P47jmnkENm7YL3oqsmI6AK+V6AD99uWDnIw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- CSS Styles -->
    <link rel="stylesheet" href="/assets/css/style.css"/>
    <link rel="stylesheet" href="/assets/css/admin-ruleset.css">
    <link rel="stylesheet" href="/assets/css/basicinput.css">
    <link rel="stylesheet" href="/assets/css/InputViaIcon.css">
    <link rel="stylesheet" href="/assets/css/admin-manageproduct.css">
    <link rel="stylesheet" href="/assets/css/notification.css">
    <link rel="stylesheet" href="/assets/css/arccordion.css">

    <!-- DataTable -->
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/3.0.3/css/responsive.dataTables.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/4.0.1/css/fixedHeader.dataTables.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/3.2.0/css/buttons.dataTables.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/select/2.1.0/css/select.dataTables.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/searchpanes/2.3.3/css/searchPanes.dataTables.css">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>

    <!-- DataTable Scripts -->
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

    <!-- jQuery UI -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/jquery-ui.min.js" integrity="sha512-MSOo1aY+3pXCOCdGAYoBZ6YGI0aragoQsg1mKKBHXCYPIWxamwOE7Drh+N5CPgGI5SA9IEKJiPjdfqWFWmZtRA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/themes/base/jquery-ui.min.css" integrity="sha512-TFee0335YRJoyiqz8hA8KV3P0tXa5CpRBSoM0Wnkn7JoJx1kaq1yXL/rb8YFpWXkMOjRcv5txv+C6UluttluCQ==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/themes/base/theme.min.css" integrity="sha512-lfR3NT1DltR5o7HyoeYWngQbo6Ec4ITaZuIw6oAxIiCNYu22U5kpwHy9wAaN0vvBj3U6Uy2NNtAfiaKcDxfhTg==" crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <!-- jQuery Validate -->
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

    <!-- MicroModal -->
    <script src="https://cdn.jsdelivr.net/npm/micromodal/dist/micromodal.min.js"></script>
    <link rel="stylesheet" href="/assets/css/micromodal.css">

    <!-- Notyf -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">

    <!-- CKEditor -->
    <script src="/assets/ckeditor/ckeditor.js"></script>

    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Flmngr -->
    <script src="https://cdn.skypack.dev/flmngr"></script>
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
                            <i class="fa-solid fa-table-list"></i>
                        </div>
                        <a href="#" class="f-bold f-s-25 breadcumb-text">Quản lý banner</a>
                    </div>
                </div>
                <div class="funcproduct">
                    <a href="#" class="button bg_green f-cl-white">Thêm mới</a>
                </div>
            </nav>
            <div class="product-table table _4c _6r">
                <table id="bannerTable" class="display compact" style="width:100%">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tiêu đề</th>
                        <th>Hình ảnh</th>
                        <th>Link</th>
                        <th>Vị trí</th>
                        <th>Trạng thái</th>
                        <th>Bắt đầu</th>
                        <th>Kết thúc</th>
                        <th>Ưu tiên</th>
                        <th>Chỉnh sửa</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
        <!-- Modal cập nhật trạng thái -->
        <div class="modal micromodal-slide" id="update_id_modal" aria-hidden="true">
            <div class="modal__overlay" tabindex="-1" data-micromodal-close>
                <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                    <header class="modal__header">
                        <h2 class="modal__title">Cập nhật trạng thái</h2>
                        <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                    </header>
                    <div class="modal-content-content">
                        <form id="updateIdForm" class="main-grid">
                            <div class="modal__content _4c">
                                <div class="fui-basic-input" style="width: 100%">
                                    <label for="update_active_id" class="f-bold f-s-14 f-cl-black">Kích hoạt</label>
                                    <select name="update_active_id" id="update_active_id" class="input input-bordered f-s-14" required>
                                        <option value="true">Hoạt động</option>
                                        <option value="false">Không hoạt động</option>
                                    </select>
                                </div>
                                <footer class="modal__footer">
                                    <button type="button" class="button bg_green f-cl-white" id="update_id_btn">Cập nhật</button>
                                </footer>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal cập nhật banner -->
        <div class="modal micromodal-slide" id="update_banner_modal" aria-hidden="true">
            <div class="modal__overlay" tabindex="-1" data-micromodal-close>
                <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-2-title">
                    <header class="modal__header">
                        <h2 class="modal__title">Cập nhật banner</h2>
                        <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                    </header>
                    <div class="modal-content-content">
                        <form id="updateBannerForm" class="main-grid">
                            <div class="modal__content _4c">
                                <input type="hidden" name="id" id="banner_id">
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="banner_title" class="f-bold f-s-14 f-cl-black">Tiêu đề</label>
                                    <input type="text" name="title" id="banner_title" placeholder="Nhập tiêu đề banner" class="input input-bordered f-s-14">
                                </div>
                                <div class="fui-basic-input flex-column gap-6 input-has-button">
                                    <label for="banner_image_url" class="f-bold f-s-14 f-cl-black">Hình ảnh</label>
                                    <input type="text" name="image_url" id="banner_image_url" placeholder="URL hình ảnh" class="input input-bordered f-s-14" readonly>
                                    <button type="button" class="button bg_green f-cl-white button-input" onclick="selectImageChange(this, 'image_url')">Chọn ảnh</button>
                                </div>
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="banner_link" class="f-bold f-s-14 f-cl-black">Link</label>
                                    <input type="text" name="link" id="banner_link" placeholder="Nhập link" class="input input-bordered f-s-14">
                                </div>
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="banner_position" class="f-bold f-s-14 f-cl-black">Vị trí</label>
                                    <select name="position" id="banner_position" class="input input-bordered f-s-14">
                                        <option value="Home">Home</option>
                                        <option value="Category">Category</option>
                                        <option value="Cart">Cart</option>
                                        <option value="Checkout">Checkout</option>
                                        <option value="Blog">Blog</option>
                                    </select>
                                </div>
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="banner_start_date" class="f-bold f-s-14 f-cl-black">Ngày bắt đầu</label>
                                    <input type="datetime-local" name="start_date" id="banner_start_date" class="input input-bordered f-s-14">
                                </div>
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="banner_end_date" class="f-bold f-s-14 f-cl-black">Ngày kết thúc</label>
                                    <input type="datetime-local" name="end_date" id="banner_end_date" class="input input-bordered f-s-14">
                                </div>
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="banner_priority" class="f-bold f-s-14 f-cl-black">Ưu tiên</label>
                                    <input type="number" name="priority" id="banner_priority" placeholder="Nhập mức ưu tiên" class="input input-bordered f-s-14">
                                </div>
                                <footer class="modal__footer">
                                    <button type="button" class="button bg_green f-cl-white" id="update_banner_btn">Cập nhật</button>
                                </footer>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<textarea id="editor"></textarea>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
<script src="/assets/js/ckeditorLoadFile.js"></script>
<script src="/assets/js/script.js"></script>
<script src="/assets/js/adminDatatable.js"></script>
<script src="/assets/js/adminBanner.js"></script>
<script src="/assets/js/notification.js"></script>
<script src="/assets/js/accordion.js"></script>
<script src="/assets/js/exitfFunc.js"></script>
</body>
</html>