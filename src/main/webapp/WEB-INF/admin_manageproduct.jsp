<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý sản phẩm</title>

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

    <!-- CKeditor 4 -->
    <script src="/assets/ckeditor/ckeditor.js"></script>



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
            <input type="hidden" id="message" value="${success}">
            <div class="main-grid">
                <nav class="navbar tag-line _4c _1r">
                    <div class="nav-back-prev">
                        <div class="breadcumb">
                            <div class="breadcumb-icon f-s-25">
                                <i class="fa-solid fa-table-list"></i>
                            </div>
                            <a href="#" class="f-bold f-s-25 breadcumb-text">Quản lý sản phẩm</a>
                        </div>
                    </div>
                    <div class="funcproduct">
                        <a href="/admin/productcrud" class="button bg_green f-cl-white">Thêm mới</a>
                    </div>
                </nav>
                <div class="product-table table _4c _6r">
                    <table id="example" class="display compact" style="width:100%">
                        <thead>
                        <tr>
                            <th>Img</th>
                            <th>Tên Sp</th>
                            <th>Chất liệu</th>
                            <th>Nhà máy</th>
                           <th>Kích thước</th>
                            <th>Danh mục</th>
                            <th>Giá mỗi hộp</th>
                            <th>Tồn kho</th>
                            <th>Trạng thái</th>
                            <th>Chỉnh sửa</th>
                        </tr>
                        </thead>
                        <tfoot>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>

        <div class="modal micromodal-slide" id="update_id_modal" aria-hidden="true">
            <div class="modal__overlay" tabindex="-1" data-micromodal-close>
                <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                    <header class="modal__header">
                        <h2 class="modal__title">
                            Cập nhật trạng thái
                        </h2>
                        <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                    </header>
                    <div class="modal-content-content">
                        <form id="updateIdForm" class="main-grid">
                            <div class="modal__content" _4c>
                                <div class="fui-basic-input" style="width: 100%">
                                    <label for="update_active_id" class="f-bold f-s-14 f-cl-black">Kích hoạt</label>
                                    <select name="update_active_id" id="update_active_id" class="input input-bordered f-s-14" required>
                                        <option value="true">Bật</option>
                                        <option value="false">Tắt</option>
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

        <div class="modal micromodal-slide" id="update_product_modal" aria-hidden="true">
            <div class="modal__overlay" tabindex="-1" data-micromodal-close>
                <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                    <header class="modal__header">
                        <h2 class="modal__title">
                            Cập nhật thông tin sản phẩm
                        </h2>
                        <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                    </header>
                    <div class="modal-content-content">
                        <form id="updateProductForm" class="main-grid" method="post">
                            <div class="modal__content _4c">
                                <div class="product-name _4c">
                                    <div class="fui-basic-input flex-column gap-6">
                                        <label for="productname" class="f-bold f-s-14 f-cl-black">Tên sản phẩm</label>
                                        <input type="text" name="name" placeholder="Nhập tên sản phẩm" class="input input-bordered f-s-14" id="productname" autocomplete="off" required/>
                                    </div>
                                </div>
                                <div class="poduct-quantity _3c">
                                    <div class="fui-basic-input flex-column gap-6">
                                        <label for="size" class="f-bold f-s-14 f-cl-black">Kích thước</label>
                                        <select name="size" id="size" class="input input-bordered f-s-14" required>
                                            <c:forEach items="${sizes}" var="size">
                                                <option value="${size.id}" ${size.id == selectedSize ? 'selected' : ''}><c:out value="${size.name}"/></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="poduct-quantity _1c">
                                    <div class="fui-basic-input flex-column gap-6">
                                        <label for="productquantity" class="f-bold f-s-14 f-cl-black">Số lượng</label>
                                        <input type="number" name="quantity" placeholder="Nhập số lượng" class="input input-bordered f-s-14" id="productquantity" autocomplete="off" required/>
                                    </div>
                                </div>
                                <div class="product-price _4c">
                                    <div class="fui-basic-input flex-column gap-6">
                                        <label for="productprice" class="f-bold f-s-14 f-cl-black">Giá Sản phẩm (1 hộp)</label>
                                        <input type="number" name="price" placeholder="Nhập giá" class="input input-bordered f-s-14" id="productprice" autocomplete="off" required/>
                                    </div>
                                </div>
                                <div class="product-price-promotion _4c">
                                    <div class="fui-basic-input flex-column gap-6">
                                        <label for="price_promotion" class="f-bold f-s-14 f-cl-black">Giá khuyến mãi</label>
                                        <input type="number" name="promotion" placeholder="Nhập giá khuyến mãi" class="input input-bordered f-s-14" id="price_promotion" autocomplete="off" required/>
                                    </div>
                                </div>
                                <div class="poduct-form _4c">
                                    <div class="fui-basic-input flex-column gap-6">
                                        <label for="category" class="f-bold f-s-14 f-cl-black">Loại sản phẩm</label>
                                        <select name="category" id="category" class="input input-bordered f-s-14" required>
                                            <c:forEach items="${categories}" var="category">
                                                <option value="${category.id}"><c:out value="${category.name}"/></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="poduct-material _4c">
                                    <div class="fui-basic-input flex-column gap-6">
                                        <label for="productmaterial" class="f-bold f-s-14 f-cl-black">Chất liệu</label>
                                        <select name="material" id="productmaterial" class="input input-bordered f-s-14" required>
                                            <c:forEach items="${materials}" var="material">
                                                <option value="${material.id}"><c:out value="${material.name}"/></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="poduct-manufacturer _4c">
                                    <div class="fui-basic-input flex-column gap-6">
                                        <label for="productmanufacturer" class="f-bold f-s-14 f-cl-black">Nhà cung cấp</label>
                                        <select name="manufacturer" id="productmanufacturer" class="input input-bordered f-s-14" required>
                                            <c:forEach items="${manufacturers}" var="manufacturer">
                                                <option value="${manufacturer.id}"><c:out value="${manufacturer.name}"/></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="product-img _4c">
                                    <div class="fui-basic-input flex-column gap-6">
                                        <label for="productimg" class="f-bold f-s-14 f-cl-black">Hình ảnh</label>
                                        <input type="text" name="img" placeholder="Nhập đường dẫn hình ảnh" class="input input-bordered f-s-14" id="productimg" autocomplete="off"/>
                                    </div>
                                </div>
                                <!-- Trường ẩn để lưu vid -->
                                <input type="hidden" name="vid" id="vid">
                                <input type="hidden" name="action" value="Cập nhật">
                                <footer class="modal__footer">
                                    <button type="button" class="button bg_green f-cl-white" id="update_product_btn">Cập nhật</button>
                                </footer>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal micromodal-slide" id="update_spec_modal" aria-hidden="true">
            <div class="modal__overlay" tabindex="-1" data-micromodal-close>
                <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                    <header class="modal__header">
                        <h2 class="modal__title">
                            Thông Số Sản Phẩm
                        </h2>
                        <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                    </header>
                    <div class="modal-content-content">
                        <div class="modal__content">
                            <table id="spec" class="display compact" style="width:100%">
                                <thead>
                                <tr>
                                    <th>Tên</th>
                                    <th>Giá trị</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal micromodal-slide" id="add_spec" aria-hidden="true">
            <div class="modal__overlay" tabindex="-1" data-micromodal-close>
                <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                    <header class="modal__header">
                        <h2 class="modal__title">
                            Thêm Thông Số
                        </h2>
                        <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                    </header>
                    <div class="modal-content-content">
                        <div class="modal__content">
                            <div class="fui-basic-input" style="width: 100%">
                                <label for="add_spec_type" class="f-bold f-s-14 f-cl-black">Kích hoạt</label>
                                <select name="add_spec_type" id="add_spec_type" class="input input-bordered f-s-14" required>
                                </select>
                            </div>
                            <div class="fui-basic-input flex-column gap-6">
                                <label for="add_spec_val" class="f-bold f-s-14 f-cl-black">Giá trị</label>
                                <input type="text" name="add_spec_val" placeholder="Nhập giá trị" class="input input-bordered f-s-14" id="add_spec_val" autocomplete="off"/>
                            </div>
                        </div>
                        <footer class="modal__footer">
                            <button class="button bg_green f-cl-white" id="add_spec_btn">Cập nhật</button>
                        </footer>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal micromodal-slide" id="update_spec" aria-hidden="true">
            <div class="modal__overlay" tabindex="-1" data-micromodal-close>
                <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                    <header class="modal__header">
                        <h2 class="modal__title">
                            Thông số sản phẩm
                        </h2>
                        <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                    </header>
                    <div class="modal-content-content">
                        <div class="modal__content">
                            <div class="fui-basic-input flex-column gap-6">
                                <label for="update_spec_val" class="f-bold f-s-14 f-cl-black">Giá trị</label>
                                <input type="text" name="update_spec_val" placeholder="Nhập giá trị" class="input input-bordered f-s-14" id="update_spec_val" autocomplete="off"/>
                            </div>
                        </div>
                        <footer class="modal__footer">
                            <button class="button bg_green f-cl-white" id="update_spec_btn">Cập nhật</button>
                        </footer>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal micromodal-slide" id="update_color_modal" aria-hidden="true">
            <div class="modal__overlay" tabindex="-1" data-micromodal-close>
                <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                    <header class="modal__header">
                        <h2 class="modal__title">
                            Màu sản phẩm
                        </h2>
                        <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                    </header>
                    <div class="modal-content-content">
                        <div class="modal__content">
                            <table id="color" class="display compact" style="width:100%">
                                <thead>
                                <tr>
                                    <th>Tên</th>
                                    <th>Giá trị</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal micromodal-slide" id="add_color" aria-hidden="true">
            <div class="modal__overlay" tabindex="-1" data-micromodal-close>
                <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                    <header class="modal__header">
                        <h2 class="modal__title">
                            Thêm màu
                        </h2>
                        <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                    </header>
                    <div class="modal-content-content">
                        <div class="modal__content">
                            <div class="fui-basic-input" style="width: 100%">
                                <label for="add_color_type" class="f-bold f-s-14 f-cl-black">Kích hoạt</label>
                                <select name="add_color_type" id="add_color_type" class="input input-bordered f-s-14" required>
                                </select>
                            </div>
                            <div class="fui-basic-input flex-column gap-6">
                                <label for="add_color_val" class="f-bold f-s-14 f-cl-black">Đường dẫn</label>
                                <input type="text" name="add_color_val" placeholder="Nhập giá trị" class="input input-bordered f-s-14" id="add_color_val" autocomplete="off"/>
                            </div>
                        </div>
                        <footer class="modal__footer">
                            <button class="button bg_green f-cl-white" id="add_color_btn">Cập nhật</button>
                        </footer>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal micromodal-slide" id="update_color" aria-hidden="true">
            <div class="modal__overlay" tabindex="-1" data-micromodal-close>
                <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                    <header class="modal__header">
                        <h2 class="modal__title">
                            Cập nhật đường dẫn
                        </h2>
                        <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                    </header>
                    <div class="modal-content-content">
                        <div class="modal__content">
                            <div class="fui-basic-input flex-column gap-6">
                                <label for="update_color_val" class="f-bold f-s-14 f-cl-black">Đường dẫn</label>
                                <input type="text" name="update_color_val" placeholder="Nhập giá trị" class="input input-bordered f-s-14" id="update_color_val" autocomplete="off"/>
                            </div>
                        </div>
                        <footer class="modal__footer">
                            <button class="button bg_green f-cl-white" id="update_color_btn">Cập nhật</button>
                        </footer>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal micromodal-slide" id="update_des" aria-hidden="true">
            <div class="modal__overlay" tabindex="-1" data-micromodal-close>
                <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                    <header class="modal__header">
                        <h2 class="modal__title">
                            Mô Tả sản phẩm
                        </h2>
                        <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                    </header>
                    <div class="modal-content-content">
                        <div class="modal__content">
                            <div class="fui-basic-input flex-column gap-6">
                                <label for="des" class="f-bold f-s-14 f-cl-black">
                                    Mô tả sản phẩm
                                </label>
                                <textarea class="editor-label" name="des" id="des" cols="30" rows="10"></textarea>
                            </div>
                        </div>
                        <footer class="modal__footer">
                            <button class="button bg_green f-cl-white" id="update_des_btn">Cập nhật</button>
                        </footer>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
    <script src="/assets/js/script.js"></script>
    <script src="/assets/js/adminDatatable.js"></script>
    <script src="/assets/js/adminProduct.js"></script>
    <script src="/assets/js/notification.js"></script>
    <script src="/assets/js/accordion.js"></script>
    <script src="/assets/js/exitfFunc.js"></script>
   <script>
       $(document).ready(function () {
           const value = $("#mesage").text();

           if(value === 'true') {
               notyf.success("Thêm sản phẩm thành công");
           }
       })
   </script>
<%--    <script src="/assets/js/datatableAjax.js"></script>--%>

</body>

</html>