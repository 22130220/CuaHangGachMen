<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thống kê mua hàng</title>

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

    <!-- chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.9/dist/chart.umd.min.js"></script>
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
                </div>
            </nav>
                <div class="card _1c _2r">
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

                <div class="card _1c _2r">
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

                <div class="card _1c _2r">
                    <div class="title-icon">
                        <p class="text_entry_title">Số Lượng nhập vào</p>
                        <i class="fa-solid fa-money-bill text_entry_title fa-lg"></i>
                    </div>
                    <div class="content-entry">
                        <p class="big-title f-cl-black f-bold f-s-30" x-text="inStock">

                        </p>
                        <p class="less-title f-cl-black f-bold f-s-16">
                            VNĐ
                        </p>
                    </div>

                </div>

                <div class="card _1c _2r">
                    <div class="title-icon">
                        <p class="text_entry_title">Tổng doanh thu</p>
                        <i class="fa-solid fa-money-bill text_entry_title fa-lg"></i>
                    </div>
                    <div class="content-entry">
                        <p class="big-title f-cl-black f-bold f-s-30">
                            24242323
                        </p>
                        <p class="less-title f-cl-black f-bold f-s-16">
                            VNĐ
                        </p>
                    </div>

                </div>


<%--            <div class="_2c _2r">--%>
<%--                <div class="card">--%>
<%--                    <div class="title-icon">--%>
<%--                        <p class="text_entry_title">Doanh thu</p>--%>
<%--                    </div>--%>
<%--                    <canvas id="revenueChart"></canvas>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="_2c _3r">--%>
<%--                <div class="card">--%>
<%--                    <div class="title-icon">--%>
<%--                        <p class="text_entry_title">Doanh thu</p>--%>
<%--                    </div>--%>
<%--                    <canvas id="pieChart"></canvas>--%>
<%--                </div>--%>
<%--            </div>--%>

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
                    async init() {
                        try {
                            const form = new FormData();
                            form.append('totalRevenue', 'totalRevenue');
                            form.append('outStock', 'outStock');
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
                        } catch (error) {
                            console.error("Đã xảy ra lỗi:", error);
                        }
                    }
                }))
            })
        </script>
        <script>
            fetch('/admin/get-monthly-revenue')
                .then(res => res.json())
                .then(data => {
                    const labels = data.map(item => `Tháng ${item.month}/${item.year}`);
                    const revenues = data.map(item => (item.total / 1000000).toFixed(2)); // chuyển sang triệu VND

                    const ctx = document.getElementById('revenueChart').getContext('2d');

                    const revenueChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: labels,
                            datasets: [{
                                label: 'Doanh thu (triệu VND)',
                                data: revenues,
                                backgroundColor: 'rgba(54, 162, 235, 0.6)',
                                borderColor: 'rgba(54, 162, 235, 1)',
                                borderWidth: 1
                            }]
                        },
                        options: {
                            responsive: true,
                            scales: {
                                y: {
                                    beginAtZero: true,
                                    title: {
                                        display: true,
                                        text: 'Triệu VND'
                                    }
                                },
                                x: {
                                    title: {
                                        display: true,
                                        text: 'Tháng/Năm'
                                    }
                                }
                            },
                            plugins: {
                                legend: {
                                    display: true
                                },
                                tooltip: {
                                    mode: 'index',
                                    intersect: false
                                }
                            }
                        }
                    });
                })
                .catch(error => {
                    console.error('Lỗi khi lấy dữ liệu doanh thu:', error);
                });

            const pieChart = new Chart(document.getElementById('pieChart').getContext('2d'), {
                type: 'pie',
                data: {
                    labels: ['Thời trang', 'Điện tử', 'Gia dụng', 'Thực phẩm', 'Khác'],
                    datasets: [{
                        label: 'Tỷ lệ doanh thu',
                        data: [35, 25, 15, 10, 15], // phần trăm hoặc số tuyệt đối
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.6)',
                            'rgba(54, 162, 235, 0.6)',
                            'rgba(255, 206, 86, 0.6)',
                            'rgba(75, 192, 192, 0.6)',
                            'rgba(153, 102, 255, 0.6)'
                        ],
                        borderColor: '#fff',
                        borderWidth: 2
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'bottom'
                        },
                        tooltip: {
                            callbacks: {
                                label: function(context) {
                                    const label = context.label || '';
                                    const value = context.parsed;
                                    return `${label}: ${value} triệu VND`;
                                }
                            }
                        }
                    }
                }
            });

            const lineChart = new Chart(document.getElementById('lineChart').getContext('2d'), {
                type: 'line',
                data: {
                    labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6'],
                    datasets: [{
                        label: 'Doanh thu (triệu VND)',
                        data: [120, 150, 180, 170, 200, 230],
                        fill: true,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        tension: 0.3,
                        pointBackgroundColor: 'rgba(54, 162, 235, 1)'
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Triệu VND'
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: 'Tháng'
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            display: true
                        },
                        tooltip: {
                            mode: 'index',
                            intersect: false
                        }
                    }
                }
            });

            const doughnutChart = new Chart(document.getElementById('doughnutChart').getContext('2d'), {
                type: 'doughnut',
                data: {
                    labels: ['Thời trang', 'Điện tử', 'Gia dụng', 'Thực phẩm', 'Khác'],
                    datasets: [{
                        label: 'Doanh thu',
                        data: [40, 25, 15, 10, 10], // phần trăm hoặc số tuyệt đối
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.6)',
                            'rgba(54, 162, 235, 0.6)',
                            'rgba(255, 206, 86, 0.6)',
                            'rgba(75, 192, 192, 0.6)',
                            'rgba(153, 102, 255, 0.6)'
                        ],
                        borderColor: '#fff',
                        borderWidth: 2
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'bottom'
                        },
                        tooltip: {
                            callbacks: {
                                label: function(context) {
                                    const label = context.label || '';
                                    const value = context.parsed;
                                    return `${label}: ${value} triệu VND`;
                                }
                            }
                        }
                    }
                }
            });
        </script>

</body>
</html>