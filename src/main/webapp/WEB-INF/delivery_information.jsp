
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

    <!--Micromodal.js-->
    <script src="https://cdn.jsdelivr.net/npm/micromodal/dist/micromodal.min.js"></script>
    <link rel="stylesheet" href="/assets/css/micromodal.css">


    <style>
        .discount {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            align-items: center;
            margin-top: 20px;
        }

        .voucher-label {
            display: flex;
            align-items: center;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            background-color: #f9f9f9;
            margin-bottom: 10px;
        }

        .voucher-label:hover {
            background-color: #f0f0f0;
            border-color: #999;
        }

        .voucher-checkbox {
            margin-right: 12px;
            transform: scale(1.2);
            accent-color: #4CAF50;
        }

        .voucher-content {
            display: flex;
            flex-direction: column;
        }

        .voucher-code {
            font-weight: bold;
            font-size: 16px;
            color: #333;
        }

        .voucher-discount {
            color: #888;
            font-size: 14px;
        }
        .discount button {
            padding: 8px 12px;
            font-size: 14px;
            border-radius: 6px;
            border: 1px solid #ccc;
            min-width: 200px;
            height: 40px;
        }

        .discount button {
            background-color: #4caf50;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .discount button:disabled {
            background-color: #aaa;
            cursor: not-allowed;
        }

        .btn-primary:disabled {
            background-color: #aaa;
            cursor: not-allowed;
        }

        .discount button:hover:enabled {
            background-color: #388e3c;
        }

        .modal__button {
            background-color: #4CAF50; /* xanh lá dịu */
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .modal__button:hover {
            background-color: #45a049;
            transform: translateY(-1px);
        }
    </style>
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
            <input type="hidden" id="voucherIDShip" name="voucherIDShip" value="Không có mã voucher">
            <input type="hidden" id="voucherIDOther" name="voucherIDOther" value="Không có mã voucher">
            <input type="hidden" id="finalTotal1" name="finalTotal" value="">



            <button type="submit" class="btn-primary" id="btn-tt">Tiếp tục đến phương thức thanh toán</button>


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
<%--            &lt;%&ndash;            <input type="text" id="discount" placeholder="Nhập mã giảm giá">&ndash;%&gt;--%>
<%--            <!-- Select: Giảm giá đơn hàng -->--%>
<%--            <select id="voucherOrder">--%>
<%--                <option value="">-- Giảm giá đơn hàng --</option>--%>
<%--                <c:forEach var="voucher" items="${orderVouchers}">--%>
<%--                    <option value="${voucher.id}">${voucher.code}-${voucher.discountValue}</option>--%>
<%--                </c:forEach>--%>
<%--            </select>--%>

<%--            <!-- Select: Giảm giá phí vận chuyển -->--%>
<%--            <select id="voucherShipping">--%>
<%--                <option value="">-- Giảm giá phí vận chuyển --</option>--%>
<%--                <c:forEach var="voucher" items="${shippingVouchers}">--%>
<%--                    <option value="${voucher.id}">${voucher.code}-${voucher.discountValue}</option>--%>
<%--                </c:forEach>--%>
<%--            </select>--%>

            <%--            <input type="text" id="discount" placeholder="Nhập mã giảm giá">--%>
            <button class="btn-secondary" id="btn_usage2" disabled>Sử dụng voucher </button>
        </div>
        <hr>
        <div class="price-summary">
            <p>Tạm tính:
               <span id="phiDonHangBd"><fmt:formatNumber value="${cart.total}" type="number" maxFractionDigits="0"/></span> ₫
            </p>
            <p >Phí vận chuyển:
               <span id="feeValue"><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></span> ₫
            </p>
            <p id="dis_val"></p>
            <p id="dis_val1"></p>
            <p id="dis_val2"></p>
            <hr>
            <h3>Tổng cộng:
                <span id="totalPrice"><fmt:formatNumber value="${cart.total}" type="number" maxFractionDigits="0"/></span>₫
            </h3>
        </div>
    </aside>
</div>
<div class="modal micromodal-slide" id="VoucherModal" aria-hidden="true">
    <div class="modal__overlay" tabindex="-1" data-micromodal-close>
        <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
            <header class="modal__header">
                <h2 class="modal__title">Voucher</h2>
                <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
            </header>
            <div class="modal__field">
                <strong>Chọn thẻ giảm giá:</strong>
                <div id="voucherList">
                    <c:forEach var="voucher" items="${Vouchers}">
                        <label class="voucher-label">
                            <input type="checkbox"
                                   name="vouchers"
                                   value="${voucher.id}"
                                   data-type="${voucher.voucherType}"
                                   class="voucher-checkbox" />
                            <div class="voucher-content">
                                <span class="voucher-code">${voucher.code}</span>
                                <span class="voucher-discount">
                    Giảm <fmt:formatNumber value="${voucher.discountValue}" type="number" groupingUsed="true"/>đ
                </span>
                            </div>
                        </label>
                    </c:forEach>
                </div>
            </div>
            <div class="modal__actions">
                <button type="button" class="modal__button" id="btn_usage">Xác nhận</button>
            </div>
        </div>
    </div>
</div>




<script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>


<script>
    const apiToken = 'db44e853-cc14-11ef-b1ed-769685acafa5';
    const baseURL = 'https://dev-online-gateway.ghn.vn';
    checkFirst =true;
    const selectedVouchers = {};
    let originalTotalPrice = 0;
    let feeVanChuyen =0;
    let feeDonHang=document.getElementById('phiDonHangBd').textContent.trim();
    let feeNumber = parseInt(feeDonHang.replace(/\./g, ''));

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
                    $('#feeValue').text(fee.toLocaleString('vi-VN'))  ;
                    $('#totalPrice').text(data.totalPrice.toLocaleString())
                    $('#finalTotal1').val(data.totalPrice)
                    originalTotalPrice = data.totalPrice;
                    feeVanChuyen= fee;
                }

            })
            .catch(error => {
                console.error('Error updating session fee:', error);
            });
    }


    function checkAddressSelection() {
        const hasProvince = $('#province').val();
        const hasDistrict = $('#district').val();
        const hasWard = $('#ward').val();
        if (!hasProvince || !hasDistrict || !hasWard) {
            $('#btn_usage2').prop('disabled', true);
            $('#btn-tt').prop('disabled', true)
        } else {
            $('#btn_usage2').prop('disabled', false);
            $('#tooltip_warn').hide();
            $('#btn-tt').prop('disabled', false)
        }
    }
    document.getElementById("btn_usage2").addEventListener("click", function () {
        MicroModal.show('VoucherModal');
    });


    document.addEventListener('DOMContentLoaded', function () {
        const checkboxes = document.querySelectorAll('.voucher-checkbox');
        // const selectedVouchers = {}; // { order: 2, shipping: 5 }

        checkboxes.forEach(cb => {
            cb.addEventListener('change', function () {
                const type = cb.dataset.type;
                const id = cb.value;

                if (cb.checked) {
                    // Nếu đã có voucher loại này → bỏ check cái cũ đi
                    checkboxes.forEach(other => {
                        if (other !== cb && other.dataset.type === type) {
                            other.checked = false;
                        }
                    });
                    // Ghi nhận vào mảng
                    selectedVouchers[type] = id;
                } else {
                    // Nếu bỏ tích → xóa khỏi mảng
                    delete selectedVouchers[type];
                }

                console.log("Selected:", selectedVouchers);
            });
        });
    });




    $(document).ready(function () {
        const notyf = new Notyf();
        // ✅ Gắn đúng chỗ - DUY NHẤT MỘT LẦN
        $("#btn_usage").on('click', function () {
            if ($(this).prop('disabled')) return;
            const selectedIds = Object.values(selectedVouchers);
            console.log(selectedIds)
            $.ajax({
                url: '/user/voucher',
                type: 'GET',
                traditional: true,
                data: {
                    ids:selectedIds,
                    price:originalTotalPrice,
                    feevn:feeVanChuyen,
                    feedh:feeNumber,
                },
                success: function (response) {
                    if (response.status) {
                        MicroModal.close('VoucherModal');
                        notyf.success("Voucher được áp dụng");
                        if (response.discount !== null) {
                            $("#dis_val").text("Giảm giá order: " + response.discount.toLocaleString('vi-VN') + "₫");
                            $("#dis_val1").text("Giảm giá ship: " + response.discountShip.toLocaleString('vi-VN') + "₫");
                            $("#dis_val2").text("Giảm giá khác: " + response.discountOther.toLocaleString('vi-VN') + "₫");
                            $("#totalPrice").text(response.price.toLocaleString('vi-VN'));
                            $("#voucherID").val(response.voucherID > 0 ? response.voucherID : "Không áp dụng mã giảm order");
                            $("#voucherIDShip").val(response.voucherIDShip > 0 ? response.voucherIDShip : "Không áp dụng mã giảm giá ship");
                            $("#voucherIDOther").val(response.voucherIDOther >0 ? 'Giảm giá khác' : 'Không áp dụng mã giảm giá');
                            $("#finalTotal1").val(response.price);

                        }
                    } else {
                        notyf.error("bị lỗi");
                    }
                }
            });
        });

        // Địa chỉ thay đổi thì kiểm tra lại
        $('#province, #district, #ward').on('change', checkAddressSelection);
        checkAddressSelection(); // kiểm tra lần đầu

        // Tooltip nếu chưa chọn địa chỉ
        $('#usage_wrapper').on('click', function () {
            if ($('#btn_usage').prop('disabled')) {
                $('#tooltip_warn').fadeIn();
                setTimeout(() => $('#tooltip_warn').fadeOut(), 2000);
            }
        });
    });
</script>


<%--<script src="/assets/js/ajaxVoucher.js"></script>--%>


</body>
</html>

