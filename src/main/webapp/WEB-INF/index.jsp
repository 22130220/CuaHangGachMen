<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cửa hàng gạch men</title>

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

    <!-- Kiểu CSS -->
    <link rel="stylesheet" href="./assets/css/style.css" />
    <link rel="stylesheet" href="./assets/css/banner.css" />
    <link rel="stylesheet" href="./assets/css/danhmucgachmen.css" />
    <link rel="stylesheet" href="./assets/css/popular.css" />
    <link rel="stylesheet" href="./assets/css/cacthanhphancodinh.css" />
    <link rel="stylesheet" href="./assets/css/dropdown_user_menu.css">
</head>
<body>

<jsp:include page="view_shared/header_footer/header.jsp"/>

<div class="slider">
    <div class="slides">
        <div class="slide">
            <img src="./assets/img/ceramic-india-1-1.jpg" alt="Ảnh 1" />
        </div>
        <div class="slide">
            <img src="./assets/img/banner-home-1.png" alt="Ảnh 2" />
        </div>
        <div class="slide">
            <img src="./assets/img/banner-home-2.png" alt="Ảnh 3" />
        </div>
        <!-- Thêm ảnh tùy thích -->
    </div>
    <!-- Nút điều khiển bên trong ảnh -->
    <a class="prev" onclick="changeSlide(-1)">&#10094;</a>
    <a class="next" onclick="changeSlide(1)">&#10095;</a>
</div>

<div class="dots">
    <span class="dot" onclick="currentSlide(0)"></span>
    <span class="dot" onclick="currentSlide(1)"></span>
    <span class="dot" onclick="currentSlide(2)"></span>
    <!-- Thêm dấu chấm tương ứng với số ảnh -->
</div>

