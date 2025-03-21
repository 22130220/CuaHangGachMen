const columns = [
    {
        targets: 0,
        data: 'fullname',
        className: 'dt-center',
        searchPanes: {
            show: true
        }
    },
    {
        targets: 1,
        data: 'status',
        render: function (data) {
            if (data) {
                return `<td> <div class="isActive"> Đang bật </div> </td>`;
            } else {
                return `<td> <div class="deActive"> Khoá </div> </td>`;
            }
        },
        className: 'dt-center',

        searchPanes: {
            show: true
        }
    },
    {
        targets: 2,
        data: 'email',
        className: 'dt-center dt-nowrap',

        searchPanes: {
            show: true
        }

    },
    {
        targets: 3,
        data: 'phone',
        className: 'dt-center dt-nowrap',
        render: data => `<td>${data}</td>`,
        searchPanes: {
            show: true
        }

    },
    {
        targets: 4,
        data: 'birthtime',
        render: function (data) {
            const style = data === 0 ? 'background-color: #ffe0e0;' : '';
            return `<td style="${style}">${data}</td>`;
        },
        className: 'dt-center',
        searchPanes: {
            show: true
        }

    },
    {
        targets: 5,
        data: 'sex',
        render: function (data) {
            if (data === 1) {
                return `<td> Nam </td>`;
            } else {
                return `<td> Nữ </td>`;
            }
        },
        className: 'dt-center',

        searchPanes: {
            show: true
        }
    },
    {
        targets: 6,
        data: 'createtime',
        className: 'dt-center',
        searchPanes: {
            show: true
        }
    }
];

const buttonConfigs = [
    [defaultButton],
    {
        text: 'Thêm',
        className: 'green',
        action: function (e, dt, node, config) {
            action = addEle;
            MicroModal.show('add_modal');
        },
        enabled: true
    },
    {
        text: 'Chỉnh sửa',
        className: 'red',
        action: function (e, dt, node, config) {
            let data = dt.row({ selected: true }).data();
            vid = data.id;
            $("#update_fullname").val(data.fullname);
            $("#update_status").val(data.status.toString());
            $("#update_email").val(data.email);
            $("#update_birth").val(data.birthtime);
            $("#update_sex").val(data.sex);
            $("#update_address").val(data.address);
            $("#update_userphone").val(data.phone);
            action = updateEle;
            MicroModal.show('update_modal');
        },
        enabled: false
    },
    {
        text: 'Đổi mật khẩu',
        className: 'red',
        action: function (e, dt, node, config) {
            var data = dt.row({ selected: true }).data();
            vid = data.id;
            action = "Đổi MK";
            MicroModal.show('update_password_modal');
        },
        enabled: false
    }
];

const buttonShow = function () {
    var selectedRows = table.rows({ selected: true }).count();
    // table.button(2).enable(selectedRows === 1);
    // table.button(3).enable(selectedRows === 1);
};

var table = initDataTable(
    '#example',
    '/admin/user',
    'users',
    null,
    columns,
    buttonConfigs,
    buttonShow,
    { paging: true, searching: true }
);

// // Keep the resizable functionality
// $('table th').resizable({
//     handles: 'e',
//     stop: function(e, ui) {
//         $(this).width(ui.size.width);
//     }
// });