<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ Hàng</title>

    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/cacthanhphancodinh.css">
    <!-- Thêm favicon -->
    <link rel="icon" type="image/x-icon" href="/assets/icons/logo2_no_text.svg"/>
    <link rel="stylesheet" href="/assets/css/giohang.css">
    <link rel="stylesheet" href="/assets/css/pagination.css">


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/assets/css/search.css"/>

    <link href="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js"></script>
</head>
<body>
<!-- Header chung -->
<div id="menuContainer">
<jsp:include page="/view_shared/header_footer/header.jsp"/>
</div>
<f:setLocale value="vi_VN" />
<div class="cart-page">
    <!-- Đường dẫn -->
    <div class="breadcrumb">
        <a href="/">Trang chủ</a> > <a href="#">Giỏ hàng</a>
    </div>

<%--    <div class="duongdanvahinhthucgiao">--%>
<%--        <div class="hinhthucgiao">--%>
<%--            <a href="#!">--%>
<%--                <div class="gt giaotannoi">Giao tận nơi</div>--%>
<%--            </a>--%>
<%--            <a href="./store.html">--%>
<%--                <div class="gt nhantaicuahang">Đề xuất cửa hàng gần nhất</div>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--    </div>--%>

    <div id="default-carousel" class="relative w-full" data-carousel="slide">
        <!-- Carousel wrapper -->
        <div class="relative h-56 overflow-hidden rounded-lg md:h-76">
            <c:forEach var="banner" items="${banners}" varStatus="status">
                <div class="${status.first ? '' : 'hidden'} duration-700 ease-in-out" data-carousel-item>
                    <img src="${banner.imageUrl}" class="absolute block w-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2" alt="${banner.title}">
                </div>
            </c:forEach>
        </div>
        <!-- Slider indicators -->
        <div class="absolute z-30 flex -translate-x-1/2 bottom-5 left-1/2 space-x-3 rtl:space-x-reverse">
            <c:forEach var="banner" items="${banners}" varStatus="status">
                <button type="button" class="w-3 h-3 rounded-full" aria-current="${status.first ? 'true' : 'false'}" aria-label="Slide ${status.count}" data-carousel-slide-to="${status.index}"></button>
            </c:forEach>
        </div>
        <!-- Slider controls -->
        <button type="button" class="absolute top-0 start-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none" data-carousel-prev>
        <span class="inline-flex items-center justify-center w-10 h-10 rounded-full bg-white/30 dark:bg-gray-800/30 group-hover:bg-white/50 dark:group-hover:bg-gray-800/60 group-focus:ring-4 group-focus:ring-white dark:group-focus:ring-gray-800/70 group-focus:outline-none">
            <svg class="w-4 h-4 text-white dark:text-gray-800 rtl:rotate-180" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 1 1 5l4 4"/>
            </svg>
            <span class="sr-only">Previous</span>
        </span>
        </button>
        <button type="button" class="absolute top-0 end-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none" data-carousel-next>
        <span class="inline-flex items-center justify-center w-10 h-10 rounded-full bg-white/30 dark:bg-gray-800/30 group-hover:bg-white/50 dark:group-hover:bg-gray-800/60 group-focus:ring-4 group-focus:ring-white dark:group-focus:ring-gray-800/70 group-focus:outline-none">
            <svg class="w-4 h-4 text-white dark:text-gray-800 rtl:rotate-180" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
            </svg>
            <span class="sr-only">Next</span>
        </span>
        </button>
    </div>
    <!-- Container -->
    <div class="cart-container">

        <!-- Kiểm tra giỏ hàng -->
        <c:if test="${empty sessionScope.cart || sessionScope.cart.items.size() == 0}">
            <!-- Nếu giỏ hàng trống -->
            <div class="cart-left">
                <h2>Giỏ hàng của bạn</h2>
                <p>Giỏ hàng trống</p>
            </div>
        </c:if>

        <c:if test="${not empty sessionScope.cart && sessionScope.cart.items.size() > 0}">
            <!-- Nếu giỏ hàng có sản phẩm -->
            <c:set var="cart" value="${sessionScope.cart}"/>


            <div class="cart-left">
                <h2>Giỏ hàng của bạn</h2>
                <!-- Số lượng sản phẩm (tính theo tổng hộp) -->
                <p>Bạn đang có
                    <span id="quantity12" class="highlight">${sessionScope.quantity}</span> sản phẩm
                    trong giỏ hàng
                </p>

                <!-- Duyệt từng item trong giỏ -->
                <div id="cart-left1">


                    <c:forEach var="item" items="${listo}">
                        <div class="cart-item" id="item${item.productId}-${item.productColor}">
                            <!-- Nút Xóa -->
                            <button class="btn-remove" type="button" onclick="confirmRemove(${item.productId}, '${item.productColor}')">x</button>

                            <!-- Hình ảnh sản phẩm -->
                            <img src="${item.productImage}" alt="Sản phẩm">

                            <!-- Thông tin sản phẩm -->
                            <div class="item-info">
                                <p class="item-title">${item.productName}</p>
                                <p class="item-color">${item.productColor}</p>
                                <div class="item-price">
                                    <!-- Giá/hộp -->
                                    <span class="current-price">
                                        <f:formatNumber value="${item.pricePerBox}" type="currency" currencyCode="VND" currencySymbol="₫"
                                                        maxFractionDigits="0"/>/hộp
                                    </span>

                                </div>
                            </div>

                            <!-- Bộ điều chỉnh số lượng -->
                            <div class="quantity-control">
                                <!-- Ta chỉ để nút trừ/tăng ở đây, hoặc bỏ đi nếu không cần -->
                                <button type="button" class="quantity_stepdown">
                                    -
                                </button>

                                <input
                                        type="number"
                                        value="${item.quantity}"
                                        min="1"
                                        data-productid="${item.productId}"
                                        data-color="${item.productColor}"
                                        id="quantity_input"
                                        name="quantity_input"
                                        class="quantity_input"
                                />

                                <button type="button" class="quantity_stepup">
                                    +
                                </button>
                            </div>

                            <!-- Giá tổng -->
                            <p class="item-total">
                                <f:formatNumber value="${item.totalPrice}" type="currency" currencyCode="VND" currencySymbol="₫" maxFractionDigits="0"/>
                            </p>
                        </div>
                    </c:forEach>
                </div>


                <!-- Phân trang -->

                    <%--                    <ul class="pagination justify-content-center">--%>
                    <%--                        <!-- Nút Previous -->--%>
                    <%--                        <c:if test="${page > 1}">--%>
                    <%--                            <li class="page-item"><a class="page-link"--%>
                    <%--                                                     href="cart?page=${page - 1}" aria-label="Previous"> <span--%>
                    <%--                                    aria-hidden="true">&laquo;</span>--%>
                    <%--                            </a></li>--%>
                    <%--                        </c:if>--%>

                    <%--                        <!-- Các nút trang -->--%>
                    <%--                        <c:forEach var="i" begin="1" end="${num}" step="1">--%>
                    <%--                            <li class="page-item <c:if test="${i == page}">active</c:if>">--%>
                    <%--                                <a class="page-link" href="cart?page=${i}">${i}</a> <!-- Chỗ này nếu không có đường dẫn thì nó mặc định là servlet hiên tại  -->--%>
                    <%--                            </li>--%>
                    <%--                        </c:forEach>--%>

                    <%--                        <!-- Nút Next -->--%>
                    <%--                        <c:if test="${page < num}">--%>
                    <%--                            <li class="page-item"><a class="page-link"--%>
                    <%--                                                     href="cart?page=${page + 1}" aria-label="Next"> <span--%>
                    <%--                                    aria-hidden="true">&raquo;</span>--%>
                    <%--                            </a></li>--%>
                    <%--                        </c:if>--%>
                    <%--                    </ul>--%>
                <nav aria-label="Page navigation">
                    <div class="pagination">
                        <div class="fui-roundedFull-pagination">
                            <ul class="pagination-list" id="pagination">

                                <c:forEach var="i" begin="1" end="${num}" step="1">
                                    <li class="pagination-item ">
                                        <a class="pagination-link <c:if test="${i == page}">selected</c:if>"
                                           href="javascript:void(0);" data-xpage="${i}"
                                           onclick="loadPage(this, event)">${i}</a>
                                    </li>
                                </c:forEach>


                            </ul>
                        </div>
                    </div>
                </nav>


            </div>


            <!-- Phần thông tin đơn hàng -->
            <div class="cart-right">
                <h2>Thông tin đơn hàng</h2>
                <div id="sumary1">
                    <div class="summary" >
                    <p>Tổng tiền:</p>
                    <p class="total-price" id="total_price">
                        <f:formatNumber value="${cart.total}" type="currency" currencyCode="VND" currencySymbol="₫" maxFractionDigits="0"/>
                    </p>
                    </div>
                </div>
                <p>Phí vận chuyển sẽ được tính ở trang Thanh toán.</p>
                <p>Mã giảm giá được nhập ở trang Thanh toán.</p>

                <a href="#" onclick="handleCheckout()">
                    <button class="btn-checkout">Thanh toán</button>
                </a>


                <script>
                    function handleCheckout() {
                        const isLoggedIn = ${not empty sessionScope.auth}; // Kiểm tra session đăng nhập
                        if (!isLoggedIn) {
                            alert("Bạn cần đăng nhập để tiếp tục thanh toán.");
                            window.location.href = "login"; // Chuyển đến trang đăng nhập
                        } else {
                            window.location.href = "delivery_information"; // Chuyển đến trang thông tin giao hàng
                        }
                    }

                </script>

                <!-- Vouchers -->