<!-- Blog -->
<div class="blog">
    <div class="main-content">
        <div class="blog-top">
            <h2 class="heading lv2">DANH MỤC GẠCH MEN</h2>
        </div>

        <div class="blog-list">
            <!-- Thêm nút mũi tên -->
            <button class="arrow left" onclick="prevPage()">❮</button>

            <!-- Blog item 1 -->
            <div class="item">
                <a href="./list_product.html">
                    <img
                            src="./assets/img/loaigach1.jpg"
                            alt="How to become a pro web designer in 2022 and get remot job?"
                            class="thumb"
                    />
                </a>
                <div class="info">
                            <span class="date"
                            >Top loại gạch men đẹp chất lượng</span
                            >
                    <h3 class="title">
                        <a href="#!">
                            <br />
                            GẠCH PORCELAIN
                        </a>
                    </h3>

                    <a href="./list_product.html" class="btn">Chi tiết</a>

                </div>
            </div>

            <!-- Blog item 2 -->
            <div class="item">
                <a href="./list_product.html">
                    <img
                            src="./assets/img/loaigach2.jpg"
                            alt="How to become a pro web designer in 2022 and get remot job?"
                            class="thumb"
                    />
                </a>
                <div class="info">
                            <span class="date"
                            >Top loại gạch men đẹp chất lượng</span
                            >
                    <h3 class="title">
                        <a href="#!"> <br />GẠCH CERAMIC</a>
                    </h3>

                    <a href="./list_product.html" class="btn">Chi tiết</a>

                </div>
            </div>

            <!-- Blog item 3 -->
            <div class="item">
                <a href="./list_product.html">
                    <img
                            src="./assets/img/loaigach3.png"
                            alt="How to become a pro web designer in 2022 and get remot job?"
                            class="thumb"
                    />
                </a>
                <div class="info">
                            <span class="date"
                            >Top loại gạch men đẹp chất lượng</span
                            >
                    <h3 class="title">
                        <a href="#!"> <br />GẠCH MOSAIC</a>
                    </h3>

                    <a href="./list_product.html" class="btn">Chi tiết</a>

                </div>
            </div>

            <!-- Blog item 4 -->
            <div class="item">
                <a href="./list_product.html">
                    <img
                            src="./assets/img/loaigach4.jpg"
                            alt="How to become a pro web designer in 2022 and get remot job?"
                            class="thumb"
                    />
                </a>
                <div class="info">
                            <span class="date"
                            >Top loại gạch men đẹp chất lượng</span
                            >
                    <h3 class="title">
                        <a href="#!"> <br />GẠCH ỐP NGOÀI TRỜI</a>
                    </h3>

                    <a href="./list_product.html" class="btn">Chi tiết</a>

                </div>
            </div>

            <!-- Blog item 5 -->
            <div class="item">
                <a href="./list_product.html">
                    <img
                            src="./assets/img/loaigach5.webp"
                            alt="How to become a pro web designer in 2022 and get remot job?"
                            class="thumb"
                    />
                </a>
                <div class="info">
                            <span class="date"
                            >Top loại gạch men đẹp chất lượng</span
                            >
                    <h3 class="title">
                        <a href="#!"> <br />GẠCH TRANG TRÍ</a>
                    </h3>

                    <a href="./list_product.html" class="btn">Chi tiết</a>

                </div>
            </div>

            <!-- Blog item 6 -->
            <div class="item">
                <a href="./list_product.html">
                    <img
                            src="./assets/img/loaigach6.jpg"
                            alt="How to become a pro web designer in 2022 and get remot job?"
                            class="thumb"
                    />
                </a>
                <div class="info">
                            <span class="date"
                            >Top loại gạch men đẹp chất lượng</span
                            >
                    <h3 class="title">
                        <a href="#!"> <br />GẠCH LỤC GIÁC</a>
                    </h3>

                    <a href="./list_product.html" class="btn">Chi tiết</a>

                </div>
            </div>

            <!-- Blog item 7 -->
            <div class="item">
                <a href="./list_product.html">
                    <img
                            src="./assets/img/loaigach7.jpg"
                            alt="How to become a pro web designer in 2022 and get remot job?"
                            class="thumb"
                    />
                </a>
                <div class="info">
                            <span class="date"
                            >Top loại gạch men đẹp chất lượng</span
                            >
                    <h3 class="title">
                        <a href="#!"> <br />GẠCH ỐP TƯỜNG</a>
                    </h3>

                    <a href="./list_product.html" class="btn">Chi tiết</a>

                </div>
            </div>

            <!-- Blog item 8 -->
            <div class="item">
                <a href="./list_product.html">
                    <img
                            src="./assets/img/loaigach8.jpg"
                            alt="How to become a pro web designer in 2022 and get remot job?"
                            class="thumb"
                    />
                </a>
                <div class="info">
                            <span class="date"
                            >Top loại gạch men đẹp chất lượng</span
                            >
                    <h3 class="title">
                        <a href="#!"> <br />GẠCH LÁT NỀN</a>
                    </h3>

                    <a href="./list_product.html" class="btn">Chi tiết</a>

                </div>
            </div>

            <!-- Blog item 9 -->
            <div class="item">
                <a href="#!">
                    <img
                            src="./assets/img/loaigach9.jpg"
                            alt="How to become a pro web designer in 2022 and get remot job?"
                            class="thumb"
                    />
                </a>
                <div class="info">
                            <span class="date"
                            >Top loại gạch men đẹp chất lượng</span
                            >
                    <h3 class="title">
                        <a href="#!">
                            <br />ĐANG CẬP NHẬT LOẠI MỚI...</a
                        >
                    </h3>
                </div>
            </div>
            <button class="arrow right" onclick="nextPage()">❯</button>
        </div>

        <!-- Thêm dot cho các trang -->
        <div class="dots">
            <span class="dot" onclick="showPage(0)"></span>
            <span class="dot active" onclick="showPage(1)"></span>
            <span class="dot" onclick="showPage(2)"></span>
        </div>
    </div>
</div>

