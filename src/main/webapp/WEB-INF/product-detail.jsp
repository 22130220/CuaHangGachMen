<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Gạch 80X80 Catalan 80112</title>

    <!-- Reset CSS -->
    <link rel="stylesheet" href="/assets/css/reset.css" />

    <!-- Thêm favicon -->
    <link
            rel="icon"
            type="image/x-icon"
            href="/assets/icons/logo2_no_text.svg"
    />

    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />

    <!-- Font Awesome-->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
            integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">

    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js"
            integrity="sha512-6sSYJqDreZRZGkJ3b+YfdhB3MzmuP9R7X1QZ6g5aIXhRvR1Y/N/P47jmnkENm7YL3oqsmI6AK+V6AD99uWDnIw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    ></script>


        <style>
        #review-content {
            display: none;
        }
    </style>

    <link rel="stylesheet" href="/assets/css/style.css" />
    <link rel="stylesheet" href="/assets/css/banner.css" />
    <link rel="stylesheet" href="/assets/css/danhmucgachmen.css" />
    <link rel="stylesheet" href="/assets/css/popular.css" />
    <link rel="stylesheet" href="/assets/css/cacthanhphancodinh.css" />
    <link rel="stylesheet" href="/assets/css/dropdown_user_menu.css">
    <link rel="stylesheet" href="/assets/css/product-detail.css">
    <link rel="stylesheet" href="/assets/css/breadcrumb.css">
    <link rel="stylesheet" href="/assets/css/product-card.css">
    <link rel="stylesheet" href="/assets/css/bt_hover.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="/assets/css/search.css"/>
</head>
<body>
<div id="menuContainer">
    <jsp:include page="../view_shared/header_footer/header.jsp"/>
</div>


<input type="hidden" value="${p.id}" id="pid">

        <div class="main-content">
            <div class="fui-basic-breadcrumb breadcrumb-style">
                <ul class="breadcrumb-list">
                    <li class="breadcrumb-item">
                        <a href="/" class="breadcrumb-link">
                            Trang chủ
                        </a>
                    </li>
                    <li class="breadcrumb-item">
                        <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="24"
                                height="24"
                                fill="none"
                                viewBox="0 0 24 24"
                        >
                            <path
                                    fill="currentColor"
                                    fill-rule="evenodd"
                                    d="M9.793 7.793a1 1 0 000 1.414L12.586 12l-2.793 2.793a1 1 0 101.414 1.414l3.5-3.5a1 1 0 000-1.414l-3.5-3.5a1 1 0 00-1.414 0z"
                                    clip-rule="evenodd"
                            ></path>
                        </svg>
                        <a href="list-product" class="breadcrumb-link">Danh mục</a>
                    </li>
                    <li class="breadcrumb-item">
                        <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="24"
                                height="24"
                                fill="none"
                                viewBox="0 0 24 24"
                        >
                            <path
                                    fill="currentColor"
                                    fill-rule="evenodd"
                                    d="M9.793 7.793a1 1 0 000 1.414L12.586 12l-2.793 2.793a1 1 0 101.414 1.414l3.5-3.5a1 1 0 000-1.414l-3.5-3.5a1 1 0 00-1.414 0z"
                                    clip-rule="evenodd"
                            ></path>
                        </svg>
                        <a href="list-product?danhmuc=${p.category.id}" class="breadcrumb-link"><c:out value="${p.category.name}"/> </a>
                    </li>
                    <li class="breadcrumb-item">
                        <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="24"
                                height="24"
                                fill="none"
                                viewBox="0 0 24 24"
                        >
                            <path
                                    fill="currentColor"
                                    fill-rule="evenodd"
                                    d="M9.793 7.793a1 1 0 000 1.414L12.586 12l-2.793 2.793a1 1 0 101.414 1.414l3.5-3.5a1 1 0 000-1.414l-3.5-3.5a1 1 0 00-1.414 0z"
                                    clip-rule="evenodd"
                            ></path>
                        </svg>
                        <a href="#" class="breadcrumb-link"><c:out value="${p.name}"/></a>
                    </li>
                </ul>
            </div>
            <div class="product-details-grid">

                <div class="product-img img-grid">
                    <div class="column">

                        <div id="slide-wrapper">
                            <div id="slider">
                                <c:forEach items="${p.imgList}" var="lsImg">
                                    <img class="thumbnail active" src="${lsImg}">
                                </c:forEach>
