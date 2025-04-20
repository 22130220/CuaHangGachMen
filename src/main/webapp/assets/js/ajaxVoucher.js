function checkAddressSelection() {
    const hasProvince = $('#province').val();
    const hasDistrict = $('#district').val();
    const hasWard = $('#ward').val();
    if (!hasProvince || !hasDistrict || !hasWard) {
        $('#btn_usage').prop('disabled', true);
    } else {
        $('#btn_usage').prop('disabled', false);
        $('#tooltip_warn').hide();
    }
}

$(document).ready(function () {
    var notyf = new Notyf();

    // Gắn click SỚM và CHỈ MỘT LẦN
    $("#btn_usage").on('click', function () {
        if ($(this).prop('disabled')) return; // nếu nút đang disable thì bỏ qua
        let rootPrice = $("#totalPrice").text().replace(/\./g, "");
        let fee = parseInt($("#feeValue").text().replace(/\./g, ""));

        const code = $("#discount").val();

        $.ajax({
            url: '/user/voucher',
            type: 'GET',
            data: { code: code },
            success: function (response) {
                if (response.status) {
                    notyf.error("Voucher đã được áp dụng");
                } else {
                    notyf.success("Voucher được áp dụng");
                    if (response.discount !== null) {
                        $("#dis_val").text("Giảm giá: " + response.discount.toLocaleString('vi-VN') + "₫");
                        const f1 = parseFloat(rootPrice);
                        const f2 = parseFloat(response.discount);
                        let f5 = fee - f2;
                        if (f5 < 0) f5 = 0;
                        let f3 = f1 - f2;
                        if (f3 < 0) f3 = 0;
                        $("#totalPrice").text(f3.toLocaleString('vi-VN'));
                        $("#feeValue").text(f5.toLocaleString('vi-VN'));
                        $("#voucherID").val(response.voucherID);
                        $("#finalTotal1").val(f3);

                        // ✅ NGĂN DÙNG LẠI: disable nút
                        $("#btn_usage").prop("disabled", true);

                        // (tuỳ chọn) Đổi text nút hoặc ẩn input mã giảm giá
                        $("#discount").prop("disabled", true);
                    }
                }
            },
            error: function () {
                // notyf.error("Có lỗi xảy ra");
            },
        });
    });

    $('#province, #district, #ward').on('change', checkAddressSelection);
    checkAddressSelection(); // gọi lúc trang load

    $('#usage_wrapper').on('click', function () {
        if ($('#btn_usage').prop('disabled')) {
            $('#tooltip_warn').fadeIn();
            setTimeout(() => {
                $('#tooltip_warn').fadeOut();
            }, 2000);
        }
    });
});