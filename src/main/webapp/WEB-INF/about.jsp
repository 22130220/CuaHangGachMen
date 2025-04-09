<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 26/02/2025
  Time: 2:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Liên hệ</title>

    <!-- Reset CSS -->
    <link rel="stylesheet" href="../assets/css/reset.css" />

    <!-- Thêm favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/icons/logo2_no_text.svg">


    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">


    <!-- Font Awesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js" integrity="sha512-6sSYJqDreZRZGkJ3b+YfdhB3MzmuP9R7X1QZ6g5aIXhRvR1Y/N/P47jmnkENm7YL3oqsmI6AK+V6AD99uWDnIw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- Kiểu CSS -->
    <link rel="stylesheet" href="../assets/css/style.css" />
    <link rel="stylesheet" href="../assets/css/contact.css" />
    <link rel="stylesheet" href="../assets/css/basicinput.css"/>
    <link rel="stylesheet" href="../assets/css/basictextarea.css"/>
    <link rel="stylesheet" href="../assets/css/cacthanhphancodinh.css" />

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/spin.js@2.0.2/spin.min.js"></script>

    <style>
        button:disabled {
            opacity: 0.6;
            cursor: not-allowed;
        }
    </style>
    <link rel="stylesheet" href="/assets/css/search.css"/>
</head>
<body>
<jsp:include page="/view_shared/header_footer/header.jsp" />
<div id="spinner" style="display: none;"></div>
<div class="withus">
    <div class="main-content layout-flex">
        <div class="fit-title">
            <p class="bg-title">
                Liên hệ với chúng tôi
            </p>
            <p class="des">
                Để biết thêm thông tin về sản phẩm và dịch vụ của chúng tôi. Xin vui lòng gửi email cho chúng tôi. Nhân viên của chúng tôi luôn có mặt để giúp đỡ bạn. Đừng ngần ngại!
            </p>
        </div>

    </div>
</div>

<div class="contact-label">
    <div class="main-content">
        <form action="/AboutController" id="validationAbout" class="contact-form" method="post">
            <div class="infor-label">
                <div class="label">
                    <div class="label-logo">
                        <i class="fa-solid fa-location-dot fa-lg"></i>
                    </div>
                    <div class="label-content">
                        <div class="text-head heading">
                            Địa chỉ
                        </div>
                        <div class="text-infor">
                            <p>
                                236 5th SE Avenue, New York NY10000, United States
                            </p>

                        </div>
                    </div>
                </div>
                <div class="label">
                    <div class="label-logo">
                        <i class="fa-solid fa-phone fa-lg"></i>
                    </div>
                    <div class="label-content">
                        <div class="text-head heading">
                            Đường dây nóng
                        </div>
                        <div class="text-infor">
                            <p>
                                Mobile: +(84) 546-6789
                                <br>
                                Hotline: +(84) 456-6789
                            </p>

                        </div>
                    </div>
                </div>
                <div class="label">
                    <div class="label-logo">
                        <i class="fa-solid fa-clock fa-lg"></i>
                    </div>
                    <div class="label-content">
                        <div class="text-head heading">
                            Thời gian làm việc
                        </div>
                        <div class="text-infor">
                            <p>
                                Monday-Friday: 9:00 - 22:00
                                <br>
                                Saturday-Sunday: 9:00 - 21:00
                            </p>

                        </div>
                    </div>
                </div>

            </div>
            <div class="inputform">
                <div class="fui-basic-input input-field">
                    <label for="name" class="">Họ và tên</label>
                    <input type="text" name="name" placeholder="" class="input input-height" id="name" autocomplete="off" required/>
                </div>
                <div class="fui-basic-input input-field">
                    <label for="email" class="">Email</label>
                    <input type="text" name="Email" placeholder="" class="input input-height" id="email" autocomplete="off" required/>
                </div>
                <div class="fui-basic-input input-field">
                    <label for="subject" class="">Tiêu đề</label>
                    <input type="text" name="TieuDe" placeholder="" class="input input-height" id="subject" autocomplete="off" required/>
                </div>
                <div class="fui-basic-textarea input-field">
                    <label for="content" class="">Nội dung</label>
                    <textarea id="content" name="content" class="tarea area-height" rows="4" cols="50" required></textarea>
                </div>
                <div class="submit-btn">
                    <button class="btn" id="submitBtn" disabled>Gửi yêu cầu</button>
                </div>
            </div>
        </form>
    </div>

