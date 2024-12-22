<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="../assets/css/product-card.css"/>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Gạch men Catalan</title>

    <!-- Reset CSS -->
    <link rel="stylesheet" href="./assets/css/reset.css" />


    <!-- Thêm favicon -->
    <link
            rel="icon"
            type="image/x-icon"
            href="./assets/icons/logo2_no_text.svg"
    />

    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
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

    <link rel="stylesheet" href="./assets/css/banner.css" />
    <link rel="stylesheet" href="./assets/css/danhmucgachmen.css" />
    <link rel="stylesheet" href="./assets/css/popular.css" />
    <link rel="stylesheet" href="./assets/css/cacthanhphancodinh.css" />
    <link rel="stylesheet" href="./assets/css/dropdown_user_menu.css">
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="./assets/css/breadcrumb.css">
    <link rel="stylesheet" href="./assets/css/pagination.css">
    <link rel="stylesheet" href="./assets/css/list_product.css">
    <link rel="stylesheet" href="./assets/css/checkbox.css">
    <link rel="stylesheet" href="./assets/css/product-card.css">

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<jsp:include page="view_shared/header_footer/header.jsp"/>

    <div class="main-content">
        <div class="fui-basic-breadcrumb breadcrumb-style">
            <ul class="breadcrumb-list">
                <li class="breadcrumb-item">
                    <a href="index.html" class="breadcrumb-link">
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
                    <a href="list_product.html" class="breadcrumb-link">
                        Danh mục gạch men
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
                    <a href="#" class="breadcrumb-link">
                        Gạch men Catalan
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
                                <input type="checkbox" name="priceRange" value="5000-1000" id="price1" class="input-checkbox filter" />
                                <span class="check-icon">
                                    <i class="fa-solid fa-check"></i>
                                 </span>
                            </div>
                            <label class="label s-12 cl-brown" for="price1">500.000đ - 1.000.000đ</label>
                        </div>
                    </div>
                    <div class="filter-item">
                        <div class="fui-checkbox-custom">
                            <div class="input-wrap">
                                <input type="checkbox" name="priceRange" value="1000-1500" id="price2" class="input-checkbox filter" />
                                <span class="check-icon">
                                    <i class="fa-solid fa-check"></i>
                                 </span>
                            </div>
                            <label class="label s-12 cl-brown" for="price2">1.000.000đ - 1.500.000đ</label>
                        </div>
                    </div>
                    <div class="filter-item">
                        <div class="fui-checkbox-custom">
                            <div class="input-wrap">
                                <input type="checkbox" name="priceRange" value="1500-2000" id="price3" class="input-checkbox filter" />
                                <span class="check-icon">
                                    <i class="fa-solid fa-check"></i>
                                 </span>
                            </div>
                            <label class="label s-12 cl-brown" for="price3">1.500.000đ - 2.000.000đ</label>
                        </div>
                    </div>
                    <div class="filter-item">
                        <div class="fui-checkbox-custom">
                            <div class="input-wrap">
                                <input type="checkbox" name="priceRange" value="2000-5000" id="price4" class="input-checkbox filter" />
                                <span class="check-icon">
                                    <i class="fa-solid fa-check"></i>
                                 </span>
                            </div>
                            <label class="label s-12 cl-brown" for="price4">2.000.000đ - 5.000.000đ</label>
                        </div>
                    </div>
                </div>
                <div class="panel-title bg-white cl-brown s-16 normal"> Kích thước</div>
                <div class="panel-list bg-yellow cl-brown">

                    <div class="filter-item">
                        <div class="fui-checkbox-custom">
                            <div class="input-wrap">
                                <input type="checkbox" name="size" value="1" id="1" class="input-checkbox filter" />
                                <span class="check-icon">
                                    <i class="fa-solid fa-check"></i>
                                 </span>
                            </div>
                            <label class="label s-12 cl-brown" for="1">500 x 500mm</label>
                        </div>
                    </div>
                    <div class="filter-item">
                        <div class="fui-checkbox-custom">
                            <div class="input-wrap">
                                <input type="checkbox" name="size" value="2" id="2" class="input-checkbox filter" />
                                <span class="check-icon">
                                    <i class="fa-solid fa-check"></i>
                                 </span>
                            </div>
                            <label class="label s-12 cl-brown" for="2">300×600 mm</label>
                        </div>
                    </div>
                    <div class="filter-item">
                        <div class="fui-checkbox-custom">
                            <div class="input-wrap">
                                <input type="checkbox" name="size" value="3" id="3" class="input-checkbox filter" />
                                <span class="check-icon">
                                    <i class="fa-solid fa-check"></i>
                                 </span>
                            </div>
                            <label class="label s-12 cl-brown" for="3">400×800 mm</label>
                        </div>
                    </div>
                    <div class="filter-item">
                        <div class="fui-checkbox-custom">
                            <div class="input-wrap">
                                <input type="checkbox" name="size" value="4" id="4" class="input-checkbox filter" />
                                <span class="check-icon">
                                    <i class="fa-solid fa-check"></i>
                                 </span>
                            </div>
                            <label class="label s-12 cl-brown" for="4">600×600 mm</label>
                        </div>
                    </div>
                    <div class="filter-item">
                        <div class="fui-checkbox-custom">
                            <div class="input-wrap">
                                <input type="checkbox" name="size" value="5" id="5" class="input-checkbox filter" />
                                <span class="check-icon">
                                    <i class="fa-solid fa-check"></i>
                                 </span>
                            </div>
                            <label class="label s-12 cl-brown" for="5">800×800 mm</label>
                        </div>
                    </div>
                </div>
