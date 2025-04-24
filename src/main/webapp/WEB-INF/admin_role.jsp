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
  <!-- Sweet alert 2 -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <style>
    .permission-item {
      cursor: pointer;
      padding: 5px;
      margin: 5px 0;
    }
    .permission-item:hover {
      background-color: #f0f0f0;
    }
    .resource-list {
      margin-left: 20px;
      display: none;
    }
    .resource-list.active {
      display: block;
    }
    .permission-checkbox {
      margin-right: 10px;
    }
    .resource-checkbox {
      margin-left: 20px;
      margin-top: 5px;
    }
  </style>
</head>

<body>
<div class="admin-container grid-layout">
  <jsp:include page="../view_shared/admin/admin-grid.jsp"/>

  <!-- Nội dung chính -->
  <div class="content grid-item content-grid">
    <div class="main-grid">
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
          <div class="button bg_blue f-cl-white" id="createRole" data-micromodal-trigger="create_role_modal">Tạo vai trò và tài nguyên </div>
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
                  <th>Tên quyền</th>
                  <th> Mô tả </th>
                  <th>Trạng thái</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="role" items="${roles}">
                  <tr>
                    <td>${role.name}</td>
                    <td>${role.description}</td>
                    <td>${role.status ? 'Kích hoạt' : 'Hủy'}</td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
              <div class="total-roles text-left">
                TỔNG SỐ QUYỀN: ${roles.size()}
              </div>
            </div>
          </div>

          <!-- Cột phải: Permission groups -->
          <div class="_2c">
            <h3 class="text_entry_title" id="selectedRoleName">Chọn một quyền để xem vai trò và tài nguyên.</h3>
            <div class="card">
              <div class="title-icon">
                <div class="action-buttons">
                  <div class="button bg_orange f-cl-white" data-micromodal-trigger="modify_role_modal">Chỉnh sửa vai trò và tài nguyên </div>
<%--                  <div class="button bg_red f-cl-white" data-micromodal-trigger="delete_role_modal">Xóa vai trò và tài nguyên</div>--%>
                </div>
              </div>
              <h4> Các vai trò và tài nguyên </h4>
              <div id="permissionGroups">
                <!-- Permissions sẽ được cập nhật qua AJAX -->
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
          <h2 class="modal__title" id="create_role_title">Tạo Vai Trò và Tài Nguyên</h2>
          <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
        </header>
        <div class="modal-content-content">
          <div class="modal__content">
            <div class="fui-basic-input" style="width: 100%">
              <label for="role_select" class="f-bold f-s-14 f-cl-black">Chọn Role</label>
              <select name="role_select" id="role_select" class="input input-bordered f-s-14" required>
                <option value="">Chọn một role</option>
                <c:forEach var="role" items="${roles}">
                  <option value="${role.id}">${role.name}</option>
                </c:forEach>
              </select>
            </div>
            <div class="fui-basic-input" style="width: 100%">
              <label class="f-bold f-s-14 f-cl-black">Chọn Quyền</label>
              <div id="permissions_list">
                <!-- Permissions sẽ được tải qua AJAX -->
              </div>
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
          <h2 class="modal__title" id="modify_role_title">Chỉnh sửa Vai Trò và Tài Nguyên</h2>
          <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
        </header>
        <div class="modal-content-content">
          <div class="modal__content">
            <div class="fui-basic-input" style="width: 100%">
              <label for="modify_role_select" class="f-bold f-s-14 f-cl-black">Chọn Role</label>
              <select name="modify_role_select" id="modify_role_select" class="input input-bordered f-s-14" disabled>
                <c:forEach var="role" items="${roles}">
                  <option value="${role.id}">${role.name}</option>
                </c:forEach>
              </select>
            </div>
            <div class="fui-basic-input" style="width: 100%">
              <label class="f-bold f-s-14 f-cl-black">Chọn Quyền</label>
              <div id="modify_permissions_list">
                <!-- Permissions sẽ được tải qua AJAX -->
              </div>
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
<%--  <div class="modal micromodal-slide" id="delete_role_modal" aria-hidden="true">--%>
<%--    <div class="modal__overlay" tabindex="-1" data-micromodal-close>--%>
<%--      <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">--%>
<%--        <header class="modal__header">--%>
<%--          <h2 class="modal__title">Xóa Role</h2>--%>
<%--          <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>--%>
<%--        </header>--%>
<%--        <div class="modal-content-content">--%>
<%--          <div class="modal__content">--%>
<%--            <p>Bạn có chắc chắn muốn xóa role này không?</p>--%>
<%--          </div>--%>
<%--          <footer class="modal__footer">--%>
<%--            <button class="button bg_red f-cl-white" id="delete_role_btn">Xóa</button>--%>
<%--          </footer>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
<script src="/assets/js/script.js"></script>
<script src="/assets/js/notification.js"></script>
<script src="/assets/js/accordion.js"></script>
<script src="/assets/js/exitfFunc.js"></script>