</div>
<jsp:include page="/view_shared/header_footer/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
<script src="../assets/js/scrollTop.js"></script>
<script src="../assets/js/search.js"></script>
<script>
    $(document).ready(function () {
        // Thêm phương thức kiểm tra email tùy chỉnh
        $.validator.addMethod("validEmail", function (value, element) {
            return this.optional(element) || /@/.test(value);
        }, "Email phải có @");

        // Khởi tạo validate cho form
        $("#validationAbout").validate({
            onkeyup: function (element) {
                $(element).valid(); // Kiểm tra ngay khi người dùng nhập
                toggleSubmitButton(); // Cập nhật trạng thái nút submit
            },
            rules: {
                name: {
                    required: true,
                    minlength: 2
                },
                Email: {
                    required: true,
                    email: true,
                    validEmail: true
                },
                TieuDe: {
                    required: true,
                    minlength: 2
                },
                content: {
                    required: true,
                    minlength: 2
                }
            },
            messages: {
                name: {
                    required: "Vui lòng nhập họ và tên",
                    minlength: "Tên phải dài ít nhất 2 ký tự"
                },
                Email: {
                    required: "Vui lòng nhập email",
                    email: "Vui lòng nhập đúng định dạng email",
                    validEmail: "Email phải có @"
                },
                TieuDe: {
                    required: "Vui lòng nhập tiêu đề",
                    minlength: "Tiêu đề phải dài ít nhất 2 ký tự"
                },
                content: {
                    required: "Vui lòng nhập nội dung",
                    minlength: "Nội dung phải dài ít nhất 2 ký tự"
                }
            },
            errorPlacement: function (error, element) {
                error.css("color", "red");
                error.insertAfter(element);
            }
        });

        // Hàm bật/tắt nút submit
        function toggleSubmitButton() {
            const isValid = $("#validationAbout").valid();
            $("#submitBtn").prop("disabled", !isValid);
        }

        // Gọi toggleSubmitButton khi có input thay đổi
        $("#validationAbout input, #validationAbout textarea").on("input", function () {
            toggleSubmitButton();
        });

        // Gọi kiểm tra lần đầu
        toggleSubmitButton();
    });
</script>