<%--                <div class="panel-title bg-white cl-brown s-16 normal"> Xuất xứ</div>--%>
<%--                <div class="panel-list bg-yellow cl-brown">--%>
<%--                    <div class="filter-item">--%>
<%--                        <div class="fui-checkbox-custom">--%>
<%--                            <div class="input-wrap">--%>
<%--                                <input type="checkbox" name="manu" value="vn" id="vn" class="input-checkbox" />--%>
<%--                                <span class="check-icon">--%>
<%--                                    <i class="fa-solid fa-check"></i>--%>
<%--                                 </span>--%>
<%--                            </div>--%>
<%--                            <label class="label s-12 cl-brown" for="vn">Việt Nam</label>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="filter-item">--%>
<%--                        <div class="fui-checkbox-custom">--%>
<%--                            <div class="input-wrap">--%>
<%--                                <input type="checkbox" name="manu" value="Ấn Độ" id="indi" class="input-checkbox" />--%>
<%--                                <span class="check-icon">--%>
<%--                                    <i class="fa-solid fa-check"></i>--%>
<%--                                 </span>--%>
<%--                            </div>--%>
<%--                            <label class="label s-12 cl-brown" for="indi">Ấn Độ</label>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="filter-item">--%>
<%--                        <div class="fui-checkbox-custom">--%>
<%--                            <div class="input-wrap">--%>
<%--                                <input type="checkbox" name="manu" value="Ấn Độ" id="cn" class="input-checkbox" />--%>
<%--                                <span class="check-icon">--%>
<%--                                    <i class="fa-solid fa-check"></i>--%>
<%--                                 </span>--%>
<%--                            </div>--%>
<%--                            <label class="label s-12 cl-brown" for="indi">Ấn Độ</label>--%>
<%--                        </div>--%>
<%--                    </div>--%>