<%--                <div class="vouchers">--%>

<%--                    <c:forEach var="vsc" items="${vs}">--%>
<%--                        <div class="voucher-card">--%>
<%--                            <div class="voucher-content">--%>
<%--                                <img src="https://theme.hstatic.net/200000796751/1001266995/14/home_coupon_2_img.png?v=66"--%>
<%--                                     alt="Voucher">--%>
<%--                                <div class="voucher-info">--%>
<%--                                    <p><b><c:out value="${vsc.discountValue}"/></b></p>--%>

<%--                                    <p>Mã: <b class="a">${vsc.code}</b></p>--%>
<%--                                    <p>HSD: ${vsc.expireDate} </p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <button class="btn-copy">SAO CHÉP MÃ</button>--%>
<%--                        </div>--%>
<%--                    </c:forEach>--%>


<%--                </div>--%>
            </div>
        </c:if>
    </div>
</div>

<!-- File JS chức năng tăng/giảm số lượng, sao chép mã giảm giá, v.v. -->
<script src="/assets/js/congtrusaochep.js"></script>

<div class="gioithieuuytin">
    <div class="info">
        <div class="info-item">
            <p>🏆</p>
            <p>Chất Lượng Cao</p>
            <p>Sản phẩm từ vật liệu cao cấp</p>
        </div>
        <div class="info-item">
            <p>🛡️</p>
            <p>Bảo Hành</p>
            <p>Hơn 2 năm</p>
        </div>
        <div class="info-item">
            <p>🚚</p>
            <p>Miễn Phí Giao Hàng</p>
            <p>Cho đơn hàng trên 3,500,000 VNĐ</p>
        </div>
        <div class="info-item">
            <p>📞</p>
            <p>Hỗ Trợ 24/7</p>
            <p>Hỗ trợ tận tình</p>
        </div>
    </div>
