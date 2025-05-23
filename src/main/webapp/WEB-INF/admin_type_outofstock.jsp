<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 23/05/2025
  Time: 12:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Quản lý thể loại xuất kho </title>

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
  <link rel="stylesheet" href="/assets/css/InputViaIcon.css">
  <link rel="stylesheet" href="/assets/css/admin-manageproduct.css">
  <link rel="stylesheet" href="/assets/css/notification.css">
  <link rel="stylesheet" href="/assets/css/arccordion.css">
  <link rel="stylesheet" href="/assets/css/product-detail.css">

  <!-- Thêm Datatable-->
  <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/responsive/3.0.3/css/responsive.dataTables.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/4.0.1/css/fixedHeader.dataTables.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/3.2.0/css/buttons.dataTables.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/select/2.1.0/css/select.dataTables.css">

  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
  <script src="https://cdn.datatables.net/responsive/3.0.3/js/dataTables.responsive.js"></script>
  <script src="https://cdn.datatables.net/responsive/3.0.3/js/responsive.dataTables.js"></script>
  <script src="https://cdn.datatables.net/fixedheader/4.0.1/js/dataTables.fixedHeader.js"></script>
  <script src="https://cdn.datatables.net/fixedheader/4.0.1/js/fixedHeader.dataTables.js"></script>
  <script src="https://cdn.datatables.net/buttons/3.2.0/js/dataTables.buttons.js"></script>
  <script src="https://cdn.datatables.net/buttons/3.2.0/js/buttons.dataTables.js"></script>
  <script src="https://cdn.datatables.net/buttons/3.2.0/js/buttons.colVis.min.js"></script>
  <script src="https://cdn.datatables.net/select/2.1.0/js/dataTables.select.js"></script>
  <script src="https://cdn.datatables.net/select/2.1.0/js/select.dataTables.js"></script>

  <!-- Jquery UI-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/jquery-ui.min.js" integrity="sha512-MSOo1aY+3pXCOCdGAYoBZ6YGI0aragoQsg1mKKBHXCYPIWxamwOE7Drh+N5CPgGI5SA9IEKJiPjdfqWFWmZtRA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/themes/base/jquery-ui.min.css" integrity="sha512-TFee0335YRJoyiqz8hA8KV3P0tXa5CpRBSoM0Wnkn7JoJx1kaq1yXL/rb8YFpWXkMOjRcv5txv+C6UluttluCQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/themes/base/theme.min.css" integrity="sha512-lfR3NT1DltR5o7HyoeYWngQbo6Ec4ITaZuIw6oAxIiCNYu22U5kpwHy9wAaN0vvBj3U6Uy2NNtAfiaKcDxfhTg==" crossorigin="anonymous" referrerpolicy="no-referrer" />


  <!--Micromodal.js-->
  <script src="https://cdn.jsdelivr.net/npm/micromodal/dist/micromodal.min.js"></script>
  <link rel="stylesheet" href="/assets/css/micromodal.css">

  <!--Notyf-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">

  <!-- Sweet alert 2 -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <style>
    div.container {
      max-width: 1200px;
    }
    .modal__field {
      margin-bottom: 1rem;
    }

    .modal__input {
      width: 100%;
      padding: 10px 14px;
      font-size: 1.1rem; /* tăng cỡ chữ khi nhập */
      border: 1px solid #ccc;
      border-radius: 8px;
      outline: none;
      transition: border 0.2s;
    }

    .modal__input::placeholder {
      font-size: 1.1rem; /* tăng cỡ placeholder */
      color: #aaa;
    }

    .modal__input:focus {
      border-color: #3cb371; /* xanh lá nhẹ */
      box-shadow: 0 0 0 3px rgba(60, 179, 113, 0.2);
    }

    .modal__button {
      background-color: #3cb371; /* xanh lá */
      color: #fff;
      border: none;
      padding: 12px 20px;
      font-size: 1.1rem; /* tăng cỡ chữ nút */
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.2s;
    }

    .modal__button:hover {
      background-color: #34a863;
    }
  </style>