<!-- Popular -->
<div class="popular" id="popular">
    <div class="main-content">
        <div class="popular-top">
            <div class="info">
                <h2 class="heading lv2">
                    CÁC MẪU GẠCH BÁN CHẠY
                </h2>
            </div>
        </div>

        <div class="course-list">
            <!-- Course item 1 -->
            <div class="course-item">
                <a href="./product-detail.html">
                    <img
                            src="./assets/img/gachlatnenphobien1.jpg"
                            alt="Basic web design"
                            class="thumb"
                    />
                </a>
                <div class="info">
                    <div class="head">
                        <div class="title">
                            <a href="#!" class="line-clamp break-all">
                                Gạch lát sàn BAMBU BB65
                            </a>
                        </div>
                        <div class="rating">
                            <img
                                    src="./assets/img/star.svg"
                                    alt="Star"
                                    class="star"
                            />
                            <span class="value">4.9</span>
                        </div>
                    </div>
                    <p class="desc line-clamp line-2 break-all">
                        Kích thước 600×600 mm - Bề mặt mài bóng <br />
                        Loại gạch Pocerlain
                    </p>
                    <div class="foot">
                        <span class="price">50.000₫</span>
                        <a href=""
                        >

                            <svg
                                    class="icon"
                                    width="30"
                                    height="30"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    xmlns="http://www.w3.org/2000/svg"
                            >
                                <path
                                        fill-rule="evenodd"
                                        clip-rule="evenodd"
                                        d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                        fill="#2e2100ff"
                                />
                                <path
                                        fill-rule="evenodd"
                                        clip-rule="evenodd"
                                        d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                        fill="#2e2100ff"
                                />
                                <path
                                        fill-rule="evenodd"
                                        clip-rule="evenodd"
                                        d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                        fill="#2e2100ff"
                                />
                            </svg>
                        </a>

                        <a href="./delivery_information.html"><button class="btn book-btn">Đặt ngay</button></a>

                    </div>
                </div>
            </div>

            <!-- Course item 2 -->
            <div class="course-item">
                <a href="./product-detail.html">
                    <img
                            src="./assets/img/gachlatsanphobien2.jpg"
                            alt="UI/UX design"
                            class="thumb"
                    />
                </a>
                <div class="info">
                    <div class="head">
                        <div class="title">
                            <a href="#!" class="line-clamp break-all"
                            >Gạch lát sàn BAMBU BB66
                            </a>
                        </div>
                        <div class="rating">
                            <img
                                    src="./assets/img/star.svg"
                                    alt="Star"
                                    class="star"
                            />
                            <span class="value">4.9</span>
                        </div>
                    </div>
                    <p class="desc line-clamp line-2 break-all">
                        Kích thước 600×600 mm - Bề mặt mài bóng <br />
                        Loại gạch Pocerlain
                    </p>
                    <div class="foot">
                        <span class="price">50.000₫</span>
                        <a href=""
                        ><svg
                                class="icon"
                                width="30"
                                height="30"
                                viewBox="0 0 24 24"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                    fill="#2e2100ff"
                            />
                        </svg></a>

                        <a href="./delivery_information.html"><button class="btn book-btn">Đặt ngay</button></a>

                    </div>
                </div>
            </div>

            <!-- Course item 3 -->
            <div class="course-item">
                <a href="./product-detail.html">
                    <img
                            src="./assets/img/gachlatsanphobien3.jpg"
                            alt="Web App design"
                            class="thumb"
                    />
                </a>
                <div class="info">
                    <div class="head">
                        <div class="title">
                            <a href="#!" class="line-clamp break-all"
                            >Gạch lát sàn BAMBU BB67
                            </a>
                        </div>
                        <div class="rating">
                            <img
                                    src="./assets/img/star.svg"
                                    alt="Star"
                                    class="star"
                            />
                            <span class="value">4.9</span>
                        </div>
                    </div>
                    <p class="desc line-clamp line-2 break-all">
                        Kích thước 600×600 mm - Bề mặt mài bóng <br />
                        Loại gạch Pocerlain
                    </p>
                    <div class="foot">
                        <span class="price">50.000₫</span>
                        <a href=""
                        ><svg
                                class="icon"
                                width="30"
                                height="30"
                                viewBox="0 0 24 24"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                    fill="#2e2100ff"
                            />
                        </svg></a>

                        <a href="./delivery_information.html"><button class="btn book-btn">Đặt ngay</button></a>

                    </div>
                </div>
            </div>
        </div>

        <div class="course-list">
            <!-- Course item 1 -->
            <div class="course-item">
                <a href="./product-detail.html">
                    <img
                            src="./assets/img/gachoptuongphobien1.jpg"
                            alt="Basic web design"
                            class="thumb"
                    />
                </a>
                <div class="info">
                    <div class="head">
                        <div class="title">
                            <a href="#!" class="line-clamp break-all">
                                Gạch ốp lát EPEDA E601201
                            </a>
                        </div>
                        <div class="rating">
                            <img
                                    src="./assets/img/star.svg"
                                    alt="Star"
                                    class="star"
                            />
                            <span class="value">4.5</span>
                        </div>
                    </div>
                    <p class="desc line-clamp line-2 break-all">
                        Kích thước 600×1200 mm - Bề mặt mài bóng <br />
                        Loại gạch Granite
                    </p>
                    <div class="foot">
                        <span class="price">50.000₫</span>
                        <a href=""
                        ><svg
                                class="icon"
                                width="30"
                                height="30"
                                viewBox="0 0 24 24"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                    fill="#2e2100ff"
                            />
                        </svg></a>

                        <a href="./delivery_information.html"><button class="btn book-btn">Đặt ngay</button></a>

                    </div>
                </div>
            </div>

            <!-- Course item 2 -->
            <div class="course-item">
                <a href="./product-detail.html">
                    <img
                            src="./assets/img/gachoptuongphobien2.jpg"
                            alt="UI/UX design"
                            class="thumb"
                    />
                </a>
                <div class="info">
                    <div class="head">
                        <div class="title">
                            <a href="#!" class="line-clamp break-all"
                            >Gạch ốp lát EPEDA E601202</a
                            >
                        </div>
                        <div class="rating">
                            <img
                                    src="./assets/img/star.svg"
                                    alt="Star"
                                    class="star"
                            />
                            <span class="value">4.5</span>
                        </div>
                    </div>
                    <p class="desc line-clamp line-2 break-all">
                        Kích thước 600×1200 mm - Bề mặt mài bóng <br />
                        Loại gạch Granite
                    </p>
                    <div class="foot">
                        <span class="price">50.000₫</span>
                        <a href=""
                        ><svg
                                class="icon"
                                width="30"
                                height="30"
                                viewBox="0 0 24 24"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                    fill="#2e2100ff"
                            />
                        </svg></a>

                        <a href="./delivery_information.html"><button class="btn book-btn">Đặt ngay</button></a>

                    </div>
                </div>
            </div>

            <!-- Course item 3 -->
            <div class="course-item">
                <a href="./product-detail.html">
                    <img
                            src="./assets/img/gachoptuongphobien3.jpg"
                            alt="Web App design"
                            class="thumb"
                    />
                </a>
                <div class="info">
                    <div class="head">
                        <div class="title">
                            <a href="#!" class="line-clamp break-all"
                            >Gạch ốp lát EPEDA E601203</a
                            >
                        </div>
                        <div class="rating">
                            <img
                                    src="./assets/img/star.svg"
                                    alt="Star"
                                    class="star"
                            />
                            <span class="value">4.5</span>
                        </div>
                    </div>
                    <p class="desc line-clamp line-2 break-all">
                        Kích thước 600×1200 mm - Bề mặt mài bóng <br />
                        Loại gạch Granite
                    </p>
                    <div class="foot">
                        <span class="price">50.000₫</span>
                        <a href=""
                        ><svg
                                class="icon"
                                width="30"
                                height="30"
                                viewBox="0 0 24 24"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                    fill="#2e2100ff"
                            />
                        </svg></a>

                        <a href="./delivery_information.html"><button class="btn book-btn">Đặt ngay</button></a>

                    </div>
                </div>
            </div>
        </div>

        <a
                href="#!"
                style="
                        display: inline-block;
                        margin-top: 20px;
                        margin-left: 10px;
                    "
        >
            <span class="desc">-> Xem thêm tại đây... </span>
        </a>
    </div>
