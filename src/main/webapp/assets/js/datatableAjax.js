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

var table = new DataTable('#example', {
    ajax: {
        url: '/admin/get-product',
        dataSrc: 'products'
    },
    fixedHeader: true,
    layout: {
        topStart: {
            buttons: [
                'colvis',
                // {
                //     text: 'Chỉnh Sửa',
                //     className: 'green',
                //     action: function (e, dt, node, config) {
                //         let data = dt.row({ selected: true }).data();
                //         action = updateEle;
                //         vid = data.id;
                //         openModal('update_modal', data.name, data.status);
                //
                //     },
                //     enabled: false
                // },
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
            targets: 0, // Cột hình ảnh
            data: 'imgThumbnail',
            render: function (data) {
                return `<td style="background-color: #f5f5f5;">
                            <img src="${data}" style="width:50px; height:auto;">
                        </td>`;
            },
            className: 'dt-center'
        },
        {
            targets: 1,
            data: 'name',
            className: 'dt-center'
        },
        {
            targets: 2, // Cột giá
            data: 'pricePerBox',
            render: function (data) {
                return `<td style="color: red;">${data.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' })}</td>`;
            },
            className: 'dt-center  dt-nowrap'
        },
        {
            targets: 3, // Cột số lượng
            data: 'stock',
            render: function (data) {
                const style = data === 0 ? 'background-color: #ffe0e0;' : '';
                return `<td style="${style}">${data}</td>`;
            },
            className: 'dt-center'
        },
        {
            targets: 4, // Cột đánh giá
            data: 'status',
            render: function (data) {
                if(data) {
                    return `<td> <div class="isActive"> Còn hàng </div> </td>`
                } else return `<td> <div class="deActive"> Hết hàng </div> </td>`
            },
            className: 'dt-center'
        },
        {
            target: 5,
            data: 'id',
            render: function (data) {
                return`<div class='table-icon-label'>  <a href="#" onclick="openUpdateProductModal(${data})"><i class="fa-solid fa-note-sticky"></i></a><a href="#"><i class="fa-solid fa-eraser"></i></a> </div>`
            },
            className: 'dt-center'
        }
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
            'vertical-align': 'middle'
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

    // table.button(1).enable(selectedRows === 1);
    // table.button(2).enable(selectedRows > 0);

    table.button(1).enable(selectedRows > 0);
});

$("#update_id_btn").on('click', function () {
    const active = $("#update_active_id").val();
    if((isNullOrEmptyOrWhitespace(active))) {
        notyf.error("Cần nhập đủ thông tin");
    } else{
        $.ajax({
            url: '/admin/get-product',
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

function openUpdateProductModal(id) {
    MicroModal.show('update_product_modal');
}
