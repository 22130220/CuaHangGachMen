<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hoàn thiện thông tin</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Flowbite CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.css" rel="stylesheet" />
    <!-- Font Awesome CDN -->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
            integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
    <!-- Google Fonts: Be Vietnam Pro -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body class="min-h-screen bg-gradient-to-br from-gray-50 to-blue-100 flex items-center justify-center p-4 sm:p-8 font-['Be_Vietnam_Pro']">
<div class="bg-white rounded-3xl shadow-xl p-6 sm:p-10 max-w-lg w-full">
    <h2 class="text-2xl sm systematic-text-3xl font-bold text-center text-gray-900 mb-6">Hoàn thiện thông tin cá nhân</h2>
    <c:if test="${not empty error}">
        <p class="text-red-600 text-center text-sm mb-6 bg-red-50 p-3 rounded-lg">${error}</p>
    </c:if>
    <form id="profileForm" action="/complete-profile" method="post" class="space-y-6">
        <!-- Email -->
        <div>
            <label for="email" class="block text-sm font-medium text-gray-700 mb-1.5">Email</label>
            <div class="relative">
                <input
                        type="email"
                        id="email"
                        name="email"
                        value="${param.email != null ? param.email : user.email}"
                        required
                        class="block w-full pl-10 pr-4 py-3 border border-gray-200 rounded-lg bg-white text-sm text-gray-900 focus:ring-2 focus:ring-blue-600 focus:border-blue-600 transition-all duration-300 shadow-sm"
                        placeholder="Nhập email của bạn"
                >
                <i class="fa-solid fa-envelope absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
            </div>
            <span class="field-error text-red-600 text-xs mt-1.5 hidden" id="emailError"></span>
        </div>

        <!-- Phone -->
        <div>
            <label for="phone" class="block text-sm font-medium text-gray-700 mb-1.5">Số điện thoại</label>
            <div class="relative">
                <input
                        type="tel"
                        id="phone"
                        name="phone"
                        value="${param.phone != null ? param.phone : user.phone}"
                        required
                        class="block w-full pl-10 pr-4 py-3 border border-gray-200 rounded-lg bg-white text-sm text-gray-900 focus:ring-2 focus:ring-blue-600 focus:border-blue-600 transition-all duration-300 shadow-sm"
                        placeholder="Nhập số điện thoại"
                >
                <i class="fa-solid fa-phone absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
            </div>
            <span class="field-error text-red-600 text-xs mt-1.5 hidden" id="phoneError"></span>
        </div>

        <!-- Address -->
        <div>
            <label for="address" class="block text-sm font-medium text-gray-700 mb-1.5">Địa chỉ</label>
            <div class="relative">
                <input
                        type="text"
                        id="address"
                        name="address"
                        value="${param.address != null ? param.address : user.address}"
                        required
                        class="block w-full pl-10 pr-4 py-3 border border-gray-200 rounded-lg bg-white text-sm text-gray-900 focus:ring-2 focus:ring-blue-600 focus:border-blue-600 transition-all duration-300 shadow-sm"
                        placeholder="Nhập địa chỉ"
                >
                <i class="fa-solid fa-location-dot absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
            </div>
        </div>

        <!-- Birthtime -->
        <div>
            <label for="birthtime" class="block text-sm font-medium text-gray-700 mb-1.5">Ngày sinh</label>
            <div class="relative">
                <input
                        type="datetime-local"
                        id="birthtime"
                        name="birthtime"
                        value="${param.birthtime != null ? param.birthtime : (user.birthtime != null ? user.birthtime.toString().substring(0,16) : '')}"
                        required
                        class="block w-full pl-10 pr-4 py-3 border border-gray-200 rounded-lg bg-white text-sm text-gray-900 focus:ring-2 focus:ring-blue-600 focus:border-blue-600 transition-all duration-300 shadow-sm"
                >
                <i class="fa-solid fa-calendar absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
            </div>
        </div>

        <!-- Sex -->
        <div>
            <label for="sex" class="block text-sm font-medium text-gray-700 mb-1.5">Giới tính</label>
            <div class="relative">
                <select
                        id="sex"
                        name="sex"
                        required
                        class="block w-full pl-10 pr-4 py-3 border border-gray-200 rounded-lg bg-white text-sm text-gray-900 focus:ring-2 focus:ring-blue-600 focus:border-blue-600 transition-all duration-300 shadow-sm appearance-none"
                >
                    <option value="1" ${param.sex == '1' || user.sex == 1 ? 'selected' : ''}>Nam</option>
                    <option value="2" ${param.sex == '2' || user.sex == 2 ? 'selected' : ''}>Nữ</option>
                    <option value="0" ${param.sex == '0' || user.sex == 0 ? 'selected' : ''}>Khác</option>
                </select>
                <i class="fa-solid fa-user absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
            </div>
        </div>

        <!-- Submit Button -->
        <button
                type="submit"
                class="w-full py-3.5 bg-gradient-to-r from-blue-200 to-indigo-300 text-black font-semibold rounded-lg hover:from-blue-300 hover:to-indigo-400 transition-all duration-300 transform hover:-translate-y-0.5 shadow-md flex items-center justify-center space-x-2"
                data-flowbite="button"
        >
            <i class="fa-solid fa-check"></i>
            <span>Cập nhật</span>
        </button>

    </form>
