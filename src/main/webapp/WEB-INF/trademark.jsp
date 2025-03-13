<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 13/03/2025
  Time: 3:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="./assets/css/trademark.css">
  <title>Thương hiệu</title>
  <!-- Nhúng phông chữ -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
          href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet"
  />

  <link rel="stylesheet" href="./assets/css/style.css">
  <link rel="stylesheet" href="./assets/css/cacthanhphancodinh.css">
  <link rel="stylesheet" href="./assets/css/giohang.css">
  <!-- Thêm favicon -->
  <link
          rel="icon"
          type="image/x-icon"
          href="./assets/icons/logo2_no_text.svg"

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
</head>
<body>
<jsp:include page="../view_shared/header_footer/header.jsp"/>

<!-- Thương hiệu -->
<div class="container">
  <h2>Hợp tác với các thương hiệu gạch men lớn</h2>
  <div class="partner-logos">
    <div class="logo-row">
      <img src="https://upload.wikimedia.org/wikipedia/commons/2/22/Viglacera.png" alt="Brand 1">
      <img src="https://weareprimegroup.com/cms/wp-content/uploads/2021/03/Logo-Primario.png" alt="Brand 2">
      <img src="https://royaltiles.vn/wp-content/uploads/2022/06/Logo-ROYALmin.png" alt="Brand 3">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8Wt6jMBF3wpmxbb0vjA269dgX0YD02RTL4w&s" alt="Brand 4">
      <img src="https://vpf.vn/wp-content/uploads/2018/10/1365749200.jpg" alt="Brand 5">
    </div>
    <div class="logo-row">
      <img src="https://hrchannels.com/Upload/avatar/20211215/102401762_CNC.jpg" alt="Brand 6">
      <img src="https://bighousevietnam.vn/wp-content/uploads/2018/04/cong-ty-gach-catalan.jpg" alt="Brand 7">
      <img src="https://hanoisme.vn/pic/News/pic-New-i_637691174652513551_HasThumb.jpg" alt="Brand 8">
      <img src="https://vinhphuc.work/wp-content/uploads/2021/07/image_cong-ty-vitto_280721-094840.jpg" alt="Brand 9">
      <img src="https://toko.vn/wp-content/uploads/New-Logo-200-pixel.png" alt="Brand 10">
    </div>

  </div>
</div>

<jsp:include page="/view_shared/header_footer/footer.jsp"/>



</body>
</html>
