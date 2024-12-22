
    $(document).ready(function () {
    $('.filter').on('change', function () {
        // let filters = {};
        //
        // $('#filters input:checked').each(function () {
        //     let name = $(this).attr('name');
        //     let value = $(this).val();
        //
        //     if (!filters[name]) {
        //         filters[name] = [];
        //     }
        //     filters[name].push(value);
        // });

        // Lấy giá trị các checkbox đã chọn
        var priceRanges = [];
        var sizes = [];
        var origins = [];

        $("input[name='priceRange']:checked").each(function() {
            priceRanges.push($(this).val());
        });

        $("input[name='size']:checked").each(function() {
            sizes.push($(this).val());
        });

        $("input[name='nsx']:checked").each(function() {
            origins.push($(this).val());
        });

        const priceRangesJson = JSON.stringify(priceRanges);
        const sizesRangesJson = JSON.stringify(sizes);
        const nsxJson = JSON.stringify(origins);
        $.ajax({
            url: '/list-product/filter',
            type: 'GET',
            data: {
                price : priceRangesJson,
                size : sizesRangesJson,
                nsx  : nsxJson
            },
            success: function (data) {
                // Xóa toàn bộ nội dung của #product_list chỉ một lần trước khi thêm mới
                $("#product_list").empty();
                // Tạo một biến để chứa HTML cho tất cả sản phẩm
                var htmlContent = '';

                // Duyệt qua dữ liệu và xây dựng HTML cho tất cả các sản phẩm
                data.forEach(function (item) {
                    htmlContent += "<div class=\"product-card\">\n" +
                        "   <a href=\"pdetail?pid=" + item.id + "\" class=\"product-card-link\">\n" +
                        "       <div class=\"card-img\">\n" +
                        "           <img src=\"" + item.imgThumbnail + "\" alt=\"\">\n" +
                        "       </div>\n" +
                        "       <div class=\"card-title\">\n" +
                        "           <span>" + item.name + "</span>\n" +
                        "       </div>\n" +
                        "       <div class=\"card-price\">" + item.pricePerBox + " Vnđ/hộp</div>\n" +
                        "   </a>\n" +
                        "   <div class=\"button-gr\">\n" +
                        "       <button class=\"add-cart-button btn-left\">\n" +
                        "           <a href=\"pdetail?pid=" + item.id + "\">Xem chi tiết</a>\n" +
                        "       </button>\n" +
                        "       <button class=\"buy-now btn-right\">\n" +
                        "           <a href=\"giohang.html\"><i class=\"fa-solid fa-plus fa-lg\"></i></a>\n" +
                        "       </button>\n" +
                        "   </div>\n" +
                        "</div>";
                });

                // Chỉ một lần thêm HTML vào DOM
                $("#product_list").html(htmlContent);
            },
            error: function () {
                alert('Không thể tải danh sách sản phẩm.');
            }
        });

    });
});