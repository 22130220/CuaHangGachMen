<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 02/05/2025
  Time: 7:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Quản lý stockin</title>

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
  <style>
    .modal__button {
      background-color: #4fe613; /* màu xanh dương hiện đại */
      color: white;
      font-size: 16px;
      font-weight: 600;
      padding: 10px 24px;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.25s ease, transform 0.15s ease;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .modal__button:hover {
      background-color: #2563eb; /* xanh đậm hơn khi hover */
      transform: translateY(-1px);
    }

    .modal__button:active {
      background-color: #1d4ed8;
      transform: translateY(1px);
    }
    .btn-detail {
      cursor: pointer;
    }
    #stockInDetailTable {
      width: 100%;
      border-collapse: collapse;
      border: 1px solid #ccc;
      font-size: 14px;
    }

    #stockInDetailTable th,
    #stockInDetailTable td {
      border: 1px solid #ccc;
      padding: 8px 12px;
      text-align: center;
    }

    #stockInDetailTable thead {
      background-color: #f3f4f6; /* xám nhẹ */
      font-weight: 600;
    }

    #stockInDetailTable tbody tr:nth-child(even) {
      background-color: #fafafa;
    }

    #stockInDetailTable tbody tr:hover {
      background-color: #e0f2fe; /* xanh nhạt khi hover */
    }

    ul.custom-option-list {
      border: 1px solid #ccc;
      border-radius: 4px;
      max-height: 200px;
      overflow-y: auto;
      padding: 0;
      margin-top: 4px;
      list-style: none;
      background-color: white;
      box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }

    ul.custom-option-list li {
      padding: 10px 14px;
      cursor: pointer;
      transition: background-color 0.2s ease;
    }

    ul.custom-option-list li:hover {
      background-color: #f3f4f6; /* giống hover của option */
    }

    ul.custom-option-list li:active {
      background-color: #e5e7eb; /* nhấn giữ */
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
            <a href="#" class="f-bold f-s-25 breadcumb-text">Quản lý stockIn</a>
          </div>
        </div>
        <div class="funcvouchertype">
          <div class="button bg_green f-cl-white" id="add" data-micromodal-trigger="add_modal">Nhập hàng</div>
        </div>
      </nav>
      <div class="product-table table _4c _6r">
        <table id="stockin" class="display compact" style="width:100%">
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
</div>




<div class="modal micromodal-slide" id="userNhapModal" aria-hidden="true">
  <div class="modal__overlay" tabindex="-1" data-micromodal-close>
    <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-userNhap-title">
      <header class="modal__header">
        <h2 class="modal__title" id="modal-userNhap-title">Người nhập</h2>
        <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
      </header>
      <div class="modal__content">
        <div id="user-id">Mã người dùng: </div>
        <div id="user-name">Tên: </div>
        <div id="user-email">Email: </div>
      </div>
    </div>
  </div>
</div>
<div class="modal micromodal-slide" id="typeModal" aria-hidden="true">
  <div class="modal__overlay" tabindex="-1" data-micromodal-close>
    <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
      <header class="modal__header">
        <h2 class="modal__title">Thể loại phiếu  nhập</h2>
        <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
      </header>
      <div class="modal__content">
        <div id="type-id">Mã thể loại: </div>
        <div id="type-name">Tên: </div>
      </div>
    </div>
  </div>
</div>

<div class="modal micromodal-slide" id="phieuChiTietModal" aria-hidden="true">
  <div class="modal__overlay" tabindex="-1" data-micromodal-close>
    <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
      <header class="modal__header">
        <h2 class="modal__title">Chi tiết của phiếu nhập</h2>
        <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
      </header>
      <div class="modal__content">
        <table id="stockindetail" class="display compact" style="width:100%">
          <thead>
          <tr>
            <th>Id</th>
            <th>stockId</th>
            <th>productName</th>
            <th>ColorName</th>
            <th>Số lượng</th>
            <th>Unit price</th>
            <th>tổng tiền</th>
          </tr>
          </thead>
        </table>
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
      <form id="StockinupdateForm" class="modal__content">
        <!-- ID (readonly) -->
        <div class="fui-basic-input" style="width: 100%">
          <label for="idmodify" class="f-bold f-s-14 f-cl-black">ID</label>
          <input type="text" id="idmodify" name="id" class="input input-bordered f-s-14" readonly>
        </div>

        <!-- User ID -->
        <div class="fui-basic-input" style="width: 100%">
          <label for="userId" class="f-bold f-s-14 f-cl-black">User ID</label>
          <input type="number" id="userId" name="userId" class="input input-bordered f-s-14" readonly  required>
        </div>
        <!-- Kích hoạt -->
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

</div>






</body>
<script src="/assets/js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
<script>




  document.addEventListener('alpine:init', () => {
    Alpine.data('changeSelectToText', () => ({
      isInputText: true,
      isNhanText: true,
      colors: [
      ],
      dataInput: '',
      dataInputID: '',
      danhsachsearch() {
        if (!this.dataInput || this.dataInput.trim() === '') {
          this.colors = []; // reset nếu input trống
          return;
        }
        this.isNhanText=true;

        $.ajax({
          url: `/GetDanhSanPhamSearch?data=\${this.dataInput}`,
          type: 'GET',
          success: (res) => {
            this.colors = res.data;
          },
          error: function () {
            alert("Không thể tải danh sách.");
          }
        });
      },
      nhanTen(colorIs){
        this.dataInput = colorIs.name;
        this.dataInputID=colorIs.id;
        this.isNhanText = false;
      },
      toggleChangeInput() {
        this.isInputText = !this.isInputText;
        if(this.isInputText===false){
          $.ajax({
            url: '/GetListProdudctAndColor',
            type: 'GET',
            success: function (res) {
              const productList = res.productList;
              const colorList = res.colorList;
              const typeList = res.typeList;
              const $select = $("#productId");
              $select.empty().append(`<option value="">-- Chọn sản phẩm --</option>`);
              productList.forEach(t => {
                $select.append(`<option value="\${t.id}">\${t.name}</option>`);
              });

              const $selectcolor = $("#colorId");
              $selectcolor.empty().append(`<option value="">-- Chọn màu --</option>`);
              colorList.forEach(c => {
                $selectcolor.append(`<option value="\${c.ID}">\${c.Name}</option>`);
              });

              const $selecttype = $("#typeId");
              $selecttype.empty().append(`<option value="">-- Thể loại --</option>`);
              typeList.forEach(c => {
                $selecttype.append(`<option value="\${c.id}">\${c.type}</option>`);
              });



              MicroModal.show('add_modal');
            },
            error: function () {
              alert("Không thể tải danh sách.");
            }
          });
        }
      },

    }))
  })

  let stockInDetails = [];
  let setActive = [];
  let action ='';
  let detailuser='';
  var table=new DataTable('#stockin',{
    ajax: {
      url: '/GetSetStockin',
      dataSrc: 'data'
    },
    fixedHeader: true,
    searching: true,
    layout: {
      topStart: {
        buttons: [
          'colvis',
          {
            text: 'Chỉnh Sửa',
            className: 'green',
            action: function (e, dt, node, config) {
              let data = dt.row({ selected: true }).data();
              action = 'sửa';
              vid = data.id;
              openModal3('modifiStockInModal', data.id,data.userId,data.isActive,data.typeId);
            },
            enabled: false
          },
          {
            text: 'Trạng thái',
            className: 'red',
            action: function (e, dt, node, config) {
              // console.log('Rows: ' + dt.rows({ selected: true }).count());
              var data = dt.rows({ selected: true }).data();
              setActive = [];
              data.each(function(rowData, index) {
                setActive.push(rowData.id);
              });
              console.log(setActive)
              action = 'cp';
              MicroModal.show('update_id_modal2');
            },
            enabled: false
          }
        ]
      },
    },
    select: true,
    columnDefs:  [
      {
        targets: 0,
        data: 'id',
        className: 'dt-center'
      },
      {
        targets: 1,
        data: 'createDate',
        className: 'dt-center'
      },
      {
        targets: 2,
        data: 'userName',
        className: 'dt-center',
      },
      {
        targets: 3,
        data: 'updateDate',
        className: 'dt-center'
      },
      {
        targets: 4,
        data: 'typeName',
        className: 'dt-center',
      },
      {
        targets: 5,
        data: 'id',
        className: 'dt-center',
        render:function (data,row){
          return `<i style="align-items: center" data-target="\${data}" title="Xem chi tiết"  class="fa-solid fa-file" onclick="getModel('phieuChiTietModal',\${data})"></i>`;
        }
      },
      {
        targets: 6,
        data: 'isActive',
        width: '15%',
        render: function (data) {
          if(data) {
            return `<td> <div class="isActive"> Đang bật </div> </td>`
          } else return `<td> <div class="deActive"> Đã tắt </div> </td>`
        },
        className: 'dt-center'
      },
    ],
    'autoWidth': false,
    language: {
      lengthMenu: "Hiển thị _MENU_ mục mỗi trang",
      zeroRecords: "Không tìm thấy kết quả",
      info: "Hiển thị trang _PAGE_ của _PAGES_",
      infoEmpty: "Không có dữ liệu",
      infoFiltered: "(lọc từ _MAX_ tổng mục)"
    },
    createdRow: function (row, data, dataIndex) {
      // Thêm lớp CSS để căn giữa các ô
      $('td', row).css({
        'text-align': 'center',
        'vertical-align': 'middle',
        'align-content': 'center',
      });
    }
  });
  $('table th').resizable({
    handles: 'e',
    stop: function(e, ui) {
      $(this).width(ui.size.width);
    }
  });
  table.on('select deselect', function () {
    var selectedRows = table.rows({ selected: true }).count();
    table.button(1).enable(selectedRows === 1);
    table.button(2).enable(selectedRows > 0);
  });

  const addButton = document.getElementById("add");
  if (addButton) {
    addButton.addEventListener("click", function () {

      $.ajax({
        url: '/GetListProdudctAndColor',
        type: 'GET',
        success: function (res) {
          const productList = res.productList;
          const colorList = res.colorList;
          const typeList = res.typeList;
          const $select = $("#productId");
          $select.empty().append(`<option value="">-- Chọn sản phẩm --</option>`);
          productList.forEach(t => {
            $select.append(`<option value="\${t.id}">\${t.name}</option>`);
          });

          const $selectcolor = $("#colorId");
          $selectcolor.empty().append(`<option value="">-- Chọn màu --</option>`);
          colorList.forEach(c => {
            $selectcolor.append(`<option value="\${c.ID}">\${c.Name}</option>`);
          });


          const $selecttype = $("#typeId");
          $selecttype.empty().append(`<option value="">-- Thể loại --</option>`);
          typeList.forEach(c => {
            $selecttype.append(`<option value="\${c.id}">\${c.type}</option>`);
          });




          MicroModal.show('add_modal');
        },
        error: function () {
          alert("Không thể tải danh sách.");
        }
      });
      action='Thêm';

    });
  }
  $("#addDetailBtn").on("click", function () {
    let productId = $("#productId").val();
    const productId2=$("#productId3").val();
    if (productId2 !== undefined && productId2 !== "") {
      productId = productId2;
    }
    let productText = $("#productId option:selected").text();
    const productText2=$("#productId1").val();
    if(productText2!=='' && productText2 !== undefined){
      productText =productText2;
    }
    const colorId = $("#colorId").val();
    const colorText = $("#colorId option:selected").text();
    const quantity = parseInt($("#quantity").val(), 10);
    const unitPriceRaw = $("#unitPrice").val().replace(/\./g, '');
    const unitPrice = parseFloat(unitPriceRaw);

    if (!productId || !colorId || !quantity || !unitPrice) {
      alert("Vui lòng nhập đầy đủ.");
      return;
    }

    stockInDetails.push({
      productId: parseInt(productId, 10),
      colorId: parseInt(colorId, 10),
      quantity,
      unitPrice
    });

    console.log(stockInDetails)
    const rowHtml = `
    <tr>
      <td>\${productText}</td>
      <td>\${colorText}</td>
      <td>\${quantity}</td>
      <td>\${unitPrice.toFixed(2)}</td>
      <td><button type="button" class="btn-delete">X</button></td>
    </tr>
  `;
    $("#stockInDetailTable tbody").append(rowHtml);
  });

  $("#stockInDetailTable").on("click", ".btn-delete", function () {
    const rowIndex = $(this).closest("tr").index();
    stockInDetails.splice(rowIndex, 1); // Xóa trong mảng
    $(this).closest("tr").remove();     // Xóa trong HTML
    console.log(stockInDetails)
  });
  $("#add_btn").on("click", function () {
    let typeid = document.getElementById('typeId').value;
    $.ajax({
      url: "/AddStockIn",
      method: "POST",
      contentType: "application/json",
      data: JSON.stringify({
        stockInDetails: stockInDetails,
        typeid: typeid
      }),
      success: function (response) {
        table.ajax.reload(null, false);
        stockInDetails = [];
        const notyf = new Notyf();
        $("#stockInDetailTable tbody").empty();
        MicroModal.close("add_modal");
        if (response.success) {
          table.rows().deselect();
          notyf.open({
            duration: 1000,
            position: { x: 'right', y: 'bottom' },
            type: "success",
            message: "Xuất kho thành công",
          });
          $("#productId1").val('');
          $("#quantity").val('');
          $("#unitPrice").val('');

        } else {
          table.rows().deselect();
          notyf.open({
            duration: 1000,
            position: { x: 'right', y: 'bottom' },
            type: "error",
            message: "Xuất kho không thành công",
          });
        }
      },
      error: function () {
        alert("Có lỗi khi lưu dữ liệu.");
      }
    });
  });


  function openModal(modalSelector,id) {

    $.ajax({
      url: '/GetUserById',
      type: 'GET',
      data: { id: id },
      success: function(resp) {
        if(resp.status){
          $('#user-id').text("Mã người dùng: " + resp.id);
          $('#user-name').text("Tên: " + resp.Name);
          $('#user-email').text("Email: " + resp.Email);
          MicroModal.show(modalSelector);
        }
      },
      error: function(xhr, status, error) {
        console.error("Lỗi khi gửi:", error);
      }
    });
  }

  function openModal2(modalSelector,id) {
    $.ajax({
      url: '/GetSetTypeOfReceipt',
      type: 'GET',
      data: { id: id },
      success: function(resp) {
        if(resp.status){
          $('#type-id').text("Mã thể loại: " + resp.id);
          $('#type-name').text("Thể loại: " + resp.Type);
          MicroModal.show(modalSelector);
        }
      },
      error: function(xhr, status, error) {
        console.error("Lỗi khi gửi:", error);
      }
    });
  }



  function getModel(modalSelector,id){
    const tableId = '#stockindetail';
    const dataUrl = '/GetSetStockInDetail';
    if ($.fn.DataTable.isDataTable(tableId)) {
      const table = $(tableId).DataTable();
      table.ajax.url(dataUrl + '?id=' + id).load();
    } else {
      var table=new DataTable('#stockindetail',{
        ajax: {
          url: dataUrl,
          data:{id:id},
          dataSrc: 'data'
        },
        fixedHeader: true,
        layout: {
          topStart: {
            buttons: [
              'colvis',
            ]
          },
        },
        select: true,
        columnDefs: [
          {
            targets: 0,
            data: 'id',
            className: 'dt-center'
          },
          {
            targets: 1,
            data: 'stockId',
            className: 'dt-center'
          },
          {
            targets: 2,
            data: 'productName',
            className: 'dt-center',
          },
          {
            targets: 3,
            data: 'colorName',
            className: 'dt-center'
          },
          {
            targets: 4,
            data: 'quantity',
            className: 'dt-center'
          },
          {
            targets: 5,
            data: 'unitPrice',
            className: 'dt-center'
          },
          {
            targets: 6,
            data: 'totalPrice',
            className: 'dt-center'
          },

        ],
        'autoWidth': false,
        language: {
          lengthMenu: "Hiển thị _MENU_ mục mỗi trang",
          zeroRecords: "Không tìm thấy kết quả",
          info: "Hiển thị trang _PAGE_ của _PAGES_",
          infoEmpty: "Không có dữ liệu",
          infoFiltered: "(lọc từ _MAX_ tổng mục)"
        },
        createdRow: function (row, data, dataIndex) {
          // Thêm lớp CSS để căn giữa các ô
          $('td', row).css({
            'text-align': 'center',
            'vertical-align': 'middle',
            'align-content': 'center',
          });
        }
      });

    }
    MicroModal.show(modalSelector);
  }
  function openModal3(modalSelector, id, userId,isActive, typeId ) {
    $.ajax({
      url: "/GetAllTypeOfReceipt",
      method: "GET",
      success: function (typeList) {
        const $select = $("#type");
        $select.empty();
        $select.append(`<option value="">-- Chọn thể loại --</option>`);
        typeList.forEach(t => {
          $select.append(`<option value="\${t.id}">\${t.type}</option>`);
        });
        $("#idmodify").val(id);
        $("#userId").val(userId);
        $("#update_active").val(isActive ? "true" : "false");
        $select.val(typeId);
        MicroModal.show(modalSelector);
      },
      error: function () {
        alert("Không thể tải danh sách thể loại phiếu nhập.");
      }
    });
  }

  $(document).ready(function () {
    $('#StockinupdateForm').on('submit', function (e) {
      e.preventDefault();

      let formData = $(this).serializeArray(); // Đây là array
      formData.push({ name: 'action', value: action });
      $.ajax({
        url: '/GetSetStockin',
        type: 'POST',
        data: formData,
        success: function (response) {
          MicroModal.close('modifiStockInModal');

          const notyf = new Notyf();
          if (response.success) {
            table.rows().deselect();
            notyf.open({
              duration: 1000,
              position: { x: 'right', y: 'bottom' },
              type: "success",
              message: "Sửa thành công",
            });
            table.ajax.reload(null, false);
          } else {
            table.rows().deselect();
            notyf.open({
              duration: 1000,
              position: { x: 'right', y: 'bottom' },
              type: "error",
              message: "Sửa không thành công",
            });
          }
        },
        error: function (xhr, status, error) {
          console.error('Lỗi khi Sửa:', error);
          const notyf = new Notyf();
          table.rows().deselect();
          notyf.open({
            duration: 1000,
            position: { x: 'right', y: 'bottom' },
            type: "error",
            message: "Có lỗi xảy ra khi sửa",
          });
        }
      });
    });
  });

  $("#update_id_btn3").on('click', function () {
    const active = $("#update_active_id").val();
    console.log(setActive)
    $.ajax({
      url: '/GetSetStockin',
      type: 'POST',
      traditional: true,
      data: {
        id: setActive,
        active: active,
        action: action

      },
      success: function (data) {
        MicroModal.close('update_id_modal2');
        const notyf = new Notyf();
        if(data.success) {
          notyf.success( " thành công");
          table.ajax.reload();
          table.rows().deselect();
        } else {
          notyf.error(" thất bại");
          table.rows().deselect();
        }
      },
      error: function () {
        MicroModal.close('update_id_modal2');
        const notyf = new Notyf();
        notyf.error(" thất bại");
      }
    })
  });




</script>


















</html>
