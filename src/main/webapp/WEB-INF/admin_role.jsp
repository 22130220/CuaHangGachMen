<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Quản lý Role</title>

  <!-- Reset CSS -->
  <link rel="stylesheet" href="/assets/css/reset.css" />

  <!-- Favicon -->
  <link rel="icon" type="image/x-icon" href="/assets/icons/logo2_no_text.svg">

  <!-- Nhúng phông chữ -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js" integrity="sha512-6sSYJqDreZRZGkJ3b+YfdhB3MzmuP9R7X1QZ6g5aIXhRvR1Y/N/P47jmnkENm7YL3oqsmI6AK+V6AD99uWDnIw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

  <!-- CSS -->
  <link rel="stylesheet" href="/assets/css/style.css" />
  <link rel="stylesheet" href="/assets/css/admin-ruleset.css">
  <link rel="stylesheet" href="/assets/css/basicinput.css">
  <link rel="stylesheet" href="/assets/css/InputViaIcon.css">
  <link rel="stylesheet" href="/assets/css/admin-manageproduct.css">
  <link rel="stylesheet" href="/assets/css/notification.css">
  <link rel="stylesheet" href="/assets/css/arccordion.css">
  <link rel="stylesheet" href="/assets/css/product-detail.css">

  <!-- DataTable -->
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

  <!-- jQuery UI -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/jquery-ui.min.js" integrity="sha512-MSOo1aY+3pXCOCdGAYoBZ6YGI0aragoQsg1mKKBHXCYPIWxamwOE7Drh+N5CPgGI5SA9IEKJiPjdfqWFWmZtRA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/themes/base/jquery-ui.min.css" integrity="sha512-TFee0335YRJoyiqz8hA8KV3P0tXa5CpRBSoM0Wnkn7JoJx1kaq1yXL/rb8YFpWXkMOjRcv5txv+C6UluttluCQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/themes/base/theme.min.css" integrity="sha512-lfR3NT1DltR5o7HyoeYWngQbo6Ec4ITaZuIw6oAxIiCNYu22U5kpwHy9wAaN0vvBj3U6Uy2NNtAfiaKcDxfhTg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- MicroModal -->
  <script src="https://cdn.jsdelivr.net/npm/micromodal/dist/micromodal.min.js"></script>
  <link rel="stylesheet" href="/assets/css/micromodal.css">

  <!-- Notyf -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
</head>

