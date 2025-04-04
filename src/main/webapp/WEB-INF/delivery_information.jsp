
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin giao hàng</title>
    <link rel="stylesheet" href="../assets/css/delivery_information.css">
    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />

    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>

    <!--Notyf-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
</head>
<body>
<div class="container">
    <div class="main-content">
        <h1>Cửa hàng gạch men</h1>
        <nav class="breadcrumb">
            <a href="#">Giỏ hàng</a> >
            <span>Thông tin giao hàng</span>
        </nav>
        <h2>Thông tin giao hàng</h2>
        <p>Dưới đây là thông tin nhận hàng của bạn! <a href="#"><b>Thay đổi thông tin</b></a></p>
        <form action="thanhtoan" method="post" class="checkout-form">
            <div class="form-group">
                <label for="name">Họ và tên</label>
                <input type="text" id="name" name="name" placeholder="Họ và tên" value="${sessionScope.auth.fullname}" required style="width: 700px;">

            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" value="${sessionScope.auth.email}" placeholder="Email">
                </div>
                <div class="form-group sdt">
                    <label for="phone">Số điện thoại</label>
                    <input type="tel" name="phone" id="phone" placeholder="Số điện thoại" value="${sessionScope.auth.phone}" required>
                </div>
            </div>
            <div class="form-row">
            <div class="form-group">
                <select id="province" name="province">
                    <option value="">-- Chọn Tỉnh/Thành phố --</option>
                </select>
            </div>
                <div class="form-group">
                <select id="district" name="district">
                    <option value="">-- Quận huyện --</option>
                </select>
                </div>
                <div class="form-group">
                <select id="ward" name="ward">
                    <option value="">Xã phường</option>
                </select>
                </div>
            </div>
            <div class="form-group">
                <label for="address">Số nhà</label>
                <input type="text" name="address" id="address" placeholder="Địa chỉ" value="" style="width: 700px;" required>
            </div>
            <div class="form-group">
                <label for="des">Ghi chú</label>
                <input type="text" id="des" name="note" placeholder=" Nhập lưu ý của bạn " style="width: 700px;">
            </div>

            <input type="hidden" id="province1" name="province1" value="">
            <input type="hidden" id="district1" name="district1" value="">
            <input type="hidden" id="ward1" name="ward1" value="">
            <input type="hidden" id="voucherID" name="voucherID" value="Không có mã voucher">
            <input type="hidden" id="finalTotal1" name="finalTotal" value="">



            <button type="submit" class="btn-primary">Tiếp tục đến phương thức thanh toán</button>


        </form>
    </div>
    <aside class="sidebar">
        <ul class="cart-items">
            <c:forEach var="item" items="${cart.items}">
                <li class="chitietsanphamthanhtoan">
                    <div class="image-wrapper">
                        <img class="img_small" src="${item.productImage}" alt="">
                        <span class="badge">${item.quantity}</span>
                    </div>
                    <span>
                ${item.productName} <br>
                Màu: ${item.productColor} <br>
                Số lượng: ${item.quantity}
            </span>
                    <span>
                <fmt:formatNumber value="${item.totalPrice}" type="number" maxFractionDigits="0"/>₫
            </span>
                </li>
            </c:forEach>
        </ul>
        <div class="discount">

            <input type="text" id="discount" placeholder="Nhập mã giảm giá">
            <div class="btn-secondary" id="btn_usage">Sử dụng</div>
        </div>
        <hr>
        <div class="price-summary">
            <p>Tạm tính:
                <fmt:formatNumber value="${cart.total}" type="number" maxFractionDigits="0"/>₫
            </p>
            <p id="feeValue">Phí vận chuyển:
                <fmt:formatNumber value="0" type="number" maxFractionDigits="0"/>₫
            </p>
            <p id="dis_val"></p>
            <hr>
            <h3>Tổng cộng:
                <span id="totalPrice"><fmt:formatNumber value="${cart.total}" type="number" maxFractionDigits="0"/></span>₫
            </h3>
        </div>
    </aside>
</div>
<script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
<script src="/assets/js/ajaxVoucher.js"></script>

