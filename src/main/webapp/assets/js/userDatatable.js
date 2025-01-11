var table = new DataTable('#user', {
    ajax: {
        url: '/admin/user',
        dataSrc: 'users'
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
            targets: 0, // Cột hình ảnh
            data: 'avatar',
            render: function (data) {
                return `<td style="background-color: #f5f5f5;">
                            <img src="${data}" style="width:50px; height:auto;">
                        </td>`;
            },
            className: 'dt-center'
        },
        {
            targets: 1,
            data: 'fullname',
            className: 'dt-center'
        },
        {
            targets: 2, // Cột giá
            data: 'email',
            className: 'dt-center  dt-nowrap'
        },
        {
            targets: 3, // Cột số lượng
            data: 'birthtime',
            render: function (data) {
                const style = data === 0 ? 'background-color: #ffe0e0;' : '';
                return `<td style="${style}">${data}</td>`;
            },
            className: 'dt-center'
        },
        {
            targets: 4,
            data: 'sex',
            render: function (data) {
                if(data === 1) {
                    return `<td> <div class="isActive"> Nam </div> </td>`
                } else return `<td> <div class="deActive"> Nữ </div> </td>`
            },
            className: 'dt-center'
        },
        {
            target: 5,
            data: 'createtime',
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
    table.button(1).enable(selectedRows === 1);
    table.button(2).enable(selectedRows > 0);
});