<%--                                <img class="thumbnail active" src="/assets/img/gt04.webp">--%>
<%--                                <img class="thumbnail" src="/assets/img/loaigach1.jpg">--%>
<%--                                <img class="thumbnail" src="/assets/img/gachlatsanphobien3.jpg">--%>
<%--                                <img class="thumbnail" src="/assets/img/gachoptuongphobien2.jpg">--%>
<%--                                <img class="thumbnail" src="/assets/img/gachlatsanphobien3.jpg">--%>
                            </div>
                        </div>
                        <img id=featured src="${p.imgList.isEmpty() ? " " : p.imgList.get(0)}">
                    </div>
                </div>
                <div class="sumarize-info sumarize-grid">
                    <div class="product-info">
                        <p class="product-title">
                            <c:out value="${p.name}"/>
                        </p>
                        <div class="product-data-info">
                            <p class="product-id product-text">${p.rating}⭐</p>
                            <p class="product-des product-text">Mỗi hộp bao gồm <c:out value="${p.quantityPerBox}"/> thẻ</p>
                        </div>

                    </div>

                    <div class="product-price">
                        <p class="per-box">
                            <f:formatNumber value="${p.pricePerBox}" type="number" maxFractionDigits="0"/>₫/1 hộp
                        </p>
                        <p class="per-feat">
                            <f:formatNumber value="${p.pricePerBox / p.quantityPerBox}" type="number" maxFractionDigits="0"/>₫/1 thẻ


                        </p>
                    </div>

<%--                    <div class="producttype">--%>
<%--                        <p class="color">Màu sắc</p>--%>
<%--                        <div class="card-color-container">--%>
<%--                            <c:forEach items="${p.lsColor}" var="items" >--%>
<%--                                <a href="pdetail?pid=${p.id}&color=${items.ID}" class="color-active">--%>
<%--                            <div class="card-color ">--%>
<%--                                <img src="${items.url}" alt="" class="img-color">--%>
<%--                                <div class="color-name">${items.name}</div>--%>
<%--                            </div>--%>
<%--                                </a>--%>
<%--                            </c:forEach>--%>

<%--                        </div>--%>

<%--                    </div>--%>
                    <div class="producttype">
                        <p class="color">Màu sắc</p>
                        <div class="card-color-container" id="color-container">
                            <c:forEach items="${p.lsColor}" var="items">
                                <a href="javascript:void(0);" class="color-item color-active" data-pid="${p.id}" data-color="${items.ID}" data-url="${items.url}" data-name="${items.name}">
                                    <div class="card-color">
                                        <img src="${items.url}" alt="" class="img-color">
                                        <div class="color-name">${items.name}</div>
                                    </div>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="cart" id="cart1">
                        <div class="cart-label">
                            <!-- Form submit đến /add-to-cart -->
                            <form id="addToCartForm" action="${pageContext.request.contextPath}/add-to-cart" method="post">
                                <!-- productId -->
                                <input type="hidden" name="productId" value="${p.id}">

                                <input type="hidden" name="colorId" id="colorIdInput" value="${param.color}">

                                <!-- Số lượng -->
                                <div class="card-labelis">
                                    <div class="box-quantity input-sample border-type">
                                        <label for="quantity">Số lượng</label>
                                        <span class="seperate">|</span>
                                        <input type="number" name="quantity" class="quantity" value="1" min="1" id="quantity">
                                    </div>

                                    <div class="add-cart">
                                        <button type="submit" class="input-sample add-cart-btn" name="action" value="addToCart">Thêm vào giỏ</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <form action="/buynow" method="get" id="formbt">
                            <input type="hidden" name="pid" value="${p.id}">
                            <input type="hidden" name="colorId" id="colorIdInput1" value="1">
                            <input type="hidden" name="quantity" id="quantityInput" value="1">
                            <div class="container-button" onclick="document.getElementById('formbt').submit()">
                                <div class="hover bt-1"></div>
                                <div class="hover bt-2"></div>
                                <div class="hover bt-3"></div>
                                <div class="hover bt-4"></div>
                                <div class="hover bt-5"></div>
                                <div class="hover bt-6"></div>
                                <div class="btn-custom"></div>
                            </div>
