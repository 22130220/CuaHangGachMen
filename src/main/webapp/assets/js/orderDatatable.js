var table = new DataTable('#orders', {
    ajax: {
        url: '/admin/order',
        dataSrc: 'orders'
    },
    fixedHeader: true,
    layout: {
        topStart: {
            buttons: [
                'colvis',
                {
                    text: 'Mô tả',
                    className: 'green',
                    action: function (e, dt, node, config) {
                        let data = dt.row({ selected: true }).data();
                        linkDes = data.description;
                        pid = data.id;
                        action = updateEle;
                        loadFileCKEditor(linkDes, pid);
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
            data: 'userId',
            className: 'dt-center'
        },
        {
            targets: 1,
            data: 'fullName',
            className: 'dt-center'
        },
        {
            targets: 2, // Cột giá
            data: 'orderDate',
            // render: function (data) {
            //     return `<td style="color: red;">${data.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' })}</td>`;
            // },
            className: 'dt-center  dt-nowrap'
        },
        {
            targets: 3, // Cột số lượng
            data: 'address',
            // render: function (data) {
            //     const style = data === 0 ? 'background-color: #ffe0e0;' : '';
            //     return `<td style="${style}">${data}</td>`;
            // },
            className: 'dt-center'
        },
        {
            targets: 4, // Cột đánh giá
            data: 'status',
            // render: function (data) {
            //     if(data) {
            //         return `<td> <div class="isActive"> Còn hàng </div> </td>`
            //     } else return `<td> <div class="deActive"> Hết hàng </div> </td>`
            // },
            className: 'dt-center'
        },
        {
            target: 5,
            data: 'totalPrice',
            // render: function (data) {
            //     return`<div class='table-icon-label'>  <a href="#" onclick="openUpdateProductModal(${data})"><i class="fa-solid fa-note-sticky"></i></a><a href="#" onclick="openSpecModal(${data})"><i class="fa-solid fa-eraser"></i></a> <a href="#" onclick="openColorModal(${data})"><i class="fa-solid fa-eraser"></i></a> </div>`
            // },
            className: 'dt-center'
        },
        {
            target: 6,
            data: 'id',
            render: function (data) {
                return`<div class='table-icon-label'>  <a href="#" onclick="openOrderDetailModal(${data})"><i class="fa-solid fa-note-sticky"></i></a> </div>`
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


function openOrderDetailModal(orderID) {

}