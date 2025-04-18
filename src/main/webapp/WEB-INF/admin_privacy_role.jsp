<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý chính sách quyền</title>

    <!-- Reset CSS -->
    <link rel="stylesheet" href="/assets/css/reset.css" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/assets/icons/logo2_no_text.svg">

    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js" integrity="sha512-6sSYJqDreZRZGkJ3b+YfdhB3MzmuP9R7X1QZ6g5aIXhRvR1Y/N/P47jmnkENm7YL3oqsmI6AK+V6AD99uWDnIw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- CSS -->
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

    <!-- CKeditor 4 -->
    <script src="/assets/ckeditor/ckeditor.js"></script>

    <!-- Sweet alert 2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
<div class="admin-container grid-layout">
    <jsp:include page="../view_shared/admin/admin-grid.jsp"/>

    <!-- Nội dung chính -->
    <div class="content grid-item content-grid">
        <div class="main-grid">
            <!-- Thanh điều hướng -->
            <nav class="navbar tag-line _4c _1r">
                <div class="nav-back-prev">
                    <div class="breadcumb">
                        <div class="breadcumb-icon f-s-25">
                            <i class="fa-solid fa-user-shield"></i>
                        </div>
                        <a href="#" class="f-bold f-s-25 breadcumb-text">Quyền và hạng mục</a>
                    </div>
                </div>
                <div class="funcproduct">
                </div>
            </nav>

            <!-- Bảng danh sách roles và permissions -->
            <!-- Cột trái: Danh sách roles -->
            <div class="_2c">
                <div class="card">
                    <div class="title-icon">
                        <p class="text_entry_title">Quyền</p>
                        <button class="button bg_green f-cl-white" id="role_add">Thêm</button>
                    </div>
                    <table id="roles" class="display" style="width:100%">
                        <thead>
                        <tr>
                            <th>Tên quyền</th>
                            <th>Mô tả</th>
                            <th>Trạng thái</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>

            <div class="_2c">
                <div class="card">
                    <div class="title-icon">
                        <p class="text_entry_title"> Hạng mục</p>
                        <button class="button bg_green f-cl-white" id="res_add">Thêm</button>
                    </div>
                    <table id="resource" class="display" style="width:100%">
                        <thead>
                        <tr>
                            <th>Hạng mục</th>
                            <th>Tên danh mục</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal: Create resource -->
    <div class="modal micromodal-slide" id="create_resource_modal" aria-hidden="true">
        <div class="modal__overlay" tabindex="-1" data-micromodal-close>
            <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                <header class="modal__header">
                    <h2 class="modal__title">Thêm mới dữ liệu</h2>
                    <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                </header>
                <div class="modal-content-content">
                    <div class="modal__content">
                        <form id="add_resource_form" class="main-grid">
                            <!-- Name Field -->
                            <div class="form-group _4c">
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="resource_name" class="f-bold f-s-14 f-cl-black">Tên</label>
                                    <input type="text" name="resource_name" id="resource_name" class="input input-bordered f-s-14" placeholder="Nhập tên" required />
                                </div>
                            </div>

                            <!-- Submit Button -->
                            <div class="_1c">
                                <button class="button bg_green f-cl-white" type="button" id="add_resource_btn">Thêm</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal micromodal-slide" id="update_resource_modal" aria-hidden="true">
        <div class="modal__overlay" tabindex="-1" data-micromodal-close>
            <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                <header class="modal__header">
                    <h2 class="modal__title">Chỉnh sửa dữ liệu</h2>
                    <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                </header>
                <div class="modal-content-content">
                    <div class="modal__content">
                        <form id="modify_resource_form" class="main-grid">
                            <!-- Name Field -->
                            <div class="form-group _4c">
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="resource_name_update" class="f-bold f-s-14 f-cl-black">Tên</label>
                                    <input type="text" name="resource_name_update" id="resource_name_update" class="input input-bordered f-s-14" placeholder="Nhập tên" required />
                                </div>
                            </div>

                            <input type="hidden" name="resource_id_update" id="resource_id_update" />
                            <!-- Submit Button -->
                            <div class="_1c">
                                <button class="button bg_green f-cl-white" type="button" id="update_resource_btn">Cập nhật</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal: Create Role -->
    <div class="modal micromodal-slide" id="create_role_modal" aria-hidden="true">
        <div class="modal__overlay" tabindex="-1" data-micromodal-close>
            <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                <header class="modal__header">
                    <h2 class="modal__title" id="create_role_title">Thêm mới dữ liệu</h2>
                    <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                </header>
                <div class="modal-content-content">
                    <div class="modal__content">
                        <form id="add_role_form" class="main-grid">
                            <!-- Name Field -->
                            <div class="form-group _4c">
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="role_name" class="f-bold f-s-14 f-cl-black">Tên</label>
                                    <input type="text" name="role_name" id="role_name" class="input input-bordered f-s-14" placeholder="Nhập tên" required />
                                </div>
                            </div>

                            <!-- Description Field -->
                            <div class="form-group _4c">
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="role_description" class="f-bold f-s-14 f-cl-black">Mô tả</label>
                                    <input type="text" name="role_description" id="role_description" class="input input-bordered f-s-14" placeholder="Nhập mô tả" />
                                </div>
                            </div>

                            <!-- Status Field -->
                            <div class="form-group _4c">
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="status" class="f-bold f-s-14 f-cl-black">Trạng thái</label>
                                    <select name="status" id="status" class="input input-bordered f-s-14" required>
                                        <option value="true">Kích hoạt</option>
                                        <option value="false">Hủy</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Submit Button -->
                            <div class="_1c">
                                <button class="button bg_green f-cl-white" type="button" id="add_role_btn">Thêm</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal: Update Role -->
    <div class="modal micromodal-slide" id="update_role_modal" aria-hidden="true">
        <div class="modal__overlay" tabindex="-1" data-micromodal-close>
            <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                <header class="modal__header">
                    <h2 class="modal__title">Chỉnh sửa dữ liệu</h2>
                    <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                </header>
                <div class="modal-content-content">
                    <div class="modal__content">
                        <form id="modify_role_form" class="main-grid">
                            <!-- Name Field -->
                            <div class="form-group _4c">
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="role_name_update" class="f-bold f-s-14 f-cl-black">Tên</label>
                                    <input type="text" name="role_name_update" id="role_name_update" class="input input-bordered f-s-14" placeholder="Nhập tên" required />
                                </div>
                            </div>

                            <!-- Description Field -->
                            <div class="form-group _4c">
                                <div class="fui-basic-input flex-column gap-6">
                                    <label for="role_description_update" class="f-bold f-s-14 f-cl-black">Mô tả</label>
                                    <input type="text" name="role_description_update" id="role_description_update" class="input input-bordered f-s-14" placeholder="Nhập mô tả" />
                                </div>
                            </div>
                            <input type="hidden" name="role_id_update" id="role_id_update" />
                            <!-- Submit Button -->
                            <div class="_1c">
                                <button class="button bg_green f-cl-white" type="button" id="update_role_btn">Cập nhật</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
    <script src="/assets/js/script.js"></script>
    <script src="/assets/js/notification.js"></script>
    <script src="/assets/js/accordion.js"></script>
    <script src="/assets/js/exitfFunc.js"></script>
    <script src="/assets/js/adminDatatable.js"></script>
    <script src="/assets/js/admin_privacy_role.js"></script>
</body>
</html>