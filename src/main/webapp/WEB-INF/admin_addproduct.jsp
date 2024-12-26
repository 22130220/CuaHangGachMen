<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thêm sản phẩm</title>

    <!-- Reset CSS -->
    <link rel="stylesheet" href="/assets/css/reset.css" />

    <!-- Thêm favicon -->
    <link rel="icon" type="image/x-icon" href="/assets/icons/logo2_no_text.svg">


    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

    <!-- Font Awesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js"
            integrity="sha512-6sSYJqDreZRZGkJ3b+YfdhB3MzmuP9R7X1QZ6g5aIXhRvR1Y/N/P47jmnkENm7YL3oqsmI6AK+V6AD99uWDnIw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- Kiểu CSS -->
    <link rel="stylesheet" href="/assets/css/style.css" />
    <link rel="stylesheet" href="/assets/css/admin-ruleset.css">
    <link rel="stylesheet" href="/assets/css/basicinput.css">
    <link rel="stylesheet" href="/assets/css/UploadImg.css">
    <link rel="stylesheet" href="/assets/css/InputViaIcon.css">
    <link rel="stylesheet" href="/assets/css/admin_addproduct.css">
    <link rel="stylesheet" href="/assets/css/notification.css">
    <link rel="stylesheet" href="/assets/css/arccordion.css">
    <!-- CKeditor 4 -->
    <script src="/assets/ckeditor/ckeditor.js"></script>
    <script src="/assets/ckfinder/ckfinder.js"></script>


    <style>
        div.container {
            max-width: 1200px;
        }
    </style>
</head>