<script>
    const apiToken = 'db44e853-cc14-11ef-b1ed-769685acafa5';
    const baseURL = 'https://dev-online-gateway.ghn.vn';
    checkFirst =true;

    function loadProvinces() {
        fetch(baseURL+'/shiip/public-api/master-data/province', {
            method: 'GET',
            headers: { 'Token': apiToken }
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                const provinceSelect = document.getElementById('province');
                data.data.forEach(province => {
                    const option = document.createElement('option');
                    option.value = province.ProvinceID;
                    option.textContent = province.ProvinceName;
                    document.getElementById('province1').value=province.ProvinceName
                    provinceSelect.appendChild(option);
                });
            })
            .catch(error => console.error('Error loading provinces:', error));
    }

    function loadDistricts(provinceID) {
        fetch(baseURL+`/shiip/public-api/master-data/district`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Token': apiToken
            },
            body: JSON.stringify({ province_id: parseInt(provinceID, 10) })
        })
            .then(response => {
                if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
                return response.json();
            })
            .then(data => {
                const districtSelect = document.getElementById('district');
                districtSelect.innerHTML = '<option value="">Chọn Quận/Huyện</option>';
                data.data.forEach(district => {
                    const option = document.createElement('option');
                    option.value = district.DistrictID;
                    option.textContent = district.DistrictName;
                    document.getElementById('district1').value=district.DistrictName
                    districtSelect.appendChild(option);
                    console.log(district.DistrictID+' ' + district.DistrictName)
                });
                districtSelect.disabled = false;
            })
            .catch(error => console.error('Error loading districts:', error));
    }

    function loadWards(districtID) {
        fetch(baseURL+`/shiip/public-api/master-data/ward`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Token': apiToken
            },
            body: JSON.stringify({ district_id: parseInt(districtID, 10) })
        })
            .then(response => {
                if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
                return response.json();
            })
            .then(data => {
                const wardSelect = document.getElementById('ward');
                wardSelect.innerHTML = '<option value="">Chọn Phường/Xã</option>';
                data.data.forEach(ward => {
                    const option = document.createElement('option');
                    option.value = ward.WardCode;
                    option.textContent = ward.WardName;
                    document.getElementById('ward1').value=ward.WardName
                    wardSelect.appendChild(option);
                    console.log(ward.WardCode+' '+ward.WardName)
                });
                wardSelect.disabled = false;

            })
            .catch(error => console.error('Error loading wards:', error));
    }
    function getShippingFee() {
        const toDistrictID = document.getElementById('district').value;
        const toWardID = document.getElementById('ward').value;
        const weight = 100;

        if (!toDistrictID || !toWardID || !weight) {
            alert('Vui lòng nhập đầy đủ thông tin!');
            return;
        }

        fetch(baseURL+`/shiip/public-api/v2/shipping-order/fee`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Token': apiToken
            },
            body: JSON.stringify({
                from_district_id: 3695,
                from_ward_code: "90735",
                to_district_id: parseInt(toDistrictID, 10),
                to_ward_code: toWardID,
                weight: parseInt(weight, 10),
                service_type_id: 2,
                shop_id: 2509459
            })
        })
            .then(response => {
                if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
                return response.json();
            })
            .then(data => {
                updateFeeInCart(data.data.total);
            })
            .catch(error => {
                console.error('Error fetching shipping fee:', error);
            });
    }

    document.getElementById('province').addEventListener('change', function () {
        const provinceSelect = document.getElementById('province');
        const districtSelect = document.getElementById('district');
        const wardSelect = document.getElementById('ward');

        if(this.value == ''){

            districtSelect.innerHTML = '<option value="">Chọn Quận/Huyện</option>';
            districtSelect.disabled = true;

            wardSelect.innerHTML = '<option value="">Chọn Phường/Xã</option>';
            wardSelect.disabled = true;

        }else{
            loadDistricts(this.value);
        }
    });

    document.getElementById('district').addEventListener('change', function () {

        loadWards(this.value);

    });

    document.getElementById('ward').addEventListener('change', function () {
        getShippingFee();

    });
    loadProvinces();

    function updateFeeInCart(fee){


        fetch('/UpdateController', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ fee: fee })
        })
            .then(response => {
                if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
                return response.json();
            })
            .then (data =>{
                if(data.success){
                    $('#feeValue').text(fee.toLocaleString()+" đ")  ;
                    $('#totalPrice').text(data.totalPrice.toLocaleString())
                    $('#finalTotal1').val(data.totalPrice)
                }

            })
            .catch(error => {
                console.error('Error updating session fee:', error);
            });
    }
</script>





</body>
</html>