</div>

<jsp:include page="/view_shared/header_footer/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="../assets/js/search.js"></script>
<script>
    function confirmRemove(productId, productColor) {
        // Sử dụng SweetAlert2 để hiển thị modal xác nhận
        Swal.fire({
            title: 'Bạn có chắc chắn muốn xóa sản phẩm này?',
            text: `Sản phẩm màu ${productColor} sẽ bị xóa!`,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Xóa',
            cancelButtonText: 'Hủy',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                // Gửi dữ liệu qua AJAX đến controller
                sendRemoveRequest(productId, productColor);
            }
        });
    }

    function sendRemoveRequest(productId, productColor) {
        const url = new URL('/deleteproduct', window.location.origin);
        const params = new URLSearchParams({
            productId: productId,
            productColor: productColor
        });

        url.search = params.toString(); // Chuyển tham số thành query string

        fetch(url, {
            method: 'GET', // Vẫn giữ GET method
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        })
            .then(response => response.json())
            .then(data => {
                console.log(data)
               $('#total_price').text(data.totalPrice1.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' }));
                $('#menuContainer').load('/view_shared/header_footer/header.jsp')
                $('#quantity12').text(data.quantity)
                $("#cart-left1").empty();
                var content='';
                data.listItems.forEach(function (item){
                    content += "<div class=\"cart-item\" id=\"item" + item.productId + "-" + item.productColor + "\">\n" +
                        "    <!-- Nút Xóa -->\n" +
                        "    <button class=\"btn-remove\" type=\"button\" onclick=\"confirmRemove(" + item.productId + ", '" + item.productColor + "')\">\n" +
                        "        x\n" +
                        "    </button>\n" +
                        "    <!-- Hình ảnh sản phẩm -->\n" +
                        "    <img src=\"" + item.productImage + "\" alt=\"Sản phẩm\">\n" +
                        "    <!-- Thông tin sản phẩm -->\n" +
                        "    <div class=\"item-info\">\n" +
                        "        <p class=\"item-title\">" + item.productName + "</p>\n" +
                        "        <p class=\"item-color\">" + item.productColor + "</p>\n" +
                        "        <div class=\"item-price\">\n" +
                        "            <span class=\"current-price\">" + item.pricePerBox.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' }) + "/hộp</span>\n" +
                        "        </div>\n" +
                        "    </div>\n" +
                        "    <!-- Bộ điều chỉnh số lượng -->\n" +
                        "    <div class=\"quantity-control\">\n" +
                        "        <button type=\"button\" onclick=\"this.parentElement.querySelector('input[type=number]').stepDown(); triggerUpdate(this.parentElement.querySelector('input[type=number]'));\">\n" +
                        "            -\n" +
                        "        </button>\n" +
                        "        <input type=\"number\" value=\"" + item.quantity + "\" min=\"1\" onchange=\"triggerUpdate(this)\" data-productid=\"" + item.productId + "\" data-color=\"" + item.productColor + "\"/>\n" +
                        "        <button type=\"button\" onclick=\"this.parentElement.querySelector('input[type=number]').stepUp(); triggerUpdate(this.parentElement.querySelector('input[type=number]'));\">\n" +
                        "            +\n" +
                        "        </button>\n" +
                        "    </div>\n" +
                        "    <!-- Giá tổng -->\n" +
                        "    <p class=\"item-total\">" + (item.quantity*item.pricePerBox).toLocaleString('vi-VN', { style: 'currency', currency: 'VND' }) + "</p>\n" +
                        "</div>";
                });
                $("#cart-left1").html(content);

            })
            .catch(error => {
                console.log(error);
            });


    }
</script>




<script>
    function loadPage(element, event) {
        event.preventDefault(); // Ngăn hành động mặc định của thẻ <a>

        var pageNumber = $(element).data("xpage"); // Lấy giá trị từ thuộc tính data-xpage

        $.ajax({
            url: "/get-cart", // Gọi controller cart
            type: "POST", // Phương thức HTTP là GET
            data: {xpage: pageNumber}, // Gửi tham số xpage qua dữ liệu GET
            success: function (data) {
                if (data.success) {
                    $("#cart-left1").empty();
                    content = "";

                    data.cart_item.forEach(function (item) {
                        content += "<div class=\"cart-item\" id=\"item" + item.productId + "-" + item.productColor + "\">\n" +
                            "    <!-- Nút Xóa -->\n" +
                            "    <button class=\"btn-remove\" type=\"button\" onclick=\"confirmRemove(" + item.productId + ", '" + item.productColor + "')\">\n" +
                            "        x\n" +
                            "    </button>\n" +
                            "    <!-- Hình ảnh sản phẩm -->\n" +
                            "    <img src=\"" + item.productImage + "\" alt=\"Sản phẩm\">\n" +
                            "    <!-- Thông tin sản phẩm -->\n" +
                            "    <div class=\"item-info\">\n" +
                            "        <p class=\"item-title\">" + item.productName + "</p>\n" +
                            "        <p class=\"item-color\">" + item.productColor + "</p>\n" +
                            "        <div class=\"item-price\">\n" +
                            "            <span class=\"current-price\">" + item.pricePerBox.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' }) + "/hộp</span>\n" +
                            "        </div>\n" +
                            "    </div>\n" +
                            "    <!-- Bộ điều chỉnh số lượng -->\n" +
                            "    <div class=\"quantity-control\">\n" +
                            "        <button type=\"button\" onclick=\"this.parentElement.querySelector('input[type=number]').stepDown(); triggerUpdate(this.parentElement.querySelector('input[type=number]'));\">\n" +
                            "            -\n" +
                            "        </button>\n" +
                            "        <input type=\"number\" value=\"" + item.quantity + "\" min=\"1\" onchange=\"triggerUpdate(this)\" data-productid=\"" + item.productId + "\" data-color=\"" + item.productColor + "\"/>\n" +
                            "        <button type=\"button\" onclick=\"this.parentElement.querySelector('input[type=number]').stepUp(); triggerUpdate(this.parentElement.querySelector('input[type=number]'));\">\n" +
                            "            +\n" +
                            "        </button>\n" +
                            "    </div>\n" +
                            "    <!-- Giá tổng -->\n" +
                            "    <p class=\"item-total\">" + item.totalPrice.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' }) + "</p>\n" +
                            "</div>";

                    })

                    $("#cart-left1").html(content);


                    // Lấy tất cả các phần tử pagination-link
                    const paginationLinks = document.querySelectorAll('.pagination-link');

                    // Loại bỏ lớp 'selected' khỏi tất cả các trang
                    paginationLinks.forEach(function(link) {
                        link.classList.remove('selected');
                    });
                    // Thêm lớp 'selected' vào trang hiện tại
                    element.classList.add('selected');

                    // Lấy số trang và thực hiện các thao tác cần thiết (ví dụ như tải nội dung trang)
                    const pageNumber = element.getAttribute('data-xpage');

                }
            },
            error: function (xhr, status, error) {
                alert("Có lỗi xảy ra: " + error); // Xử lý lỗi nếu có
            }
        });
    }
</script>


<script>
    function debounce(callback, delay) {
        let timeoutId; // Biến lưu trữ timeout

        return function (...args) {
            clearTimeout(timeoutId);

            timeoutId = setTimeout(() => {
                callback(...args);
            }, delay);
        };
    }

    function triggerUpdate(element) {
        let parentElement = element.closest("div");
        let inputElement = parentElement.querySelector('input[type=number]');
        const quantity = inputElement.value;
        const productId = inputElement.dataset.productid;
        const color = inputElement.dataset.color;

        // Gửi request cập nhật cart
        fetch('<c:url value="/cart"/>', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                action: 'update',
                productId: productId,
                color: color,
                quantity: quantity
            }).toString()
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Cập nhật thất bại');
                }
                return response.json();
            })
            .then(data => {
                console.log(data);
                $('#total_price').text(data.totalPrice.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' }))
                let allParrentElement = parentElement.parentElement;
                let totalPriceElement = allParrentElement.querySelector(".item-total");
                totalPriceElement.textContent = data.thisElementPrice.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' }+"/hộp");
            })
            .catch(err => {
                console.error(err);
                alert('Không thể cập nhật giỏ hàng!');
            });
    }

    const debouncedUpdateCart = debounce(triggerUpdate, 200);

    $(".quantity_input").on('change', (event) => {
        let a = event.currentTarget;
        console.log([a])
        debouncedUpdateCart(event.currentTarget)
    });
    // Xử lý sự kiện input
    $(".quantity_input").on("input", function() {
        let value = parseFloat($(this).val());

        if (value <= 0) {
            $(this).val(1);
        }
    });
    $(".quantity_input").on("keydown", function(event) {
        // Cho phép các phím: số, phím điều hướng, phím xóa
        if (
            (event.key >= '0' && event.key <= '9') ||
            event.key === 'ArrowLeft' || event.key === 'ArrowRight' ||
            event.key === 'Home' || event.key === 'End' ||
            event.key === 'Backspace' || event.key === 'Delete'
        ) {
            return; // Cho phép
        } else {
            event.preventDefault(); // Chặn các phím khác
        }
    });

    $(".quantity_stepup").on('click', (event) => {
        let parentElement = event.currentTarget.closest("div");
        let inputElement = parentElement.querySelector('#quantity_input');
        // document.querySelector('input[type=number][name="quantity_input"]').stepUp();
        inputElement.stepUp();
        debouncedUpdateCart(event.currentTarget);
    })
    $('.quantity_stepdown').on('click', (event) => {
        let parentElement = event.currentTarget.closest("div");
        let inputElement = parentElement.querySelector('#quantity_input');
        // document.querySelector('input[type=number][name="quantity_input"]').stepUp();
        inputElement.stepDown();
        debouncedUpdateCart(event.currentTarget);
    });
</script>

<%--<script>--%>
<%--    function removeItem(productId, color) {--%>
<%--        if (!confirm('Bạn có chắc muốn xóa sản phẩm này?')) {--%>
<%--            return;--%>
<%--        }--%>

<%--        // Gửi request xóa bằng fetch--%>
<%--        fetch('<c:url value="/cart"/>', {--%>
<%--            method: 'POST',--%>
<%--            headers: {--%>
<%--                'Content-Type': 'application/x-www-form-urlencoded'--%>
<%--            },--%>
<%--            body: new URLSearchParams({--%>
<%--                action: 'remove',--%>
<%--                productId: productId,--%>
<%--                color: color--%>
<%--            })--%>
<%--        })--%>
<%--            .then(response => {--%>
<%--                if (!response.ok) {--%>
<%--                    // Nếu status không phải 2xx thì ném lỗi--%>
<%--                    throw new Error('Remove failed');--%>
<%--                }--%>
<%--                // Nếu xóa thành công => reload trang để cập nhật--%>
<%--                // window.location.reload();--%>
<%--            })--%>
<%--            .catch(err => {--%>
<%--                console.error(err);--%>
<%--                alert('Không thể xóa sản phẩm!');--%>
<%--            });--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
