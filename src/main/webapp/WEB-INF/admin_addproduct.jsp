<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thêm sản phẩm</title>

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
    <link rel="stylesheet" href="/assets/css/UploadImg.css">
    <link rel="stylesheet" href="/assets/css/InputViaIcon.css">
    <link rel="stylesheet" href="/assets/css/admin_addproduct.css">
    <link rel="stylesheet" href="/assets/css/notification.css">
    <link rel="stylesheet" href="/assets/css/arccordion.css">


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

    <!-- Jquery validate -->
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/localization/messages_vi.js"></script>
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
        <div class="main-grid">
            <nav class="navbar tag-line _4c _1r">
                <div class="nav-back-prev">
                    <div class="breadcumb">
                        <div class="breadcumb-icon f-s-25">
                            <i class="fa-regular fa-square-plus"></i>
                        </div>
                        <p class="f-bold f-s-25 breadcumb-text"> <c:out value="${message}"/> </p>
                    </div>
                </div>
                <div class="funcproduct">
                    <button type="submit" form="add_product_form" class="button bg_green f-cl-white" id="add-btn"> <c:out value="${operation}"/></button>
                </div>
            </nav>
            <div class="card _4c _10r">
                <form id="add_product_form" action="/admin/get-product" enctype="multipart/form-data" method="post" class="main-grid">
                    <input type="hidden" id="pid" value="${p.id}">
                    <input type="hidden" id="desUrl" value="${p.description}">
                    <div class="product-name _4c">
                        <div class="fui-basic-input flex-column gap-6">
                            <label for="productname" class="f-bold f-s-14 f-cl-black">Tên sản phẩm</label>
                            <input type="text" name="name" placeholder="Nhập tên sản phẩm" value="${p.name}" class="input input-bordered f-s-14" id="productname" autocomplete="off" required/>
                        </div>
                    </div>
                    <div class="poduct-quantity _3c">
                        <div class="fui-basic-input flex-column gap-6">
                            <label for="size" class="f-bold f-s-14 f-cl-black">Kích thước</label>
                            <select name="size" id="size" class="input input-bordered f-s-14 required">
                                <c:forEach items="${sizes}" var="size">
                                    <c:choose>
                                        <c:when test="${p.sizeId == size.id}">
                                            <option value="${size.id}" selected><c:out value="${size.name}"/></option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${size.id}"><c:out value="${size.name}"/></option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="poduct-quantity _1c">
                        <div class="fui-basic-input flex-column gap-6">
                            <label for="productquantity" class="f-bold f-s-14 f-cl-black">Số lượng</label>
                            <input type="text" name="quantity" placeholder="Nhập số lượng" value="${p.quantityPerBox}" class="input input-bordered f-s-14" id="productquantity" autocomplete="off" required/>
                        </div>
                    </div>
                    <div class="product-price _4c">
                        <div class="fui-basic-input flex-column gap-6">
                            <label for="productprice" class="f-bold f-s-14 f-cl-black">Giá Sản phẩm (1 hộp)</label>
                            <input type="text" name="price" placeholder="Nhập giá" value="${p.pricePerBox}" class="input input-bordered f-s-14" id="productprice" autocomplete="off" required/>
                        </div>
                    </div>
                    <div class="product-price-promotion _4c">
                        <div class="fui-basic-input flex-column gap-6">
                            <label for="price_promotion" class="f-bold f-s-14 f-cl-black">Giá khuyến mãi</label>
                            <input type="number" name="price_promotion" placeholder="Nhập giá khuyến mãi" class="input input-bordered f-s-14" id="price_promotion" autocomplete="off" required/>
                        </div>
                    </div>
                    <div class="poduct-form _4c">
                        <div class="fui-basic-input flex-column gap-6">
                            <label for="productform" class="f-bold f-s-14 f-cl-black"> Loại sản phẩm</label>
                            <select name="category" id="productform" class="input input-bordered f-s-14" required>
                                <c:forEach items="${categories}" var="category">
                                    <c:choose>
                                        <c:when test="${p.categoryId == category.id}">
                                            <option value="${category.id}" selected><c:out value="${category.name}"/></option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${category.id}"><c:out value="${category.name}"/></option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="poduct-material _4c">
                        <div class="fui-basic-input flex-column gap-6">
                            <label for="productmaterial" class="f-bold f-s-14 f-cl-black"> Chất liệu</label>
                            <select name="material" id="productmaterial" class="input input-bordered f-s-14" required>
                                <c:forEach items="${materials}" var="material">
                                    <c:choose>
                                        <c:when test="${p.materialId == material.id}">
                                            <option value="${material.id}" selected><c:out value="${material.name}"/></option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${material.id}"><c:out value="${material.name}"/></option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="poduct-manufacturer _4c">
                        <div class="fui-basic-input flex-column gap-6">
                            <label for="productmanufacturer" class="f-bold f-s-14 f-cl-black"> Nhà cung cấp</label>
                            <select name="manufacturer" id="productmanufacturer" class="input input-bordered f-s-14" required>
                                <c:forEach items="${manufacturers}" var="manufacturer">
                                    <c:choose>
                                        <c:when test="${p.manufacturerId == manufacturer.id}">
                                            <option value="${manufacturer.id}" selected><c:out value="${manufacturer.name}"/></option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${manufacturer.id}"><c:out value="${manufacturer.name}"/></option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="product-img _4c">
                        <div class="fui-basic-input flex-column gap-6">
                            <label for="img_thumbnail" class="f-bold f-s-14 f-cl-black">Giá trị</label>
                            <input type="file" name="img_thumbnail" accept=".jpg, .jpeg, .png" class="input input-bordered f-s-14" id="img_thumbnail" autocomplete="off" required/>
                        </div>
                    </div>

                    <div class="product-description _4c">
                        <div class="flex-column gap-6">
                            <label for="editor" class="f-bold f-s-14 f-cl-black">
                                Mô tả sản phẩm
                            </label>
                            <textarea class="editor-label" name="editor" id="editor" cols="30" rows="10"></textarea>
                        </div>

                    </div>
                    <div class="product-spec _4c">
                        <div class="flex-column gap-6">
                            <label for="spec-table" class="f-bold f-s-14 f-cl-black">
                                Thông số sản phẩm
                            </label>
                            <table id="spec-table" class="display table table-bordered">
                                <thead>
                                <tr>
                                    <th>Tên</th>
                                    <th>Giá trị</th>
                                </tr>
                                </thead>
                            </table>
                        </div>

                    </div>

                    <div class="product-spec _4c">
                        <div class="flex-column gap-6">
                            <label for="spec-table" class="f-bold f-s-14 f-cl-black">
                                Màu sản phẩm
                            </label>
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

                </form>
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
                    <div class="fui-basic-input" style="width: 100%">
                        <label for="add_spec_type" class="f-bold f-s-14 f-cl-black">Kích hoạt</label>
                        <select name="add_spec_type" id="add_spec_type" class="input input-bordered f-s-14" required>
                        </select>
                    </div>
                    <div class="fui-basic-input flex-column gap-6">
                        <label for="add_spec_val" class="f-bold f-s-14 f-cl-black">Giá trị</label>
                        <input type="text" name="add_spec_val" placeholder="Nhập giá trị" class="input input-bordered f-s-14" id="add_spec_val" autocomplete="off"/>
                    </div>
                    <footer class="modal__footer">
                        <button class="button bg_green f-cl-white" id="add_spec_btn">Cập nhật</button>
                    </footer>
                </div>
            </div>
        </div>
    </div>

    <div class="modal micromodal-slide" id="add_color" aria-hidden="true">
        <div class="modal__overlay" tabindex="-1" data-micromodal-close>
            <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                <header class="modal__header">
                    <h2 class="modal__title">
                        Thêm Thông Số
                    </h2>
                    <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                </header>
                <div class="modal-content-content">
                    <div class="fui-basic-input" style="width: 100%">
                        <label for="add_color_type" class="f-bold f-s-14 f-cl-black">Kích hoạt</label>
                        <select name="add_color_type" id="add_color_type" class="input input-bordered f-s-14" required>
                        </select>
                    </div>
