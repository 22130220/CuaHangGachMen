
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <style>
    .user-menu {
      display: flex;
      align-items: center;
      position: relative;
      cursor: pointer;
    }

    .user-info {
      display: flex;
      align-items: center;
      padding: 10px;
      border-radius: 50px;
      background-color: #ffffff;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      transition: box-shadow 0.3s ease, transform 0.3s ease;
      border: 1px solid #333;
    }

    .user-info:hover {
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
      transform: scale(1.05);
    }

    .avatar {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 12px;
    }

    .username {
      font-size: 16px;
      font-weight: 600;
      color: #333;
    }

    .dropdown {
      position: absolute;
      top: 63px;
      right: 0;
      display: none;
      background-color: #fff;
      border-radius: 8px;
      border: 1px solid #e0e0e0;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      z-index: 10;
      opacity: 0;
      transform: translateY(-10px);
      transition: opacity 0.3s ease, transform 0.3s ease;

      width: 200px;
      left: -5px;
    }

    .dropdown ul {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .dropdown ul li {
      padding: 12px 16px;
      border-bottom: 1px solid #f1f1f1;
    }

    .dropdown ul li:last-child {
      border-bottom: none;
    }

    .dropdown ul li a {
      text-decoration: none;
      color: #333;
      font-weight: 500;
      transition: color 0.2s ease;
    }

    .dropdown ul li a:hover {
      color: #007bff;
    }

    .user-info:hover + .dropdown,
    .dropdown:hover {
      display: block;
      opacity: 1;
      transform: translateY(0);
    }


  </style>
</head>
<body>
<div class="button-container">


  <!-- Messenger button -->
  <div class="contact-button2 messenger" id="messenger">
    <svg width="25" height="25" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path fill-rule="evenodd" clip-rule="evenodd" d="M7 15.9013V18.9951L12.0622 16.0038L12.5913 15.9951C14.6952 15.9607 16.5886 15.7488 18.0044 15.5334C18.8979 15.3975 19.5187 14.7739 19.6536 13.9909C19.8406 12.9049 20 11.5289 20 10C20 8.47108 19.8406 7.09512 19.6536 6.00907C19.5187 5.22608 18.8979 4.60252 18.0044 4.46657C16.4559 4.23096 14.3383 4 12 4C9.66167 4 7.54408 4.23096 5.99562 4.46657C5.10214 4.60252 4.4813 5.22608 4.34643 6.00907C4.15936 7.09512 4 8.47108 4 10C4 11.5289 4.15936 12.9049 4.34643 13.9909C4.46355 14.6709 4.93854 15.2158 5.63108 15.4461L7 15.9013ZM2.37546 5.66957C2.66565 3.98488 4.00472 2.74648 5.69477 2.48932C7.31411 2.24293 9.53559 2 12 2C14.4644 2 16.6859 2.24293 18.3052 2.48932C19.9953 2.74648 21.3344 3.98488 21.6245 5.66957C21.8268 6.84372 22 8.33525 22 10C22 11.6647 21.8268 13.1563 21.6245 14.3304C21.3344 16.0151 19.9953 17.2535 18.3052 17.5107C16.8238 17.7361 14.8384 17.9586 12.6241 17.9949L6.50873 21.6085C5.84211 22.0024 5 21.5219 5 20.7476V17.344C3.64656 16.8939 2.62456 15.7766 2.37546 14.3304C2.17321 13.1563 2 11.6647 2 10C2 8.33525 2.17321 6.84372 2.37546 5.66957Z" fill="currentColor"/>
      <path fill-rule="evenodd" clip-rule="evenodd" d="M7 7C6.44772 7 6 7.44772 6 8C6 8.55228 6.44772 9 7 9H17C17.5523 9 18 8.55228 18 8C18 7.44772 17.5523 7 17 7H7ZM7 11C6.44772 11 6 11.4477 6 12C6 12.5523 6.44772 13 7 13H11C11.5523 13 12 12.5523 12 12C12 11.4477 11.5523 11 11 11H7Z" fill="currentColor"/>
    </svg>


    <!-- Hộp thoại chat hiện lên khi click hoặc hover -->
    <div class="chat-box" id="chat-box">
      <!-- Header -->
      <div class="chat-header">
        <div class="chat-avatar">
          <img src="assets/icons/logo2_no_text.svg" alt="Avatar">
        </div>
        <div class="chat-title">
          <h3>Hỗ Trợ Khách Hàng</h3>
          <p>Đang trực tuyến</p>
        </div>
        <button id="chat-close" class="chat-close">×</button>
      </div>

      <!-- Messages -->
      <div id="chat-messages" class="chat-messages">
        <div class="message bot">
          <img src="assets/icons/logo2_no_text.svg" alt="Bot Avatar">
          <div class="message-content">
            <p>Chào bạn! Mình có thể giúp gì cho bạn?</p>
            <span>10:00 AM</span>
          </div>
        </div>
        <div class="message user">
          <img src="assets/icons/logo2_no_text.svg" alt="" style="display: none;">

        </div>
      </div>

      <!-- Input -->
      <div class="chat-input">
        <textarea id="user-input" placeholder="Nhập tin nhắn..."></textarea>
        <button id="send-btn">Gửi</button>
      </div>
    </div>
  </div>
  <script src="assets/js/chatbox.js"></script>
  <script src="assets/js/chat.js"></script>
</div>

<div onclick="scrollToTop()" class="scrollTop">
  <i class="fa-solid fa-arrow-up"></i>
</div>

<div class="noibatdautien">
  <div class="main-content">
    <div class="noibat">
      <div class="gioithieu">Cửa hàng gạch men Thủ Đức</div>
      <!-- Điều hướng -->
      <nav class="nav">
        <ul>

          <li>
            <a href="https://mail.google.com/mail/?view=cm&fs=1&to=22130188@st.hcmuaf.edu.vn&su=Yêu cầu hỗ trợ&body=Chào bạn, tôi cần hỗ trợ vấn đề sau..." target="_blank">Email: cuahanggachmen@gmail.com</a>
          </li>
          <li>
            <a href="https://zalo.me/0376272024" target="_blank">Hotline: 0376272024</a>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</div>


<!-- Đầu trang -->
<header class="header fixed">
  <div class="main-content">
    <div class="body">
      <!-- Logo -->
      <a href="/">
        <img
                src="assets/icons/logo2.svg"
                alt="Logo"
                class="logo"
        />
      </a>

      <!-- Thanh tìm kiếm -->
      <div class="search-bar" style="position: relative;">
        <input type="text" id="searchInput"  placeholder="Tìm kiếm sản phẩm..."
               autocomplete="off"/>
        <i   id="searchIcon"  class="fa-solid fa-magnifying-glass search-icon"  title="Tìm kiếm"
             style="cursor: pointer !important;"></i>

        <!-- Hộp lịch sử (history) -->
        <div id="suggestionsBox" class="suggestions-box"></div>

        <div id="productbox1" class="suggestions-box"></div>
      </div>

      <!-- Nếu chưa đăng nhập, chỉ hiển thị nút Đăng Nhập -->
      <c:if test="${empty sessionScope.auth}">
        <div class="action">
          <a href="login" class="btn sign-up-btn">Đăng Nhập</a>
        </div>
      </c:if>

      <!-- Nếu đã đăng nhập, chỉ hiển thị giao diện người dùng -->
      <c:if test="${not empty sessionScope.auth}">
        <div class="user-menu">
          <div class="user-info">
            <img src="${sessionScope.auth.avatar != null ? sessionScope.auth.avatar : 'https://via.placeholder.com/150'}"
                 alt="Avatar" class="avatar">
            <span class="username">${sessionScope.auth.fullname}</span>
          </div>
          <div class="dropdown">
            <ul>
              <li><a href="/profile">Tài khoản của tôi</a></li>
              <li><a href="completeorderhistory">Đơn mua</a></li>
              <li><a href="logout">Đăng xuất</a></li>
            </ul>
          </div>
        </div>
      </c:if>

        <c:choose>
          <c:when test="${!sessionScope.userRole.havePermission('user.cart', 4)}">
            <h1>Không có quyền</h1>
          </c:when>
          <c:otherwise>
            <a href="cart" class="cart-button">
              <svg
                      class="icon"
                      width="30"
                      height="30"
                      viewBox="0 0 24 24"
                      fill="none"
                      xmlns="http://www.w3.org/2000/svg"
              >
                <path
                        fill-rule="evenodd"
                        clip-rule="evenodd"
                        d="M10 20C10 21.6569 8.65685 23 7 23C5.34315 23 4 21.6569 4 20C4 18.3431 5.34315 17 7 17C8.65685 17 10 18.3431 10 20ZM8 20C8 20.5523 7.55228 21 7 21C6.44772 21 6 20.5523 6 20C6 19.4477 6.44772 19 7 19C7.55228 19 8 19.4477 8 20Z"
                        fill="#2e2100ff"
                />
                <path
                        fill-rule="evenodd"
                        clip-rule="evenodd"
                        d="M20 20C20 21.6569 18.6569 23 17 23C15.3431 23 14 21.6569 14 20C14 18.3431 15.3431 17 17 17C18.6569 17 20 18.3431 20 20ZM18 20C18 20.5523 17.5523 21 17 21C16.4477 21 16 20.5523 16 20C16 19.4477 16.4477 19 17 19C17.5523 19 18 19.4477 18 20Z"
                        fill="#2e2100ff"
                />
                <path
                        fill-rule="evenodd"
                        clip-rule="evenodd"
                        d="M2.10557 2.55276C2.35256 2.05878 2.95323 1.85856 3.44721 2.10555L4.45072 2.6073C5.37999 3.07193 6.0027 3.98429 6.09676 5.01898L6.1446 5.54524C6.16801 5.80278 6.38394 5.99997 6.64255 5.99997H19.8355C21.581 5.99997 22.7892 7.74341 22.1763 9.37778L20.423 14.0533C19.9839 15.2243 18.8645 16 17.614 16H7.82643C6.27482 16 4.97922 14.8168 4.83875 13.2716L4.10497 5.20005C4.07362 4.85515 3.86605 4.55103 3.55629 4.39616L2.55278 3.8944C2.05881 3.64741 1.85858 3.04674 2.10557 2.55276ZM6.91527 7.99997C6.62126 7.99997 6.39071 8.25243 6.41733 8.54524L6.83053 13.0905C6.87736 13.6056 7.30922 14 7.82643 14H17.614C18.0308 14 18.404 13.7414 18.5503 13.3511L20.3037 8.67554C20.4262 8.34866 20.1846 7.99997 19.8355 7.99997H6.91527Z"
                        fill="#2e2100ff"
                />
              </svg>
              <!-- Giả sử chúng ta hiển thị count trên 1 "badge" nhỏ -->
              <span class="cart-count">
        <c:out value="${empty sessionScope.quantity ? 0 : sessionScope.quantity}"/>
    </span>
            </a>
          </c:otherwise>
        </c:choose>
          <!-- Hiển thị value (List<permissionId>) -->
<%--          <td>--%>
<%--            <c:forEach var="permissionId" items="${entry.value}" varStatus="loop">--%>
<%--              ${permissionId}<c:if test="${!loop.last}">,</c:if>--%>
<%--            </c:forEach>--%>
<%--          </td>--%>

      <!-- Cart Button -->
    </div>
  </div>
</header>

<div class="noibatthu3">
  <div class="main-content">
    <div class="noibat2">
      <!-- Điều hướng -->
      <nav class="nav">
        <ul>
          <li>
            <a href="/introduction">GIỚI THIỆU</a>
          </li>
          <li class="has-dropdown">
            <a href="#">THƯƠNG HIỆU</a>
            <div class="dropdown">
              <ul>
                <c:forEach var="manufacturerwithstatus" items="${manufacturers}">
                  <li>
                    <a href="list-product?thuonghieu=${manufacturerwithstatus.id}">${manufacturerwithstatus.name}</a>
                  </li>
                </c:forEach>
              </ul>
            </div>

          <li class="has-dropdown">
            <a href="list-product">DANH MỤC</a>
            <div class="dropdown">
              <ul>
                <!-- Lặp qua danh sách danh mục từ cơ sở dữ liệu -->
                <c:forEach var="category" items="${categories}">
                  <li>
                    <a href="list-product?danhmuc=${category.id}">${category.name}</a>
                  </li>
                </c:forEach>
              </ul>
            </div>
          </li>
          <li>
            <a href="list-product?danhmuc=1">GẠCH LÁT SÀN</a>
          </li>
          <li>
            <a href="list-product?danhmuc=2">GẠCH ỐP TƯỜNG</a>
          </li>

          <li class="has-dropdown">
            <a href="list-product">CHẤT LIỆU GẠCH</a>
            <div class="dropdown">
              <ul>
                <!-- Lặp qua danh sách danh mục từ cơ sở dữ liệu -->
                <c:forEach var="materialwithstatus" items="${sessionScope.materials}">
                  <li>
                    <a href="list-product?chatlieu=${materialwithstatus.id}">${materialwithstatus.name}</a>
                  </li>
                </c:forEach>
              </ul>
            </div>
          </li>

          <li>
            <a href="./store.html">CỬA HÀNG</a>
          </li>
          <li>
            <a href="/AboutController">LIÊN HỆ</a>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</div>
</body>
<script src="assets/js/scrollTop.js"></script>
<script></script>
<%--<script>--%>
<%--  document.getElementById("searchInput").addEventListener("blur", function() {--%>
<%--    var query = this.value.trim();--%>

<%--    // Kiểm tra nếu có giá trị nhập vào--%>
<%--    if (query) {--%>
<%--      // Gửi yêu cầu tới servlet qua fetch--%>
<%--      fetch(`/yourServletPath?query=${encodeURIComponent(query)}`)--%>
<%--              .then(response => response.json())--%>
<%--              .then(data => {--%>
<%--                // Xử lý kết quả trả về--%>
<%--                displaySearchResults(data);--%>
<%--              })--%>
<%--              .catch(error => console.error("Error fetching data: ", error));--%>
<%--    } else {--%>
<%--      // Nếu không có gì nhập vào, ẩn kết quả tìm kiếm--%>
<%--      document.getElementById("searchResults").innerHTML = "";--%>
<%--    }--%>
<%--  });--%>

<%--  function displaySearchResults(data) {--%>
<%--    const resultsContainer = document.getElementById("searchResults");--%>
<%--    resultsContainer.innerHTML = ""; // Làm sạch kết quả cũ--%>

<%--    if (data && data.length > 0) {--%>
<%--      data.forEach(item => {--%>
<%--        const resultItem = document.createElement("div");--%>
<%--        resultItem.classList.add("result-item");--%>
<%--        resultItem.textContent = item.name; // Hoặc thuộc tính tương ứng từ JSON--%>
<%--        resultsContainer.appendChild(resultItem);--%>
<%--      });--%>
<%--    } else {--%>
<%--      resultsContainer.innerHTML = "<p>No results found</p>";--%>
<%--    }--%>
<%--  }--%>
<%--</script>--%>
</html>
