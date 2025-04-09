<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="/assets/css/product-card.css"/>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gạch men Catalan</title>

    <!-- Reset CSS -->
    <link rel="stylesheet" href="/assets/css/reset.css"/>


    <!-- Thêm favicon -->
    <link
            rel="icon"
            type="image/x-icon"
            href="/assets/icons/logo2_no_text.svg"
    />

    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />

    <!-- Font Awesome-->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
            integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js"
            integrity="sha512-6sSYJqDreZRZGkJ3b+YfdhB3MzmuP9R7X1QZ6g5aIXhRvR1Y/N/P47jmnkENm7YL3oqsmI6AK+V6AD99uWDnIw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    ></script>

    <link rel="stylesheet" href="/assets/css/banner.css"/>
    <link rel="stylesheet" href="/assets/css/danhmucgachmen.css"/>
    <link rel="stylesheet" href="/assets/css/popular.css"/>
    <link rel="stylesheet" href="/assets/css/cacthanhphancodinh.css"/>
    <link rel="stylesheet" href="/assets/css/dropdown_user_menu.css">
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/breadcrumb.css">
    <link rel="stylesheet" href="/assets/css/pagination.css">
    <link rel="stylesheet" href="/assets/css/list_product.css">
    <link rel="stylesheet" href="/assets/css/checkbox.css">
    <link rel="stylesheet" href="/assets/css/product-card.css">

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
    <link rel="stylesheet" href="/assets/css/search.css"/>
</head>
<body>

<jsp:include page="../view_shared/header_footer/header.jsp"/>

<c:set value="${rs.data}" var="p"/>