<%--                    <div class="fui-basic-input flex-column gap-6">--%>
<%--                        <label for="add_color_val" class="f-bold f-s-14 f-cl-black">Giá trị</label>--%>
<%--                        <input type="file" name="add_color_val"  accept=".jpg, .jpeg, .png" class="input input-bordered f-s-14" id="add_color_val" autocomplete="off" required/>--%>
<%--                    </div>--%>
                    <footer class="modal__footer">
                        <button class="button bg_green f-cl-white" id="add_color_btn">Cập nhật</button>
                    </footer>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
<script src="/assets/js/ckeditorLoadFile.js"></script>
<script src="/assets/js/datatable_addproduct.js"></script>
<script src="/assets/js/adminDatatable.js"></script>
<script src="/assets/js/script.js"></script>
<script src="/assets/js/img-uploading.js"></script>
<script src="/assets/js/accordion.js"></script>
<script>
    $(document).ready(function() {
        // Thêm phương thức tùy chỉnh để kiểm tra giá khuyến mãi
        $.validator.addMethod("lessThanPrice", function(value, element) {
            var price = parseFloat($("#productprice").val());
            var pricePromotion = parseFloat(value);
            return this.optional(element) || pricePromotion <= price;
        }, "Giá khuyến mãi phải nhỏ hơn hoặc bằng giá sản phẩm");

        // Thêm phương thức tùy chỉnh để kiểm tra file extension
        $.validator.addMethod("fileExtension", function(value, element) {
            return this.optional(element) || /\.(jpg|jpeg|png)$/i.test(value);
        }, "Chỉ chấp nhận file .jpg, .jpeg, .png");

        // Khởi tạo validate cho form
        $("#add_product_form").validate({
            // Quy tắc validate
            rules: {
                name: {
                    required: true,
                    minlength: 3
                },
                quantity: {
                    required: true,
                    number: true,
                    min: 1
                },
                price: {
                    required: true,
                    number: true,
                    min: 0
                },
                price_promotion: {
                    required: true,
                    number: true,
                    min: 0,
                    lessThanPrice: true
                },
                size: {
                    required: true
                },
                category: {
                    required: true
                },
                material: {
                    required: true
                },
                manufacturer: {
                    required: true
                },
                img_thumbnail: {
                    required: true,
                    fileExtension: true
                },
                editor: {
                    required: true,
                    minlength: 10
                },
                spec: {
                    required: true,
                    minlength: 5
                }
            },
            // Thông báo lỗi
            messages: {
                name: {
                    required: "Vui lòng nhập tên sản phẩm",
                    minlength: "Tên sản phẩm phải có ít nhất 3 ký tự"
                },
                quantity: {
                    required: "Vui lòng nhập số lượng",
                    number: "Số lượng phải là số",
                    min: "Số lượng phải lớn hơn 0"
                },
                price: {
                    required: "Vui lòng nhập giá sản phẩm",
                    number: "Giá sản phẩm phải là số",
                    min: "Giá sản phẩm không được âm"
                },
                price_promotion: {
                    required: "Vui lòng nhập giá khuyến mãi",
                    number: "Giá khuyến mãi phải là số",
                    min: "Giá khuyến mãi không được âm"
                },
                size: {
                    required: "Vui lòng chọn kích thước"
                },
                category: {
                    required: "Vui lòng chọn loại sản phẩm"
                },
                material: {
                    required: "Vui lòng chọn chất liệu"
                },
                manufacturer: {
                    required: "Vui lòng chọn nhà cung cấp"
                },
                img_thumbnail: {
                    required: "Vui lòng chọn ảnh sản phẩm"
                },
                editor: {
                    required: "Vui lòng nhập mô tả sản phẩm",
                    minlength: "Mô tả sản phẩm phải có ít nhất 10 ký tự"
                },
                spec: {
                    required: "Vui lòng nhập thong số",
                    minlength: "Có ít nhất 5 ký tự"
                }
            },
            // Hiển thị lỗi
            errorPlacement: function(error, element) {
                error.addClass("f-s-12 f-cl-red");
                error.insertAfter(element);
            },
            submitHandler: function(form) {
                if ($(form).valid()) {
                    $("#editor").val(editor.getData());
                    formAjaxRequest({
                        url: '/admin/get-product',
                        formSelector: '#add_product_form',
                        successMessage: "Thêm thành công",
                        errorMessage: "Thêm thất bại",
                        tableToReload: null,
                        modalToClose: null,
                        type: 'POST',
                        onSuccess: function (resp) {
                            if(resp.success) {
                                notyf.success(resp.message)
                            } else {
                                notyf.error(resp.message)
                            }
                        }
                    });
                } else {
                    alert("Form không hợp lệ, vui lòng kiểm tra lại.");
                }
            }
        });
    });
   $("#add-btn").click(function (e) {
       e.preventDefault();
       $("#add_product_form").submit();
   })
</script>

</body>

</html>