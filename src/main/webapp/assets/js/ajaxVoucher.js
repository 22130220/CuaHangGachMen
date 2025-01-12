var notyf = new Notyf();
let rootPrice = $("#totalPrice").text().replace(/\./g, "");
$("#btn_usage").on('click', function () {
    const code = $("#discount").val();
    $.ajax({
        url: '/user/voucher',
        type: 'GET',
        data: {
            code: code
        },
        success: function (response) {
            if(response.status) {
                notyf.error("Voucher đã được áp dụng");

            }else {
                notyf.success("Voucher được áp dụng");
                if(response.discount !== null) {
                    $("#dis_val").text("Giảm giá: " + response.discount+"₫");
                    const f1 = parseFloat(rootPrice);
                    const f2 = parseFloat(response.discount);
                    let f3 = f1 - f2;
                    if(f3 < 0) f3 = 0;
                    $("#totalPrice").text(f3);
                    // Lưu voucherID và cập nhật tổng cộng
                    $("#voucherID").val(response.voucherID);
                    $("#finalTotal").val(f3);
                }
            }
        },
        error: function () {
            //console.log("loi");
        },
    })
})