<body>
<div class="admin-container grid-layout">
  <jsp:include page="../view_shared/admin/admin-grid.jsp"/>

  <!-- Nội dung chính -->
  <div class="content grid-item content-grid">
    <div class="main-grid">
      <!-- Thanh điều hướng -->
      <nav class="navbar tag-line _4c _1r">
        <div class="nav-back-prev">
          <div class="breadcumb">
            <div class="breadcumb-icon f-s-25">
              <i class="fa-solid fa-user-shield"></i>
            </div>
            <a href="#" class="f-bold f-s-25 breadcumb-text">Quản lý Role</a>
          </div>
        </div>
        <div class="funcproduct">
          <div class="button bg_blue f-cl-white" id="createRole" data-micromodal-trigger="create_role_modal">Tạo Role</div>
        </div>
      </nav>

      <!-- Bảng danh sách roles và permissions -->
      <div class="table _4c _6r">
        <div class="main-grid flex-row gap-20">
          <!-- Cột trái: Danh sách roles -->
          <div class="_2c">
            <div class="card">
              <table id="rolesTable" class="display" style="width:100%">
                <thead>
                <tr>
                  <th>Role Name</th>
                  <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>App Admin</td>
                  <td>Cannot be modified</td>
                </tr>
                <tr>
                  <td>Backup Only</td>
                  <td>Cannot be modified</td>
                </tr>
                <tr>
                  <td>Restore Only</td>
                  <td>Cannot be modified</td>
                </tr>
                <tr>
                  <td>SYSADMIN</td>
                  <td>Cannot be modified</td>
                </tr>

                <tr class="selected">
                  <td>roleTier1</td>
                  <td>
                    Cannot be modified
                  </td>
                </tr>

                </tbody>
              </table>
              <div class="total-roles text-left">
                TOTAL: 5
              </div>
            </div>
          </div>

          <!-- Cột phải: Permission groups -->
          <div class="_2c">
            <h3 class="text_entry_title">roleTier1</h3>
            <div class="card">

              <div class="title-icon">

                <div class="action-buttons">
                  <div class="button bg_orange f-cl-white" data-micromodal-trigger="modify_role_modal">Modify role</div>
                  <div class="button bg_red f-cl-white" data-micromodal-trigger="delete_role_modal">Delete role</div>
                </div>
              </div>
              <h4>Permission groups</h4>
              <div class="permission-group">
                <h4><i class="fa-solid fa-chevron-down"></i> Job</h4>
                <div class="permission-items">
                  <div class="permission-item">
                    <span class="sos">view</span>
                    <span>roleTier</span>
                  </div>
                  <div class="permission-item">
                    <span class="sos">run</span>
                    <span>roleTier</span>
                  </div>
                </div>
              </div>
              <div class="permission-group">
                <h4><i class="fa-solid fa-chevron-down"></i> Screen</h4>
                <div class="permission-items">
                  <div class="permission-item">
                    <span class="sos">view</span>
                    <span>roleTier1</span>
                  </div>
                </div>
              </div>
              <div class="permission-group">
                <h4><i class="fa-solid fa-chevron-down"></i> Site</h4>
                <div class="permission-items">
                  <div class="permission-item">
                    <span class="sos">create</span>
                    <span>roleTier1</span>
                  </div>
                  <div class="permission-item">
                    <span class="sos">view</span>
                    <span>roleTier2</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal: Create Role -->
  <div class="modal micromodal-slide" id="create_role_modal" aria-hidden="true">
    <div class="modal__overlay" tabindex="-1" data-micromodal-close>
      <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
        <header class="modal__header">
          <h2 class="modal__title" id="create_role_title">Tạo Role Mới</h2>
          <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
        </header>
        <div class="modal-content-content">
          <div class="modal__content">
            <div class="fui-basic-input" style="width: 100%">
              <label for="role_name" class="f-bold f-s-14 f-cl-black">Tên Role</label>
              <input type="text" name="role_name" placeholder="Nhập tên role" class="input input-bordered f-s-14" style="width: 100%" id="role_name" autocomplete="off" required/>
            </div>
            <div class="fui-basic-input" style="width: 100%">
              <label for="role_permissions" class="f-bold f-s-14 f-cl-black">Quyền</label>
              <select name="role_permissions" id="role_permissions" class="input input-bordered f-s-14" multiple required>
                <option value="job_view">Job - View</option>
                <option value="job_run">Job - Run</option>
                <option value="screen_view">Screen - View</option>
                <option value="site_create">Site - Create</option>
                <option value="site_view">Site - View</option>
              </select>
            </div>
          </div>
          <footer class="modal__footer">
            <button class="button bg_green f-cl-white" id="create_role_btn">Tạo</button>
          </footer>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal: Modify Role -->
  <div class="modal micromodal-slide" id="modify_role_modal" aria-hidden="true">
    <div class="modal__overlay" tabindex="-1" data-micromodal-close>
      <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
        <header class="modal__header">
          <h2 class="modal__title" id="modify_role_title">Chỉnh sửa Role</h2>
          <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
        </header>
        <div class="modal-content-content">
          <div class="modal__content">
            <div class="fui-basic-input" style="width: 100%">
              <label for="modify_role_name" class="f-bold f-s-14 f-cl-black">Tên Role</label>
              <input type="text" name="modify_role_name" placeholder="Nhập tên role" class="input input-bordered f-s-14" style="width: 100%" id="modify_role_name" autocomplete="off" required/>
            </div>
            <div class="fui-basic-input" style="width: 100%">
              <label for="modify_role_permissions" class="f-bold f-s-14 f-cl-black">Quyền</label>
              <select name="modify_role_permissions" id="modify_role_permissions" class="input input-bordered f-s-14" multiple required>
                <option value="job_view">Job - View</option>
                <option value="job_run">Job - Run</option>
                <option value="screen_view">Screen - View</option>
                <option value="site_create">Site - Create</option>
                <option value="site_view">Site - View</option>
              </select>
            </div>
          </div>
          <footer class="modal__footer">
            <button class="button bg_green f-cl-white" id="modify_role_btn">Cập nhật</button>
          </footer>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal: Delete Role -->
  <div class="modal micromodal-slide" id="delete_role_modal" aria-hidden="true">
    <div class="modal__overlay" tabindex="-1" data-micromodal-close>
      <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
        <header class="modal__header">
          <h2 class="modal__title">Xóa Role</h2>
          <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
        </header>
        <div class="modal-content-content">
          <div class="modal__content">
            <p>Bạn có chắc chắn muốn xóa role này không?</p>
          </div>
          <footer class="modal__footer">
            <button class="button bg_red f-cl-white" id="delete_role_btn">Xóa</button>
          </footer>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
