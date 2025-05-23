let setActive = [];
let action ='';
var table=new DataTable('#outofstocktp',{
    ajax: {
        url: '/GetSetTypeOutOfStock',
        dataSrc: 'data'
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
                        action = 'sửa';
                        vid = data.id;
                        openModal('modifiStockinTypeModal', data.name,data.id);
                    },
                    enabled: false
                },
                {
                    text: 'Trạng thái',
                    className: 'red',
                    action: function (e, dt, node, config) {
                        // console.log('Rows: ' + dt.rows({ selected: true }).count());
                        var data = dt.rows({ selected: true }).data();
                        setActive = [];
                        data.each(function(rowData, index) {
                            setActive.push(rowData.id);
                        });
                        console.log(setActive)
                        action = 'cp';
                        MicroModal.show('update_id_modal2');
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
            data: 'isActive',
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
















$(document).ready(function () {
    $('#modifyForm').on('submit', function (e) {
        e.preventDefault();

        let formData = $(this).serializeArray(); // Đây là array
        formData.push({ name: 'action', value: action });
        $.ajax({
            url: '/GetSetTypeOutOfStock',
            type: 'POST',
            data: formData,
            success: function (response) {
                MicroModal.close('modifiStockinTypeModal');
                table.rows().deselect();
                const notyf = new Notyf();
                if (response.success) {
                    notyf.open({
                        duration: 1000,
                        position: { x: 'right', y: 'bottom' },
                        type: "success",
                        message: "Sửa thành công",
                    });
                    table.ajax.reload(null, false);
                } else {
                    notyf.open({
                        duration: 1000,
                        position: { x: 'right', y: 'bottom' },
                        type: "error",
                        message: "Sửa không thành công",
                    });
                }
            },
            error: function (xhr, status, error) {
                table.rows().deselect();
                console.error('Lỗi khi Sửa:', error);
                const notyf = new Notyf();
                notyf.open({
                    duration: 1000,
                    position: { x: 'right', y: 'bottom' },
                    type: "error",
                    message: "Có lỗi xảy ra khi sửa",
                });
            }
        });
    });
});
function openModal(modalSelector,name,id) {
    MicroModal.show(modalSelector);
    $("#modalmodifyName").val(name);
    $("#idmodify").val(id);
}