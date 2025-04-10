// Function to initialize the data table
const buttonShowRole = function () {
    var selectedRows = roleTable.rows({ selected: true }).count();
    roleTable.button(0).enable(selectedRows === 1);
    roleTable.button(1).enable(selectedRows > 0);
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
            MicroModal.show('update_role_modal');
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
                        url: '/admin/get-role',
                        data: formData,
                        successMessage: null,
                        errorMessage: null,
                        tableToReload: roleTable,
                        modalToClose: null,
                        type: 'DELETE',
                        onSuccess: function (resp) {
                            if (resp.success) {
                                notyf.success(resp.message);
                            }
                            else {
                                notyf.error(resp.message);
                            }
                        }
                    });
                }
            });
        },
        enabled: false
    }
]

const buttonResourceConfig = [
    {
        text: 'Chỉnh Sửa',
        className: 'green',
        action: function (e, dt, node, config) {
            let data = dt.row({ selected: true }).data();
            id = data.Id;
            url = colorUrl;
            action = updateEle;
            tableReload = "color";
            openModal('update_modal', 'update', data.Name);
        },
        enabled: false
    },
    {
        text: 'Xoá',
        className: 'red',
        action: function (e, dt, node, config) {
            // console.log('Rows: ' + dt.rows({ selected: true }).count());
            var data = dt.rows({ selected: true }).data();
        },
        enabled: false
    }
]
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

let roleTable = initDataTable('#roles', '/admin/get-role', 'roles', null,
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
    ],
    buttonRoleConfig,
    buttonShowRole,
    { paging: true, searching: false }
);


function openModal(modalSelector, inputSelector, bind) {
    MicroModal.show(modalSelector);
    $("#" + inputSelector).val(bind);
};

$('#role_add').on('click', function () {
    $('#add_role_form')[0].reset();
    MicroModal.show('create_role_modal');
});

$('#add_role_btn').on('click', function () {
    let formData = new FormData($('#add_role_form')[0]);
    sendAjaxRequest({
        url: '/admin/get-role',
        data: formData,
        successMessage: null,
        errorMessage: null,
        tableToReload: roleTable,
        modalToClose: 'create_role_modal',
        type: 'POST',
        onSuccess: function (resp) {
            if (resp.success) {
                notyf.success(resp.message)
            }
            else {
                notyf.error(resp.message)
            }
        }
    });
});

$('#update_role_btn').on('click', function () {
    let formData = new FormData($('#modify_role_form')[0]);
    sendAjaxRequest({
        url: '/admin/get-role',
        data: formData,
        successMessage: null,
        errorMessage: null,
        tableToReload: roleTable,
        modalToClose: 'update_role_modal',
        type: 'PUT',
        onSuccess: function (resp) {
            if (resp.success) {
                notyf.success(resp.message)
            }
            else {
                notyf.error(resp.message)
            }
        }
    });
});
