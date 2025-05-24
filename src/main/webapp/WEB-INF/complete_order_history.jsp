<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch sử đơn hàng </title>
    <link rel="stylesheet" href="/assets/css/lichsudonhangthanhcong.css">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/cacthanhphancodinh.css">
    <link rel="stylesheet" href="/assets/css/giohang.css">
    <link rel="stylesheet" href="/assets/css/dropdown_user_menu.css">
    <link rel="icon" type="image/x-icon" href="/assets/icons/logo2_no_text.svg" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <!-- Thêm SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Thêm Notyf -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js"></script>

    <style>
        ol {
            display: flex;
            padding: 1rem;
            gap: 1.5rem;
            min-width: fit-content;
        }
        @media (min-width: 640px) {
            ol {
                padding: 2.5rem 3.2rem;
                gap: 1rem;
            }
        }
        li {
            flex-shrink: 0;
        }
        li > span:first-child {
            margin-right: 1rem;
        }
        li > svg {
            margin-left: 1rem;
        }
        @media (min-width: 640px) {
            li > svg {
                margin-left: 2rem;
            }
        }
    </style>
</head>
<body>
<jsp:include page="../view_shared/header_footer/header.jsp"/>

<div class="container">
    <aside class="sidebar">
        <ul>
            <li><b>Tài Khoản Của Tôi</b></li>
            <a href="profile"><li>Hồ Sơ</li></a>
            <hr>
            <li class="active">Đơn Mua</li>
            <hr>
            <a href="/"><li>Quay về trang chủ</li></a>
        </ul>
    </aside>

    <main class="profile">
        <ol class="flex items-center w-full px-12 py-10 gap-10 text-center text-gray-500 bg-white border-2 border-gray-200 rounded-lg shadow-md min-w-fit sm:px-20 sm:py-12 sm:gap-12">
            <li class="DH flex items-center active text-blue-600 shrink-0" onclick="loadOrders('all')">
        <span class="flex items-center justify-center w-9 h-9 mr-6 text-xl font-semibold border-2 border-blue-600 rounded-full shrink-0">
            1
        </span>
                <span class="text-3xl font-medium">Tất cả</span>
                <svg class="w-6 h-6 ml-6 sm:ml-8" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 12 10">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m7 9 4-4-4-4M1 9l4-4-4-4"/>
                </svg>
            </li>
            <li class="DH flex items-center shrink-0" onclick="loadOrders('Processing')">
        <span class="flex items-center justify-center w-9 h-9 mr-6 text-xl font-semibold border-2 border-gray-500 rounded-full shrink-0">
            2
        </span>
                <span class="text-3xl font-medium">Đang xử lý</span>
                <svg class="w-6 h-6 ml-6 sm:ml-8" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 12 10">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m7 9 4-4-4-4M1 9l4-4-4-4"/>
                </svg>
            </li>
            <li class="DH flex items-center shrink-0" onclick="loadOrders('Shipping')">
        <span class="flex items-center justify-center w-9 h-9 mr-6 text-xl font-semibold border-2 border-gray-500 rounded-full shrink-0">
            3
        </span>
                <span class="text-3xl font-medium">Chờ giao hàng</span>
                <svg class="w-6 h-6 ml-6 sm:ml-8" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 12 10">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m7 9 4-4-4-4M1 9l4-4-4-4"/>
                </svg>
            </li>
            <li class="DH flex items-center shrink-0" onclick="loadOrders('Delivered')">
        <span class="flex items-center justify-center w-9 h-9 mr-6 text-xl font-semibold border-2 border-gray-500 rounded-full shrink-0">
            4
        </span>
                <span class="text-3xl font-medium">Đơn đã giao</span>
                <svg class="w-6 h-6 ml-6 sm:ml-8" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 12 10">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m7 9 4-4-4-4M1 9l4-4-4-4"/>
                </svg>
            </li>
            <li class="DH flex items-center shrink-0" onclick="loadOrders('Cancelled')">
        <span class="flex items-center justify-center w-9 h-9 mr-6 text-xl font-semibold border-2 border-gray-500 rounded-full shrink-0">
            5
        </span>
                <span class="text-3.5xl font-medium">Đơn đã hủy</span>
            </li>
        </ol>


        <div class="noidungcacdonhang" id="orderContent">
            <div class="cacsanpham">
                <div class="hoanthanh"><b>TẤT CẢ ĐƠN HÀNG</b></div>
                <!-- Thêm ô tìm kiếm và dropdown sắp xếp -->
                <div class="sort-container flex flex-col sm:flex-row sm:items-center gap-4 p-6 bg-gray-50 rounded-2xl shadow-md">
                    <div class="relative w-full sm:w-auto">
                        <input
                                type="text"
                                id="searchKeyword"
                                placeholder="Tìm kiếm đơn hàng (VD: 27-03-2025, BAMBU, Đang xử lý)"
                                onkeyup="handleSearch(event)"
                                class="w-full px-5 py-3 text-gray-800 border border-gray-200 rounded-2xl focus:outline-none focus:ring-2 focus:ring-blue-400 bg-white shadow-sm transition-all duration-300"
                        >
                        <div
                                id="suggestions"
                                class="autocomplete-suggestions absolute w-full mt-2 bg-white border border-gray-100 rounded-2xl shadow-lg max-h-60 overflow-y-auto hidden z-10"
                        ></div>
                    </div>
                    <select
                            id="sortOption"
                            onchange="loadOrdersWithSortAndSearch()"
                            class="w-full sm:w-auto px-5 py-3 text-gray-800 border border-gray-200 rounded-2xl focus:outline-none focus:ring-2 focus:ring-blue-400 bg-white shadow-sm transition-all duration-300"
                    >
                        <option value="newest">Mới nhất</option>
                        <option value="oldest">Cũ nhất</option>
                        <option value="totalPriceDesc">Tổng giá: Cao đến thấp</option>
                        <option value="totalPriceAsc">Tổng giá: Thấp đến cao</option>
                    </select>
                </div>
                <hr>
                <c:if test="${not empty orderDetails}">
                    <!-- Nhóm các sản phẩm theo OrderID -->
                    <c:forEach var="entry" items="${orderGroups}">
                        <div class="order-group">
                            <div class="order-header">
                                <span>Đơn hàng #${entry.key} - Ngày tạo: ${orderCreateDates[entry.key]} - Trạng thái: ${orderStatusDisplayMap[entry.key]} - Tổng: ₫${orderTotalPrices[entry.key]} - Phương thức thanh toán: ${orderPayments[entry.key]}</span>
                                <c:set var="orderStatus" value="${orderStatusMap[entry.key]}" />
                                <c:if test="${orderStatus == 'Processing' || orderStatus == 'Shipping'}">
                                    <div class="mualaine" onclick="confirmCancelOrder(${entry.key})" style="display: inline-block; cursor: pointer;">
                                        <div class="mualai">Hủy đơn</div>
                                    </div>
                                </c:if>
                            </div>
                            <c:forEach var="order" items="${entry.value}">
                                <div class="sanpham">
                                    <div class="hinhanhcuacaigach">
                                        <img class="img-donhang" src="${order.productImg}" alt="">
                                    </div>
                                    <div class="chitietsanpham">
                                        <div class="tengachmen1">${order.productName}</div>
                                        <div class="soluong1">Số lượng ${order.quantity}</div>
                                    </div>
                                    <c:set var="orderStatus" value="${orderStatusMap[order.orderId]}" />
                                    <c:choose>
                                        <c:when test="${orderStatus == 'Processing' || orderStatus == 'Shipping'}">
                                            <a class="mualaine" href="/pdetail?pid=${order.productId}" style="display: inline-block;">
                                                <div class="mualai">Xem chi tiết</div>
                                            </a>
                                        </c:when>
                                        <c:when test="${orderStatus == 'Cancelled'}">
                                            <a class="mualaine" href="/pdetail?pid=${order.productId}" style="display: inline-block;">
                                                <div class="mualai">Mua lại</div>
                                            </a>
                                        </c:when>
                                        <c:when test="${orderStatus == 'Delivered'}">
                                            <a class="mualaine" href="/pdetail?pid=${order.productId}&tab=review" style="display: inline-block;">
                                                <div class="mualai">Đánh giá</div>
                                            </a>
                                            <a class="mualaine" href="/pdetail?pid=${order.productId}" style="display: inline-block;">
                                                <div class="mualai">Mua lại</div>
                                            </a>
                                        </c:when>
                                    </c:choose>
                                </div>
                                <hr>
                            </c:forEach>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty orderDetails}">
                    <p>Không có đơn hàng nào.</p>
                </c:if>
            </div>
        </div>
    </main>