</div>


<!-- Popular -->
<div class="popular" id="popular">
    <div class="main-content">
        <div class="popular-top">
            <div class="info">
                <h2 class="heading lv2">
                    CÁC MẪU GẠCH MỚI NHẤT
                </h2>
            </div>
        </div>

        <div class="course-list">
            <!-- Course item 1 -->
            <div class="course-item">
                <a href="./product-detail.html">
                    <img
                            src="./assets/img/gachlatnenphobien1.jpg"
                            alt="Basic web design"
                            class="thumb"
                    />
                </a>
                <div class="info">
                    <div class="head">
                        <div class="title">
                            <a href="#!" class="line-clamp break-all">
                                Gạch lát sàn BAMBU BB65
                            </a>
                        </div>
                        <div class="rating">
                            <img
                                    src="./assets/img/star.svg"
                                    alt="Star"
                                    class="star"
                            />
                            <span class="value">4.9</span>
                        </div>
                    </div>
                    <p class="desc line-clamp line-2 break-all">
                        Kích thước 600×600 mm - Bề mặt mài bóng <br />
                        Loại gạch Pocerlain
                    </p>
                    <div class="foot">
                        <span class="price">50.000₫</span>
                        <a href=""
                        >

                            <svg
                                    class="icon"
                                    width="30"
                                    height="30"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    xmlns="http://www.w3.org/2000/svg"
                            >
                                <path
                                        fill-rule="evenodd"
                                        clip-rule="evenodd"
                                        d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                        fill="#2e2100ff"
                                />
                                <path
                                        fill-rule="evenodd"
                                        clip-rule="evenodd"
                                        d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                        fill="#2e2100ff"
                                />
                                <path
                                        fill-rule="evenodd"
                                        clip-rule="evenodd"
                                        d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                        fill="#2e2100ff"
                                />
                            </svg>
                        </a>

                        <a href="./delivery_information.html"><button class="btn book-btn">Đặt ngay</button></a>

                    </div>
                </div>
            </div>

            <!-- Course item 2 -->
            <div class="course-item">
                <a href="./product-detail.html">
                    <img
                            src="./assets/img/gachlatsanphobien2.jpg"
                            alt="UI/UX design"
                            class="thumb"
                    />
                </a>
                <div class="info">
                    <div class="head">
                        <div class="title">
                            <a href="#!" class="line-clamp break-all"
                            >Gạch lát sàn BAMBU BB66
                            </a>
                        </div>
                        <div class="rating">
                            <img
                                    src="./assets/img/star.svg"
                                    alt="Star"
                                    class="star"
                            />
                            <span class="value">4.9</span>
                        </div>
                    </div>
                    <p class="desc line-clamp line-2 break-all">
                        Kích thước 600×600 mm - Bề mặt mài bóng <br />
                        Loại gạch Pocerlain
                    </p>
                    <div class="foot">
                        <span class="price">50.000₫</span>
                        <a href=""
                        ><svg
                                class="icon"
                                width="30"
                                height="30"
                                viewBox="0 0 24 24"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                    fill="#2e2100ff"
                            />
                        </svg></a>

                        <a href="./delivery_information.html"><button class="btn book-btn">Đặt ngay</button></a>

                    </div>
                </div>
            </div>

            <!-- Course item 3 -->
            <div class="course-item">
                <a href="./product-detail.html">
                    <img
                            src="./assets/img/gachlatsanphobien3.jpg"
                            alt="Web App design"
                            class="thumb"
                    />
                </a>
                <div class="info">
                    <div class="head">
                        <div class="title">
                            <a href="#!" class="line-clamp break-all"
                            >Gạch lát sàn BAMBU BB67
                            </a>
                        </div>
                        <div class="rating">
                            <img
                                    src="./assets/img/star.svg"
                                    alt="Star"
                                    class="star"
                            />
                            <span class="value">4.9</span>
                        </div>
                    </div>
                    <p class="desc line-clamp line-2 break-all">
                        Kích thước 600×600 mm - Bề mặt mài bóng <br />
                        Loại gạch Pocerlain
                    </p>
                    <div class="foot">
                        <span class="price">50.000₫</span>
                        <a href=""
                        ><svg
                                class="icon"
                                width="30"
                                height="30"
                                viewBox="0 0 24 24"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                    fill="#2e2100ff"
                            />
                        </svg></a>

                        <a href="./delivery_information.html"><button class="btn book-btn">Đặt ngay</button></a>

                    </div>
                </div>
            </div>
        </div>

        <div class="course-list">
            <!-- Course item 1 -->
            <div class="course-item">
                <a href="./product-detail.html">
                    <img
                            src="./assets/img/gachoptuongphobien1.jpg"
                            alt="Basic web design"
                            class="thumb"
                    />
                </a>
                <div class="info">
                    <div class="head">
                        <div class="title">
                            <a href="#!" class="line-clamp break-all">
                                Gạch ốp lát EPEDA E601201
                            </a>
                        </div>
                        <div class="rating">
                            <img
                                    src="./assets/img/star.svg"
                                    alt="Star"
                                    class="star"
                            />
                            <span class="value">4.5</span>
                        </div>
                    </div>
                    <p class="desc line-clamp line-2 break-all">
                        Kích thước 600×1200 mm - Bề mặt mài bóng <br />
                        Loại gạch Granite
                    </p>
                    <div class="foot">
                        <span class="price">50.000₫</span>
                        <a href=""
                        ><svg
                                class="icon"
                                width="30"
                                height="30"
                                viewBox="0 0 24 24"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                    fill="#2e2100ff"
                            />
                        </svg></a>

                        <a href="./delivery_information.html"><button class="btn book-btn">Đặt ngay</button></a>

                    </div>
                </div>
            </div>

            <!-- Course item 2 -->
            <div class="course-item">
                <a href="./product-detail.html">
                    <img
                            src="./assets/img/gachoptuongphobien2.jpg"
                            alt="UI/UX design"
                            class="thumb"
                    />
                </a>
                <div class="info">
                    <div class="head">
                        <div class="title">
                            <a href="#!" class="line-clamp break-all"
                            >Gạch ốp lát EPEDA E601202</a
                            >
                        </div>
                        <div class="rating">
                            <img
                                    src="./assets/img/star.svg"
                                    alt="Star"
                                    class="star"
                            />
                            <span class="value">4.5</span>
                        </div>
                    </div>
                    <p class="desc line-clamp line-2 break-all">
                        Kích thước 600×1200 mm - Bề mặt mài bóng <br />
                        Loại gạch Granite
                    </p>
                    <div class="foot">
                        <span class="price">50.000₫</span>
                        <a href=""
                        ><svg
                                class="icon"
                                width="30"
                                height="30"
                                viewBox="0 0 24 24"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                    fill="#2e2100ff"
                            />
                        </svg></a>

                        <a href="./delivery_information.html"><button class="btn book-btn">Đặt ngay</button></a>

                    </div>
                </div>
            </div>

            <!-- Course item 3 -->
            <div class="course-item">
                <a href="./product-detail.html">
                    <img
                            src="./assets/img/gachoptuongphobien3.jpg"
                            alt="Web App design"
                            class="thumb"
                    />
                </a>
                <div class="info">
                    <div class="head">
                        <div class="title">
                            <a href="#!" class="line-clamp break-all"
                            >Gạch ốp lát EPEDA E601203</a
                            >
                        </div>
                        <div class="rating">
                            <img
                                    src="./assets/img/star.svg"
                                    alt="Star"
                                    class="star"
                            />
                            <span class="value">4.5</span>
                        </div>
                    </div>
                    <p class="desc line-clamp line-2 break-all">
                        Kích thước 600×1200 mm - Bề mặt mài bóng <br />
                        Loại gạch Granite
                    </p>
                    <div class="foot">
                        <span class="price">50.000₫</span>
                        <a href=""
                        ><svg
                                class="icon"
                                width="30"
                                height="30"
                                viewBox="0 0 24 24"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                    fill="#2e2100ff"
                            />
                        </svg></a>

                        <a href="./delivery_information.html"><button class="btn book-btn">Đặt ngay</button></a>

                    </div>
                </div>
            </div>
        </div>

        <a
                href="#!"
                style="
                        display: inline-block;
                        margin-top: 20px;
                        margin-left: 10px;
                    "
        >
            <span class="desc">-> Xem thêm tại đây... </span>
        </a>
    </div>