<script>
    // ====== LƯU / PHỤC HỒI / XOÁ FORM ======

    let isReloading = false;

    // ====== LƯU / PHỤC HỒI / XOÁ FORM ======

    function saveFormData() {
        const formData = {
            name: $('#name').val(),
            email: $('#email').val(),
            subject: $('#subject').val(),
            content: $('#content').val()
        };
        sessionStorage.setItem("contactFormData", JSON.stringify(formData));
    }

    function restoreFormData() {
        const savedData = sessionStorage.getItem("contactFormData");
        if (savedData) {
            const data = JSON.parse(savedData);
            $('#name').val(data.name || "");
            $('#email').val(data.email || "");
            $('#subject').val(data.subject || "");
            $('#content').val(data.content || "");
        }
    }

    function clearFormData() {
        sessionStorage.removeItem("contactFormData");
    }

    // 🔑 Bắt sự kiện nhấn F5 hoặc Ctrl+R
    window.addEventListener('keydown', function (e) {
        if (e.key === 'F5' || (e.ctrlKey && e.key.toLowerCase() === 'r')) {
            isReloading = true;
        }
    });

    // ❗ Chỉ giữ lại dữ liệu nếu:
    // - Nhấn F5 / Ctrl+R (isReloading = true)
    // - Đang ở đúng controller AboutController
    window.addEventListener("pageshow", function () {
        const currentPath = window.location.pathname;
        const isOnAboutController = currentPath.includes("AboutController");

        if (!isReloading || !isOnAboutController) {
            clearFormData();
        }

        // Reset lại flag reload sau khi xử lý
        isReloading = false;
    });

    // ====== MAIN SCRIPT ======
    $(document).ready(function () {
        restoreFormData();

        $('#name, #email, #subject, #content').on('input', function () {
            saveFormData();
        });

        $('.contact-form').submit(function (event) {
            event.preventDefault();

            if (!$("#validationAbout").valid()) return;

            const name = $('#name').val();
            const email = $('#email').val();
            const subject = $('#subject').val();
            const content = $('#content').val();

            const formData = {
                'name': name,
                'email': email,
                'subject': subject,
                'content': content
            };

            const opts = {
                lines: 13,
                length: 28,
                width: 14,
                radius: 42,
                scale: 1,
                corners: 1,
                color: '#000',
                fadeColor: 'transparent',
                speed: 1,
                rotate: 0,
                animation: 'spinner-line-fade-quick',
                direction: 1,
                zIndex: 2e9,
                className: 'spinner',
                top: '50%',
                left: '50%',
                shadow: '0 0 1px transparent',
                position: 'absolute'
            };

            const spinner = new Spinner(opts).spin(document.getElementById('spinner'));
            $('#spinner').show();

            $.ajax({
                url: '/AboutController',
                type: 'POST',
                data: formData,
                success: function (response) {
                    $('#spinner').hide();

                    if (response.success) {
                        clearFormData();

                        $('#name').val("");
                        $('#email').val("");
                        $('#subject').val("");
                        $('#content').val("");

                        const notyf = new Notyf();
                        notyf.open({
                            duration: 1000,
                            position: { x: 'right', y: 'bottom' },
                            type: "success",
                            message: "Gửi mail thành công",
                        });
                    } else {
                        const notyf = new Notyf();
                        notyf.open({
                            duration: 1000,
                            position: { x: 'right', y: 'bottom' },
                            type: "error",
                            message: "Gửi email không thành công",
                        });
                    }
                },
                error: function () {
                    $('#spinner').hide();
                    alert("Có lỗi xảy ra! Vui lòng thử lại.");
                }
            });
        });
    });
</script>
<%--<script>--%>
<%--    $(document).ready(function() {--%>
<%--        // Tạo đối tượng spinner--%>
<%--        var opts = {--%>
<%--            lines: 13, // Số lượng vòng quay--%>
<%--            length: 28, // Chiều dài của mỗi cánh quạt--%>
<%--            width: 14, // Độ dày của cánh quạt--%>
<%--            radius: 42, // Bán kính của vòng quay--%>
<%--            scale: 1, // Tỉ lệ--%>
<%--            corners: 1, // Mặt cắt của vòng quay--%>
<%--            color: '#000', // Màu sắc--%>
<%--            fadeColor: 'transparent', // Màu khi spinner biến mất--%>
<%--            speed: 1, // Tốc độ quay--%>
<%--            rotate: 0, // Độ quay--%>
<%--            animation: 'spinner-line-fade-quick', // Loại animation--%>
<%--            direction: 1, // Chiều quay--%>
<%--            zIndex: 2e9, // Z-index để hiển thị trên các phần tử khác--%>
<%--            className: 'spinner', // Tên class của spinner--%>
<%--            top: '50%', // Vị trí top--%>
<%--            left: '50%', // Vị trí left--%>
<%--            shadow: '0 0 1px transparent', // Độ bóng--%>
<%--            position: 'absolute' // Đặt spinner tuyệt đối--%>
<%--        };--%>

<%--        // Gọi Spinner và thêm vào div--%>
<%--        var spinner = new Spinner(opts).spin(document.getElementById('spinner'));--%>

<%--        // Hiển thị spinner khi trang đang tải--%>
<%--        $('#spinner').show();--%>

<%--        // Giả sử bạn có một AJAX request ở đây--%>
<%--        // Sau khi AJAX hoàn tất, ẩn spinner đi--%>
<%--        $.ajax({--%>
<%--            url: '/AboutController',--%>
<%--            type: 'POST',--%>
<%--            data: { /* dữ liệu gửi đi */ },--%>
<%--            success: function(response) {--%>
<%--                $('#spinner').hide(); // Ẩn spinner khi AJAX xong--%>
<%--            },--%>
<%--            error: function(xhr, status, error) {--%>
<%--                $('#spinner').hide(); // Ẩn spinner khi có lỗi--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>





</body>
</html>
