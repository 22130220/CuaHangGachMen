let outOfStocDetails = [];
let setActive = [];
let action ='';
let detailuser='';
var table=new DataTable('#outofstock',{
    ajax: {
        url: '/GetSetOutOfStock',
        dataSrc: 'data'
    },
    fixedHeader: true,
    searching: true,
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
                        // openModal3('modifiStockInModal', data.id,data.userId,data.isActive,data.typeId);
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
                        // MicroModal.show('update_id_modal2');
                    },
                    enabled: false
                }
            ]
        },
    },
    select: true,
    columnDefs:  [
        {
            targets: 0,
            data: 'id',
            className: 'dt-center'
        },
        {
            targets: 1,
            data: 'createdDate',
            className: 'dt-center'
        },
        {
            targets: 2,
            data: 'userName',
            className: 'dt-center',
        },
        {
            targets: 3,
            data: 'updatedDate',
            className: 'dt-center'
        },
        {
            targets: 4,
            data: 'typeName',
            className: 'dt-center',
        },
        {
            targets: 5,
            data: 'id',
            className: 'dt-center',
            render:function (data,row){
                return `<i style="align-items: center" data-target="\${data}" title="Xem chi tiết"  class="fa-solid fa-file" onclick="getModel('phieuChiTietModal',\${data})"></i>`;
            }
        },
        {
            targets: 6,
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