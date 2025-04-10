<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý Resource Group</title>

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
                            <i class="fa-solid fa-users-rectangle"></i>
                        </div>
                        <a href="#" class="f-bold f-s-25 breadcumb-text">Resource Group</a>
                    </div>
                </div>
                <div class="funcproduct">
                    <div class="button bg_blue f-cl-white" id="createResourceGroup" data-micromodal-trigger="create_resource_group_modal">Create Resource Group</div>
                </div>
            </nav>

            <!-- Bảng danh sách resource groups và chi tiết -->
            <div class="table _4c _6r">
                <div class="flex-row gap-20">
                    <!-- Cột trái: Danh sách resource groups -->
                    <div class="_2c">
                        <div class="card">
                            <table id="resourceGroupsTable" class="display" style="width:100%">
                                <thead>
                                <tr>
                                    <th>Resource Group Name</th>
                                    <th>Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>ALL RESOURCES</td>
                                    <td>Cannot be modified</td>
                                </tr>
                                <tr>
                                    <td>HYPERVISOR ALL RESOURCE GROUP</td>
                                    <td>Cannot be modified</td>
                                </tr>
                                <tr class="selected">
                                    <td>resourceVM</td>
                                    <td>Can be modified</td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="total-resource-groups text-left">
                                TOTAL: 3
                            </div>
                        </div>
                    </div>

                    <!-- Cột phải: Chi tiết resource group -->
                    <div class="_2c">
                        <h3 class="text_entry_title">resourceVM</h3>
                        <div class="card">

                            <div class="title-icon">
                                <div class="action-buttons">
                                    <div class="button bg_orange f-cl-white" data-micromodal-trigger="modify_resource_group_modal">Modify resources</div>
                                    <div class="button bg_red f-cl-white" data-micromodal-trigger="delete_resource_group_modal">Delete resource group</div>
                                </div>
                            </div>
                            <div class="resource-details">
                                <h4>Permission groups</h4>
                                <div class="detail-item">
                                    <span>Hypervisor</span>
                                    <span>All</span>
                                </div>
                                <div class="detail-item">
                                    <span>SLA Policy</span>
                                    <span>Bronze</span>
                                </div>
                                <div class="detail-item">
                                    <span>Screen</span>
                                    <span>All</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal: Create Resource Group -->
    <div class="modal micromodal-slide" id="create_resource_group_modal" aria-hidden="true">
        <div class="modal__overlay" tabindex="-1" data-micromodal-close>
            <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                <header class="modal__header">
                    <h2 class="modal__title" id="create_resource_group_title">Tạo Resource Group Mới</h2>
                    <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                </header>
                <div class="modal-content-content">
                    <div class="modal__content">
                        <div class="fui-basic-input" style="width: 100%">
                            <label for="resource_group_name" class="f-bold f-s-14 f-cl-black">Tên Resource Group</label>
                            <input type="text" name="resource_group_name" placeholder="Nhập tên resource group" class="input input-bordered f-s-14" style="width: 100%" id="resource_group_name" autocomplete="off" required/>
                        </div>
                        <div class="fui-basic-input" style="width: 100%">
                            <label for="hypervisor" class="f-bold f-s-14 f-cl-black">Hypervisor</label>
                            <select name="hypervisor" id="hypervisor" class="input input-bordered f-s-14" required>
                                <option value="All">All</option>
                                <option value="VMware">VMware</option>
                                <option value="Hyper-V">Hyper-V</option>
                            </select>
                        </div>
                        <div class="fui-basic-input" style="width: 100%">
                            <label for="sla_policy" class="f-bold f-s-14 f-cl-black">SLA Policy</label>
                            <select name="sla_policy" id="sla_policy" class="input input-bordered f-s-14" required>
                                <option value="Bronze">Bronze</option>
                                <option value="Silver">Silver</option>
                                <option value="Gold">Gold</option>
                            </select>
                        </div>
                        <div class="fui-basic-input" style="width: 100%">
                            <label for="screen" class="f-bold f-s-14 f-cl-black">Screen</label>
                            <select name="screen" id="screen" class="input input-bordered f-s-14" required>
                                <option value="All">All</option>
                                <option value="Limited">Limited</option>
                            </select>
                        </div>
                    </div>
                    <footer class="modal__footer">
                        <button class="button bg_green f-cl-white" id="create_resource_group_btn">Tạo</button>
                    </footer>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal: Modify Resource Group -->
    <div class="modal micromodal-slide" id="modify_resource_group_modal" aria-hidden="true">
        <div class="modal__overlay" tabindex="-1" data-micromodal-close>
            <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                <header class="modal__header">
                    <h2 class="modal__title" id="modify_resource_group_title">Chỉnh sửa Resource Group</h2>
                    <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                </header>
                <div class="modal-content-content">
                    <div class="modal__content">
                        <div class="fui-basic-input" style="width: 100%">
                            <label for="modify_resource_group_name" class="f-bold f-s-14 f-cl-black">Tên Resource Group</label>
                            <input type="text" name="modify_resource_group_name" placeholder="Nhập tên resource group" class="input input-bordered f-s-14" style="width: 100%" id="modify_resource_group_name" autocomplete="off" required/>
                        </div>
                        <div class="fui-basic-input" style="width: 100%">
                            <label for="modify_hypervisor" class="f-bold f-s-14 f-cl-black">Hypervisor</label>
                            <select name="modify_hypervisor" id="modify_hypervisor" class="input input-bordered f-s-14" required>
                                <option value="All">All</option>
                                <option value="VMware">VMware</option>
                                <option value="Hyper-V">Hyper-V</option>
                            </select>
                        </div>
                        <div class="fui-basic-input" style="width: 100%">
                            <label for="modify_sla_policy" class="f-bold f-s-14 f-cl-black">SLA Policy</label>
                            <select name="modify_sla_policy" id="modify_sla_policy" class="input input-bordered f-s-14" required>
                                <option value="Bronze">Bronze</option>
                                <option value="Silver">Silver</option>
                                <option value="Gold">Gold</option>
                            </select>
                        </div>
                        <div class="fui-basic-input" style="width: 100%">
                            <label for="modify_screen" class="f-bold f-s-14 f-cl-black">Screen</label>
                            <select name="modify_screen" id="modify_screen" class="input input-bordered f-s-14" required>
                                <option value="All">All</option>
                                <option value="Limited">Limited</option>
                            </select>
                        </div>
                    </div>
                    <footer class="modal__footer">
                        <button class="button bg_green f-cl-white" id="modify_resource_group_btn">Cập nhật</button>
                    </footer>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal: Delete Resource Group -->
    <div class="modal micromodal-slide" id="delete_resource_group_modal" aria-hidden="true">
        <div class="modal__overlay" tabindex="-1" data-micromodal-close>
            <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
                <header class="modal__header">
                    <h2 class="modal__title">Xóa Resource Group</h2>
                    <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
                </header>
                <div class="modal-content-content">
                    <div class="modal__content">
                        <p>Bạn có chắc chắn muốn xóa resource group này không?</p>
                    </div>
                    <footer class="modal__footer">
                        <button class="button bg_red f-cl-white" id="delete_resource_group_btn">Xóa</button>
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

<!-- JavaScript để xử lý DataTable và các sự kiện -->
<script>
    $(document).ready(function () {
        // Khởi tạo DataTable cho bảng resource groups
        $('#resourceGroupsTable').DataTable({
            "paging": false,
            "searching": true,
            "ordering": true,
            "info": false,
            "responsive": true,
            "select": {
                style: 'single'
            },
            "dom": 'frt',
            "language": {
                "search": "Search for resource groups:"
            }
        });

        // Xử lý sự kiện click vào hàng trong bảng để hiển thị chi tiết
        $('#resourceGroupsTable tbody').on('click', 'tr', function (e) {
            $(this).addClass('selected').siblings().removeClass('selected');
            // Ở đây bạn có thể thêm logic để tải chi tiết của resource group được chọn
            // Ví dụ: Gọi API để lấy chi tiết và cập nhật cột bên phải
        });

        // Xử lý menu gập/mở
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