<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 22/05/2025
  Time: 12:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Quản lý OutOfStcok</title>

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
  <!-- Alpine Plugins -->
  <script defer src="https://cdn.jsdelivr.net/npm/@alpinejs/mask@3.x.x/dist/cdn.min.js"></script>

  <!-- Alpine Core -->
  <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
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
            <a href="#" class="f-bold f-s-25 breadcumb-text">Quản lý Xuất kho</a>
          </div>
        </div>
        <div class="funcvouchertype">
          <div class="button bg_green f-cl-white" id="add" data-micromodal-trigger="add_modal">Xuất hàng</div>
        </div>
      </nav>
      <div class="product-table table _4c _6r">
        <table id="outofstock" class="display compact" style="width:100%">
          <thead>
          <tr>
            <th>Id</th>
            <th>Ngày tạo</th>
            <th>Người nhập</th>
            <th>Ngày update</th>
            <th>Thể loại</th>
            <th>Chức năng</th>
            <th>Kích hoạt</th>
          </tr>
          </thead>
        </table>
      </div>
    </div>
  </div>



  <div class="modal micromodal-slide" id="add_modal" aria-hidden="true">
    <div class="modal__overlay" tabindex="-1" data-micromodal-close>
      <div class="modal__container" style="max-width: 900px;" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
        <header class="modal__header">
          <h2 class="modal__title" id="add_title">
            Thêm
          </h2>
          <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
        </header>
        <div class="modal-content-content">
          <div class="modal__content">
            <div class="modal__content" x-data="changeSelectToText">
              <!-- Nhập từng dòng -->
              <div class="fui-basic-input">
                <label>Sản phẩm</label>
                <template x-if="isInputText === false">
                  <select  @dblclick="toggleChangeInput" id="productId" class="input input-bordered f-s-14" style="width: 100%"></select>
                </template>
                <template x-if="isInputText">
                  <div>
                    <input  type="hidden"  x-model="dataInputID"  id="productId3"  />
                    <input  type="text" @dblclick="toggleChangeInput" x-model="dataInput" @keyup="danhsachsearch" id="productId1" class="input input-bordered f-s-14" style="width: 100%" />
                    <template x-if="isNhanText===true">
                      <ul class="custom-option-list">
                        <template x-for="color in colors" :key="color.id">
                          <li x-text="color.name" @click="nhanTen(color)"></li>
                        </template>
                      </ul>
                    </template>
                  </div>
                </template>



              </div>
              <div class="fui-basic-input">
                <label>Màu</label>
                <select id="colorId" class="input input-bordered f-s-14" style="width: 100%"></select>
              </div>
              <div class="fui-basic-input">
                <label>Số lượng</label>
                <input type="number" id="quantity" class="input input-bordered f-s-14" style="width: 100%" />
              </div>
              <div class="fui-basic-input">
                <label>Đơn giá</label>
                <input x-mask:dynamic="$money($input, ',')"  type="text" id="unitPrice" class="input input-bordered f-s-14" style="width: 100%" />
              </div>
              <div class="fui-basic-input">
                <label>Thể loại</label>
                <select id="typeId" class="input input-bordered f-s-14" style="width: 100%"></select>
              </div>
              <button id="addDetailBtn" type="button" class="button bg_green f-cl-white mt-2">Thêm dòng</button>

              <!-- DataTable hiển thị danh sách chi tiết -->
              <table id="stockInDetailTable" class="display" style="width:100%; margin-top: 20px">
                <thead>
                <tr>
                  <th>Product</th>
                  <th>Color</th>
                  <th>Quantity</th>
                  <th>Unit Price</th>
                  <th>Xóa</th>
                </tr>
                </thead>
                <tbody></tbody>
              </table>
            </div>
          </div>
          <footer class="modal__footer">
            <button class="button bg_green f-cl-white add" id="add_btn">Thêm</button>
          </footer>
        </div>
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

  <div class="modal micromodal-slide" id="modifiStockInModal" aria-hidden="true">
    <div class="modal__overlay" tabindex="-1" data-micromodal-close>
      <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
        <header class="modal__header">
          <h2 class="modal__title">Sửa loại voucher</h2>
          <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
        </header>
        <form id="OutofStockupdateForm" class="modal__content">

          <div class="fui-basic-input" style="width: 100%">
            <label for="idmodify" class="f-bold f-s-14 f-cl-black">ID</label>
            <input type="text" id="idmodify" name="id" class="input input-bordered f-s-14" readonly>
          </div>


          <div class="fui-basic-input" style="width: 100%">
            <label for="userId" class="f-bold f-s-14 f-cl-black">User ID</label>
            <input type="number" id="userId" name="userId" class="input input-bordered f-s-14" readonly  required>
          </div>
          <div class="fui-basic-input" style="width: 100%">
            <label for="userName" class="f-bold f-s-14 f-cl-black">Họ tên</label>
            <input type="text" id="userName" name="userName" class="input input-bordered f-s-14" readonly  required>
          </div>

          <div class="fui-basic-input" style="width: 100%">
            <label for="update_active" class="f-bold f-s-14 f-cl-black">Kích hoạt</label>
            <select name="update_active" id="update_active" class="input input-bordered f-s-14" required>
              <option value="true">Bật</option>
              <option value="false">Tắt</option>
            </select>
          </div>

          <!-- Thể loại phiếu nhập -->
          <div class="fui-basic-input" style="width: 100%">
            <label for="type" class="f-bold f-s-14 f-cl-black">Thể loại phiếu nhập</label>
            <select name="type" id="type" class="input input-bordered f-s-14" required>
            </select>
          </div>

          <div class="modal__actions">
            <button type="submit" class="modal__button">Xác nhận</button>
          </div>
        </form>
      </div>
    </div>
  </div>






</div>
</body>
<script src="/assets/js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
<script src="/assets/js/outofstock.js"></script>
</html>