</head>
<body>
<div class="admin-container grid-layout">
  <jsp:include page="../view_shared/admin/admin-grid.jsp"/>
  <div class="content grid-item content-grid">
    <div class="main-grid">
      <nav class="navbar tag-line _4c _1r">
        <div class="nav-back-prev">
          <div class="breadcumb">
            <div class="breadcumb-icon f-s-25">
              <i class="fa-regular fa-envelope"></i>
            </div>
            <a href="#" class="f-bold f-s-25 breadcumb-text">Quản lý Thể loại nhập kho</a>
          </div>
        </div>
        <div class="funcvouchertype">
          <div class="button bg_green f-cl-white" id="add" data-micromodal-trigger="addOutOfStockTypeModal">Thêm mới</div>
        </div>
      </nav>
      <div class="product-table table _4c _6r">
        <table id="outofstocktp" class="display compact" style="width:100%">
          <thead>
          <tr>
            <th>Id</th>
            <th>Thể loại</th>
            <th>Trạng thái</th>
          </tr>
          </thead>
        </table>
      </div>
    </div>
  </div>
</div>

<div class="modal micromodal-slide" id="addOutOfStockTypeModal" aria-hidden="true">
  <div class="modal__overlay" tabindex="-1" data-micromodal-close>
    <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
      <header class="modal__header">
        <h2 class="modal__title">Thêm loại nhập kho</h2>
        <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
      </header>
      <form id="addForm" class="modal__content">
        <div class="modal__field">
          <label for="modalName"><strong>Name:</strong></label>
          <input type="text" id="modalName" name="type" class="modal__input" placeholder="Nhập tên loại nhập kho" required />
        </div>
        <div class="modal__actions">
          <button type="submit" class="modal__button">Thêm</button>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal micromodal-slide" id="modifiStockinTypeModal" aria-hidden="true">
  <div class="modal__overlay" tabindex="-1" data-micromodal-close>
    <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
      <header class="modal__header">
        <h2 class="modal__title">Sửa thể loại nhập kho</h2>
        <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
      </header>
      <form id="modifyForm" class="modal__content">
        <div class="modal__field">
          <label for="modalName"><strong>Name:</strong></label>
          <input type="text" id="modalmodifyName" name="type" class="modal__input" required />
        </div>
        <input type="hidden" id="idmodify" name="id">
        <div class="fui-basic-input" style="width: 100%">
          <label for="update_active" class="f-bold f-s-14 f-cl-black">Kích hoạt</label>
          <select name="update_active" id="update_active" class="input input-bordered f-s-14" required>
            <option value="true">Bật</option>
            <option value="false">Tắt</option>
          </select>
        </div>
        <div class="modal__actions">
          <button type="submit" class="modal__button">Xác nhận</button>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal micromodal-slide" id="update_id_modal2" aria-hidden="true">
  <div class="modal__overlay" tabindex="-1" data-micromodal-close>
    <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
      <header class="modal__header">
        <h2 class="modal__title">
          Cập nhật trạng thái
        </h2>
        <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
      </header>
      <div class="modal-content-content">
        <div class="modal__content">
          <div class="fui-basic-input" style="width: 100%">
            <label for="update_active_id" class="f-bold f-s-14 f-cl-black">Kích hoạt</label>
            <select name="update_active_id" id="update_active_id" class="input input-bordered f-s-14" required>
              <option value="true">Bật</option>
              <option value="false">Tắt</option>
            </select>
          </div>
        </div>
        <footer class="modal__footer">
          <button class="button bg_green f-cl-white" id="update_id_btn3">Cập nhật</button>
        </footer>
      </div>
    </div>
  </div>
</div>

</body>
<script src="/assets/js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
<script src="/assets/js/typeoutofstock.js"></script>
</html>