<%--&lt;%&ndash;                    <div class="list-horizontal">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="list-button s-12 cl-white bg-brown">Việt Nam</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="list-button s-12 cl-white bg-brown">Ấn Độ</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="list-button s-12 cl-white bg-brown">Trung Quốc</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="list-button s-12 cl-white bg-brown">Châu Âu</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--                </div>--%>
                <div class="panel-title bg-white cl-brown s-16 normal"> Nhà máy sản xuất</div>
                <div class="panel-list bg-yellow cl-brown">
                    <div class="filter-item">
                        <div class="fui-checkbox-custom">
                            <div class="input-wrap">
                                <input type="checkbox" name="nsx" value="1" id="Maxtot" class="input-checkbox filter" />
                                <span class="check-icon">
                                    <i class="fa-solid fa-check"></i>
                                 </span>
                            </div>
                            <label class="label s-12 cl-brown" for="Maxtot">Maxtot</label>
                        </div>
                    </div>
                    <div class="filter-item">
                        <div class="fui-checkbox-custom">
                            <div class="input-wrap">
                                <input type="checkbox" name="nsx" value="2" id="Bambu" class="input-checkbox filter" />
                                <span class="check-icon">
                                    <i class="fa-solid fa-check"></i>
                                 </span>
                            </div>
                            <label class="label s-12 cl-brown" for="Bambu">Bambu</label>
                        </div>
                    </div>
                    <div class="filter-item">
                        <div class="fui-checkbox-custom">
                            <div class="input-wrap">
                                <input type="checkbox" name="nsx" value="3" id="Famito" class="input-checkbox filter" />
                                <span class="check-icon">
                                    <i class="fa-solid fa-check"></i>
                                 </span>
                            </div>
                            <label class="label s-12 cl-brown" for="Famito">Famito</label>
                        </div>
                    </div>
                    <div class="filter-item">
                        <div class="fui-checkbox-custom">
                            <div class="input-wrap">
                                <input type="checkbox" name="nsx" id="Ivicasa" value="4" class="input-checkbox filter" />
                                <span class="check-icon">
                                    <i class="fa-solid fa-check"></i>
                                 </span>
                            </div>
                            <label class="label s-12 cl-brown" for="Ivicasa">Ivicasa</label>
                        </div>
                    </div>
                </div>
                </div>
            </div>
            <div class="ls-product">
                <div class="panel-title cl-brown s-18 bold"> GẠCH ỐP LÁT CATALAYN</div>
                <div class="panel-title view bg-brown cl-white s-16 normal">
                    <div class="view-type">
                        <div class="view-func view-grid">
                            <i class="fa-solid fa-border-all"></i>
                        </div>
                        <div class="view-func view-detail">
                            <i class="fa-solid fa-bars"></i>
                        </div>
                    </div>
                    <div class="sort-by-product">
                        <label for="sort">
                            Sắp xếp theo
                        </label>
                        <select name="sort" id="sort">
                            <option value="new">Mới cập nhật</option>
                            <option value="asc">Giá tăng dần</option>
                            <option value="desc">Giá giảm dần</option>
                        </select>
                    </div>
                </div>
                <div class="product-list" id="product_list">
                    <c:forEach items="${list}" var="item">
                        <div class="product-card">
                            <a href="pdetail?pid=${item.id}" class="product-card-link">
                            <div class="card-img">
                                <img src="${item.imgThumbnail}" alt="">
                            </div>
                            <div class="card-title">
                                <span><c:out value="${item.name}"/></span>
                            </div>
                            <div class="card-price"> ${item.pricePerBox} Vnđ/hộp</div>
                            </a>
                            <div class="button-gr">
                                <button class="add-cart-button btn-left">
                                    <a href="pdetail?pid=${item.id}">Xem chi tiết</a>
                                </button>
                                <button class="buy-now btn-right">
                                    <a href="giohang.html"><i class="fa-solid fa-plus fa-lg"></i></a>
                                </button>
                            </div>
                        </div>


                    </c:forEach>
                </div>
                <div class="pagination">
                    <div class="fui-roundedFull-pagination">
                        <ul class="pagination-list">
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

<jsp:include page="view_shared/header_footer/footer.jsp"/>

<script src="./assets/js/scrollTop.js"></script>
<script src="./assets/js/filterItem.js"></script>
</body>
</html>