</div>

<!-- Popular -->
<div class="popular" id="popular">
    <div class="main-content">
        <div class="popular-top">
            <div class="info">
                <h2 class="heading lv2">
                    CÁC MẪU GẠCH ĐƯỢC XEM NHIỀU
                </h2>
            </div>
        </div>

        <div class="course-list">
            <!-- Course item 1 -->
            <div class="course-item">
                <a href="./product-detail.html">
                    <img
                            src="./assets/img/gachlatnenphobien1.jpg"
                            alt="Basic web design"
                            class="thumb"
                    />
                </a>
                <div class="info">
                    <div class="head">
                        <div class="title">
                            <a href="#!" class="line-clamp break-all">
                                Gạch lát sàn BAMBU BB65
                            </a>
                        </div>
                        <div class="rating">
                            <img
                                    src="./assets/img/star.svg"
                                    alt="Star"
                                    class="star"
                            />
                            <span class="value">4.9</span>
                        </div>
                    </div>
                    <p class="desc line-clamp line-2 break-all">
                        Kích thước 600×600 mm - Bề mặt mài bóng <br />
                        Loại gạch Pocerlain
                    </p>
                    <div class="foot">
                        <span class="price">50.000₫</span>
                        <a href=""
                        >

                            <svg
                                    class="icon"
                                    width="30"
                                    height="30"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    xmlns="http://www.w3.org/2000/svg"
                            >
                                <path
                                        fill-rule="evenodd"
                                        clip-rule="evenodd"
                                        d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                        fill="#2e2100ff"
                                />
                                <path
                                        fill-rule="evenodd"
                                        clip-rule="evenodd"
                                        d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                        fill="#2e2100ff"
                                />
                                <path
                                        fill-rule="evenodd"
                                        clip-rule="evenodd"
                                        d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                        fill="#2e2100ff"
                                />
                            </svg>
                        </a>

                        <a href="./delivery_information.html"><button class="btn book-btn">Đặt ngay</button></a>

                    </div>
                </div>
            </div>

            <!-- Course item 2 -->
            <div class="course-item">
                <a href="./product-detail.html">
                    <img
                            src="./assets/img/gachlatsanphobien2.jpg"
                            alt="UI/UX design"
                            class="thumb"
                    />
                </a>
                <div class="info">
                    <div class="head">
                        <div class="title">
                            <a href="#!" class="line-clamp break-all"
                            >Gạch lát sàn BAMBU BB66
                            </a>
                        </div>
                        <div class="rating">
                            <img
                                    src="./assets/img/star.svg"
                                    alt="Star"
                                    class="star"
                            />
                            <span class="value">4.9</span>
                        </div>
                    </div>
                    <p class="desc line-clamp line-2 break-all">
                        Kích thước 600×600 mm - Bề mặt mài bóng <br />
                        Loại gạch Pocerlain
                    </p>
                    <div class="foot">
                        <span class="price">50.000₫</span>
                        <a href=""
                        ><svg
                                class="icon"
                                width="30"
                                height="30"
                                viewBox="0 0 24 24"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                    fill="#2e2100ff"
                            />
                        </svg></a>

                        <a href="./delivery_information.html"><button class="btn book-btn">Đặt ngay</button></a>

                    </div>
                </div>
            </div>

            <!-- Course item 3 -->
            <div class="course-item">
                <a href="./product-detail.html">
                    <img
                            src="./assets/img/gachlatsanphobien3.jpg"
                            alt="Web App design"
                            class="thumb"
                    />
                </a>
                <div class="info">
                    <div class="head">
                        <div class="title">
                            <a href="#!" class="line-clamp break-all"
                            >Gạch lát sàn BAMBU BB67
                            </a>
                        </div>
                        <div class="rating">
                            <img
                                    src="./assets/img/star.svg"
                                    alt="Star"
                                    class="star"
                            />
                            <span class="value">4.9</span>
                        </div>
                    </div>
                    <p class="desc line-clamp line-2 break-all">
                        Kích thước 600×600 mm - Bề mặt mài bóng <br />
                        Loại gạch Pocerlain
                    </p>
                    <div class="foot">
                        <span class="price">50.000₫</span>
                        <a href=""
                        ><svg
                                class="icon"
                                width="30"
                                height="30"
                                viewBox="0 0 24 24"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                    fill="#2e2100ff"
                            />
                        </svg></a>

                        <a href="./delivery_information.html"><button class="btn book-btn">Đặt ngay</button></a>

                    </div>
                </div>
            </div>
        </div>

        <div class="course-list">
            <!-- Course item 1 -->
            <div class="course-item">
                <a href="./product-detail.html">
                    <img
                            src="./assets/img/gachoptuongphobien1.jpg"
                            alt="Basic web design"
                            class="thumb"
                    />
                </a>
                <div class="info">
                    <div class="head">
                        <div class="title">
                            <a href="#!" class="line-clamp break-all">
                                Gạch ốp lát EPEDA E601201
                            </a>
                        </div>
                        <div class="rating">
                            <img
                                    src="./assets/img/star.svg"
                                    alt="Star"
                                    class="star"
                            />
                            <span class="value">4.5</span>
                        </div>
                    </div>
                    <p class="desc line-clamp line-2 break-all">
                        Kích thước 600×1200 mm - Bề mặt mài bóng <br />
                        Loại gạch Granite
                    </p>
                    <div class="foot">
                        <span class="price">50.000₫</span>
                        <a href=""
                        ><svg
                                class="icon"
                                width="30"
                                height="30"
                                viewBox="0 0 24 24"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                    fill="#2e2100ff"
                            />
                        </svg></a>

                        <a href="./delivery_information.html"><button class="btn book-btn">Đặt ngay</button></a>

                    </div>
                </div>
            </div>

            <!-- Course item 2 -->
            <div class="course-item">
                <a href="./product-detail.html">
                    <img
                            src="./assets/img/gachoptuongphobien2.jpg"
                            alt="UI/UX design"
                            class="thumb"
                    />
                </a>
                <div class="info">
                    <div class="head">
                        <div class="title">
                            <a href="#!" class="line-clamp break-all"
                            >Gạch ốp lát EPEDA E601202</a
                            >
                        </div>
                        <div class="rating">
                            <img
                                    src="./assets/img/star.svg"
                                    alt="Star"
                                    class="star"
                            />
                            <span class="value">4.5</span>
                        </div>
                    </div>
                    <p class="desc line-clamp line-2 break-all">
                        Kích thước 600×1200 mm - Bề mặt mài bóng <br />
                        Loại gạch Granite
                    </p>
                    <div class="foot">
                        <span class="price">50.000₫</span>
                        <a href=""
                        ><svg
                                class="icon"
                                width="30"
                                height="30"
                                viewBox="0 0 24 24"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                    fill="#2e2100ff"
                            />
                        </svg></a>

                        <a href="./delivery_information.html"><button class="btn book-btn">Đặt ngay</button></a>

                    </div>
                </div>
            </div>

            <!-- Course item 3 -->
            <div class="course-item">
                <a href="./product-detail.html">
                    <img
                            src="./assets/img/gachoptuongphobien3.jpg"
                            alt="Web App design"
                            class="thumb"
                    />
                </a>
                <div class="info">
                    <div class="head">
                        <div class="title">
                            <a href="#!" class="line-clamp break-all"
                            >Gạch ốp lát EPEDA E601203</a
                            >
                        </div>
                        <div class="rating">
                            <img
                                    src="./assets/img/star.svg"
                                    alt="Star"
                                    class="star"
                            />
                            <span class="value">4.5</span>
                        </div>
                    </div>
                    <p class="desc line-clamp line-2 break-all">
                        Kích thước 600×1200 mm - Bề mặt mài bóng <br />
                        Loại gạch Granite
                    </p>
                    <div class="foot">
                        <span class="price">50.000₫</span>
                        <a href=""
                        ><svg
                                class="icon"
                                width="30"
                                height="30"
                                viewBox="0 0 24 24"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                                    fill="#2e2100ff"
                            />
                            <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                                    fill="#2e2100ff"
                            />
                        </svg></a>

                        <a href="./delivery_information.html"><button class="btn book-btn">Đặt ngay</button></a>

                    </div>
                </div>
            </div>
        </div>

        <a
                href="#!"
                style="
                        display: inline-block;
                        margin-top: 20px;
                        margin-left: 10px;
                    "
        >
            <span class="desc">-> Xem thêm tại đây... </span>
        </a>
    </div>
</div>

<jsp:include page="view_shared/header_footer/footer.jsp"/>


<script src="assets/js/chuyendoicacnut.js"></script>
<script src="assets/js/left_right.js"></script>
<script src="assets/js/slider.js"></script>
<script src="assets/js/scrollTop.js"></script>
</body>
</html>