<%--                          <button type="submit" class="input-sample buy-btn">Mua ngay</button>--%>
                        </form>
                    </div>

                </div>
                <div class="product-info-grid">
                    <div class="des-title">Thông tin sản phẩm</div>
                    <div class="product-contain">
                        <div class="product-info-list">
                            <ul id="all-func">
                                <li class="desciption func-item" id="des" onclick="activateDesInfo(this)">Mô tả</li>
                                <li class="spec func-item" id="spec" onclick="activateDesInfo(this)">Thông số</li>
                                <li class="spec func-item" id="review" onclick="activateDesInfo(this)">Bình luận</li>
                            </ul>
                        </div>
                        <div class="product-content" id="product-content">
                            <div class="content-detail des-content" id="des-content">
                                <jsp:include page="/${p.description}"/>
<%--                            <c:set var="desUrl" value="${p.description}" />--%>
<%--                            <c:choose>--%>
<%--                                <c:when test="${fn:endsWith(desUrl, '.jsp')}">--%>
<%--                                    <jsp:include page="/${desUrl}" />--%>
<%--                                </c:when>--%>
<%--                                <c:otherwise>--%>
<%--                                    ${desUrl}--%>
<%--                                </c:otherwise>--%>
<%--                            </c:choose>--%>
                            </div>
                            <div class="content-detail spec-content" id="spec-content">
                                <div class="spec-label">

                                    <div class="spec-grid">
                                        <c:forEach items="${p.specs}" var="map" >
                                            <div class="spec-item">
                                                <p class="main-spec-title"><c:out value="${map.key}"/></p>
                                                <p class="main-spec-info"><c:out value="${map.value}"/></p>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="content-detail review-content" id="review-content">
                                <div class="comment-section">
                                    <div class="comments" id="comment">
<%--                                        <c:forEach items="${p.lsReview}" var="re">--%>
<%--                                            <div class="comment">--%>
<%--                                                <img src="${re.avatar}" alt="Avatar" class="avatar">--%>
<%--                                                <div class="comment-content">--%>
<%--                                                    <p class="username">${re.userName}</p>--%>
<%--                                                    <p class="content">${re.reviewText}</p>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </c:forEach>--%>
                                    </div>

                                    <div class="comment-form">
                                        <textarea id="comment-input" name="comment_text" placeholder="Viết bình luận của bạn..." required></textarea>
                                        <ul>
                                            <li>Đánh giá</li>
                                            <li><input type="radio" name="rating" value="1">  ⭐</li>
                                            <li><input type="radio" name="rating" value="2">  ⭐ ⭐</li>
                                            <li><input type="radio" name="rating" value="3">  ⭐ ⭐ ⭐</li>
                                            <li><input type="radio" name="rating" value="4">  ⭐ ⭐ ⭐ ⭐</li>
                                            <li><input type="radio" name="rating" value="5">  ⭐ ⭐ ⭐ ⭐ ⭐</li>
                                        </ul>
                                        <button class="button-review" onclick="addReview()">Gửi</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                </div>


                <div class="like like-grid">
                    <div class="like-title">Có thể bạn cũng thích</div>
                    <div class="like-slider" id="like-slider">
                        <c:forEach items="${relatedProducts}" var="related">
                            <div class="like-item">
                                <a href="pdetail?pid=${related.id}" class="product-card">
                                    <div class="card-img">
                                        <img src="${related.imgThumbnail}" alt="${related.name}">
                                    </div>
                                    <div class="card-title">${related.name}</div>
                                    <div class="card-price">${related.pricePerBox}đ/1 hộp</div>
                                    <form action="pdetail" method="GET">
                                        <input type="hidden" name="pid" value="${related.id}">
                                        <button type="submit" class="add-cart-button">Xem chi tiết</button>
                                    </form>
                                </a>
                            </div>
                        </c:forEach>
                    </div>

                    <button class="like-slider-prev like-slider-btn" onclick="scrollToItemNextSmooth(1)">
                        <img src="/assets/img/arrow-left.png" alt="">
                    </button>
                    <button class="like-slider-next like-slider-btn" onclick="scrollToItemPrevSmooth(1)">
                        <img src="/assets/img/arrow-right.png" alt="">
                    </button>
                </div>





            </div>

        </div>
    </div>

