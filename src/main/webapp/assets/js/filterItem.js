let currentPage = 1;
const pageSize = 20;

function loadProducts() {
    // Lấy giá trị các checkbox đã chọn
    const priceRanges = [];
    const sizes = [];
    const origins = [];
    const category = [];
    const material = [];
    let sortItem = $("#sort").val();

    $("input[name='priceRange']:checked").each(function() {
        priceRanges.push($(this).val());
    });

    $("input[name='size']:checked").each(function() {
        sizes.push($(this).val());
    });

    $("input[name='nsx']:checked").each(function() {
        origins.push($(this).val());
    });

    $("input[name='material']:checked").each(function() {
        material.push($(this).val());
    });

    $("input[name='category']:checked").each(function() {
        category.push($(this).val());
    });

    const priceRangesJson = JSON.stringify(priceRanges);
    const sizesRangesJson = JSON.stringify(sizes);
    const categoryJson = JSON.stringify(category);
    const materialJson = JSON.stringify(material);
    const nsxJson = JSON.stringify(origins);


    $.ajax({
        url: '/list-product/filter',
        type: 'GET',
        data: {
            price: priceRangesJson,
            size: sizesRangesJson,
            nsx: nsxJson,
            category: categoryJson,
            material: materialJson,
            page: currentPage,
            pageSize: pageSize,
            sort: sortItem
        },
        success: function(data) {
            $("#product_list").empty();
            var selectedValue = $('input[type="radio"][name="layout"]:checked').attr('id');
            console.log("Radio button được chọn ban đầu: " + selectedValue);

            let htmlContent = '';

            if (selectedValue === "grid") {
                $("#product_list").removeClass("product-list-detail");
                $("#product_list").addClass("product-list");
                data.products.forEach(function(item) {
                    htmlContent += "<div class=\"product-card\">\n" +
                        "   <a href=\"pdetail?pid=" + item.id + "\" class=\"product-card-link\">\n" +
                        "       <div class=\"card-img\">\n" +
                        "           <img src=\"" + item.imgThumbnail + "\" alt=\"\">\n" +
                        "       </div>\n" +
                        "       <div class=\"card-title\">\n" +
                        "           <span>" + item.name + "</span>\n" +
                        "       </div>\n" +
                        "       <div class=\"card-price\">" + item.pricePerBox.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' }) + "/hộp</div>\n" +
                        "   </a>\n" +
                        "   <div class=\"button-gr\">\n" +
                        "       <button class=\"add-cart-button btn-left\">\n" +
                        "           <a href=\"pdetail?pid=" + item.id + "\">Xem chi tiết</a>\n" +
                        "       </button>\n" +
                        "       <form action=\"/add-to-cart\" method=\"post\" class=\"add-to-cart-form\">\n" +
                        "           <input type=\"hidden\" name=\"productId\" value=\"" + item.id + "\">\n" +
                        "           <input type=\"hidden\" name=\"colorId\" value=\"1\">\n" +
                        "           <input type=\"hidden\" name=\"quantity\" value=\"1\">\n" +
                        "           <button type=\"button\" class=\"buy-now btn-right add-to-cart-btn\">\n" +
                        "               <i class=\"fa-solid fa-plus fa-lg\"></i>\n" +
                        "           </button>\n" +
                        "       </form>\n" +
                        "   </div>\n" +
                        "</div>";
                });
            } else if (selectedValue === "detail") {
                $("#product_list").removeClass("product-list");
                $("#product_list").addClass("product-list-detail");
                data.products.forEach(function(item) {
                    const numStar = "⭐".repeat(item.rating);
                    htmlContent += "<div class=\"product-card-detail\">\n" +
                        "   <a href=\"pdetail?pid=" + item.id + "\" class=\"product-card-link-detail\">\n" +
                        "       <div class=\"card-img-detail\">\n" +
                        "           <img src=\"" + item.imgThumbnail + "\" alt=\"\">\n" +
                        "       </div>\n" +
                        "       <div class=\"info-tag\">\n" +
                        "           <div class=\"card-title-detail\">\n" +
                        "               <span>" + item.name + "</span>\n" +
                        "           </div>\n" +
                        "           <div class=\"card-rating-detail\">" + numStar + "</div>\n" +
                        "           <div class=\"card-price-detail\">" + item.pricePerBox.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' }) + "/hộp</div>\n" +
                        "       </div>\n" +
                        "   </a>\n" +
                        "   <div class=\"button-gr-detail\">\n" +
                        "       <button class=\"add-cart-button btn-left\">\n" +
                        "           <a href=\"pdetail?pid=" + item.id + "\">Xem chi tiết</a>\n" +
                        "       </button>\n" +
                        "       <form action=\"/add-to-cart\" method=\"post\"" +
                        "            class=\"add-to-cart-form\">\n" +
                        "           <input type=\"hidden\" name=\"productId\"" +
                        "            value=\"" + item.id + "\">\n" +
                        "           <input type=\"hidden\" name=\"colorId\" value=\"1\">\n" +
                        "           <input type=\"hidden\" name=\"quantity\" value=\"1\">\n" +
                        "           <button type=\"button\" " +
                        "           class=\"buy-now btn-right add-to-cart-btn\">\n" +
                        "               Thêm vào giỏ\n" +
                        "           </button>\n" +
                        "       </form>\n" +
                        "   </div>\n" +
                        "</div>";
                });
            }

            $("#product_list").html(htmlContent);
            updatePagination(data.TotalPages);
        },
        error: function() {
            alert('Không thể tải danh sách sản phẩm.');
        }
    });
}

