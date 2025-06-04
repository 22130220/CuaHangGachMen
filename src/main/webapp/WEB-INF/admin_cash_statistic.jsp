<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Thống kê mua hàng</title>

    <!-- Reset CSS -->
    <%--    <link rel="stylesheet" href="/assets/css/reset.css" />--%>

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/assets/icons/logo2_no_text.svg">

    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js"
            integrity="sha512-6sSYJqDreZRZGkJ3b+YfdhB3MzmuP9R7X1QZ6g5aIXhRvR1Y/N/P47jmnkENm7YL3oqsmI6AK+V6AD99uWDnIw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- CSS -->
    <link rel="stylesheet" href="/assets/css/style.css"/>
    <link rel="stylesheet" href="/assets/css/admin-ruleset.css">
    <link rel="stylesheet" href="/assets/css/basicinput.css">
    <link rel="stylesheet" href="/assets/css/InputViaIcon.css">
    <link rel="stylesheet" href="/assets/css/admin-manageproduct.css">
    <link rel="stylesheet" href="/assets/css/notification.css">
    <link rel="stylesheet" href="/assets/css/arccordion.css">
    <link rel="stylesheet" href="/assets/css/product-detail.css">
    <link rel="stylesheet" href="/assets/css/admin-dashboard.css">
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
    <script src="https://cdn.datatables.net/v/dt/jszip-3.10.1/dt-2.2.2/b-3.2.2/b-html5-3.2.2/b-print-3.2.2/datatables.min.js"
            integrity="sha384-XFeEEcuPa4foNB0cSctNhsnIdsGaxO8S8pGQmzblvpAIsSCNawP7jDpSeSI6+YuI"
            crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/buttons/3.2.0/js/dataTables.buttons.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.2.0/js/buttons.dataTables.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.2.0/js/buttons.colVis.min.js"></script>
    <script src="https://cdn.datatables.net/select/3.0.0/js/dataTables.select.js"></script>
    <script src="https://cdn.datatables.net/select/3.0.0/js/select.dataTables.js"></script>
    <script src="https://cdn.datatables.net/searchpanes/2.3.3/js/dataTables.searchPanes.js"></script>
    <script src="https://cdn.datatables.net/searchpanes/2.3.3/js/searchPanes.dataTables.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"
            integrity="sha384-VFQrHzqBh5qiJIU0uGU5CIW3+OWpdGGJM9LBnGbuIH2mkICcFZ7lPd/AAtI7SNf7"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"
            integrity="sha384-/RlQG9uf0M2vcTw3CX7fbqgbj/h8wKxw7C3zu9/GxcBPRKOEcESxaxufwRXqzq6n"
            crossorigin="anonymous"></script>

    <!-- Jquery UI-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/jquery-ui.min.js"
            integrity="sha512-MSOo1aY+3pXCOCdGAYoBZ6YGI0aragoQsg1mKKBHXCYPIWxamwOE7Drh+N5CPgGI5SA9IEKJiPjdfqWFWmZtRA=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/themes/base/jquery-ui.min.css"
          integrity="sha512-TFee0335YRJoyiqz8hA8KV3P0tXa5CpRBSoM0Wnkn7JoJx1kaq1yXL/rb8YFpWXkMOjRcv5txv+C6UluttluCQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/themes/base/theme.min.css"
          integrity="sha512-lfR3NT1DltR5o7HyoeYWngQbo6Ec4ITaZuIw6oAxIiCNYu22U5kpwHy9wAaN0vvBj3U6Uy2NNtAfiaKcDxfhTg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

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

    <!-- chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.9/dist/chart.umd.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js"></script>

    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
</head>

