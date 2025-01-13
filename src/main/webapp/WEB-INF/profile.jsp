<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link rel="stylesheet" href="/assets/css/hoso.css">
    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />

    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/cacthanhphancodinh.css">
    <link rel="stylesheet" href="/assets/css/giohang.css">
    <link rel="stylesheet" href="/assets/css/dropdown_user_menu.css">
    <!-- Thêm favicon -->
    <link
            rel="icon"
            type="image/x-icon"
            href="/assets/icons/logo2_no_text.svg"

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


<div class="container">
    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="small-profile">
            <div class="avatar">
                <img src="${user.avatar}" alt="Avatar">
            </div>
            <div class="info">
                <span class="username">${user.fullname}</span>
                <a href="#" class="edit-profile">
                    <span class="edit-icon"></span>
                    Sửa Hồ Sơ
                </a>
            </div>
        </div>

        <ul>
            <li ><b>Tài Khoản Của Tôi</b></li>
            <li class="active">Hồ Sơ</li>




            <hr>

            <a href="/lichsudonhangthanhcong.html"><li>Đơn Mua</li></a>
            <hr>
            <a href="/home.html"><li>Quay về trang chủ</li></a>

        </ul>
    </aside>

    <!-- Main Profile Section -->
    <main class="profile">
        <c:if test="${not empty message}">
            <p>${message}</p>
        </c:if>
        <h2>Hồ Sơ Của Tôi</h2>
        <p>Quản lý thông tin hồ sơ để bảo mật tài khoản</p>
        <div class="content">
            <!-- Form Section -->
            <form method="POST" action="/profile">
                <div class="form-group">
                    <label for="fullname">Tên</label>
                    <input type="text" id="fullname" name="fullname" value="${user.fullname}" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="${user.email}" disabled>

                </div>

                <div class="form-group">
                    <label for="phone">Số điện thoại</label>
                    <input type="text" id="phone" name="phone" value="${user.phone}" required>
                </div>

                <div class="form-group">
                    <label for="address">Địa chỉ</label>
                    <input type="text" id="address" name="address" value="${user.address}" required>
                </div>

                <div class="form-group">
                    <label for="birthtime">Ngày sinh</label>
                    <input type="date" id="birthtime" name="birthtime" value="${birthtime}">
                </div>

                <div class="form-group radio-group">
                    <label>Giới tính</label>
                    <div class="radio-options">
                        <label><input type="radio" name="gender" value="male" ${user.sex == 1 ? 'checked' : ''}> Nam</label>
                        <label><input type="radio" name="gender" value="female" ${user.sex == 0 ? 'checked' : ''}> Nữ</label>
                    </div>
                </div>

                <button type="submit" class="save-btn">Lưu</button>
            </form>




            <!-- Upload Photo Section -->
<%--            <div class="upload-photo">--%>
<%--                <div class="photo-preview">--%>
<%--                    <img id="preview"--%>
<%--                         src="${user.avatar}"--%>

<%--                         alt="" />--%>
<%--                </div>--%>
<%--                <label class="upload-btn">--%>
<%--                    Đổi Ảnh--%>
<%--                    <input type="file" id="fileInput" accept="image/*">--%>
<%--                </label>--%>
<%--                <p>Dung lượng file tối đa 1 MB<br>Định dạng: JPEG, PNG</p>--%>
<%--            </div>--%>
            <form method="POST" action="/uploadAvatar" enctype="multipart/form-data">
                <div class="upload-photo">
                    <div class="photo-preview">
                        <img id="preview" src="${user.avatar}" alt="Avatar hiện tại" />
                    </div>
                    <label class="upload-btn">
                        Đổi Ảnh
                        <input type="file" id="fileInput" name="avatar" accept="image/*">
                    </label>
                    <button type="submit" class="save-btn">Cập nhật ảnh</button>
                </div>
            </form>

            <!-- Form Đổi Mật Khẩu -->
            <form method="POST" action="/profile/change-password" class="change-password-form">
                <h3>Đổi mật khẩu</h3>
                <div class="form-group">
                    <label for="currentPassword">Mật khẩu hiện tại</label>
                    <input type="password" id="currentPassword" name="currentPassword" required>
                </div>
                <div class="form-group">
                    <label for="newPassword">Mật khẩu mới</label>
                    <input type="password" id="newPassword" name="newPassword" required>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Xác nhận mật khẩu mới</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required>
                </div>
                <button type="submit" class="save-btn">Đổi mật khẩu</button>
            </form>



        </div>
        <c:if test="${not empty message}">
            <div class="alert">
                    ${message}
            </div>
        </c:if>
    </main>
</div>


<jsp:include page="../view_shared/header_footer/footer.jsp"/>

<script>
    document.getElementById('fileInput').addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file && file.size <= 1048576) { // Kiểm tra kích thước file (1MB)
            const reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('preview').src = e.target.result;
            };
            reader.readAsDataURL(file);
        } else {
            alert('Vui lòng chọn file dưới 1MB!');
        }
    });
</script>



</body>
</html>