default_show = 3;

const newest_product = "nw_product";

function load_newest_product() {
    $.ajax({
        url: '/get-index',  // Địa chỉ API
        type: 'POST',
        data: {
            defaultshow: default_show,
            func_product: newest_product
        },
        success: function (data) {
            $("#course_list").empty();
            if (data.success) {
                let content = "";
                data.products.forEach(function (product) {
                    content += "<div class=\"course-item cc\">\n" +
                        "    <a href=\"/pdetail?pid=" + product.id + "\">\n" +
                        "        <img src=\"" + product.imgThumbnail + "\"\n" +
                        "             alt=\"" + product.name + "\"\n" +
                        "             class=\"thumb\" />\n" +
                        "    </a>\n" +
                        "    <div class=\"info\">\n" +
                        "        <div class=\"head\">\n" +
                        "            <div class=\"title\">\n" +
                        "                <a href=\"/pdetail?pid=" + product.id + "\" class=\"line-clamp break-all\">\n" +
                        "                    " + product.name + "\n" +
                        "                </a>\n" +
                        "            </div>\n" +
                        "            <div class=\"rating\">\n" +
                        "                <img src=\"/assets/img/star.svg\"\n" +
                        "                     alt=\"Star\"\n" +
                        "                     class=\"star\" />\n" +
                        "                <span class=\"value\">" + product.rating + "</span>\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "        <div class=\"foot\">\n" +
                        "            <span class=\"price\">" + product.pricePerBox + "₫</span>\n" +
                        "            <form action=\"/add-to-cart\" method=\"post\" class=\"add-to-cart-form\">\n" +
                        "                <input type=\"hidden\" name=\"productId\" value=\"" + product.id + "\">\n" +
                        "                <input type=\"hidden\" name=\"colorId\" value=\"1\">\n" +
                        "                <input type=\"hidden\" name=\"quantity\" value=\"1\">\n" +
                        "                <a href=\"javascript:void(0)\" onclick=\"this.closest('form').submit();\">\n" +
                        "                    <svg\n" +
                        "                        class=\"icon\"\n" +
                        "                        width=\"30\"\n" +
                        "                        height=\"30\"\n" +
                        "                        viewBox=\"0 0 24 24\"\n" +
                        "                        fill=\"none\"\n" +
                        "                        xmlns=\"http://www.w3.org/2000/svg\"\n" +
                        "                    >\n" +
                        "                        <path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z\" fill=\"#2e2100ff\"/>\n" +
                        "                        <path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z\" fill=\"#2e2100ff\"/>\n" +
                        "                        <path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z\" fill=\"#2e2100ff\"/>\n" +
                        "                    </svg>\n" +
                        "                </a>\n" +
                        "            </form>\n" +
                        "            <a href=\"/pdetail?pid=" + product.id + "\">\n" +
                        "                <button class=\"btn book-btn\">Đặt ngay</button>\n" +
                        "            </a>\n" +
                        "        </div>\n" +
                        "    </div>\n" +
                        "</div>";
                });
                $("#course_list").append(content);
            }
        }
,
        error: function () {
            alert('Không thể tải danh sách sản phẩm.');
        }
    });
}

// load_newest_product();