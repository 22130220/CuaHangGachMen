<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết Quả Xác Thực</title>
    <link rel="icon" type="image/x-icon" href="../assets/icons/logo2_no_text.svg"/>
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
</head>
<body class="min-h-screen bg-gray-50 flex items-center justify-center p-4 sm:p-6 font-['Be_Vietnam_Pro']">
<div class="bg-white rounded-2xl shadow-2xl p-8 sm:p-12 max-w-lg w-full text-center transform transition-all">
    <!-- Icon -->
    <i class="fa-solid fa-info-circle text-6xl text-green-500 mb-6"></i>
    <!-- Title -->
    <h2 class="text-3xl sm:text-4xl font-bold text-gray-800 mb-4">Kết Quả Xác Thực</h2>
    <!-- Message -->
    <p class="text-gray-600 text-lg sm:text-xl mb-8 leading-relaxed">${message}</p>
    <!-- Login Button with Flowbite styling -->
    <a
            href="/login"
            class="inline-flex items-center justify-center bg-green-600 text-white font-semibold py-3 px-8 rounded-lg hover:bg-green-700 transition-colors duration-300 ease-in-out text-lg"
            data-flowbite="button"
    >
        <i class="fa-solid fa-right-to-bracket mr-2"></i>
        Đăng nhập tại đây
    </a>
</div>
<!-- Flowbite JS CDN -->
<script src="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js"></script>
</body>
</html>