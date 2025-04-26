const buttonShowRole = function () {
    var selectedRows = roleTable.rows({ selected: true }).count();
    roleTable.button(0).enable(selectedRows === 1); // Chỉnh sửa
    roleTable.button(1).enable(selectedRows === 1); // Đổi trạng thái
};

const buttonShowResource = function () {
    var selectedRows = resourceTable.rows({ selected: true }).count();
    resourceTable.button(0).enable(selectedRows === 1);
    resourceTable.button(1).enable(selectedRows > 0);
};

const buttonRoleConfig = [
    {
        text: 'Chỉnh Sửa',
        className: 'green',
        action: function (e, dt, node, config) {
            let data = dt.row({ selected: true }).data();
            $('#modify_role_form')[0].reset();
            $('#role_id_update').val(data.id);
            $('#role_name_update').val(data.name);
            $('#role_description_update').val(data.description);
            $('#status_update').val(data.status.toString());
            MicroModal.show('update_role_modal');
        },
        enabled: false
    },
    {
        text: 'Đổi trạng thái',
        className: 'blue',
        action: function (e, dt, node, config) {
            let data = dt.row({ selected: true }).data();
            let newStatus = !data.status; // Đổi trạng thái: true -> false, false -> true
            let statusText = newStatus ? 'Kích hoạt' : 'Hủy';

            Swal.fire({
                title: `Xác nhận ${statusText} quyền`,
                html: `Bạn có muốn <strong>${statusText.toLowerCase()}</strong> quyền <strong>"${data.name}"</strong>?<br>Hành động này sẽ thay đổi trạng thái của quyền.`,
                icon: newStatus ? 'success' : 'warning',
                showCancelButton: true,
                confirmButtonText: 'Xác nhận',
                cancelButtonText: 'Hủy bỏ',
                customClass: {
                    popup: 'modern-swal-popup',
                    title: 'swal-title',
                    htmlContainer: 'swal-html',
                    confirmButton: 'btn btn-primary btn-modern',
                    cancelButton: 'btn btn-secondary btn-modern'
                },
                buttonsStyling: false,
                reverseButtons: true,
                backdrop: true,
                padding: '1.5rem',
                width: '500px',
                allowOutsideClick: false
            }).then((result) => {
                if (result.isConfirmed) {
                    let formData = new FormData();
                    formData.append('role_id_update', data.id);
                    formData.append('role_name_update', data.name);
                    formData.append('role_description_update', data.description);
                    formData.append('status', newStatus);

                    sendAjaxRequest({
                        url: '/admin/get-role-v2',
                        data: formData,
                        successMessage: null,
                        errorMessage: null,
                        tableToReload: roleTable,
                        modalToClose: null,
                        type: 'PUT',
                        onSuccess: function (resp) {
                            if (resp.success) {
                                notyf.success(`Đã ${statusText.toLowerCase()} quyền thành công`);
                            } else {
                                notyf.error(resp.message);
                            }
                        }
                    });
                }
            });
        },
        enabled: false
    }
];

const buttonResourceConfig = [
    {
        text: 'Chỉnh Sửa',
        className: 'green',
        action: function (e, dt, node, config) {
            let data = dt.row({ selected: true }).data();
            $('#modify_resource_form')[0].reset();
            $('#resource_id_update').val(data.id);
            $('#resource_name_update').val(data.name);
            MicroModal.show('update_resource_modal');
        },
        enabled: false
    },
    {
        text: 'Xoá',
        className: 'red',
        action: function (e, dt, node, config) {
            var data = dt.rows({ selected: true }).data();
            let deleteId = [];
            data.each(function(rowData, index) {
                deleteId.push(rowData.id);
            });

            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                    confirmButton: "btn btn-success",
                    cancelButton: "btn btn-danger"
                },
                buttonsStyling: false
            });
            swalWithBootstrapButtons.fire({
                title: `Bạn có chắc muốn xoá ${deleteId.length} mục này ?`,
                text: "Hành động này sẽ không thể quay lại!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Có",
                cancelButtonText: "Không",
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    let formData = new FormData();
                    formData.append('id', deleteId);
                    sendAjaxRequest({
                        url: '/admin/get-resource',
                        data: formData,
                        successMessage: null,
                        errorMessage: null,
                        tableToReload: resourceTable,
                        modalToClose: null,
                        type: 'DELETE',
                        onSuccess: function (resp) {
                            if (resp.success) {
                                notyf.success(resp.message);
                            } else {
                                notyf.error(resp.message);
                            }
                        }
                    });
                }
            });
        },
        enabled: false
    }
];

const columns = [
    {
        targets: 0,
        data: 'id',
        className: 'dt-center',
    },
    {
        targets: 1,
        data: 'name',
        className: 'dt-center',
    },
];

let resourceTable = initDataTable('#resource', '/admin/get-resource', 'resources', null,
    columns,
    buttonResourceConfig,
    buttonShowResource,
    { paging: true, searching: false }
);

let roleTable = initDataTable('#roles', '/admin/get-role-v2', 'roles', null,
    [
        {
            targets: 0,
            data: 'name',
            className: 'dt-center',
        },
        {
            targets: 1,
            data: 'description',
            className: 'dt-center',
        },
        {
            targets: 2,
            data: 'status',
            className: 'dt-center',
            render: function (data, type, row) {
                return data ? 'Kích hoạt' : 'Hủy';
            }
        },
    ],
    buttonRoleConfig,
    buttonShowRole,
    { paging: true, searching: false }
);

$('#role_add').on('click', function () {
    $('#add_role_form')[0].reset();
    MicroModal.show('create_role_modal');
});

$('#res_add').on('click', function () {
    $('#add_resource_form')[0].reset();
    MicroModal.show('create_resource_modal');
});