</div>

<jsp:include page="../view_shared/header_footer/footer.jsp"/>

<script>
    let currentStatus = 'all'; // Biến để lưu trạng thái hiện tại

    function loadOrders(status) {
        currentStatus = status;
        loadOrdersWithSortAndSearch();
    }

    function loadOrdersWithSortAndSearch() {
        const sortOption = document.getElementById('sortOption').value;
        const searchKeyword = document.getElementById('searchKeyword').value;
        $.ajax({
            url: "/completeorderhistory",
            type: "GET",
            data: {
                status: currentStatus,
                sort: sortOption,
                search: searchKeyword,
                ajax: "true"
            },
            success: function(data) {
                $("#orderContent").html(data);
                $(".DH").removeClass("active");
                $(`div[onclick="loadOrders('${currentStatus}')"]`).addClass("active");
                // Giữ giá trị từ khóa tìm kiếm sau khi tải lại
                document.getElementById('searchKeyword').value = searchKeyword;
                // Ẩn danh sách gợi ý sau khi tìm kiếm
                document.getElementById('suggestions').style.display = 'none';
            },
            error: function(xhr) {
                console.error("Có lỗi xảy ra khi tải dữ liệu:", xhr);
                $("#orderContent").html("<p>Có lỗi xảy ra khi tải đơn hàng.</p>");
            }
        });
    }

    function fetchSuggestions() {
        const keyword = document.getElementById('searchKeyword').value;
        if (keyword.length < 1) {
            document.getElementById('suggestions').style.display = 'none';
            return;
        }

        hibaiba        $.ajax({
            url: "/completeorderhistory",
            type: "GET",
            data: {
                status: currentStatus,
                search: keyword,
                suggest: "true"
            },
            success: function(data) {
                const suggestionsDiv = document.getElementById('suggestions');
                suggestionsDiv.innerHTML = '';
                if (data && data.length > 0) {
                    data.forEach(suggestion => {
                        const div = document.createElement('div');
                        div.className = 'autocomplete-suggestion';
                        div.textContent = suggestion;
                        div.onclick = function() {
                            document.getElementById('searchKeyword').value = suggestion;
                            suggestionsDiv.style.display = 'none';
                            loadOrdersWithSortAndSearch();
                        };
                        suggestionsDiv.appendChild(div);
                    });
                    suggestionsDiv.style.display = 'block';
                } else {
                    suggestionsDiv.style.display = 'none';
                }
            },
            error: function(xhr) {
                console.error("Có lỗi xảy ra khi lấy gợi ý:", xhr);
                document.getElementById('suggestions').style.display = 'none';
            }
        });
    }

    function handleSearch(event) {
        fetchSuggestions();
        // Nếu người dùng nhấn Enter, thực hiện tìm kiếm ngay
        if (event.key === 'Enter') {
            loadOrdersWithSortAndSearch();
        }
    }

    // Ẩn danh sách gợi ý khi nhấp ra ngoài
    document.addEventListener('click', function(e) {
        const suggestionsDiv = document.getElementById('suggestions');
        const searchInput = document.getElementById('searchKeyword');
        if (!searchInput.contains(e.target) && !suggestionsDiv.contains(e.target)) {
            suggestionsDiv.style.display = 'none';
        }
    });
