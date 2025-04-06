<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Mã khôi phục</title>

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
  <link rel="stylesheet" href="/assets/css/admin-login.css">
  <link rel="stylesheet" href="/assets/css/navbar-basic.css">
  <link rel="stylesheet" href="assets/css/input-anim.css">

  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>

</head>
<body>
<div class="login-header">
  <div class="container">
    <div class="child-container">
<%--      <nav class="fui-navbar-basic fui-navbar">--%>
<%--        <a href="/" class="logo">--%>
<%--          <img src="/assets/icons/logo2.svg" alt="Fast UI"/>--%>
<%--        </a>--%>
<%--        <ul class="nav-list">--%>
<%--          <li class="nav-item">--%>
<%--            <div href="/" title="Trang chủ" class="nav-link">Trang Chủ</div>--%>
<%--          </li>--%>
<%--          <li class="nav-item">--%>
<%--            <a href="/introduction" title="Giới Thiệu" class="nav-link">Giới Thiệu</a>--%>
<%--          </li>--%>
<%--          <li class="nav-item">--%>
<%--            <a href="/AboutController" title="Liên Hệ" class="nav-link">Liên Hệ</a>--%>
<%--          </li>--%>
<%--        </ul>--%>
<%--      </nav>--%>
    </div>
  </div>
</div>
<div class="login-form">
  <div class="alpha">
    <div id="qr" class="login-icon">
      <i class="fa-solid fa-file-lines log-i"></i>
<%--            <i class="fa-solid fa-user-tie log-i"></i>--%>
    </div>
  </div>
  <div class="omega">
    <form action="totp-recovery-code" method="post" class="form">
      <p class="login-title-text f-s-30 f-cl-black f-regular">
        Mã khôi phục
        <i class="fa-regular fa-hand fa-rotate-by" style="--fa-rotate-angle: 45deg;"></i>
      </p>
      <p class="totp_notice f-s-14 f-cl-black f-regular">
        Sử dụng mã khôi phục để xác thực tài khoản của bạn. Khi mất thiết bị xác thực
      </p>
      <p class="totp_notice f-s-14 f-cl-black f-regular">
        Chỉ được dùng một lần. Hãy lưu trữ vào nơi kín đáo và an toàn.
    </p>
<%--      <div class="fui-input-label-animation form-input-custom">--%>
<%--        <input type="file" class="form-input " id="totp_code" placeholder=" " required>--%>
<%--        <label for="totp_code" class="form-label">Nhập mã xác thực</label>--%>
<%--      </div>--%>

      <div class="link-download">
        <button type="button" class="btn" style="background-color: white; color: #2e2100" onclick="downloadTextFile()">Tải file recovery_code.txt</button>
      </div>
      <input type="hidden" value="${recoveryCodes}" id="recovery_code">
      <div class="login-button">
        <button disabled class="btn" id="btn-back">Quay lại trang chủ</button>
      </div>
    </form>
  </div>
  <%--  <p class="totp_notice f-s-14 f-cl-black f-bold">--%>
  <%--    Quét mã QR bằng ứng dụng xác thực của bạn.--%>
  <%--  </p>--%>
</div>
<script>
  function downloadTextFile() {
    let textContent = document.getElementById("recovery_code").value.trim();
    let fileName = "recovery_code.txt";
    // let utf8Content = "\ufeff" + textContent;
    let blob = new Blob([textContent], {type: "text/plain;charset=utf-8"});

    let url = URL.createObjectURL(blob);


    let a = document.createElement("a");
    a.href = url;
    a.download = fileName;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);

    URL.revokeObjectURL(url);
    document.getElementById("btn-back").disabled = false;
  }
</script>
</body>
</html>