$('#add_role_btn').on('click', function () {
    let formData = new FormData($('#add_role_form')[0]);
    sendAjaxRequest({
        url: '/admin/get-role-v2',
        data: formData,
        successMessage: null,
        errorMessage: null,
        tableToReload: roleTable,
        modalToClose: 'create_role_modal',
        type: 'POST',
        onSuccess: function (resp) {
            if (resp.success) {
                notyf.success(resp.message);
            } else {
                notyf.error(resp.message);
            }
        }
    });
});

$('#add_resource_btn').on('click', function () {
    let formData = new FormData($('#add_resource_form')[0]);
    sendAjaxRequest({
        url: '/admin/get-resource',
        data: formData,
        successMessage: null,
        errorMessage: null,
        tableToReload: resourceTable,
        modalToClose: 'create_resource_modal',
        type: 'POST',
        onSuccess: function (resp) {
            if (resp.success) {
                notyf.success(resp.message);
            } else {
                notyf.error(resp.message);
            }
        }
    });
});

$('#update_role_btn').on('click', function () {
    let formData = new FormData($('#modify_role_form')[0]);
    sendAjaxRequest({
        url: '/admin/get-role-v2',
        data: formData,
        successMessage: null,
        errorMessage: null,
        tableToReload: roleTable,
        modalToClose: 'update_role_modal',
        type: 'PUT',
        onSuccess: function (resp) {
            if (resp.success) {
                notyf.success(resp.message);
            } else {
                notyf.error(resp.message);
            }
        }
    });
});

$('#update_resource_btn').on('click', function () {
    let formData = new FormData($('#modify_resource_form')[0]);
    sendAjaxRequest({
        url: '/admin/get-resource',
        data: formData,
        successMessage: null,
        errorMessage: null,
        tableToReload: resourceTable,
        modalToClose: 'update_resource_modal',
        type: 'PUT',
        onSuccess: function (resp) {
            if (resp.success) {
                notyf.success(resp.message);
            } else {
                notyf.error(resp.message);
            }
        }
    });
});

// Button enable/disable logic for permissions
const buttonShowPermission = function () {
    var selectedRows = permissionTable.rows({ selected: true }).count();
    permissionTable.button(0).enable(selectedRows === 1); // Chỉnh sửa
    permissionTable.button(1).enable(selectedRows > 0); // Xoá
};

// Configuration for permission table buttons
const buttonPermissionConfig = [
    {
        text: 'Chỉnh Sửa',
        className: 'green',
        action: function (e, dt, node, config) {
            let data = dt.row({ selected: true }).data();
            $('#modify_permission_form')[0].reset();
            $('#permission_id_update').val(data.id);
            $('#permission_name_update').val(data.name);
            MicroModal.show('update_permission_modal');
        },
        enabled: false
    },
    {
        text: 'Xoá',
        className: 'red',
        action: function (e, dt, node, config) {
            var data = dt.rows({ selected: true }).data();
            let deleteId = [];
            data.each(function(rowData, index) {
                deleteId.push(rowData.id);
            });

            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                    confirmButton: "btn btn-success",
                    cancelButton: "btn btn-danger"
                },
                buttonsStyling: false
            });
            swalWithBootstrapButtons.fire({
                title: `Bạn có chắc muốn xoá ${deleteId.length} quyền này?`,
                text: "Hành động này sẽ không thể quay lại!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Có",
                cancelButtonText: "Không",
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    let formData = new FormData();
                    formData.append('id', deleteId);
                    sendAjaxRequest({
                        url: '/admin/get-permission',
                        data: formData,
                        successMessage: null,
                        errorMessage: null,
                        tableToReload: permissionTable,
                        modalToClose: null,
                        type: 'DELETE',
                        onSuccess: function (resp) {
                            if (resp.success) {
                                notyf.success(resp.message);
                            } else {
                                notyf.error(resp.message);
                            }
                        }
                    });
                }
            });
        },
        enabled: false
    }
];

// Initialize DataTable for permissions
let permissionTable = initDataTable('#permissions', '/admin/get-permission', 'permissions', null,
    [
        {
            targets: 0,
            data: 'id',
            className: 'dt-center',
        },
        {
            targets: 1,
            data: 'name',
            className: 'dt-center',
        },
    ],
    buttonPermissionConfig,
    buttonShowPermission,
    { paging: true, searching: false }
);

// Handle "Thêm" button for permissions
$('#perm_add').on('click', function () {
    $('#add_permission_form')[0].reset();
    MicroModal.show('create_permission_modal');
});

// Handle "Thêm" button click in the modal
$('#add_permission_btn').on('click', function () {
    let formData = new FormData($('#add_permission_form')[0]);
    sendAjaxRequest({
        url: '/admin/get-permission',
        data: formData,
        successMessage: null,
        errorMessage: null,
        tableToReload: permissionTable,
        modalToClose: 'create_permission_modal',
        type: 'POST',
        onSuccess: function (resp) {
            if (resp.success) {
                notyf.success(resp.message);
            } else {
                notyf.error(resp.message);
            }
        }
    });
});

// Handle "Cập nhật" button click in the modal
$('#update_permission_btn').on('click', function () {
    let formData = new FormData($('#modify_permission_form')[0]);
    sendAjaxRequest({
        url: '/admin/get-permission',
        data: formData,
        successMessage: null,
        errorMessage: null,
        tableToReload: permissionTable,
        modalToClose: 'update_permission_modal',
        type: 'PUT',
        onSuccess: function (resp) {
            if (resp.success) {
                notyf.success(resp.message);
            } else {
                notyf.error(resp.message);
            }
        }
    });
});