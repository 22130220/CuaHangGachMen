<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Quản lý User Role</title>

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
    .role-item {
      cursor: pointer;
      padding: 5px;
      margin: 5px 0;
    }
    .role-item:hover {
      background-color: #f0f0f0;
    }
    .role-checkbox {
      margin-right: 10px;
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
            <a href="#" class="f-bold f-s-25 breadcumb-text">Quản lý User Role</a>
          </div>
        </div>
        <div class="funcproduct">
          <div class="button bg_blue f-cl-white" id="createUserRole" data-micromodal-trigger="create_user_role_modal">Thêm vai trò cho người dùng</div>
        </div>
      </nav>

      <!-- Bảng danh sách users và roles -->
      <div class="table _4c _6r">
        <div class="main-grid flex-row gap-20">
          <!-- Cột trái: Danh sách users -->
          <div class="_2c">
            <div class="card">
              <table id="usersTable" class="display" style="width:100%">
                <thead>
                <tr>
                  <th>Email</th>
                  <th>Họ và tên</th>
                  <th>Trạng thái</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${users}">
                  <tr>
                    <td>${user.email}</td>
                    <td>${user.fullname}</td>
                    <td>${user.status ? 'Kích hoạt' : 'Hủy'}</td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
              <div class="total-users text-left">
                TỔNG SỐ NGƯỜI DÙNG: ${users.size()}
              </div>
            </div>
          </div>

          <!-- Cột phải: Danh sách roles của user -->
          <div class="_2c">
            <h3 class="text_entry_title" id="selectedUserEmail">Chọn một người dùng để xem vai trò.</h3>
            <div class="card">
              <div class="title-icon">
                <div class="action-buttons">
                  <div class="button bg_orange f-cl-white" data-micromodal-trigger="modify_user_role_modal">Chỉnh sửa vai trò</div>
                </div>
              </div>
              <h4>Các vai trò của người dùng</h4>
              <div id="roleList">
                <!-- Roles sẽ được cập nhật qua AJAX -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal: Create User Role -->
  <div class="modal micromodal-slide" id="create_user_role_modal" aria-hidden="true">
    <div class="modal__overlay" tabindex="-1" data-micromodal-close>
      <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
        <header class="modal__header">
          <h2 class="modal__title" id="create_user_role_title">Thêm Vai Trò Cho Người Dùng</h2>
          <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
        </header>
        <div class="modal-content-content">
          <div class="modal__content">
            <div class="fui-basic-input" style="width: 100%">
              <label for="user_select" class="f-bold f-s-14 f-cl-black">Chọn Người Dùng</label>
              <select name="user_select" id="user_select" class="input input-bordered f-s-14" required>
                <option value="">Chọn một người dùng</option>
                <c:forEach var="user" items="${users}">
                  <option value="${user.id}">${user.email}</option>
                </c:forEach>
              </select>
            </div>
            <div class="fui-basic-input" style="width: 100%">
              <label class="f-bold f-s-14 f-cl-black">Chọn Vai Trò</label>
              <div id="roles_list">
                <!-- Roles sẽ được tải qua AJAX -->
              </div>
            </div>
          </div>
          <footer class="modal__footer">
            <button class="button bg_green f-cl-white" id="create_user_role_btn">Thêm</button>
          </footer>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal: Modify User Role -->
  <div class="modal micromodal-slide" id="modify_user_role_modal" aria-hidden="true">
    <div class="modal__overlay" tabindex="-1" data-micromodal-close>
      <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
        <header class="modal__header">
          <h2 class="modal__title" id="modify_user_role_title">Chỉnh sửa Vai Trò</h2>
          <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
        </header>
        <div class="modal-content-content">
          <div class="modal__content">
            <div class="fui-basic-input" style="width: 100%">
              <label for="modify_user_select" class="f-bold f-s-14 f-cl-black">Chọn Người Dùng</label>
              <select name="modify_user_select" id="modify_user_select" class="input input-bordered f-s-14" disabled>
                <c:forEach var="user" items="${users}">
                  <option value="${user.id}">${user.email}</option>
                </c:forEach>
              </select>
            </div>
            <div class="fui-basic-input" style="width: 100%">
              <label class="f-bold f-s-14 f-cl-black">Chọn Vai Trò</label>
              <div id="modify_roles_list">
                <!-- Roles sẽ được tải qua AJAX -->
              </div>
            </div>
          </div>
          <footer class="modal__footer">
            <button class="button bg_green f-cl-white" id="modify_user_role_btn">Cập nhật</button>
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

<script>
  $(document).ready(function() {
    const notyf = new Notyf();

    $('#usersTable').DataTable({
      responsive: true,
      select: true,
      pageLength: 10
    });

    $('#usersTable').on('select.dt', function(e, dt, type, indexes) {
      var rowData = dt.rows(indexes).data().toArray();
      var userEmail = rowData[0][0];

      $('#selectedUserEmail').text(userEmail);

      console.log('Fetching roles for userEmail:', userEmail);

      $.ajax({
        url: '/admin/user-role/api',
        method: 'GET',
        data: { userEmail: userEmail },
        success: function(response) {
          console.log('Response from /admin/user-role/api:', response);

          try {
            if (typeof response === 'string') {
              if (response.trim() === '') {
                throw new Error('Phản hồi rỗng từ server');
              }
              response = JSON.parse(response);
            }
            if (response && response.success) {
              updateRolesUI(response.userRoles, response.users, response.roles);
            } else {
              notyf.error('Không thể tải vai trò: ' + (response.error || 'Không có dữ liệu'));
              $('#roleList').html('<p>Không có vai trò nào cho người dùng này.</p>');
            }
          } catch (e) {
            console.error('Error parsing JSON:', e);
            notyf.error('Lỗi phân tích JSON: ' + e.message);
            $('#roleList').html('<p>Lỗi khi tải dữ liệu vai trò.</p>');
          }
        },
        error: function(xhr, status, error) {
          console.error('AJAX error:', status, error);
          console.error('Response text:', xhr.responseText);
          var errorMessage = xhr.responseJSON ? xhr.responseJSON.error : error;
          notyf.error('Lỗi khi tải vai trò của người dùng: ' + errorMessage);
        }
      });
    });

    function updateRolesUI(userRoles, users, allRoles) {
      var user = users.find(u => u.email === $('#selectedUserEmail').text());
      if (!user) {
        $('#roleList').html('<p>Không tìm thấy người dùng.</p>');
        return;
      }

      var userId = user.id;
      var roles = userRoles.filter(ur => ur.userId === userId);
      var html = '';

      if (roles.length === 0) {
        html = '<p>Người dùng này chưa có vai trò nào.</p>';
      } else {
        roles.forEach(function(role) {
          var roleName = allRoles.find(r => r.id === role.roleId)?.name || 'Vai trò không xác định';
          html += '<div class="role-item">';
          html += '<span>' + roleName + '</span>';
          html += '</div>';
        });
      }

      $('#roleList').html(html);
    }

    $('#createUserRole').on('click', function() {
      console.log('Fetching roles for create modal');

      $.ajax({
        url: '/admin/user-role/api/roles',
        method: 'GET',
        success: function(response) {
          console.log('Response from /admin/user-role/api/roles:', response);

          try {
            if (typeof response === 'string') {
              if (response.trim() === '') {
                throw new Error('Phản hồi rỗng từ server');
              }
              response = JSON.parse(response);
            }
            if (response && response.success) {
              updateRolesModal(response.roles);
            } else {
              notyf.error('Không thể tải danh sách vai trò: ' + (response.error || 'Không có dữ liệu'));
            }
          } catch (e) {
            console.error('Error parsing JSON:', e);
            notyf.error('Lỗi phân tích JSON: ' + e.message);
          }
        },
        error: function(xhr, status, error) {
          console.error('AJAX error:', status, error);
          console.error('Response text:', xhr.responseText);
          var errorMessage = xhr.responseJSON ? xhr.responseJSON.error : error;
          notyf.error('Lỗi khi tải danh sách vai trò: ' + errorMessage);
        }
      });
    });

    function updateRolesModal(roles) {
      var html = '';
      roles.forEach(function(role) {
        html += '<div class="role-group">';
        html += '<label><input type="checkbox" class="role-checkbox" value="' + role.id + '" data-role-id="' + role.id + '"> ' + role.name + '</label>';
        html += '</div>';
      });
      $('#roles_list').html(html);
    }

    $('#create_user_role_btn').on('click', function() {
      var userIdStr = $('#user_select').val();
      var userId = parseInt(userIdStr);

      if (!userIdStr || isNaN(userId) || userId <= 0) {
        notyf.error('Vui lòng chọn một người dùng hợp lệ');
        return;
      }

      var roleIds = [];
      $('.role-checkbox:checked').each(function() {
        var roleId = parseInt($(this).val());
        if (!isNaN(roleId) && roleId > 0) {
          roleIds.push(roleId.toString());
        }
      });

      if (roleIds.length === 0) {
        notyf.error('Vui lòng chọn ít nhất một vai trò');
        return;
      }

      var payload = {
        userId: userId.toString(),
        roleIds: roleIds
      };

      console.log('Sending create request:', payload);

      $.ajax({
        url: '/admin/user-role/api/create',
        method: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(payload),
        success: function(response) {
          console.log('Response from /admin/user-role/api/create:', response);

          try {
            if (typeof response === 'string') {
              if (response.trim() === '') {
                throw new Error('Phản hồi rỗng từ server');
              }
              response = JSON.parse(response);
            }
            if (response && response.success) {
              Swal.fire({
                icon: 'success',
                title: 'Thành công',
                text: 'Thêm vai trò cho người dùng thành công',
                confirmButtonText: 'OK'
              }).then(() => {
                MicroModal.close('create_user_role_modal');
                location.reload();
              });
            } else {
              Swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: 'Lỗi khi thêm vai trò: ' + (response.error || 'Không xác định')
              });
            }
          } catch (e) {
            console.error('Error parsing JSON:', e);
            Swal.fire({
              icon: 'error',
              title: 'Lỗi',
              text: 'Lỗi phân tích JSON: ' + e.message
            });
          }
        },
        error: function(xhr, status, error) {
          console.error('AJAX error:', status, error);
          console.error('Response text:', xhr.responseText);
          var errorMessage = xhr.responseJSON ? xhr.responseJSON.error : error;
          Swal.fire({
            icon: 'error',
            title: 'Lỗi',
            text: 'Lỗi khi thêm vai trò: ' + errorMessage
          });
        }
      });
    });

    $('[data-micromodal-trigger="modify_user_role_modal"]').on('click', function() {
      var selectedRow = $('#usersTable').DataTable().rows({ selected: true }).data();
      if (selectedRow.length === 0) {
        notyf.error('Vui lòng chọn một người dùng để chỉnh sửa');
        return;
      }

      var userEmail = selectedRow[0][0];
      var userId = null;
      <c:forEach var="user" items="${users}">
      if ("${user.email}" === userEmail) {
        userId = "${user.id}";
      }
      </c:forEach>

      if (!userId) {
        notyf.error('Không tìm thấy người dùng');
        return;
      }

      $('#modify_user_select').val(userId);

      console.log('Fetching current roles for userEmail:', userEmail);

      $.ajax({
        url: '/admin/user-role/api',
        method: 'GET',
        data: { userEmail: userEmail },
        success: function(response) {
          console.log('Response from /admin/user-role/api:', response);

          try {
            if (typeof response === 'string') {
              if (response.trim() === '') {
                throw new Error('Phản hồi rỗng từ server');
              }
              response = JSON.parse(response);
            }
            if (response && response.success) {
              $.ajax({
                url: '/admin/user-role/api/roles',
                method: 'GET',
                success: function(roleResponse) {
                  console.log('Response from /admin/user-role/api/roles:', roleResponse);

                  try {
                    if (typeof roleResponse === 'string') {
                      if (roleResponse.trim() === '') {
                        throw new Error('Phản hồi rỗng từ server');
                      }
                      roleResponse = JSON.parse(roleResponse);
                    }
                    if (roleResponse && roleResponse.success) {
                      updateModifyRolesModal(roleResponse.roles, response.userRoles, userId);
                    } else {
                      notyf.error('Không thể tải danh sách vai trò: ' + (roleResponse.error || 'Không có dữ liệu'));
                    }
                  } catch (e) {
                    console.error('Error parsing JSON:', e);
                    notyf.error('Lỗi phân tích JSON danh sách vai trò: ' + e.message);
                  }
                },
                error: function(xhr, status, error) {
                  console.error('AJAX error:', status, error);
                  console.error('Response text:', xhr.responseText);
                  var errorMessage = xhr.responseJSON ? xhr.responseJSON.error : error;
                  notyf.error('Lỗi khi tải danh sách vai trò: ' + errorMessage);
                }
              });
            } else {
              notyf.error('Không thể tải vai trò hiện tại: ' + (response.error || 'Không có dữ liệu'));
            }
          } catch (e) {
            console.error('Error parsing JSON:', e);
            notyf.error('Lỗi phân tích JSON: ' + e.message);
          }
        },
        error: function(xhr, status, error) {
          console.error('AJAX error:', status, error);
          console.error('Response text:', xhr.responseText);
          var errorMessage = xhr.responseJSON ? xhr.responseJSON.error : error;
          notyf.error('Lỗi khi tải vai trò hiện tại: ' + errorMessage);
        }
      });
    });

    function updateModifyRolesModal(allRoles, currentUserRoles, userId) {
      var html = '';
      allRoles.forEach(function(role) {
        var isChecked = currentUserRoles.some(function(currentRole) {
          return currentRole.userId === parseInt(userId) && currentRole.roleId === role.id;
        });
        html += '<div class="role-group">';
        html += '<label><input type="checkbox" class="role-checkbox" value="' + role.id + '" data-role-id="' + role.id + '" ' + (isChecked ? 'checked' : '') + '> ' + role.name + '</label>';
        html += '</div>';
      });
      $('#modify_roles_list').html(html);
    }

    $('#modify_user_role_btn').on('click', function() {
      var userIdStr = $('#modify_user_select').val();
      var userId = parseInt(userIdStr);

      if (!userIdStr || isNaN(userId) || userId <= 0) {
        notyf.error('Người dùng không hợp lệ');
        return;
      }

      var roleIds = [];
      $('.role-checkbox:checked').each(function() {
        var roleId = parseInt($(this).val());
        if (!isNaN(roleId) && roleId > 0) {
          roleIds.push(roleId.toString());
        }
      });

      var payload = {
        userId: userId.toString(),
        roleIds: roleIds
      };

      console.log('Sending update request:', payload);

      $.ajax({
        url: '/admin/user-role/api/update',
        method: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(payload),
        success: function(response) {
          console.log('Response from /admin/user-role/api/update:', response);

          try {
            if (typeof response === 'string') {
              if (response.trim() === '') {
                throw new Error('Phản hồi rỗng từ server');
              }
              response = JSON.parse(response);
            }
            if (response && response.success) {
              Swal.fire({
                icon: 'success',
                title: 'Thành công',
                text: 'Cập nhật vai trò thành công',
                confirmButtonText: 'OK'
              }).then(() => {
                MicroModal.close('modify_user_role_modal');
                location.reload();
              });
            } else {
              Swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: 'Lỗi khi cập nhật vai trò: ' + (response.error || 'Không xác định')
              });
            }
          } catch (e) {
            console.error('Error parsing JSON:', e);
            Swal.fire({
              icon: 'error',
              title: 'Lỗi',
              text: 'Lỗi phân tích JSON: ' + e.message
            });
          }
        },
        error: function(xhr, status, error) {
          console.error('AJAX error:', status, error);
          console.error('Response text:', xhr.responseText);
          var errorMessage = xhr.responseJSON ? xhr.responseJSON.error : error;
          Swal.fire({
            icon: 'error',
            title: 'Lỗi',
            text: 'Lỗi khi cập nhật vai trò: ' + errorMessage
          });
        }
      });
    });
  });
</script>
</body>
</html>