<body>
<div class="admin-container grid-layout">
    <jsp:include page="../view_shared/admin/admin-grid.jsp"/>

    <!-- Nội dung chính -->
    <div class="content grid-item content-grid">
        <div class="main-grid" x-data="summary">
            <!-- Thanh điều hướng -->
            <nav class="navbar tag-line _4c _1r">
                <div class="nav-back-prev">
                    <div class="breadcumb">
                        <div class="breadcumb-icon f-s-25">
                            <i class="fa-solid fa-user-shield"></i>
                        </div>
                        <a href="#" class="f-bold f-s-25 breadcumb-text">Thống kê mua hàng</a>
                    </div>
                </div>
                <div class="funcproduct">

                    <!-- Select Tháng -->
                    <select x-model="selectedMonth">
                        <option value="">Chọn tháng</option>
                        <template x-for="(month, index) in months" :key="index">
                            <option :value="index + 1" x-text="month"></option>
                        </template>
                    </select>

                    <!-- Select Năm -->
                    <select x-model="selectedYear">
                        <option value="">Chọn năm</option>
                        <template x-for="year in years" :key="year">
                            <option :value="year" x-text="year"></option>
                        </template>
                    </select>
                </div>
            </nav>
            <div class="card _1c _2r">
                <div x-show="loadAll" class="text-center">
                    <div role="status">
                        <svg aria-hidden="true"
                             class="inline w-12 h-12 text-gray-200 animate-spin dark:text-gray-600 fill-gray-600 dark:fill-gray-300"
                             viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z"
                                  fill="currentColor"/>
                            <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z"
                                  fill="currentFill"/>
                        </svg>
                        <span class="sr-only">Loading...</span>
                    </div>
                </div>

                <div x-transition.opacity
                     x-transition.duration.400ms
                     x-transition:leave.duration.0ms
                     x-cloak x-show="!loadAll">
                    <div class="title-icon">
                        <p class="text_entry_title">Tổng doanh thu</p>
                        <i class="fa-solid fa-money-bill text_entry_title fa-lg"></i>
                    </div>
                    <div class="content-entry">
                        <p class="big-title f-cl-black f-bold f-s-30" x-text="totalRevenue">
                        </p>
                        <p class="less-title f-cl-black f-bold f-s-16">
                            VNĐ
                        </p>
                    </div>

                </div>

            </div>

            <div class="card _1c _2r">
                <div x-show="loadAll" class="text-center">
                    <div role="status">
                        <svg aria-hidden="true"
                             class="inline w-12 h-12 text-gray-200 animate-spin dark:text-gray-600 fill-gray-600 dark:fill-gray-300"
                             viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z"
                                  fill="currentColor"/>
                            <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z"
                                  fill="currentFill"/>
                        </svg>
                        <span class="sr-only">Loading...</span>
                    </div>
                </div>
                <div x-transition.opacity
                     x-transition.duration.400ms
                     x-cloak x-show="!loadAll">
                    <div class="title-icon">
                        <p class="text_entry_title">Số lượng bán ra</p>
                        <i class="fa-solid fa-money-bill text_entry_title fa-lg"></i>
                    </div>
                    <div class="content-entry">
                        <p class="big-title f-cl-black f-bold f-s-30" x-text="outStock">
                        </p>
                        <p class="less-title f-cl-black f-bold f-s-16">
                            Sản phẩm
                        </p>
                    </div>
                </div>


            </div>

            <div class="card _1c _2r">
                <div x-show="loadAll" class="text-center">
                    <div role="status">
                        <svg aria-hidden="true"
                             class="inline w-12 h-12 text-gray-200 animate-spin dark:text-gray-600 fill-gray-600 dark:fill-gray-300"
                             viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z"
                                  fill="currentColor"/>
                            <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z"
                                  fill="currentFill"/>
                        </svg>
                        <span class="sr-only">Loading...</span>
                    </div>
                </div>
                <div x-transition.opacity
                     x-transition.duration.400ms
                     x-cloak x-show="!loadAll">
                    <div class="title-icon">
                        <p class="text_entry_title">Lợi nhuận</p>
                        <i class="fa-solid fa-money-bill text_entry_title fa-lg"></i>
                    </div>
                    <div class="content-entry">
                        <p class="big-title f-cl-black f-bold f-s-30" x-text="profit">
                        </p>
                        <p class="less-title f-cl-black f-bold f-s-16">
                            VNĐ
                        </p>
                    </div>
                </div>


            </div>

            <div class="card _1c _2r">
                <div x-show="loadAll" class="text-center">
                    <div role="status">
                        <svg aria-hidden="true"
                             class="inline w-12 h-12 text-gray-200 animate-spin dark:text-gray-600 fill-gray-600 dark:fill-gray-300"
                             viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z"
                                  fill="currentColor"/>
                            <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z"
                                  fill="currentFill"/>
                        </svg>
                        <span class="sr-only">Loading...</span>
                    </div>
                </div>

                <div x-transition.opacity
                     x-transition.duration.400ms
                     x-cloak x-show="!loadAll">
                    <div class="title-icon">
                        <p class="text_entry_title">Số Lượng nhập vào</p>
                        <i class="fa-solid fa-money-bill text_entry_title fa-lg"></i>
                    </div>
                    <div class="content-entry">
                        <p class="big-title f-cl-black f-bold f-s-30" x-text="inStock">

                        </p>
                        <p class="less-title f-cl-black f-bold f-s-16">
                            Sản phẩm
                        </p>
                    </div>
                </div>
            </div>


            <div class="card _2c _2r">
                <div x-show="loadAll" class="text-center">
                    <div role="status">
                        <svg aria-hidden="true"
                             class="inline w-12 h-12 text-gray-200 animate-spin dark:text-gray-600 fill-gray-600 dark:fill-gray-300"
                             viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z"
                                  fill="currentColor"/>
                            <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z"
                                  fill="currentFill"/>
                        </svg>
                        <span class="sr-only">Loading...</span>
                    </div>
                </div>
                <div x-show="!loadAll" class="title-icon">
                    <p class="text_entry_title">Doanh thu</p>
                </div>
                <canvas x-show="!loadAll" id="revenueChart"></canvas>

            </div>

            <div class="card _2c _3r">
                <div x-show="loadAll" class="text-center">
                    <div role="status">
                        <svg aria-hidden="true"
                             class="inline w-12 h-12 text-gray-200 animate-spin dark:text-gray-600 fill-gray-600 dark:fill-gray-300"
                             viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z"
                                  fill="currentColor"/>
                            <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z"
                                  fill="currentFill"/>
                        </svg>
                        <span class="sr-only">Loading...</span>
                    </div>
                </div>
                <div x-show="!loadAll" class="title-icon">
                    <p class="text_entry_title">Top 5 sản phẩm bán chạy</p>
                </div>
                <div class="fui-table-ui-basic-linh table-wrap">
                    <table x-show="!loadAll">
                        <thead>
                        <tr>
                            <th>Vị trí</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
                        </tr>
                        </thead>
                        <tbody>
                        <template x-for="(product, index) in topSelling" :key="product.id">
                            <tr>
                                <td x-text="index + 1"></td>
                                <td class="pcs" x-text="product.name"></td>
                                <td x-text="product.pricePerBox">   đ </td>
                                <td class="per"></td>
                            </tr>
                        </template>
                        </tbody>
                    </table>
                </div>
            </div>

            <%--            <div class="_2c _1r">--%>
            <%--                <div class="card">--%>
            <%--                    <div class="title-icon">--%>
            <%--                        <p class="text_entry_title">Doanh thu</p>--%>
            <%--                    </div>--%>
            <%--                    <canvas id="lineChart"></canvas>--%>

            <%--                </div>--%>
            <%--            </div>--%>

            <%--            <div class="_2c _3r">--%>
            <%--                <div class="card">--%>
            <%--                    <div class="title-icon">--%>
            <%--                        <p class="text_entry_title">Doanh thu</p>--%>
            <%--                    </div>--%>
            <%--                    <canvas id="doughnutChart"></canvas>--%>

            <%--                </div>--%>
            <%--            </div>--%>

        </div>
    </div>


    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
    <script src="/assets/js/script.js"></script>
    <script src="/assets/js/notification.js"></script>
    <script src="/assets/js/accordion.js"></script>
    <script src="/assets/js/exitfFunc.js"></script>
    <script src="/assets/js/adminDatatable.js"></script>
    <script>
        document.addEventListener('alpine:init', () => {
            Alpine.data('summary', () => ({
                totalRevenue: 0,
                outStock: 0,
                inStock: 0,
                profit:0,
                topSelling: [],
                revenueByDay: [],
                selectedMonth: '',
                selectedYear: '',

                months: [
                    'Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6',
                    'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'
                ],
                years: Array.from({length: 100}, (_, i) => new Date().getFullYear() - i),

                loadAll: false,

                revenueChart: null,
                async init() {
                    const today = new Date();
                    this.selectedYear = today.getFullYear();
                    this.selectedMonth = today.getMonth() + 1;
                    this.updateDays();
                    await this.getSumaryStatistic();

                    this.$watch('selectedYear', async (value) => {
                        await this.getSumaryStatistic();
                        this.initChart()
                    })
                    this.$watch('selectedMonth', async (value) => {
                        await this.getSumaryStatistic();
                        this.initChart()
                    })
                    this.initChart();
                },
                updateDays() {
                    if (!this.selectedMonth || !this.selectedYear) {
                        this.selectedDay = '';
                    }
                },

                initChart() {
                    if (this.revenueChart) {
                        this.revenueChart.destroy();
                    }
                    const labels = this.revenueByDay.map(item => this.formatDate(item.revenueDay));
                    const ctx = document.getElementById('revenueChart').getContext('2d');
                    this.revenueChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: labels,
                            datasets: [{
                                label: 'Doanh thu (triệu VNĐ)',
                                data: this.revenueByDay.map(item => (item.revenue)),
                                backgroundColor: 'rgba(54, 162, 235, 0.6)',
                                borderColor: 'rgba(54, 162, 235, 1)',
                                borderWidth: 1
                            }]
                        },
                        options: {
                            responsive: true,
                            plugins: {
                                tooltip: {
                                    callbacks: {
                                        label: context => "Doanh thu (triệu VNĐ):" + context.raw
                                    }
                                }
                            },
                            scales: {
                                x: {
                                    title: {
                                        display: true,
                                        text: 'Ngày',
                                    },
                                    ticks: {
                                        autoSkip: false
                                    }
                                },
                                y: {
                                    beginAtZero: true,
                                    title: {
                                        display: true,
                                        text: 'Triệu VNĐ'
                                    }
                                }
                            }
                        }
                    });
                },

                formatDate(dateString) {
                    const date = new Date(dateString);
                    const day = String(date.getDate()).padStart(2, '0');
                    const month = String(date.getMonth() + 1).padStart(2, '0');
                    const year = date.getFullYear();
                    return day + "/" + month + "/" + year;
                },

                async getSumaryStatistic() {
                    try {
                        this.loadAll = true;
                        const form = new FormData();
                        form.append('totalRevenue', 'totalRevenue');
                        form.append('outStock', 'outStock');
                        form.append('inStock', 'inStock');
                        form.append('revenueByDay', 'revenueByDay');
                        form.append('profit', 'profit');
                        form.append('month', this.selectedMonth);
                        form.append('year', this.selectedYear);
                        const response = await fetch("/admin/total-revenue", {
                            method: "POST",
                            body: form
                        });
                        if (!response.ok) {
                            throw new Error("Lỗi từ server: " + response.status);
                        }

                        // Nhận JSON phản hồi từ Servlet
                        const result = await response.json();
                        this.totalRevenue = result.totalRevenue;
                        this.outStock = result.outStock;
                        this.inStock = result.inStock;
                        this.revenueByDay = result.revenueByDay;
                        if(result.profit < 0) this.profit = 0;
                        else this.profit = result.profit;
                        this.topSelling = result.topSelling;
                        console.log(result.topSelling)
                    } catch (error) {
                        console.error("Đã xảy ra lỗi:", error);
                    } finally {
                        this.loadAll = false;
                    }
                }

            }))
        })
    </script>


</body>
</html>