<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hoàn thiện thông tin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
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
    <form action="/complete-profile" method="post">
        <label>Email:</label>
        <input type="email" name="email" value="${user.email}" required><br>
        <label>Số điện thoại:</label>
        <input type="tel" name="phone" value="${user.phone}" required><br>
        <label>Địa chỉ:</label>
        <input type="text" name="address" value="${user.address}" required><br>
        <label>Ngày sinh:</label>
        <input type="datetime-local" name="birthtime" value="${user.birthtime != null ? user.birthtime.toString().substring(0,16) : ''}" required><br>
        <label>Giới tính:</label>
        <select name="sex" required>
            <option value="1" ${user.sex == 1 ? 'selected' : ''}>Nam</option>
            <option value="2" ${user.sex == 2 ? 'selected' : ''}>Nữ</option>
            <option value="0" ${user.sex == 0 ? 'selected' : ''}>Khác</option>
        </select><br>
        <input type="submit" value="Cập nhật">
    </form>
</div>
</body>
</html>