<script>
  $(document).ready(function() {
    // Khởi tạo Notyf
    const notyf = new Notyf();

    // Khởi tạo DataTable
    $('#rolesTable').DataTable({
      responsive: true,
      select: true,
      pageLength: 10
    });

    // Xử lý khi chọn một row trong bảng roles
    $('#rolesTable').on('select.dt', function(e, dt, type, indexes) {
      var rowData = dt.rows(indexes).data().toArray();
      var roleName = rowData[0][0]; // Lấy tên role từ cột đầu tiên

      // Cập nhật tiêu đề role được chọn
      $('#selectedRoleName').text(roleName);

      // Gửi AJAX để lấy permissions của role
      $.ajax({
        url: '/admin/role/api',
        method: 'GET',
        data: { roleName: roleName },
        success: function(response) {
          if (response.success) {
            updatePermissionsUI(response.permissions);
          } else {
            notyf.error('Không thể tải quyền: ' + response.error);
            $('#permissionGroups').html('<p>Không có quyền nào cho role này.</p>');
          }
        },
        error: function(xhr, status, error) {
          var errorMessage = xhr.responseJSON ? xhr.responseJSON.error : error;
          notyf.error('Lỗi khi tải quyền của role: ' + errorMessage);
        }
      });
    });

    // Hàm cập nhật giao diện permissions
    function updatePermissionsUI(permissions) {
      var permissionNames = [...new Set(permissions.map(perm => perm.permissionName))];
      var html = '';
      permissionNames.forEach(function(permName) {
        html += '<div class="permission-group">';
        html += '<h4 class="permission-item" data-permission="' + permName + '"><i class="fa-solid fa-chevron-down"></i> ' + permName + '</h4>';
        html += '<div class="resource-list" id="resources-' + permName.replace(/[^a-zA-Z0-9]/g, '') + '">';
        html += '</div>';
        html += '</div>';
      });

      if (permissionNames.length === 0) {
        html = '<p>Không có quyền nào cho role này.</p>';
      }

      $('#permissionGroups').html(html);

      $('.permission-item').on('click', function() {
        var permName = $(this).data('permission');
        var resourceListId = '#resources-' + permName.replace(/[^a-zA-Z0-9]/g, '');

        if ($(resourceListId).hasClass('active')) {
          $(resourceListId).removeClass('active');
          return;
        }

        var resources = permissions
                .filter(perm => perm.permissionName === permName)
                .map(perm => perm.resourceName);

        var resourceHtml = '';
        resources.forEach(function(resource) {
          resourceHtml += '<div class="resource-item">' + resource + '</div>';
        });

        $(resourceListId).html(resourceHtml).addClass('active');
      });
    }

    // Xử lý khi mở modal tạo role
    $('#createRole').on('click', function() {
      $.ajax({
        url: '/admin/role/api/permissions',
        method: 'GET',
        success: function(response) {
          if (response.success) {
            updatePermissionsModal(response.permissions);
          } else {
            notyf.error('Không thể tải danh sách quyền: ' + response.error);
          }
        },
        error: function(xhr, status, error) {
          var errorMessage = xhr.responseJSON ? xhr.responseJSON.error : error;
          notyf.error('Lỗi khi tải danh sách quyền: ' + errorMessage);
        }
      });
    });

    // Hàm cập nhật danh sách permissions trong modal
    function updatePermissionsModal(permissions) {
      var html = '';
      permissions.forEach(function(perm) {
        html += '<div class="permission-group">';
        html += '<label><input type="checkbox" class="permission-checkbox" value="' + perm.id + '" data-permission-id="' + perm.id + '"> ' + perm.name + '</label>';
        html += '<div class="resource-list" id="resources-create-' + perm.id + '"></div>';
        html += '</div>';
      });
      $('#permissions_list').html(html);

      $('.permission-checkbox').on('change', function() {
        var permId = $(this).data('permission-id');
        var resourceListId = '#resources-create-' + permId;

        if ($(this).is(':checked')) {
          $.ajax({
            url: '/admin/role/api/resources',
            method: 'GET',
            success: function(response) {
              if (response.success) {
                var resourceHtml = '';
                response.resources.forEach(function(resource) {
                  resourceHtml += '<label class="resource-checkbox"><input type="checkbox" name="resources[' + permId + '][]" value="' + resource.id + '"> ' + resource.name + '</label><br>';
                });
                $(resourceListId).html(resourceHtml).addClass('active');
              } else {
                notyf.error('Không thể tải danh sách tài nguyên: ' + response.error);
              }
            },
            error: function(xhr, status, error) {
              var errorMessage = xhr.responseJSON ? xhr.responseJSON.error : error;
              notyf.error('Lỗi khi tải danh sách tài nguyên: ' + errorMessage);
            }
          });
        } else {
          $(resourceListId).html('').removeClass('active');
        }
      });
    }

    // Xử lý khi nhấn nút Tạo
    $('#create_role_btn').on('click', function() {
      var roleIdStr = $('#role_select').val();
      var roleId = parseInt(roleIdStr);

      // Kiểm tra roleId hợp lệ
      if (!roleIdStr || isNaN(roleId) || roleId <= 0) {
        notyf.error('Vui lòng chọn một vai trò hợp lệ');
        return;
      }

      var permissions = [];

      $('.permission-checkbox:checked').each(function() {
        var permIdStr = $(this).val();
        var permId = parseInt(permIdStr);
        var resources = [];
        $('input[name="resources[' + permId + '][]"]:checked').each(function() {
          var resourceId = parseInt($(this).val());
          if (!isNaN(resourceId) && resourceId > 0) {
            resources.push(resourceId.toString()); // Chuyển resourceId thành chuỗi
          }
        });
        if (resources.length > 0 && !isNaN(permId) && permId > 0) {
          permissions.push({
            permissionId: permId.toString(), // Chuyển permissionId thành chuỗi
            resourceIds: resources
          });
        }
      });

      if (permissions.length === 0) {
        notyf.error('Vui lòng chọn ít nhất một quyền và tài nguyên');
        return;
      }

      // Tạo payload JSON
      var payload = {
        roleId: roleId.toString(), // Chuyển roleId thành chuỗi
        permissions: permissions
      };

      // Gửi AJAX để tạo role-resource-permission
      $.ajax({
        url: '/admin/role/api/create',
        method: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(payload),
        success: function(response) {
          if (response.success) {
            Swal.fire({
              icon: 'success',
              title: 'Thành công',
              text: 'Tạo vai trò và tài nguyên thành công',
              confirmButtonText: 'OK'
            }).then(() => {
              MicroModal.close('create_role_modal');
              location.reload();
            });
          } else {
            Swal.fire({
              icon: 'error',
              title: 'Lỗi',
              text: 'Lỗi khi tạo vai trò và tài nguyên: ' + response.error
            });
          }
        },
        error: function(xhr, status, error) {
          var errorMessage = xhr.responseJSON ? xhr.responseJSON.error : error;
          Swal.fire({
            icon: 'error',
            title: 'Lỗi',
            text: 'Lỗi khi tạo vai trò và tài nguyên: ' + errorMessage
          });
        }
      });

    });

    // Xử lý khi mở modal chỉnh sửa
    $('[data-micromodal-trigger="modify_role_modal"]').on('click', function() {
      var selectedRow = $('#rolesTable').DataTable().rows({ selected: true }).data();
      if (selectedRow.length === 0) {
        notyf.error('Vui lòng chọn một vai trò để chỉnh sửa');
        return;
      }

      var roleName = selectedRow[0][0]; // Lấy tên role từ cột đầu tiên

      // Tìm roleId từ danh sách roles
      var roleId = null;
      <c:forEach var="role" items="${roles}">
      if ("${role.name}" === roleName) {
        roleId = "${role.id}";
      }
      </c:forEach>

      if (!roleId) {
        notyf.error('Không tìm thấy vai trò');
        return;
      }

      // Cập nhật roleId vào modal
      $('#modify_role_select').val(roleId);

      // Tải permissions hiện tại của role
      $.ajax({
        url: '/admin/role/api',
        method: 'GET',
        data: { roleName: roleName },
        success: function(response) {
          if (response.success) {
            // Tải danh sách tất cả permissions
            $.ajax({
              url: '/admin/role/api/permissions',
              method: 'GET',
              success: function(permResponse) {
                if (permResponse.success) {
                  updateModifyPermissionsModal(permResponse.permissions, response.permissions, roleId);
                } else {
                  notyf.error('Không thể tải danh sách quyền: ' + permResponse.error);
                }
              },
              error: function(xhr, status, error) {
                var errorMessage = xhr.responseJSON ? xhr.responseJSON.error : error;
                notyf.error('Lỗi khi tải danh sách quyền: ' + errorMessage);
              }
            });
          } else {
            notyf.error('Không thể tải quyền hiện tại: ' + response.error);
          }
        },
        error: function(xhr, status, error) {
          var errorMessage = xhr.responseJSON ? xhr.responseJSON.error : error;
          notyf.error('Lỗi khi tải quyền hiện tại: ' + errorMessage);
        }
      });
    });

    // Hàm cập nhật danh sách permissions trong modal chỉnh sửa
    function updateModifyPermissionsModal(allPermissions, currentPermissions, roleId) {
      var html = '';
      allPermissions.forEach(function(perm) {
        html += '<div class="permission-group">';
        // Kiểm tra xem permission này có trong currentPermissions không
        var isChecked = currentPermissions.some(function(currentPerm) {
          return currentPerm.permissionId === perm.id;
        });
        html += '<label><input type="checkbox" class="permission-checkbox" value="' + perm.id + '" data-permission-id="' + perm.id + '" ' + (isChecked ? 'checked' : '') + '> ' + perm.name + '</label>';
        html += '<div class="resource-list" id="modify-resources-' + perm.id + '"></div>';
        html += '</div>';
      });
      $('#modify_permissions_list').html(html);

      // Tải resources cho các permission đã chọn
      $('.permission-checkbox').each(function() {
        var permId = $(this).data('permission-id');
        var resourceListId = '#modify-resources-' + permId;

        if ($(this).is(':checked')) {
          loadResourcesForPermission(permId, resourceListId, currentPermissions);
        }
      });

      $('.permission-checkbox').on('change', function() {
        var permId = $(this).data('permission-id');
        var resourceListId = '#modify-resources-' + permId;

        if ($(this).is(':checked')) {
          loadResourcesForPermission(permId, resourceListId, currentPermissions);
        } else {
          $(resourceListId).html('').removeClass('active');
        }
      });
    }

    // Hàm tải resources cho permission
    function loadResourcesForPermission(permId, resourceListId, currentPermissions) {
      $.ajax({
        url: '/admin/role/api/resources',
        method: 'GET',
        success: function(response) {
          if (response.success) {
            var resourceHtml = '';
            response.resources.forEach(function(resource) {
              // Kiểm tra xem resource này có trong currentPermissions không
              var isResourceChecked = currentPermissions.some(function(currentPerm) {
                return currentPerm.permissionId === permId && currentPerm.resourceId === resource.id;
              });
              resourceHtml += '<label class="resource-checkbox"><input type="checkbox" name="resources[' + permId + '][]" value="' + resource.id + '" ' + (isResourceChecked ? 'checked' : '') + '> ' + resource.name + '</label><br>';
            });
            $(resourceListId).html(resourceHtml).addClass('active');
          } else {
            notyf.error('Không thể tải danh sách tài nguyên: ' + response.error);
          }
        },
        error: function(xhr, status, error) {
          var errorMessage = xhr.responseJSON ? xhr.responseJSON.error : error;
          notyf.error('Lỗi khi tải danh sách tài nguyên: ' + errorMessage);
        }
      });
    }

    // Xử lý khi nhấn nút Cập nhật
    $('#modify_role_btn').on('click', function() {
      var roleIdStr = $('#modify_role_select').val();
      var roleId = parseInt(roleIdStr);

      // Kiểm tra roleId hợp lệ
      if (!roleIdStr || isNaN(roleId) || roleId <= 0) {
        notyf.error('Vai trò không hợp lệ');
        return;
      }

      var permissions = [];

      $('.permission-checkbox:checked').each(function() {
        var permIdStr = $(this).val();
        var permId = parseInt(permIdStr);
        var resources = [];
        $('input[name="resources[' + permId + '][]"]:checked').each(function() {
          var resourceId = parseInt($(this).val());
          if (!isNaN(resourceId) && resourceId > 0) {
            resources.push(resourceId.toString());
          }
        });
        if (resources.length > 0 && !isNaN(permId) && permId > 0) {
          permissions.push({
            permissionId: permId.toString(),
            resourceIds: resources
          });
        }
      });

      // Tạo payload JSON
      var payload = {
        roleId: roleId.toString(),
        permissions: permissions
      };

      // Gửi AJAX để cập nhật role-resource-permission
      $.ajax({
        url: '/admin/role/api/update',
        method: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(payload),
        success: function(response) {
          if (response.success) {
            Swal.fire({
              icon: 'success',
              title: 'Thành công',
              text: 'Cập nhật vai trò và tài nguyên thành công',
              confirmButtonText: 'OK'
            }).then(() => {
              MicroModal.close('modify_role_modal');
              location.reload();
            });
          } else {
            Swal.fire({
              icon: 'error',
              title: 'Lỗi',
              text: 'Lỗi khi cập nhật vai trò và tài nguyên: ' + response.error
            });
          }
        },
        error: function(xhr, status, error) {
          var errorMessage = xhr.responseJSON ? xhr.responseJSON.error : error;
          Swal.fire({
            icon: 'error',
            title: 'Lỗi',
            text: 'Lỗi khi cập nhật vai trò và tài nguyên: ' + errorMessage
          });
        }
      });
    });
  });
</script>

</body>
</html>