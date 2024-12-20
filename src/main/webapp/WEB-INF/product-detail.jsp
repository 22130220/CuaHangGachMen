<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Gạch 80X80 Catalan 80112</title>

    <!-- Reset CSS -->
<%--    <link rel="stylesheet" href="./assets/css/reset.css" />--%>

    <style><%@include file="./assets/css/reset.css"%></style>

    <!-- Thêm favicon -->
    <link
            rel="icon"
            type="image/x-icon"
            href="./assets/icons/logo2_no_text.svg"
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

    <style><%@include file="./assets/css/style.css"%></style>
    <style><%@include file="./assets/css/popular.css"%></style>
    <style><%@include file="./assets/css/product-detail.css"%></style>
    <style><%@include file="./assets/css/breadcrumb.css"%></style>
    <style><%@include file="./assets/css/product-card.css"%></style>
    <style><%@include file="./assets/css/cacthanhphancodinh.css"%></style>
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="assets/css/banner.css" />
    <link rel="stylesheet" href="assets/css/danhmucgachmen.css" />
    <link rel="stylesheet" href="assets/css/popular.css" />
    <link rel="stylesheet" href="assets/css/cacthanhphancodinh.css" />
    <link rel="stylesheet" href="assets/css/dropdown_user_menu.css">
</head>
<body>
<jsp:include page="view_shared/header_footer/header.jsp"/>

        <div class="main-content">
            <div class="fui-basic-breadcrumb breadcrumb-style">
                <ul class="breadcrumb-list">
                    <li class="breadcrumb-item">
                        <a href="index.html" class="breadcrumb-link">
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
                        <a href="list_product.html" class="breadcrumb-link">Danh mục gạch men</a>
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
                        <a href="list_product.html" class="breadcrumb-link">Gạch men Catalan</a>
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
                        <a href="product-detail.html" class="breadcrumb-link">Gạch 80X80 Catalan 80112</a>
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
<%--                                <img class="thumbnail active" src="./assets/img/gt04.webp">--%>
<%--                                <img class="thumbnail" src="./assets/img/loaigach1.jpg">--%>
<%--                                <img class="thumbnail" src="./assets/img/gachlatsanphobien3.jpg">--%>
<%--                                <img class="thumbnail" src="./assets/img/gachoptuongphobien2.jpg">--%>
<%--                                <img class="thumbnail" src="./assets/img/gachlatsanphobien3.jpg">--%>
                            </div>
                        </div>
                        <img id=featured src="${p.imgList.get(0)}">
                    </div>
                </div>
                <div class="sumarize-info sumarize-grid">
                    <div class="product-info">
                        <p class="product-title">
                            <c:out value="${p.name}"/>
                        </p>
                        <div class="product-data-info">
                            <p class="product-id product-text">#484040</p>
                            <p class="product-des product-text">Mỗi hộp bao gồm 10 thẻ</p>
                        </div>

                    </div>

                    <div class="product-price">
                        <p class="per-box">
                            750.000đ/1 hộp
                        </p>
                        <p class="per-feat">
                            80.000đ/1 thẻ
                        </p>
                    </div>

                    <div class="producttype">
                        <p class="color">Màu sắc</p>
                        <div class="card-color-container">
                            <div class="card-color color-active">
                                <img src="./assets/img/loaigach4.jpg" alt="" class="img-color">
                                <div class="color-name">Xám</div>
                            </div>
                            <div class="card-color">
                                <img src="./assets/img/ceramic-india-1-1.jpg" alt="" class="img-color">
                                <div class="color-name">Trắng</div>
                            </div>
                            <div class="card-color" >
                                <img src="./assets/img/gt02.webp" alt="" class="img-color">
                                <div class="color-name">Nâu</div>
                            </div>
                        </div>
                    </div>

                    <div class="cart">
                        <div class="cart-label">
                            <div class="box-quantity input-sample border-type">
                                <label for="quantity">Số lượng</label>
                                <span class="seperate">|</span>
                                <input type="number" class="quantity " value="1" id="quantity">
                            </div>
                            <div class="add-cart">
                                <button class="input-sample add-cart-btn">Thêm vào giỏ</button>
                            </div>

                        </div>
                        <button class="input-sample buy-btn">Mua ngay</button>
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
                                <jsp:include page="${p.description}"/>

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
                                    <div class="comments">
                                        <!-- Bình luận mẫu -->
                                        <div class="comment">
                                            <img src="./assets/img/blog-1.jpg" alt="Avatar" class="avatar">
                                            <div class="comment-content">
                                                <p class="username">Teo123</p>
                                                <p class="content">Sản phẩm đẹp quá</p>
                                            </div>
                                        </div>
                                        <div class="comment">
                                            <img src="./assets/img/feedback-avatar.jpg" alt="Avatar" class="avatar">
                                            <div class="comment-content">
                                                <p class="username">k1mSaChi</p>
                                                <p class="content">Very good</p>
                                            </div>
                                        </div>
                                    </div>

                                    <form class="comment-form">
                                        <textarea id="comment-input" placeholder="Viết bình luận của bạn..." required></textarea>
                                        <button class="button-review" type="submit">Gửi</button>
                                    </form>
                                </div>
                            </div>
                        </div>


                </div>

                <div class="like like-grid">
                    <div class="like-title">Có thể bạn cũng thích</div>
                    <div class="like-slider" id="like-slider">
                        <div class="like-item">
                            <div class="product-card">
                                <div class="card-img">
                                    <img src="./assets/img/gachoptuongphobien3.jpg" alt="">
                                </div>
                                <div class="card-title"> Gạch 80X80 Catalan 80112</div>
                                <div class="card-price"> 750.000đ/1 hộp</div>
                                <button class="add-cart-button">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <div class="like-item">
                            <div class="product-card">
                                <div class="card-img">
                                    <img src="./assets/img/gachoptuongphobien3.jpg" alt="">
                                </div>
                                <div class="card-title"> Gạch 80X80 Catalan 80112</div>
                                <div class="card-price"> 750.000đ/1 hộp</div>
                                <button class="add-cart-button">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <div class="like-item">
                            <div class="product-card">
                                <div class="card-img">
                                    <img src="./assets/img/gachoptuongphobien3.jpg" alt="">
                                </div>
                                <div class="card-title"> Gạch 80X80 Catalan 80112</div>
                                <div class="card-price"> 750.000đ/1 hộp</div>
                                <button class="add-cart-button">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <div class="like-item">
                            <div class="product-card">
                                <div class="card-img">
                                    <img src="./assets/img/gachoptuongphobien3.jpg" alt="">
                                </div>
                                <div class="card-title"> Gạch 80X80 Catalan 80112</div>
                                <div class="card-price"> 750.000đ/1 hộp</div>
                                <button class="add-cart-button">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <div class="like-item">
                            <div class="product-card">
                                <div class="card-img">
                                    <img src="./assets/img/gachoptuongphobien3.jpg" alt="">
                                </div>
                                <div class="card-title"> Gạch 80X80 Catalan 80112</div>
                                <div class="card-price"> 750.000đ/1 hộp</div>
                                <button class="add-cart-button">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <div class="like-item">
                            <div class="product-card">
                                <div class="card-img">
                                    <img src="./assets/img/gachoptuongphobien3.jpg" alt="">
                                </div>
                                <div class="card-title"> Gạch 80X80 Catalan 80112</div>
                                <div class="card-price"> 750.000đ/1 hộp</div>
                                <button class="add-cart-button">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <div class="like-item">
                            <div class="product-card">
                                <div class="card-img">
                                    <img src="./assets/img/gachoptuongphobien3.jpg" alt="">
                                </div>
                                <div class="card-title"> Gạch 80X80 Catalan 80112</div>
                                <div class="card-price"> 750.000đ/1 hộp</div>
                                <button class="add-cart-button">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <div class="like-item">
                            <div class="product-card">
                                <div class="card-img">
                                    <img src="./assets/img/gachoptuongphobien3.jpg" alt="">
                                </div>
                                <div class="card-title"> Gạch 80X80 Catalan 80112</div>
                                <div class="card-price"> 750.000đ/1 hộp</div>
                                <button class="add-cart-button">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <div class="like-item">
                            <div class="product-card">
                                <div class="card-img">
                                    <img src="./assets/img/gachoptuongphobien3.jpg" alt="">
                                </div>
                                <div class="card-title"> Gạch 80X80 Catalan 80112</div>
                                <div class="card-price"> 750.000đ/1 hộp</div>
                                <button class="add-cart-button">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <div class="like-item">
                            <div class="product-card">
                                <div class="card-img">
                                    <img src="./assets/img/gachoptuongphobien3.jpg" alt="">
                                </div>
                                <div class="card-title"> Gạch 80X80 Catalan 80112</div>
                                <div class="card-price"> 750.000đ/1 hộp</div>
                                <button class="add-cart-button">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <div class="like-item">
                            <div class="product-card">
                                <div class="card-img">
                                    <img src="./assets/img/gachoptuongphobien3.jpg" alt="">
                                </div>
                                <div class="card-title"> Gạch 80X80 Catalan 80112</div>
                                <div class="card-price"> 750.000đ/1 hộp</div>
                                <button class="add-cart-button">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <div class="like-item">
                            <div class="product-card">
                                <div class="card-img">
                                    <img src="./assets/img/gachoptuongphobien3.jpg" alt="">
                                </div>
                                <div class="card-title"> Gạch 80X80 Catalan 80112</div>
                                <div class="card-price"> 750.000đ/1 hộp</div>
                                <button class="add-cart-button">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <div class="like-item">
                            <div class="product-card">
                                <div class="card-img">
                                    <img src="./assets/img/gachoptuongphobien3.jpg" alt="">
                                </div>
                                <div class="card-title"> Gạch 80X80 Catalan 80112</div>
                                <div class="card-price"> 750.000đ/1 hộp</div>
                                <button class="add-cart-button">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <div class="like-item">
                            <div class="product-card">
                                <div class="card-img">
                                    <img src="./assets/img/gachoptuongphobien3.jpg" alt="">
                                </div>
                                <div class="card-title"> Gạch 80X80 Catalan 80112</div>
                                <div class="card-price"> 750.000đ/1 hộp</div>
                                <button class="add-cart-button">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <div class="like-item">
                            <div class="product-card">
                                <div class="card-img">
                                    <img src="./assets/img/gachoptuongphobien3.jpg" alt="">
                                </div>
                                <div class="card-title"> Gạch 80X80 Catalan 80112</div>
                                <div class="card-price"> 750.000đ/1 hộp</div>
                                <button class="add-cart-button">Thêm vào giỏ</button>
                            </div>
                        </div>

                    </div>
                    <button class="like-slider-prev like-slider-btn" onclick="scrollToItemNextSmooth(1)">
                        <img src="./assets/img/arrow-left.png" alt="">
                    </button>
                    <button class="like-slider-next like-slider-btn" onclick="scrollToItemPrevSmooth(1)">
                        <img src="./assets/img/arrow-right.png" alt="">
                    </button>
                </div>
            </div>

        </div>
    </div>

<jsp:include page="view_shared/header_footer/footer.jsp"/>


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


        let buttonRight = document.getElementById('slideRight');
        let buttonLeft = document.getElementById('slideLeft');

        buttonLeft.addEventListener('click', function(){
            document.getElementById('slider').scrollLeft -= 180
        })

        buttonRight.addEventListener('click', function(){
            document.getElementById('slider').scrollLeft += 180
        })


    </script>
        <script>
            function activateDesInfo(button){
                const des = button.id;
                const elements = document.getElementById('product-content').children;
                Array.from(elements).forEach(element => {
                    const id = element.id.split('-');
                    if(id[0] === des) {
                        element.style.display = 'flex';
                        document.getElementById(id[0]).style.borderBottom = '1px solid #000';

                    } else {
                        element.style.display = 'none';
                        document.getElementById(id[0]).style.borderBottom = 'none';
                    }
                });
            }

        </script>
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
            } else {
                element.style.display = 'none';
                document.getElementById(id[0]).style.borderBottom = 'none';
            }
        });

        // Ẩn bình luận nếu không chọn 'review'
        if (des !== "review") {
            document.getElementById('review-content').style.display = 'none';
        }
    }

</script>
<script src="./assets/js/scrollTop.js"></script>
</body>
</html>