<body>
<div class="admin-container grid-layout">
    <jsp:include page="view_shared/admin/admin-grid.jsp"/>
    <div class="content grid-item content-grid">
        <div class="main-grid">
            <nav class="navbar tag-line _4c _1r">
                <div class="nav-back-prev">
                    <div class="back-button button "></div>
                    <div class="breadcumb">
                        <div class="breadcumb-icon f-s-25">
                            <i class="fa-regular fa-square-plus"></i>
                        </div>
                        <p class="f-bold f-s-25 breadcumb-text"> <c:out value="${message}"/> </p>
                    </div>
                </div>
                <div class="funcproduct">
                    <a href="#" class="button bg_green f-cl-white"> <c:out value="${operation}"/></a>
                </div>
            </nav>
            <div class="options card _1c 10r gap-10">
                <p class="f-s-18 f-bold border-bottom">Tuỳ chỉnh</p>
                <div class="card-white">
                    <p class="f-s-14 f-bold">Tên sản phẩm</p>
                    <br>
                    <p class="f-s-12 f-regular"> - Phải có dấu </p>
                    <br>
                    <p class="f-s-12 f-regular"> - Không dài quá 20 ký tự </p>
                    <br>
                    <p class="f-s-12 f-regular"> - Theo format là: Tên sản phẩm + loại sản phẩm </p>
                </div>
                <div class="card-white">
                    <p class="f-s-14 f-bold">Thẻ sản phẩm</p>
                    <br>
                    <p class="f-s-12 f-regular"> - Gạch có vân </p>
                    <br>
                    <p class="f-s-12 f-regular"> - Gạch không vân </p>
                    <br>
                    <p class="f-s-12 f-regular"> - Gạch ceramic </p>
                </div>
                <div class="card-white">
                    <p class="f-s-14 f-bold">Số lượng sản phẩm</p>
                    <br>
                    <p class="f-s-12 f-regular"> - Không được âm </p>
                </div>
            </div>
            <div class="card _3c _10r">
                <form action="" class="main-grid">
                    <div class="product-name _4c">
                        <div class="fui-basic-input flex-column gap-6">
                            <label for="productname" class="f-bold f-s-14 f-cl-black">Tên sản phẩm</label>
                            <input type="text" name="name" placeholder="Nhập tên sản phẩm" value="${product.name}" class="input input-bordered f-s-14" id="productname" autocomplete="off"/>
                        </div>
                    </div>
                    <div class="poduct-quantity _3c">
                        <div class="fui-basic-input flex-column gap-6">
                            <label for="size" class="f-bold f-s-14 f-cl-black">Kích thước</label>
                            <select name="size" id="size" class="input input-bordered f-s-14">
                                <c:forEach items="${sizes}" var="size">
                                    <c:choose>
                                        <c:when test="${product.sizeId == size.id}">
                                            <option value="${size.id}" selected><c:out value="${size.name}"/></option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${size.id}"><c:out value="${size.name}"/></option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="poduct-quantity _1c">
                        <div class="fui-basic-input flex-column gap-6">
                            <label for="productquantity" class="f-bold f-s-14 f-cl-black">Số lượng</label>
                            <input type="text" name="quantity" placeholder="Nhập số lượng" value="${product.quantityPerBox}" class="input input-bordered f-s-14" id="productquantity" autocomplete="off"/>
                        </div>
                    </div>
                    <div class="product-price _4c">
                        <div class="fui-basic-input flex-column gap-6">
                            <label for="productprice" class="f-bold f-s-14 f-cl-black">Giá Sản phẩm (1 hộp)</label>
                            <input type="text" name="price" placeholder="Nhập giá" value="${product.pricePerBox}" class="input input-bordered f-s-14" id="productprice" autocomplete="off"/>
                        </div>
                    </div>
                    <div class="poduct-form _4c">
                        <div class="fui-basic-input flex-column gap-6">
                            <label for="productform" class="f-bold f-s-14 f-cl-black"> Loại sản phẩm</label>
                            <select name="category" id="productform" class="input input-bordered f-s-14">
                                <c:forEach items="${categories}" var="category">
                                    <c:choose>
                                        <c:when test="${product.categoryId == category.id}">
                                            <option value="${category.id}" selected><c:out value="${category.name}"/></option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${category.id}"><c:out value="${category.name}"/></option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="poduct-material _4c">
                        <div class="fui-basic-input flex-column gap-6">
                            <label for="productmaterial" class="f-bold f-s-14 f-cl-black"> Chất liệu</label>
                            <select name="material" id="productmaterial" class="input input-bordered f-s-14">
                                <c:forEach items="${materials}" var="material">
                                    <c:choose>
                                        <c:when test="${product.materialId == material.id}">
                                            <option value="${material.id}" selected><c:out value="${material.name}"/></option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${material.id}"><c:out value="${material.name}"/></option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="poduct-manufacturer _4c">
                        <div class="fui-basic-input flex-column gap-6">
                            <label for="productmanufacturer" class="f-bold f-s-14 f-cl-black"> Nhà cung cấp</label>
                            <select name="manufacturer" id="productmanufacturer" class="input input-bordered f-s-14">
                                <c:forEach items="${manufacturers}" var="manufacturer">
                                    <c:choose>
                                        <c:when test="${product.manufacturerId == manufacturer.id}">
                                            <option value="${manufacturer.id}" selected><c:out value="${manufacturer.name}"/></option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${manufacturer.id}"><c:out value="${manufacturer.name}"/></option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="product-description _4c">
                        <div class="flex-column gap-6">
                            <label for="editor" class="f-bold f-s-14 f-cl-black">
                                Mô tả sản phẩm
                            </label>
                            <textarea class="editor-label" name="editor" id="editor" cols="30" rows="10"></textarea>
                        </div>
                    </div>
                    <div class="poduct-img-thumb _4c">
                        <div class="flex-column gap-6">
                            <p class="f-bold f-s-14 f-cl-black">Thêm thông số</p>
                            <div class="fui-accordion-HL1">
                                <div class="wrapBox">
                                    <div class="boxTitle">
                                        <span class="title">
                                            <div class="fui-basic-input flex-column gap-6">
                                             <select name="" id=""spec1 class="input f-s-14 accordion-input">
                                                 <option value="0"></option>
                                                <option value="2">Hoa văn</option>
                                                <option value="3">Độ dày</option>
                                                 <option value="4">Hoàn thiện</option>
                                                 <option value="5">Áp dụng cho</option>
                                            </select>

                                        </div>
                                    </span>
                                        <div class="boxIcon"><span class="icon icon-plus">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M13 7C13 6.44772 12.5523 6 12 6C11.4477 6 11 6.44772 11 7V11H7C6.44772 11 6 11.4477 6 12C6 12.5523 6.44772 13 7 13H11V17C11 17.5523 11.4477 18 12 18C12.5523 18 13 17.5523 13 17V13H17C17.5523 13 18 12.5523 18 12C18 11.4477 17.5523 11 17 11H13V7Z" fill="currentColor"></path>
              </svg></span><span class="icon icon-minus">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M6 12C6 11.4477 6.44772 11 7 11H17C17.5523 11 18 11.4477 18 12C18 12.5523 17.5523 13 17 13H7C6.44772 13 6 12.5523 6 12Z" fill="currentColor"></path>
              </svg></span></div>
                                    </div>
                                    <div class="boxContent">
                                        <div class="fui-basic-input flex-column gap-6">
                                            <label for="moretext1" class="f-bold f-s-14 f-cl-black">Nội dung</label>
                                            <input type="text" name="name" placeholder="" class="input input-bordered f-s-14" id="moretext1" autocomplete="off"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="wrapBox">
                                    <div class="boxTitle">
                                        <span class="title">
                                            <div class="fui-basic-input flex-column gap-6">
                                             <select name="" id="spec2" class="input f-s-14 accordion-input">
                                                 <option value="0"></option>
                                                <option value="2">Hoa văn</option>
                                                <option value="3">Độ dày</option>
                                                 <option value="4">Hoàn thiện</option>
                                                 <option value="5">Áp dụng cho</option>
                                            </select>

                                        </div>
                                    </span>
                                        <div class="boxIcon"><span class="icon icon-plus">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M13 7C13 6.44772 12.5523 6 12 6C11.4477 6 11 6.44772 11 7V11H7C6.44772 11 6 11.4477 6 12C6 12.5523 6.44772 13 7 13H11V17C11 17.5523 11.4477 18 12 18C12.5523 18 13 17.5523 13 17V13H17C17.5523 13 18 12.5523 18 12C18 11.4477 17.5523 11 17 11H13V7Z" fill="currentColor"></path>
              </svg></span><span class="icon icon-minus">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M6 12C6 11.4477 6.44772 11 7 11H17C17.5523 11 18 11.4477 18 12C18 12.5523 17.5523 13 17 13H7C6.44772 13 6 12.5523 6 12Z" fill="currentColor"></path>
              </svg></span></div>
                                    </div>
                                    <div class="boxContent">
                                        <div class="fui-basic-input flex-column gap-6">
                                            <label for="moretext2" class="f-bold f-s-14 f-cl-black">Nội dung</label>
                                            <input type="text" name="name" placeholder="" class="input input-bordered f-s-14" id="moretext2" autocomplete="off"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="wrapBox">
                                    <div class="boxTitle">
                                        <span class="title">
                                            <div class="fui-basic-input flex-column gap-6">
                                             <select name="" id="spec3" class="input f-s-14 accordion-input">
                                                 <option value="0"></option>
                                                <option value="2">Hoa văn</option>
                                                <option value="3">Độ dày</option>
                                                 <option value="4">Hoàn thiện</option>
                                                 <option value="5">Áp dụng cho</option>
                                            </select>

                                        </div>
                                    </span>
                                        <div class="boxIcon"><span class="icon icon-plus">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M13 7C13 6.44772 12.5523 6 12 6C11.4477 6 11 6.44772 11 7V11H7C6.44772 11 6 11.4477 6 12C6 12.5523 6.44772 13 7 13H11V17C11 17.5523 11.4477 18 12 18C12.5523 18 13 17.5523 13 17V13H17C17.5523 13 18 12.5523 18 12C18 11.4477 17.5523 11 17 11H13V7Z" fill="currentColor"></path>
              </svg></span><span class="icon icon-minus">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M6 12C6 11.4477 6.44772 11 7 11H17C17.5523 11 18 11.4477 18 12C18 12.5523 17.5523 13 17 13H7C6.44772 13 6 12.5523 6 12Z" fill="currentColor"></path>
              </svg></span></div>
                                    </div>
                                    <div class="boxContent">
                                        <div class="fui-basic-input flex-column gap-6">
                                            <label for="moretext3" class="f-bold f-s-14 f-cl-black">Nội dung</label>
                                            <input type="text" name="name" placeholder="" class="input input-bordered f-s-14" id="moretext3" autocomplete="off"/>
                                        </div>
                                    </div>
                                </div>
                        </div>
                    </div>
                    <div class="poduct-img-thumb _4c">
                        <div class="flex-column gap-6">
                            <p class="f-bold f-s-14 f-cl-black">Chọn ảnh đại diện</p>
                            <div id="thumbnail" class="upload-area-container">
                                <div class="upload-area">
                                    <label class="custom-file-upload">
                                        Chọn ảnh
                                        <input type="file" accept="image/*" multiple style="display: none;">
                                    </label>
                                    <div class="image-preview"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="poduct-img-thumb _4c">
                        <div class="flex-column gap-6">
                            <p class="f-bold f-s-14 f-cl-black">Ảnh của từng loại màu</p>
                            <div class="fui-accordion-HL1">
                                <div class="wrapBox">
                                    <div class="boxTitle">
                                        <span class="title">
                                            <div class="fui-basic-input flex-column gap-6">
                                             <select name="" id="corlor1" class="input f-s-14 accordion-input">
                                                 <option value="0"></option>
                                                <option value="1">Xanh ngọc</option>
                                                <option value="2">Trắng</option>
                                                <option value="3">Cam</option>
                                            </select>

                                        </div>
                                    </span>
                                        <div class="boxIcon"><span class="icon icon-plus">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M13 7C13 6.44772 12.5523 6 12 6C11.4477 6 11 6.44772 11 7V11H7C6.44772 11 6 11.4477 6 12C6 12.5523 6.44772 13 7 13H11V17C11 17.5523 11.4477 18 12 18C12.5523 18 13 17.5523 13 17V13H17C17.5523 13 18 12.5523 18 12C18 11.4477 17.5523 11 17 11H13V7Z" fill="currentColor"></path>
              </svg></span><span class="icon icon-minus">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M6 12C6 11.4477 6.44772 11 7 11H17C17.5523 11 18 11.4477 18 12C18 12.5523 17.5523 13 17 13H7C6.44772 13 6 12.5523 6 12Z" fill="currentColor"></path>
              </svg></span></div>
                                    </div>
                                    <div class="boxContent">
                                        <div id="area1" class="upload-area-container">
                                            <div class="upload-area">
                                                <label class="custom-file-upload">
                                                    Chọn ảnh
                                                    <input type="file" accept="image/*" multiple style="display: none;">
                                                </label>
                                                <div class="image-preview"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="wrapBox">
                                    <div class="boxTitle"><span class="title">
                                        <div class="fui-basic-input flex-column gap-6">
                                             <select name="" id="corlor2" class="input f-s-14 accordion-input">
                                                 <option value="0"></option>
                                                <option value="1">Xanh ngọc</option>
                                                <option value="2">Trắng</option>
                                                <option value="3">Cam</option>
                                            </select>

                                        </div>
                                    </span>
                                        <div class="boxIcon"><span class="icon icon-plus">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M13 7C13 6.44772 12.5523 6 12 6C11.4477 6 11 6.44772 11 7V11H7C6.44772 11 6 11.4477 6 12C6 12.5523 6.44772 13 7 13H11V17C11 17.5523 11.4477 18 12 18C12.5523 18 13 17.5523 13 17V13H17C17.5523 13 18 12.5523 18 12C18 11.4477 17.5523 11 17 11H13V7Z" fill="currentColor"></path>
              </svg></span><span class="icon icon-minus">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M6 12C6 11.4477 6.44772 11 7 11H17C17.5523 11 18 11.4477 18 12C18 12.5523 17.5523 13 17 13H7C6.44772 13 6 12.5523 6 12Z" fill="currentColor"></path>
              </svg></span></div>
                                    </div>
                                    <div class="boxContent">
                                        <div id="area2" class="upload-area-container">
                                            <div class="upload-area">
                                                <label class="custom-file-upload">
                                                    Chọn ảnh
                                                    <input type="file" accept="image/*" multiple style="display: none;">
                                                </label>
                                                <div class="image-preview"></div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="wrapBox">
                                    <div class="boxTitle"><span class="title">
                                        <div class="fui-basic-input flex-column gap-6">
                                             <select name="" id="corlor3" class="input f-s-14 accordion-input">
                                                 <option value="0"></option>
                                                <option value="1">Xanh ngọc</option>
                                                <option value="2">Trắng</option>
                                                <option value="3">Cam</option>
                                            </select>

                                        </div>
                                    </span>
                                        <div class="boxIcon"><span class="icon icon-plus">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M13 7C13 6.44772 12.5523 6 12 6C11.4477 6 11 6.44772 11 7V11H7C6.44772 11 6 11.4477 6 12C6 12.5523 6.44772 13 7 13H11V17C11 17.5523 11.4477 18 12 18C12.5523 18 13 17.5523 13 17V13H17C17.5523 13 18 12.5523 18 12C18 11.4477 17.5523 11 17 11H13V7Z" fill="currentColor"></path>
              </svg></span><span class="icon icon-minus">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M6 12C6 11.4477 6.44772 11 7 11H17C17.5523 11 18 11.4477 18 12C18 12.5523 17.5523 13 17 13H7C6.44772 13 6 12.5523 6 12Z" fill="currentColor"></path>
              </svg></span></div>
                                    </div>
                                    <div class="boxContent">
                                        <div id="area3" class="upload-area-container">
                                            <div class="upload-area">
                                                <label class="custom-file-upload">
                                                    Chọn ảnh
                                                    <input type="file" accept="image/*" multiple style="display: none;">
                                                </label>
                                                <div class="image-preview"></div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="notifi-box" id="box">
            <h2>Có <span>3 thông báo mới</span></h2>
            <div class="notifi-item">
                <i class="fa-solid fa-user-tag fa-2x"></i>
                <div class="text">
                    <h4>Có 4 khách hàng mới</h4>
                </div>
            </div>
            <div class="notifi-item">
                <i class="fa-solid fa-bookmark fa-2x"></i>
                <div class="text">
                    <h4>Đã có thêm 4 đơn đặt hàng mới</h4>
                </div>
            </div>
            <div class="notifi-item">
                <i class="fa-solid fa-thumbs-up fa-2x"></i>
                <div class="text">
                    <h4>Hôm qua làm việc tốt lắm</h4>
                </div>
            </div>
        </div>
    </div>



</div>
<script src="/assets/js/notification.js"></script>
<script src="/assets/js/img-uploading.js"></script>
<script src="/assets/js/accordion.js"></script>
<script>
    var editor = CKEDITOR.replace('editor');
    CKFinder.setupCKEditor(editor, 'assets/ckfinder/');
</script>
</body>

</html>