<script src="/assets/js/script.js"></script>
<script src="/assets/js/notification.js"></script>
<script src="/assets/js/accordion.js"></script>
<script src="/assets/js/exitfFunc.js"></script>

<!-- JavaScript để xử lý DataTable, accordion và các sự kiện -->
<script>
  $(document).ready(function () {
    // Khởi tạo DataTable cho bảng roles
    $('#rolesTable').DataTable({
      "paging": true,
      "searching": true,
      "ordering": true,
      "info": false,
      "responsive": true,
      "select": {
        style: 'single'
      },
      "dom": 'frt', // Chỉ hiển thị tìm kiếm (f), bảng (t), và sắp xếp (r)
      "language": {
        "search": "Tìm kiếm role theo tên:"
      }
    });

    // Xử lý sự kiện click vào hàng trong bảng để hiển thị permissions
    $('#rolesTable tbody').on('click', 'tr', function (e) {
      // Ngăn sự kiện click trên nút lan truyền lên hàng
      if ($(e.target).closest('.action-buttons').length) {
        return;
      }
      $(this).addClass('selected').siblings().removeClass('selected');
      // Ở đây bạn có thể thêm logic để tải permissions của role được chọn
      // Ví dụ: Gọi API để lấy permissions và cập nhật cột bên phải
    });

    // Xử lý accordion cho permission groups
    $('.permission-group h4').on('click', function () {
      const $parent = $(this).parent();
      const $items = $parent.find('.permission-items');
      const $icon = $(this).find('i');

      if ($items.is(':hidden')) {
        $items.slideDown();
        $parent.addClass('active');
        $icon.removeClass('fa-chevron-down').addClass('fa-chevron-up');
      } else {
        $items.slideUp();
        $parent.removeClass('active');
        $icon.removeClass('fa-chevron-up').addClass('fa-chevron-down');
      }
    });

    // Xử lý menu gập/mở (từ mã trước đó)
    $('.sidebar-button.has-subitems').each(function () {
      const $parentItem = $(this);
      const $subItems = $parentItem.next('.subitems');
      const $toggleIcon = $parentItem.find('.toggle-icon');

      const isMenuOpen = localStorage.getItem('accountsMenuOpen') === 'true';
      if (isMenuOpen) {
        $subItems.show();
        $toggleIcon.addClass('active');
      } else {
        $subItems.hide();
        $toggleIcon.removeClass('active');
      }

      $parentItem.on('click', function (event) {
        if ($subItems.is(':hidden')) {
          $subItems.slideDown();
          $toggleIcon.addClass('active');
          localStorage.setItem('accountsMenuOpen', 'true');
        } else {
          $subItems.slideUp();
          $toggleIcon.removeClass('active');
          localStorage.setItem('accountsMenuOpen', 'false');
        }
      });
    });

    $('.subitems .sidebar-button.subitem').on('click', function (event) {
      event.stopPropagation();
    });
  });
</script>

</body>
</html>