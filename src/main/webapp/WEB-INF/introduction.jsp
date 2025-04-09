<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/03/2025
  Time: 3:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../assets/css/introduction.css">
    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/cacthanhphancodinh.css">
    <!-- Thêm favicon -->
    <link
            rel="icon"
            type="image/x-icon"
            href="../assets/icons/logo2_no_text.svg"

    />
    <link rel="stylesheet" href="/assets/css/search.css"/>
</head>
<body>
<jsp:include page="../view_shared/header_footer/header.jsp"/>
<section class="intro">
    <div class="intro-text">
        <h1>Chào Mừng Đến Với Cửa Hàng Gạch Men Chất Lượng Cao</h1>
        <p>Khám phá bộ sưu tập gạch men đa dạng với thiết kế tinh tế, sang trọng. Chúng tôi cam kết cung cấp sản phẩm chất lượng nhất cho mọi không gian sống của bạn.</p>
        <a href="./index.html" class="btn_001">Khám Phá Ngay</a>
    </div>
    <div class="intro-image">
        <img src="../assets/img/gt01.webp" alt="Gạch Men Cửa Hàng">
    </div>
</section>

<section class="features">
    <h2>Các Sản Phẩm Nổi Bật</h2>
    <div class="feature-item">
        <img src="../assets/img/gt01.webp" alt="Gạch Men Sang Trọng">
        <h3>Gạch Men Sang Trọng</h3>
        <p>Đem lại vẻ đẹp tinh tế cho không gian sống của bạn với những mẫu gạch men chất lượng, thiết kế đẹp mắt, bền bỉ.</p>
    </div>
    <div class="feature-item">
        <img src="../assets/img/gt02.webp" alt="Gạch Men Ốp Tường">
        <h3>Gạch Men Ốp Tường</h3>
        <p>Được sản xuất với công nghệ tiên tiến, gạch men ốp tường sẽ giúp không gian của bạn thêm hiện đại và sạch sẽ.</p>
    </div>
    <div class="feature-item">
        <img src="../assets/img/gt03.webp" alt="Gạch Men Sàn Nhà">
        <h3>Gạch Men Sàn Nhà</h3>
        <p>Chất liệu gạch men sàn nhà bền đẹp, chống trơn trượt, phù hợp với mọi loại diện tích và phong cách thiết kế, nâng tầm không gian sống.</p>
    </div>
</section>

<section class="about">
    <h2>Về Chúng Tôi</h2>
    <p>Với hơn 10 năm kinh nghiệm trong ngành gạch men, chúng tôi tự hào là nhà cung cấp uy tín cho hàng ngàn khách hàng trên toàn quốc. Sản phẩm của chúng tôi được nhập khẩu từ các thương hiệu nổi tiếng, cam kết mang lại sự hài lòng tuyệt đối.</p>
    <p>Chúng tôi luôn nỗ lực không ngừng để mang đến những mẫu gạch men đẹp mắt, chất lượng cao, phù hợp với xu hướng thiết kế hiện đại, giúp mọi không gian sống của bạn trở nên sang trọng và ấm cúng hơn.</p>
</section>





<jsp:include page="../view_shared/header_footer/footer.jsp"/>
<script src="../assets/js/search.js"></script>
</body>
</html>