</script>

<script>
    // Khởi tạo Notyf
    const notyf = new Notyf({
        duration: 3000,
        position: { x: 'right', y: 'bottom' }, // Thay 'top' bằng 'bottom'
        ripple: true,
        dismissible: true // Có thể thêm tùy chọn cho phép đóng thông báo
    });

    // Hàm xác nhận hủy đơn hàng bằng SweetAlert
    function confirmCancelOrder(orderId) {
        Swal.fire({
            title: 'Xác nhận hủy đơn hàng',
            text: 'Bạn có chắc chắn muốn hủy đơn hàng #' + orderId + ' không?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Có, hủy đơn!',
            cancelButtonText: 'Không'
        }).then((result) => {
            if (result.isConfirmed) {
                cancelOrder(orderId);
            }
        });
    }

    // Hàm thực hiện hủy đơn hàng qua AJAX
    function cancelOrder(orderId) {
        $.ajax({
            url: '/cancelOrderAjax',
            type: 'POST',
            data: { orderId: orderId },
            success: function(response) {
                try {
                    const data = typeof response === 'string' ? JSON.parse(response) : response;
                    if (data.success) {
                        notyf.success(data.message);
                        // Tải lại danh sách đơn hàng sau khi hủy thành công
                        loadOrdersWithSortAndSearch();
                    } else {
                        notyf.error(data.message || 'Không thể hủy đơn hàng');
                    }
                } catch (e) {
                    console.error('Lỗi phân tích phản hồi:', e);
                    notyf.error('Có lỗi xảy ra khi xử lý phản hồi từ máy chủ');
                }
            },
            error: function(xhr, status, error) {
                console.error('AJAX Error:', status, error);
                notyf.error('Kết nối đến máy chủ thất bại: ' + error);
            }
        });
    }


    function loadOrders(status) {
        currentStatus = status;
        loadOrdersWithSortAndSearch();
    }

    function loadOrdersWithSortAndSearch() {
        const sortOption = document.getElementById('sortOption').value;
        const searchKeyword = document.getElementById('searchKeyword').value;
        $.ajax({
            url: "/completeorderhistory",
            type: "GET",
            data: {
                status: currentStatus,
                sort: sortOption,
                search: searchKeyword,
                ajax: "true"
            },
            success: function(data) {
                $("#orderContent").html(data);
                $(".DH").removeClass("active");
                $(`.DH[onclick="loadOrders('${currentStatus}')"]`).addClass("active");
                document.getElementById('searchKeyword').value = searchKeyword;
                document.getElementById('suggestions').style.display = 'none';
            },
            error: function(xhr) {
                console.error("Có lỗi xảy ra khi tải dữ liệu:", xhr);
                $("#orderContent").html("<p>Có lỗi xảy ra khi tải đơn hàng.</p>");
            }
        });
    }

    function fetchSuggestions() {
        const keyword = document.getElementById('searchKeyword').value;
        if (keyword.length < 1) {
            document.getElementById('suggestions').style.display = 'none';
            return;
        }

        $.ajax({
            url: "/completeorderhistory",
            type: "GET",
            data: {
                status: currentStatus,
                search: keyword,
                suggest: "true"
            },
            success: function(data) {
                const suggestionsDiv = document.getElementById('suggestions');
                suggestionsDiv.innerHTML = '';
                if (data && data.length > 0) {
                    data.forEach(suggestion => {
                        const div = document.createElement('div');
                        div.className = 'autocomplete-suggestion';
                        div.textContent = suggestion;
                        div.onclick = function() {
                            document.getElementById('searchKeyword').value = suggestion;
                            suggestionsDiv.style.display = 'none';
                            loadOrdersWithSortAndSearch();
                        };
                        suggestionsDiv.appendChild(div);
                    });
                    suggestionsDiv.style.display = 'block';
                } else {
                    suggestionsDiv.style.display = 'none';
                }
            },
            error: function(xhr) {
                console.error("Có lỗi xảy ra khi lấy gợi ý:", xhr);
                document.getElementById('suggestions').style.display = 'none';
            }
        });
    }

    function handleSearch(event) {
        fetchSuggestions();
        if (event.key === 'Enter') {
            loadOrdersWithSortAndSearch();
        }
    }

    document.addEventListener('click', function(e) {
        const suggestionsDiv = document.getElementById('suggestions');
        const searchInput = document.getElementById('searchKeyword');
        if (!searchInput.contains(e.target) && !suggestionsDiv.contains(e.target)) {
            suggestionsDiv.style.display = 'none';
        }
    });
</script>
</body>
</html>