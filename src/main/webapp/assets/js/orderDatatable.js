let orderDetail = null;

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

// Khởi tạo DataTable
const table = initDataTable(
    '#orders', // tableId
    '/admin/order', // ajaxUrl
    'orders', // dataSrc
    {}, // sendData (trống vì không có dữ liệu gửi kèm)
    [ // columns
        { targets: 0, data: 'id', className: 'dt-center' },
        { targets: 1, data: 'fullName', className: 'dt-center' },
        {
            targets: 2,
            data: 'orderDate',
            className: 'dt-center dt-nowrap'
        },
        {
            targets: 3,
            data: 'address',
            className: 'dt-center'
        },
        {
            targets: 4,
            data: 'status',
            render: function (data) {
                if (data === 'Delivered') {
                    return `<td> <div class="isActive"> Đã Giao </div> </td>`;
                } else if (data === 'Cancelled') {
                    return `<td> <div class="deActive"> Đã huỷ </div> </td>`;
                } else if (data === 'Shipping') {
                    return `<td> <div class="shipping"> Đang vận chuyển </div> </td>`;
                } else {
                    return `<td> <div class="processing"> Đang xử lý </div> </td>`;
                }
            },
            className: 'dt-center'
        },
        {
            targets: 5,
            data: 'totalPrice',
            render: function (data) {
                return `<td style="color: red;">${data.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' })}</td>`;
            },
            className: 'dt-center'
        },
        {
            targets: 6,
            data: 'id',
            render: function (data) {
                return `<div class='table-icon-label'> <a href="#" onclick="openOrderDetailModal(${data})"><i class="fa-solid fa-note-sticky"></i></a> </div>`;
            },
            className: 'dt-center'
        }
    ],
    [ // buttonConfigs
        [defaultButton],
        {
            text: 'Trạng thái',
            className: 'green',
            action: function (e, dt, node, config) {
                var data = dt.rows({ selected: true }).data();
                setActive = [];
                var selectedStatus = null;

                // Lấy trạng thái của các hàng được chọn
                data.each(function(rowData, index) {
                    setActive.push(rowData.id);
                    selectedStatus = rowData.status; // Lấy trạng thái của hàng đầu tiên (giả sử chỉ chọn 1 hàng)
                });

                // Kiểm tra trạng thái và điều chỉnh modal
                const statusSelect = $("#update_active_id");
                statusSelect.empty(); // Xóa các lựa chọn cũ

                if (selectedStatus === 'Processing') {
                    // Đang xử lý: Cho phép chọn "Đang vận chuyển" hoặc "Đã giao"
                    statusSelect.append('<option value="Shipping">Đang vận chuyển</option>');
                    statusSelect.append('<option value="Delivered">Đã giao</option>');
                } else if (selectedStatus === 'Shipping') {
                    // Đang vận chuyển: Chỉ cho phép chọn "Đã giao"
                    statusSelect.append('<option value="Delivered">Đã giao</option>');
                }

                action = updateEle;
                MicroModal.show('update_status_modal');
            },
            enabled: false
        }
    ],
    handleButtonShow, // buttonShow
    { // extraOptions
        fixedHeader: true
    }
);

// Hàm xử lý sự kiện nút button
function handleButtonShow(e, dt, node, config) {
    var selectedRows = dt.rows({ selected: true }).count();
    var data = dt.rows({ selected: true }).data();
    var canUpdateStatus = false;

    if (selectedRows > 0) {
        var selectedStatus = null;
        data.each(function(rowData, index) {
            selectedStatus = rowData.status; // Lấy trạng thái của hàng đầu tiên (giả sử chỉ chọn 1 hàng)
        });

        // Chỉ kích hoạt nút "Trạng thái" nếu trạng thái không phải "Delivered" hoặc "Cancelled"
        if (selectedStatus !== 'Delivered' && selectedStatus !== 'Cancelled') {
            canUpdateStatus = true;
        }
    }

    dt.buttons(8).enable(canUpdateStatus); // Kích hoạt nút "Trạng thái" nếu hợp lệ
}

function openOrderDetailModal(orderID) {
    if (orderDetail == null) {
        orderDetail = new DataTable('#orderdetail', {
            ajax: {
                url: '/admin/orderdetail',
                data: function (d) {
                    d.orderId = orderID;
                },
                dataSrc: function (json) {
                    return json.orderdetail;
                },
            },
            fixedHeader: true,
            layout: {
                topStart: {
                    buttons: ['colvis']
                },
            },
            select: true,
            columnDefs: [
                {
                    targets: 0,
                    data: 'img',
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
                    targets: 2,
                    data: 'quantity',
                    className: 'dt-center dt-nowrap'
                },
                {
                    targets: 3,
                    data: 'price',
                    className: 'dt-center'
                },
                {
                    targets: 4,
                    data: 'color',
                    render: function (data) {
                        return data;
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
                $('td', row).css({
                    'text-align': 'center',
                    'vertical-align': 'middle'
                });
            }
        });
    } else {
        orderDetail.settings()[0].ajax.data = function (d) {
            d.orderId = orderID;
        };
        orderDetail.ajax.reload();
    }

    MicroModal.show('show_detail');
}

$("#update_id_btn").on('click', function () {
    const active = $("#update_active_id").val();
    if (isNullOrEmptyOrWhitespace(active)) {
        notyf.error("Cần nhập đủ thông tin");
    } else {
        $.ajax({
            url: '/admin/order',
            type: 'POST',
            data: {
                active: active,
                action: action,
                id: JSON.stringify(setActive)
            },
            success: function (data) {
                if (data.success) {
                    notyf.success(action + " thành công");
                    MicroModal.close('update_status_modal');
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
        });
    }
});

$('table th').resizable({
    handles: 'e',
    stop: function(e, ui) {
        $(this).width(ui.size.width);
    }
});