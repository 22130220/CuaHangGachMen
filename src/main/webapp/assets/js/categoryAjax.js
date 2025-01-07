var notyf = new Notyf();
let addEle = 'Thêm';
let updateEle = 'Cập nhật';
let delEle = 'Xoá';

let vid;

let setActive = [];

let action;
function isNullOrEmptyOrWhitespace(str) {
    return str === null || str === undefined || /^\s*$/.test(str) || str === "";
}
var table = new DataTable('#categories', {
    ajax: {
        url: '/admin/category',
        dataSrc: 'categories'
    },
    fixedHeader: true,
    layout: {
        topStart: {
            buttons: [
                'colvis',
                {
                    text: 'Chỉnh Sửa',
                    className: 'green',
                    action: function (e, dt, node, config) {
                        let data = dt.row({ selected: true }).data();
                        action = updateEle;
                        vid = data.id;
                        openModal('update_modal', data.name, data.status);

                    },
                    enabled: false
                },
                {
                    text: 'Trạng thái',
                    className: 'red',
                    action: function (e, dt, node, config) {
                        var data = dt.rows({ selected: true }).data();
                        setActive = [];
                        data.each(function(rowData, index) {
                            setActive.push(rowData.id);
                        });
                        action = delEle;
                        MicroModal.show('update_id_modal');
                    },
                    enabled: false
                }
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
            data: 'name',
            className: 'dt-center'
        },
        {
            targets: 2,
            data: 'status',
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

$("#add").on('click', function () {
    action = addEle;
});

$("#add_btn").on('click', function () {
    const name = $("#add_name").val();
    const active = $("#add_active").val();
    if((isNullOrEmptyOrWhitespace(name) || isNullOrEmptyOrWhitespace(active))) {
        notyf.error("Cần nhập đủ thông tin");
    } else{
        $.ajax({
            url: '/admin/category',
            type: 'POST',
            data: {
                name: name,
                active: active,
                action: action,
                id: vid
            },
            success: function (data) {
                if(data.success) {
                    notyf.success(action + " thành công");
                    MicroModal.close('add_modal');
                    table.ajax.reload();
                    table.rows().deselect();
                    $("#add_name").val('');
                    $("#add_active").val('');
                } else {
                    notyf.error(action + " thất bại");
                    table.rows().deselect();
                }
            },
            error: function () {
                notyf.error(action + " thất bại");
            }
        })
    }
});

$("#update_btn").on('click', function () {
    const name = $("#update_name").val();
    const active = $("#update_active").val();
    if((isNullOrEmptyOrWhitespace(name) || isNullOrEmptyOrWhitespace(active))) {
        notyf.error("Cần nhập đủ thông tin");
    } else{
        $.ajax({
            url: '/admin/category',
            type: 'POST',
            data: {
                name: name,
                active: active,
                action: action,
                id: vid
            },
            success: function (data) {
                if(data.success) {
                    notyf.success(action + " thành công");
                    MicroModal.close('update_modal');
                    table.ajax.reload();
                    table.rows().deselect();
                    $("#update_name").val('');
                    $("#update_active").val('');
                } else {
                    notyf.error(action + " thất bại");
                    table.rows().deselect();
                }
            },
            error: function () {
                notyf.error(action + " thất bại");
            }
        })
    }
});

$("#update_id_btn").on('click', function () {
    const active = $("#update_active_id").val();
    if((isNullOrEmptyOrWhitespace(active))) {
        notyf.error("Cần nhập đủ thông tin");
    } else{
        $.ajax({
            url: '/admin/category',
            type: 'POST',
            data: {
                active: active,
                action: action,
                id: JSON.stringify(setActive)
            },
            success: function (data) {
                if(data.success) {
                    notyf.success(action + " thành công");
                    MicroModal.close('update_id_modal');
                    table.ajax.reload();
                    table.rows().deselect();
                } else {
                    notyf.error(action + " thất bại");
                    table.rows().deselect();
                }
            },
            error: function () {
                notyf.error(action + " thất bại");
            }
        })
    }
});

function openModal(modalSelector, name, active) {
    MicroModal.show(modalSelector);
    $("#update_name").val(name);
    $("#update_active").val(`${active}`);
}