loadProducts();


function updatePagination(totalPages) {
    const paginationContainer = $("#pagination");
    paginationContainer.empty();

    if (currentPage > 1) {
        paginationContainer.append("<li class=\"pagination-item btn-prev prev-btn\">\n" +
            "                                <a href=\"#\" class=\"pagination-link\">\n" +
            "                                    <svg\n" +
            "                                            width=\"6\"\n" +
            "                                            height=\"10\"\n" +
            "                                            viewBox=\"0 0 6 10\"\n" +
            "                                            fill=\"none\"\n" +
            "                                            xmlns=\"http://www.w3.org/2000/svg\"\n" +
            "                                    >\n" +
            "                                        <path\n" +
            "                                                fill-rule=\"evenodd\"\n" +
            "                                                clip-rule=\"evenodd\"\n" +
            "                                                d=\"M5.20711 0.792893C5.59763 1.18342 5.59763 1.81658 5.20711 2.20711L2.41421 5L5.20711 7.79289C5.59763 8.18342 5.59763 8.81658 5.20711 9.20711C4.81658 9.59763 4.18342 9.59763 3.79289 9.20711L0.292893 5.70711C-0.0976311 5.31658 -0.0976311 4.68342 0.292893 4.29289L3.79289 0.792893C4.18342 0.402369 4.81658 0.402369 5.20711 0.792893Z\"\n" +
            "                                                fill=\"currentColor\"\n" +
            "                                        ></path>\n" +
            "                                    </svg>\n" +
            "                                </a>\n" +
            "                            </li>");
    }

    for (let i = 1; i <= totalPages; i++) {
        //paginationContainer.append("<button class='page' data-page='" + i + "'>" + i + "</button>");
        if(i === currentPage) {
            paginationContainer.append(" <li class=\"pagination-item\">\n" +
                "                        <a href=\"#\" class=\"pagination-link page selected\">" + i + "</a>\n" +
                "                            </li>");
        } else {
            paginationContainer.append(" <li class=\"pagination-item\">\n" +
                "                        <a href=\"#\" class=\"pagination-link page\">" + i + "</a>\n" +
                "                            </li>");
        }


    }

    if (currentPage < totalPages) {
        paginationContainer.append("<li class=\"pagination-item btn-next next-btn\">\n" +
            "                                <a href=\"#\" class=\"pagination-link\">\n" +
            "                                    <svg\n" +
            "                                            width=\"6\"\n" +
            "                                            height=\"10\"\n" +
            "                                            viewBox=\"0 0 6 10\"\n" +
            "                                            fill=\"none\"\n" +
            "                                            xmlns=\"http://www.w3.org/2000/svg\"\n" +
            "                                    >\n" +
            "                                        <path\n" +
            "                                                fill-rule=\"evenodd\"\n" +
            "                                                clip-rule=\"evenodd\"\n" +
            "                                                d=\"M0.792893 0.792893C0.402369 1.18342 0.402369 1.81658 0.792893 2.20711L3.58579 5L0.792893 7.79289C0.402369 8.18342 0.402369 8.81658 0.792893 9.20711C1.18342 9.59763 1.81658 9.59763 2.20711 9.20711L5.70711 5.70711C6.09763 5.31658 6.09763 4.68342 5.70711 4.29289L2.20711 0.792893C1.81658 0.402369 1.18342 0.402369 0.792893 0.792893Z\"\n" +
            "                                                fill=\"currentColor\"\n" +
            "                                        ></path>\n" +
            "                                    </svg>\n" +
            "                                </a>\n" +
            "                            </li>");
    }

    $(".page").on('click', function () {
        currentPage = parseInt($(this).text(), 10);
        loadProducts();
    });

    $(".next-btn").on('click', function () {
        if (currentPage < totalPages) {
            currentPage++;
            loadProducts();
        }
    });

    $(".prev-btn").on('click', function () {
        if (currentPage > 1) {
            currentPage--;
            loadProducts();
        }
    });
}

$(document).ready(function () {
    $('.filter').on('change', function () {
        currentPage = 1;
        loadProducts();
    });
});

$(document).ready(function () {
    $('#sort').on('change', function () {
        currentPage = 1;
        loadProducts();
    });
});

$(document).ready(function() {
    $('.view-type input[type="radio"]').on('change', function() {
        loadProducts();
    });
});