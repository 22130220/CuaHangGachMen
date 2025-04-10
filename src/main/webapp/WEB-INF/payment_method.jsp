
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin giao hàng</title>
    <link rel="stylesheet" href="../assets/css/payment_method.css">
    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />
</head>
<body>
<div class="container">
    <div class="main-content">
        <div class="hdne">
            <h1 class="brand">Cửa hàng gạch men</h1>
            <nav class="breadcrumb">
                <a href="cart">Giỏ hàng</a> >
                <a href="#">Thông tin giao hàng</a> >
                <span>Phương thức thanh toán</span>
            </nav>
        </div>

        <section class="section">
            <h2>Phương thức thanh toán</h2>
            <div class="payment-option">
                <div>
                    <input type="checkbox" id="cod" name="payment" >
                </div>
                <div>
                    <img src="https://hstatic.net/0/0/global/design/seller/image/payment/cod.svg?v=6" alt="COD" >
                </div>

                <div> Thanh toán khi giao hàng (COD) </div>
            </div>
            <a href="/payment-vnpay">
                <div class="payment-option">
                    <div><input type="checkbox" id="chuyenkhoan" name="payment"  ></div>
                    <div>
                        <img src="https://hstatic.net/0/0/global/design/seller/image/payment/other.svg?v=6" alt="Ngân hàng">
                    </div>

                    <div>Chuyển khoản qua VNPAY</div>
                </div>
            </a>
            <form action="/MoMoController" method="post" id="momoForm">
                <div class="payment-option" onclick="document.getElementById('momoForm').submit()">
                    <input type="hidden" name="total_momo" id="totaltien" value="">
                    <div>
                        <img src="https://tse3.mm.bing.net/th?id=OIP.ZwFh_3ZB6_1cAKgwpP0cnQAAAA&pid=Api&P=0&h=220" alt="MOMO">
                    </div>
                    <div>Thanh Toán qua MOMO</div>
                </div>
            </form>
            <form action="/ZaloPayController" method="post" id="zaloPayform">
                <div class="payment-option" onclick="document.getElementById('zaloPayform').submit()">
                    <input type="hidden" name="total_zaloPay" id="totaltien2" value="${sessionScope.finalTotal}">
                    <div>
                        <img src="https://vcci-hcm.org.vn/wp-content/uploads/2022/12/1.png" alt="MOMO">
                    </div>
                    <div>Thanh Toán qua MOMO</div>
                </div>
            </form>

            <div class="bank-info" id="bank-info" style="display: none;">
                <p>Quý khách vui lòng chuyển khoản trước số tiền cần thanh toán, sau đó chúng tôi tiến hành giao hàng theo thỏa thuận hoặc hợp đồng với Quý khách.</p>
                <p><strong>Thông tin tài khoản:</strong></p>
                <p><strong>0376272024 - BIDV CN HCM</strong></p>
                <p><strong>Công ty CP Cửa Hàng Gạch Men</strong></p>
                <p><strong>Nội dung chuyển khoản:</strong> Ghi rõ Số điện thoại hoặc Số đơn hàng</p>
            </div>
        </section>

        <div class="price-summary">
            <p>Mã voucher đã dùng: ${sessionScope.voucherID}</p>
            <h3>Tổng cộng thanh toán: ${sessionScope.finalTotal}₫</h3>
        </div>
        <aside class="sidebar">
            <ul class="cart-items">
            <c:forEach var="item" items="${cart.items}">
                <li class="chitietsanphamthanhtoan">
                    <div class="image-wrapper">
                        <img class="img_small" src="${item.productImage}" alt="">
                        <span class="badge">${item.quantity}</span>
                    </div>
                    <span> ${item.productName}
                    <br> MÀU ${item.productColor}
                        <br> SỐ LƯỢNG: ${item.quantity}
                    </span>
                    <span><fmt:formatNumber value="${item.totalPrice}" type="number" maxFractionDigits="0"/>đ</span>

                </li>

            </c:forEach>

            </ul>

            <div>
                <form action="CompleteOrderController" method="post">
                <h3>Thông tin khách hàng</h3>

                    <div class="form-group">
                        <label for="name">Họ tên</label>
                        <input type="text" id="name" name="name" value="${sessionScope.name}" required>
                    </div>
                <br>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" value="${sessionScope.email}" required>
                    </div>
                <br>
                    <div class="form-group">
                        <label for="phone">Số điện thoại</label>
                        <input type="tel" id="phone" name="phone" value="${sessionScope.phone}" required>
                    </div>
                <br>
                    <div class="form-group">
                        <label for="address">Địa chỉ</label>
                        <input type="text" id="address" name="address" value="${sessionScope.address}" required>
                    </div>
                <br>
                    <div class="form-group">
                        <label for="note">Ghi chú</label>
                        <input type="text" id="note" name="note" value="${sessionScope.note}"  >
                    </div>

                    <div class="ftne">
                        <a href="cart" class="link">Giỏ hàng</a>
                        <button type="submit" class="submit-button">Hoàn tất đơn hàng</button>
                    </div>
                </form>
            </div>


        </aside>

    </div>
</div>
<script>
    const tien=${sessionScope.finalTotal}
    document.getElementById('totaltien').value =tien;
</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const codCheckbox = document.getElementById("cod");
        const bankCheckbox = document.getElementById("chuyenkhoan");
        const bankInfo = document.getElementById("bank-info");

        // Xử lý sự kiện khi chọn "Chuyển khoản qua ngân hàng"
        bankCheckbox.addEventListener("change", function () {
            if (bankCheckbox.checked) {
                codCheckbox.checked = false; // Bỏ chọn COD
                bankInfo.style.display = "block"; // Hiển thị thông tin ngân hàng
            } else {
                bankInfo.style.display = "none"; // Ẩn thông tin ngân hàng
            }
        });

        // Xử lý sự kiện khi chọn "COD"
        codCheckbox.addEventListener("change", function () {
            if (codCheckbox.checked) {
                bankCheckbox.checked = false; // Bỏ chọn ngân hàng
                bankInfo.style.display = "none"; // Ẩn thông tin ngân hàng
            }
        });
    });


</script>
</body>


</html>

