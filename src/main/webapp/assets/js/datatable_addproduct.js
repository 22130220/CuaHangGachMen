var productSpec = new DataTable('#specs', {
    ajax: {
        url: '/admin/getspec',
        data: {
          pid : 1
        },
        dataSrc: 'productSpecs'
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
                        window.location.href = `/admin/productcrud?pid=${encodeURIComponent(data.id)}`;
                    },
                    enabled: false
                },
                {
                    text: 'Xoá',
                    className: 'red',
                    action: function (e, dt, node, config) {
                        console.log('Rows: ' + dt.rows({ selected: true }).count());
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
            width: 20,
            data: 'specName',
            className: 'dt-center'
        },
        {
            targets: 1,
            data: 'value',
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
            'vertical-align': 'middle'
        });
    }

});