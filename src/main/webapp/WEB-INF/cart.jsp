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
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/cacthanhphancodinh.css">
    <!-- Thêm favicon -->
    <link rel="icon" type="image/x-icon" href="/assets/icons/logo2_no_text.svg" />
    <link rel="stylesheet" href="/assets/css/giohang.css">
</head>
<body>
<!-- Header chung -->
<jsp:include page="/view_shared/header_footer/header.jsp" />

<div class="cart-page">
    <!-- Đường dẫn -->
    <div class="breadcrumb">
        <a href="./index.html">Trang chủ</a> / <a href="#">Giỏ hàng</a>
    </div>

    <div class="duongdanvahinhthucgiao">
        <div class="hinhthucgiao">
            <a href="#!"><div class="gt giaotannoi">Giao tận nơi</div></a>
            <a href="./store.html"><div class="gt nhantaicuahang">Đề xuất cửa hàng gần nhất</div></a>
        </div>
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
            <c:set var="cart" value="${sessionScope.cart}" />

            <div class="cart-left">
                <h2>Giỏ hàng của bạn</h2>
                <!-- Số lượng sản phẩm (tính theo tổng hộp) -->
                <p>Bạn đang có
                    <span class="highlight">${cart.totalItems}</span> sản phẩm
                    trong giỏ hàng
                </p>

                <!-- Duyệt từng item trong giỏ -->
                <c:forEach var="item" items="${cart.items}">
                    <div class="cart-item" id="item${item.productId}-${item.productColor}">
                        <!-- Nút Xóa -->
                        <button
                                class="btn-remove"
                                type="button"
                                onclick="removeItem(${item.productId}, '${item.productColor}')"
                        >
                            x
                        </button>

                        <!-- Hình ảnh sản phẩm -->
                        <img src="${item.productImage}" alt="Sản phẩm">

                        <!-- Thông tin sản phẩm -->
                        <div class="item-info">
                            <p class="item-title">${item.productName}</p>
                            <p class="item-color">${item.productColor}</p>
                            <div class="item-price">
                                <!-- Giá/hộp -->
                                <span class="current-price">
                                        <f:formatNumber value="${item.pricePerBox}" type="number" maxFractionDigits="0"/>₫
                                    </span>

                            </div>
                        </div>

                        <!-- Bộ điều chỉnh số lượng -->
                        <div class="quantity-control">
                            <!-- Ta chỉ để nút trừ/tăng ở đây, hoặc bỏ đi nếu không cần -->
                            <button type="button" onclick="this.parentElement.querySelector('input[type=number]').stepDown(); triggerUpdate(this.parentElement.querySelector('input[type=number]'));">-</button>

                            <input
                                    type="number"
                                    value="${item.quantity}"
                                    min="1"
                                    onchange="triggerUpdate(this)"
                                    data-productid="${item.productId}"
                                    data-color="${item.productColor}"
                            />

                            <button type="button" onclick="this.parentElement.querySelector('input[type=number]').stepUp(); triggerUpdate(this.parentElement.querySelector('input[type=number]'));">+</button>
                        </div>

                        <!-- Giá tổng -->
                        <p class="item-total">
                            <f:formatNumber value="${item.totalPrice}" type="number" maxFractionDigits="0"/>₫
                        </p>
                    </div>
                </c:forEach>

                <!-- Ghi chú đơn hàng -->
                <div class="order-note">
                    <label for="note">Ghi chú đơn hàng</label>
                    <textarea id="note" placeholder="Ghi chú..."></textarea>
                </div>
            </div>

            <!-- Phần thông tin đơn hàng -->
            <div class="cart-right">
                <h2>Thông tin đơn hàng</h2>
                <div class="summary">
                    <p>Tổng tiền:</p>
                    <p class="total-price">
                        <f:formatNumber value="${cart.total}" type="number" maxFractionDigits="0"/>₫
                    </p>
                </div>
                <p>Phí vận chuyển sẽ được tính ở trang Thanh toán.</p>
                <p>Mã giảm giá được nhập ở trang Thanh toán.</p>

                    <a href="#" onclick="handleCheckout()" ><button class="btn-checkout">Thanh toán</button></a>


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
                <div class="vouchers">

                    <c:forEach var="vsc" items="${vs}">
                        <div class="voucher-card">
                            <div class="voucher-content">
                                <img src="https://theme.hstatic.net/200000796751/1001266995/14/home_coupon_2_img.png?v=66" alt="Voucher">
                                <div class="voucher-info">
                                    <p><b><c:out value="${vsc.discountValue}"/></b></p>

                                    <p>Mã: <b class="a">${vsc.code}</b></p>
                                    <p>HSD: ${vsc.expireDate} </p>
                                </div>
                            </div>
                            <button class="btn-copy">SAO CHÉP MÃ</button>
                        </div>
                    </c:forEach>


                </div>
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

<script>
    function triggerUpdate(inputElement) {
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
            })
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Cập nhật thất bại');
                }
                // Reload trang để cập nhật lại giao diện
                window.location.reload();
            })
            .catch(err => {
                console.error(err);
                alert('Không thể cập nhật giỏ hàng!');
            });


    }
</script>

<script>
    function removeItem(productId, color) {
        if (!confirm('Bạn có chắc muốn xóa sản phẩm này?')) {
            return;
        }

        // Gửi request xóa bằng fetch
        fetch('<c:url value="/cart"/>', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                action: 'remove',
                productId: productId,
                color: color
            })
        })
            .then(response => {
                if (!response.ok) {
                    // Nếu status không phải 2xx thì ném lỗi
                    throw new Error('Remove failed');
                }
                // Nếu xóa thành công => reload trang để cập nhật
                window.location.reload();
            })
            .catch(err => {
                console.error(err);
                alert('Không thể xóa sản phẩm!');
            });
    }
</script>
</body>
</html>