</div>

<!-- Flowbite JS CDN -->
<script src="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js"></script>

<script>
    $(document).ready(function() {
        // Hàm kiểm tra định dạng email
        function validateEmail(email) {
            const emailRegex = /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
            return emailRegex.test(email);
        }

        // Hàm kiểm tra định dạng số điện thoại
        function validatePhone(phone) {
            const phoneRegex = /^0[0-9]{9}$/;
            return phoneRegex.test(phone);
        }

        // Kiểm tra email khi rời khỏi input
        $("input[name='email']").on("blur", function() {
            const email = $(this).val().trim();
            const $emailError = $("#emailError");

            if (email === "") {
                $emailError.text("Email không được để trống.").show();
            } else if (!validateEmail(email)) {
                $emailError.text("Email không đúng định dạng.").show();
            } else {
                $emailError.hide().text("");
            }
        });

        // Kiểm tra số điện thoại khi rời khỏi input
        $("input[name='phone']").on("blur", function() {
            const phone = $(this).val().trim();
            const $phoneError = $("#phoneError");

            if (phone === "") {
                $phoneError.text("Số điện thoại không được để trống.").show();
            } else if (!validatePhone(phone)) {
                if (phone.length !== 10) {
                    $phoneError.text("Số điện thoại phải có đúng 10 chữ số.").show();
                } else {
                    $phoneError.text("Số điện thoại không đúng định dạng (phải bắt đầu bằng 0).").show();
                }
            } else {
                $phoneError.hide().text("");
            }
        });

        // Kiểm tra lại khi gửi form để đảm bảo không bỏ sót lỗi
        $("#profileForm").on("submit", function(event) {
            // Reset các thông báo lỗi trước khi kiểm tra
            $(".field-error").hide().text("");

            let hasError = false;

            // Lấy giá trị email và số điện thoại
            const email = $("input[name='email']").val().trim();
            const phone = $("input[name='phone']").val().trim();

            // Kiểm tra email
            if (email === "") {
                $("#emailError").text("Email không được để trống.").show();
                hasError = true;
            } else if (!validateEmail(email)) {
                $("#emailError").text("Email không đúng định dạng.").show();
                hasError = true;
            }

            // Kiểm tra số điện thoại
            if (phone === "") {
                $("#phoneError").text("Số điện thoại không được để trống.").show();
                hasError = true;
            } else if (!validatePhone(phone)) {
                if (phone.length !== 10) {
                    $("#phoneError").text("Số điện thoại phải có đúng 10 chữ số.").show();
                } else {
                    $phoneError.text("Số điện thoại không đúng định dạng (phải bắt đầu bằng 0).").show();
                }
                hasError = true;
            }

            // Nếu có lỗi, ngăn form gửi đi
            if (hasError) {
                event.preventDefault();
            }
        });
    });
</script>
</body>
</html>