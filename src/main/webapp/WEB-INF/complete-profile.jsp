<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Hoàn thiện thông tin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 75vh;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }

        .container {
            background: #fff;
            padding: 30px;
            border-radius: 11.25px;
            box-shadow: 0 7.5px 22.5px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 375px;
        }

        h2 {
            text-align: center;
            margin-bottom: 15px;
            color: #333;
            font-weight: 600;
            letter-spacing: 0.75px;
            font-size: 18px;
        }

        .error {
            color: #e74c3c;
            text-align: center;
            margin-bottom: 10px;
            font-size: 10.5px;
        }

        .field-error {
            color: #e74c3c;
            font-size: 10.5px;
            margin-top: 2px;
            display: none;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        label {
            font-size: 10.5px;
            color: #555;
            font-weight: 500;
        }

        input[type="email"],
        input[type="text"],
        input[type="datetime-local"],
        input[type="tel"],
        select {
            width: 100%;
            padding: 7px 9px;
            border: 0.75px solid #ddd;
            border-radius: 6px;
            font-size: 10.5px;
            color: #333;
            background: #f9f9f9;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="submit"] {
            padding: 7px;
            background: linear-gradient(90deg, #3498db, #2980b9);
            border: none;
            border-radius: 6px;
            color: #fff;
            font-size: 12px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(90deg, #2980b9, #1f6391);
            transform: translateY(-1.5px);
        }

        input[type="submit"]:active {
            transform: translateY(0);
        }

        @media (max-width: 480px) {
            .container {
                padding: 15px;
                margin: 15px;
            }

            h2 {
                font-size: 18px;
            }

            input[type="submit"] {
                font-size: 10.5px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Hoàn thiện thông tin cá nhân</h2>
    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>
    <form id="profileForm" action="/complete-profile" method="post">
        <label>Email:</label>
        <input type="email" name="email" value="${param.email != null ? param.email : user.email}" required>
        <span class="field-error" id="emailError"></span>

        <label>Số điện thoại:</label>
        <input type="tel" name="phone" value="${param.phone != null ? param.phone : user.phone}" required>
        <span class="field-error" id="phoneError"></span>

        <label>Địa chỉ:</label>
        <input type="text" name="address" value="${param.address != null ? param.address : user.address}" required>

        <label>Ngày sinh:</label>
        <input type="datetime-local" name="birthtime" value="${param.birthtime != null ? param.birthtime : (user.birthtime != null ? user.birthtime.toString().substring(0,16) : '')}" required>

        <label>Giới tính:</label>
        <select name="sex" required>
            <option value="1" ${param.sex == '1' || user.sex == 1 ? 'selected' : ''}>Nam</option>
            <option value="2" ${param.sex == '2' || user.sex == 2 ? 'selected' : ''}>Nữ</option>
            <option value="0" ${param.sex == '0' || user.sex == 0 ? 'selected' : ''}>Khác</option>
        </select>

        <input type="submit" value="Cập nhật">
    </form>
</div>

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
                    $("#phoneError").text("Số điện thoại không đúng định dạng (phải bắt đầu bằng 0).").show();
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