<jsp:include page="../view_shared/header_footer/footer.jsp"/>
<script>
    // Lắng nghe sự kiện 'input' trên thẻ có id 'quantity'
    document.getElementById('quantity').addEventListener('input', function() {
        // Cập nhật giá trị của thẻ 'quantityInput' với giá trị mới của 'quantity'
        document.getElementById('quantityInput').value = this.value;
    });
</script>

<script>
    $(document).ready(function() {

        $(".color-item").click(function(e) {
            e.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>

            var productId = $(this).data('pid'); // Lấy ID sản phẩm
            var colorId = $(this).data('color'); // Lấy ID màu sắc được chọn
            const url = new URL('/pdetail', window.location.origin);
            // Chuyển dữ liệu thành form data
            const params = new URLSearchParams();
            params.append('pid', productId);
            params.append('color', colorId);
            fetch(url, {
                method: 'POST', // Thay đổi phương thức thành POST
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded' // Đảm bảo đúng định dạng
                },
                body: params.toString() // Chuyển tham số thành query string và gửi trong body của POST request
            })
                .then(response => response.json())
                .then(data => {
                    console.log([data])
                    // Cập nhật giá trị colorId vào input
                    $('#colorIdInput').val(colorId);
                    $('#colorIdInput1').val(colorId);
                    $('#slider').empty();
                   var check=true;
                    var content = '';
                    data.listImg.forEach(function (item) {
                        if(check){
                            document.getElementById('featured').src = item;
                            check=false;
                        }
                        content += '<img class="thumbnail active" src="' + item + '">';

                    });

                    $('#slider').html(content);
                });
        });

});
</script>

<script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
<script src="../assets/js/search.js"></script>
<script>
    $(document).ready(function() {
        // Lắng nghe sự kiện submit của form
        $('#addToCartForm').submit(function(e) {
            e.preventDefault(); // Ngăn chặn hành động mặc định (submit form)

            // Lấy dữ liệu từ form
            var formData = $(this).serialize();

            // Gửi yêu cầu AJAX
            $.ajax({
                url: $(this).attr('action'), // Lấy URL từ thuộc tính action của form
                type: 'POST',
                data: formData,
                success: function(response) {
                    $('#menuContainer').load('/view_shared/header_footer/header.jsp', function() {
                        // Tùy chọn: Hiển thị thông báo thành công
                    });


                    const notyf= new Notyf()
                    notyf.open({
                        duration:1000,
                        position:{
                            x: 'right',
                            y: 'bottom',
                        },
                        type: "success",
                        message : "Thêm vào giỏ hàng thành công",
                    });


                },
                error: function(xhr, status, error) {
                    // Xử lý lỗi khi gửi yêu cầu
                    console.log('Đã xảy ra lỗi: ' + error);
                    alert('Có lỗi xảy ra, vui lòng thử lại!');
                }
            });
        });
    });