<div class="main-content">
    <div class="fui-basic-breadcrumb breadcrumb-style">
        <ul class="breadcrumb-list">
            <li class="breadcrumb-item">
                <a href="/" class="breadcrumb-link">
                    Trang chủ
                </a>
            </li>
            <li class="breadcrumb-item">
                <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        fill="none"
                        viewBox="0 0 24 24"
                >
                    <path
                            fill="currentColor"
                            fill-rule="evenodd"
                            d="M9.793 7.793a1 1 0 000 1.414L12.586 12l-2.793 2.793a1 1 0 101.414 1.414l3.5-3.5a1 1 0 000-1.414l-3.5-3.5a1 1 0 00-1.414 0z"
                            clip-rule="evenodd"
                    ></path>
                </svg>
                <a href="list-product" class="breadcrumb-link">
                    Danh mục
                </a>
            </li>
            <li class="breadcrumb-item">
                <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        fill="none"
                        viewBox="0 0 24 24"
                >
                    <path
                            fill="currentColor"
                            fill-rule="evenodd"
                            d="M9.793 7.793a1 1 0 000 1.414L12.586 12l-2.793 2.793a1 1 0 101.414 1.414l3.5-3.5a1 1 0 000-1.414l-3.5-3.5a1 1 0 00-1.414 0z"
                            clip-rule="evenodd"
                    ></path>
                </svg>
                <a href="list-product?danhmuc=${p.categoryMain.id}" class="breadcrumb-link">
                    <c:out value="${p.categoryMain.name}"/>
                </a>
            </li>
        </ul>
    </div>
    <div class="list-product-grid">
        <div class="filter-panel">
            <div id="filters">
                <div class="panel-title bg-brown cl-white s-16 bold"> LOẠI SẢN PHẨM</div>
                <div class="panel-title bg-white cl-brown s-16 normal"> Mức giá</div>
                <div class="panel-list bg-yellow cl-brown">
                    <div class="filter-item">
                        <div class="fui-checkbox-custom">
                            <div class="input-wrap">
                                <input type="checkbox" name="priceRange" value="100000-300000" id="price1"
                                       class="input-checkbox filter"/>
                                <span class="check-icon">
                                    <i class="fa-solid fa-check"></i>
                                 </span>
                            </div>
                            <label class="label s-12 cl-brown" for="price1">100.000đ - 300.000đ</label>
                        </div>
                    </div>
                    <div class="filter-item">
                        <div class="fui-checkbox-custom">
                            <div class="input-wrap">
                                <input type="checkbox" name="priceRange" value="300000-500000" id="price2"
                                       class="input-checkbox filter"/>
                                <span class="check-icon">
                                    <i class="fa-solid fa-check"></i>
                                 </span>
                            </div>
                            <label class="label s-12 cl-brown" for="price2">300.000đ - 500.000đ</label>
                        </div>
                    </div>
                    <div class="filter-item">
                        <div class="fui-checkbox-custom">
                            <div class="input-wrap">
                                <input type="checkbox" name="priceRange" value="500000-800000" id="price3"
                                       class="input-checkbox filter"/>
                                <span class="check-icon">
                                    <i class="fa-solid fa-check"></i>
                                 </span>
                            </div>
                            <label class="label s-12 cl-brown" for="price3">500.000đ - 800.000đ</label>
                        </div>
                    </div>
                    <div class="filter-item">
                        <div class="fui-checkbox-custom">
                            <div class="input-wrap">
                                <input type="checkbox" name="priceRange" value="800000-1000000" id="price4"
                                       class="input-checkbox filter"/>
                                <span class="check-icon">
                                    <i class="fa-solid fa-check"></i>
                                 </span>
                            </div>
                            <label class="label s-12 cl-brown" for="price4">800.000đ - 1.000.000đ</label>
                        </div>
                    </div>
                </div>

                <div class="panel-title bg-white cl-brown s-16 normal"> Danh mục</div>
                <div class="panel-list bg-yellow cl-brown">
                    <c:forEach items="${p.category}" var="category">
                        <div class="filter-item">
                            <div class="fui-checkbox-custom">
                                <div class="input-wrap">
                                    <c:choose>
                                        <c:when test="${p.categoryMain.id == category.id}">
                                            <input type="checkbox" name="category" value="${category.id}"
                                                   id="${category.name}" class="input-checkbox filter" checked/>
                                            <span class="check-icon">
                                                    <i class="fa-solid fa-check"></i>
                                                </span>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="checkbox" name="category" value="${category.id}"
                                                   id="${category.name}" class="input-checkbox filter"/>
                                            <span class="check-icon">
                                                    <i class="fa-solid fa-check"></i>
                                                </span>
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                                <label class="label s-12 cl-brown" for="${category.name}"><c:out
                                        value="${category.name}"/></label>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="panel-title bg-white cl-brown s-16 normal"> Kích thước</div>
                <div class="panel-list bg-yellow cl-brown">
                    <c:forEach items="${p.size}" var="size">
                        <div class="filter-item">
                            <div class="fui-checkbox-custom">
                                <div class="input-wrap">
                                    <input type="checkbox" name="size" value="${size.id}" id="${size.name}"
                                           class="input-checkbox filter"/>
                                    <span class="check-icon">
                                    <i class="fa-solid fa-check"></i>
                                 </span>
                                </div>
                                <label class="label s-12 cl-brown" for="${size.name}"><c:out
                                        value="${size.name}"/></label>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="panel-title bg-white cl-brown s-16 normal"> Chất liệu</div>
                <div class="panel-list bg-yellow cl-brown">
                    <c:forEach items="${p.material}" var="material">
                        <div class="filter-item">
                            <div class="fui-checkbox-custom">
                                <div class="input-wrap">
                                        <%--                                    <input type="checkbox" name="material" value="${material.id}" id="${material.name}"--%>
                                        <%--                                           class="input-checkbox filter"/>--%>
                                        <%--                                    <span class="check-icon">--%>
                                        <%--                                    <i class="fa-solid fa-check"></i>--%>
                                        <%--                                 </span>--%>

                                    <c:choose>
                                        <c:when test="${p.materialMain.id == material.id}">
                                            <input type="checkbox" name="material" value="${material.id}"
                                                   id="${material.name}" class="input-checkbox filter" checked/>
                                            <span class="check-icon">
                                                    <i class="fa-solid fa-check"></i>
                                                </span>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="checkbox" name="material" value="${material.id}"
                                                   id="${material.name}" class="input-checkbox filter"/>
                                            <span class="check-icon">
                                                    <i class="fa-solid fa-check"></i>
                                                </span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <label class="label s-12 cl-brown" for="${material.name}"><c:out
                                        value="${material.name}"/></label>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="panel-title bg-white cl-brown s-16 normal"> Nhà máy sản xuất</div>
                <div class="panel-list bg-yellow cl-brown">
                    <c:forEach items="${p.manufacturer}" var="manufacturer">
                        <div class="filter-item">
                            <div class="fui-checkbox-custom">
                                <div class="input-wrap">
                                        <%--                                    <input type="checkbox" name="nsx" value="${manufacturer.id}"--%>
                                        <%--                                           id="${manufacturer.name}" class="input-checkbox filter"/>--%>
                                        <%--                                    <span class="check-icon">--%>
                                        <%--                                    <i class="fa-solid fa-check"></i>--%>
                                        <%--                                 </span>--%>
                                    <c:choose>
                                        <c:when test="${p.manufacturerMain.id == manufacturer.id}">
                                            <input type="checkbox" name="nsx" value="${manufacturer.id}"
                                                   id="${manufacturer.name}" class="input-checkbox filter" checked/>
                                            <span class="check-icon">
                                                    <i class="fa-solid fa-check"></i>
                                                </span>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="checkbox" name="nsx" value="${manufacturer.id}"
                                                   id="${manufacturer.name}" class="input-checkbox filter"/>
                                            <span class="check-icon">
                                                    <i class="fa-solid fa-check"></i>
                                                </span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <label class="label s-12 cl-brown" for="${manufacturer.name}"><c:out
                                        value="${manufacturer.name}"/></label>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="ls-product">
            <div class="panel-title cl-brown s-18 bold"><c:out value="${p.categoryMain.name}"/><c:out value="${p.manufacturerMain.name}"/><c:out value="${p.materialMain.name}"/></div>
            <div class="panel-title view bg-brown cl-white s-16 normal">
                <div class="view-type">
                    <%--                        <div class="view-func view-grid">--%>
                    <%--                            <i class="fa-solid fa-border-all"></i>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="view-func view-detail">--%>
                    <%--                            <i class="fa-solid fa-bars"></i>--%>
                    <%--                        </div>--%>
                    <input type="radio" name="layout" id="grid"/>
                    <label for="grid">
                        <i class="fa-solid fa-border-all"></i>
                        Lưới
                    </label>

                    <input type="radio" name="layout" id="detail" checked="checked"/>
                    <label for="detail">
                        <i class="fa-solid fa-bars"></i>
                        Chỉ mục
                    </label>
                </div>
                <div class="sort-by-product">
                    <label for="sort">
                        Sắp xếp theo
                    </label>
                    <select name="sort" id="sort">
                        <option value="1" selected>Từ A-Z</option>
                        <option value="2">Giá tăng dần</option>
                        <option value="3">Giá giảm dần</option>
                    </select>
                </div>
            </div>
            <div class="product-list" id="product_list">
            </div>
            <div class="pagination">
                <div class="fui-roundedFull-pagination">
                    <ul class="pagination-list" id="pagination">
                        <li class="pagination-item btn-prev">
                            <a href="#" class="pagination-link">
                                <svg
                                        width="6"
                                        height="10"
                                        viewBox="0 0 6 10"
                                        fill="none"
                                        xmlns="http://www.w3.org/2000/svg"
                                >
                                    <path
                                            fill-rule="evenodd"
                                            clip-rule="evenodd"
                                            d="M5.20711 0.792893C5.59763 1.18342 5.59763 1.81658 5.20711 2.20711L2.41421 5L5.20711 7.79289C5.59763 8.18342 5.59763 8.81658 5.20711 9.20711C4.81658 9.59763 4.18342 9.59763 3.79289 9.20711L0.292893 5.70711C-0.0976311 5.31658 -0.0976311 4.68342 0.292893 4.29289L3.79289 0.792893C4.18342 0.402369 4.81658 0.402369 5.20711 0.792893Z"
                                            fill="currentColor"
                                    ></path>
                                </svg>
                            </a>
                        </li>
                        <li class="pagination-item">
                            <a href="#" class="pagination-link">1</a>
                        </li>
                        <li class="pagination-item">
                            <a href="#" class="pagination-link selected">
                                2
                            </a>
                        </li>
                        <li class="pagination-item">
                            <a href="#" class="pagination-link">3</a>
                        </li>
                        <li class="pagination-item">
                            <a href="#" class="pagination-link">4</a>
                        </li>
                        <li class="pagination-item">
                            <a href="#" class="pagination-link">5</a>
                        </li>
                        <li class="pagination-item btn-next">
                            <a href="#" class="pagination-link">
                                <svg
                                        width="6"
                                        height="10"
                                        viewBox="0 0 6 10"
                                        fill="none"
                                        xmlns="http://www.w3.org/2000/svg"
                                >
                                    <path
                                            fill-rule="evenodd"
                                            clip-rule="evenodd"
                                            d="M0.792893 0.792893C0.402369 1.18342 0.402369 1.81658 0.792893 2.20711L3.58579 5L0.792893 7.79289C0.402369 8.18342 0.402369 8.81658 0.792893 9.20711C1.18342 9.59763 1.81658 9.59763 2.20711 9.20711L5.70711 5.70711C6.09763 5.31658 6.09763 4.68342 5.70711 4.29289L2.20711 0.792893C1.81658 0.402369 1.18342 0.402369 0.792893 0.792893Z"
                                            fill="currentColor"
                                    ></path>
                                </svg>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</div>

<jsp:include page="../view_shared/header_footer/footer.jsp"/>

<script src="/assets/js/scrollTop.js"></script>
<script src="/assets/js/filterItem.js"></script>
<script src="../assets/js/search.js"></script>

<script>
    // Sử dụng Notyf
    var notyf = new Notyf();

    $(document).ready(function() {

        $(document).on('click', '.add-to-cart-btn', function(e) {

            e.preventDefault();

            var form = $(this).closest('.add-to-cart-form');
            var formData = form.serialize();

            $.ajax({

                url: '/add-to-cart',
                type: 'POST',
                data: formData,
                dataType: 'json',
                success: function(response) {

                    if (response.status === 'success') {
                        $('.cart-count').text(response.quantity);
                        notyf.success('Đã thêm sản phẩm vào giỏ hàng!');

                    } else {
                        notyf.error(response.message);
                    }
                },

                error: function(xhr, status, error) {
                    notyf.error('Có lỗi xảy ra khi thêm vào giỏ hàng');
                }
            });
        });
    });
</script>

</body>
</html>