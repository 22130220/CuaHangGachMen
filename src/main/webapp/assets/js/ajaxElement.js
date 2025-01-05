var notyf = new Notyf();
let addEle = 'Thêm';
let updateEle = 'Cập nhật';
let delEle = 'Xoá';

let colorUrl = '/admin/color';
let action;
let url;

let deleteId = [];

let tableReload;

let id = null;

function isNullOrEmptyOrWhitespace(str) {
    return str === null || str === undefined || /^\s*$/.test(str) || str === "";
}

var clTable = new DataTable('#cl', {
    ajax: {
        url: '/admin/color',
        dataSrc: 'colors'
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
                        data.each(function(rowData, index) {
                            deleteId.push(rowData.Id);
                        });
                        url = colorUrl;
                        action = delEle;
                        tableReload = "color";
                        deleteAjax(url, 'POST', JSON.stringify(deleteId),null, action);
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
            data: 'Id',
            className: 'dt-center'
        },
        {
            targets: 1,
            data: 'Name',
            className: 'dt-center'
        },
        {
            targets: 2,
            data: 'Id',
            render: function (data) {
                return '<div class=\'table-icon-label\'> <a href=\"#\"><i class=\"fa-solid fa-eraser\"></i></a> </div>'
            },
            className: 'dt-center  dt-nowrap'
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
            'padding': '1rem 0.8rem'
        });
    }
});


$('table th').resizable({
    handles: 'e',
    stop: function(e, ui) {
        $(this).width(ui.size.width);
    }
});

clTable.on('select deselect', function () {
    var selectedRows = clTable.rows({ selected: true }).count();
    clTable.button(1).enable(selectedRows === 1);
    clTable.button(2).enable(selectedRows > 0);
});

function reloadButton(table) {
    table.rows().deselect();
}

$("#cl_add").on('click', function () {
    url = colorUrl;
    action = addEle;
    tableReload = "color";
    console.log(url + " "  + action);
});

$("#add_btn").on('click', function () {
    add();
});

$("#update_btn").on('click', function () {
    update();
});

function add() {
    const val = $("#add").val();
    if(isNullOrEmptyOrWhitespace(val)) {
        notyf.error("Không để trống");
    } else {
        addAjax(url, 'POST', val,null, action);
    }
    $("#add").val('');
}

function update() {
    const val = $('#update').val();
    if(isNullOrEmptyOrWhitespace(val)) {
        notyf.error("Không để trống");
    } else {
        updateAjax(url, 'POST', val,id, action);
    }
    $('#update').val('');
}

function openModal(modalSelector, inputSelector, bind) {
    MicroModal.show(modalSelector);
    $("#" + inputSelector).val(bind);
}


function addAjax(url,type,data,id,action) {
    $.ajax({
        url: url,
        type: type,
        data: {
            data: data,
            action: action,
            id: id
        },
        success: function (data) {
            if(data.success) {
                notyf.success(action + " thành công");
                MicroModal.close('add_modal');
                reload();
                clearParams();
            } else {
                notyf.error(action + " thất bại");
                reload();
            }

        },
        error: function () {
            notyf.error(action +" thất bại");
        }
    });
}

function deleteAjax(url,type,data,id,action) {
    $.ajax({
        url: url,
        type: type,
        data: {
            data: data,
            action: action,
            id: id
        },
        success: function (data) {
            if(data.success) {
                notyf.success(action + " thành công");
                reload();
                clearParams();
            } else {
                notyf.error(action + " thất bại");
                reload();
            }
        },
        error: function () {
            notyf.error(action +" thất bại");
        }
    });
}

function updateAjax(url,type,data,id,action) {
    $.ajax({
        url: url,
        type: type,
        data: {
            data: data,
            action: action,
            id: id
        },
        success: function (data) {
            if(data.success) {
                notyf.success(action + " thành công");
                MicroModal.close('update_modal');
                reload();
                clearParams();
            } else {
                notyf.error(action + " thất bại");
                reload();
            }
        },
        error: function () {
            notyf.error(action +" thất bại");
        }
    });
}

function reload() {
    if(tableReload.toString() === "color") {
        clTable.ajax.reload();
        reloadButton(clTable);
    }
}

function clearParams() {
    action = '';
    url= '';
    tableReload= '';
}