</script>







<script src="/assets/js/comment_ajax.js"></script>

    <script type="text/javascript">
        let thumbnails = document.getElementsByClassName('thumbnail')

        let activeImages = document.getElementsByClassName('active')

        for (var i=0; i < thumbnails.length; i++){

            thumbnails[i].addEventListener('mouseover', function(){
                console.log(activeImages)

                if (activeImages.length > 0){
                    activeImages[0].classList.remove('active')
                }


                this.classList.add('active')
                document.getElementById('featured').src = this.src
            })
        }


    </script>
        <script src="/assets/js/activateDesInfo.js"></script>
        <script>
            function scrollToItemNextSmooth(index) {
                const items = document.querySelectorAll('.like-slider > div');
                if (items[index]) {
                    const targetPosition = items[index].offsetLeft;
                    document.getElementById('like-slider').scrollLeft -= targetPosition;
                }
            }

            function scrollToItemPrevSmooth(index) {
                const items = document.querySelectorAll('.like-slider > div');
                if (items[index]) {
                    const targetPosition = items[index].offsetLeft;
                    document.getElementById('like-slider').scrollLeft += targetPosition;
                }
            }
        </script>

<script>
    function activateDesInfo(button) {
        const des = button.id;
        const elements = document.getElementById('product-content').children;

        Array.from(elements).forEach(element => {
            const id = element.id.split('-');
            if (id[0] === des) {
                element.style.display = 'flex';
                document.getElementById(id[0]).style.borderBottom = '1px solid #000';
                if (des === "review") {
                    const value = $("#pid").val();
                    getComment(value); // Tải bình luận nếu cần
                }
            } else {
                element.style.display = 'none';
                document.getElementById(id[0]).style.borderBottom = 'none';
            }
        });
    }

</script>
<script src="/assets/js/scrollTop.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        const colorBoxes = document.querySelectorAll('.card-color');

        colorBoxes.forEach(box => {
            // Xử lý sự kiện click
            box.addEventListener('click', function () {
                // Loại bỏ trạng thái "color-active" của tất cả các ô màu
                colorBoxes.forEach(box => {
                    box.classList.remove('color-active');
                    box.style.backgroundColor = ''; // Reset màu nền về mặc định
                });

                // Thêm trạng thái "color-active" cho ô màu được chọn
                this.classList.add('color-active');
                this.style.backgroundColor = "#000"; // Đổi màu nền thành đỏ (ví dụ)

                // Thực hiện các hành động khác nếu cần, ví dụ: cập nhật dữ liệu
            });
        });
    });

</script>

<script>

        function checkColor() {
        const colorId = document.getElementById("colorIdInput").value;
        if (!colorId) {
        alert("Bạn vui lòng chọn màu trước khi thêm vào giỏ hàng");
        return false; // Chặn không cho submit form
    }
        return true; // Cho phép submit form
    }

</script>

<script>
    // Hàm lấy tham số từ URL
    function getParameterByName(name) {
        const url = new URL(window.location.href);
        return url.searchParams.get(name);
    }

    // Kiểm tra tham số 'tab' khi trang được tải
    document.addEventListener('DOMContentLoaded', function() {
        const tab = getParameterByName('tab');
        if (tab === 'review') {
            // Kích hoạt tab "Bình luận"
            const reviewTab = document.getElementById('review');
            if (reviewTab) {
                activateDesInfo(reviewTab); // Gọi hàm để hiển thị tab "Bình luận"

                // Cuộn đến phần bình luận
                const reviewContent = document.getElementById('review-content');
                if (reviewContent) {
                    reviewContent.scrollIntoView({ behavior: 'smooth' });
                }
            }
        }
    });
</script>
</body>
</html>