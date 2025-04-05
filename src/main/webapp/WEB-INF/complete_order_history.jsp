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
        <div class="danhmucdautien">
            <div class="DH active" onclick="loadOrders('all')">Tất cả</div>
            <div class="DH" onclick="loadOrders('Processing')">Đang xử lý</div>
            <div class="DH" onclick="loadOrders('Shipping')">Chờ giao hàng</div>
            <div class="DH" onclick="loadOrders('Delivered')">Đơn đã giao</div>
            <div class="DH" onclick="loadOrders('Cancelled')">Đơn đã hủy</div>
        </div>

        <div class="noidungcacdonhang" id="orderContent">
            <div class="cacsanpham">
                <div class="hoanthanh"><b>TẤT CẢ ĐƠN HÀNG</b></div>
                <!-- Thêm ô tìm kiếm và dropdown sắp xếp -->
                <div class="sort-container">
                    <div style="position: relative;">
                        <input type="text" id="searchKeyword"  placeholder="Tìm kiếm đơn hàng (VD: 27-03-2025, BAMBU, Đang xử lý)" onkeyup="handleSearch(event)">
                        <div id="suggestions" class="autocomplete-suggestions" style="display: none;"></div>
                    </div>
                    <select id="sortOption" onchange="loadOrdersWithSortAndSearch()">
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
                                <span>Đơn hàng #${entry.key} - Ngày tạo: ${orderCreateDates[entry.key]} - Trạng thái: ${orderStatusDisplayMap[entry.key]} - Tổng: ₫${orderTotalPrices[entry.key]}</span>
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