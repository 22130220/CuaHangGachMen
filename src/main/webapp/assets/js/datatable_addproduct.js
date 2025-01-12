var notyf = new Notyf();
let addEle = 'Thêm';
let updateEle = 'Cập nhật';
let delEle = 'Xoá';

let vid;

let setActive = [];
let action;

let pid;
let specId;
let colorRowId;

let linkDes;

function isNullOrEmptyOrWhitespace(str) {
    return str === null || str === undefined || /^\s*$/.test(str) || str === "";
}



// var productSpec = new DataTable('#specs', {
//     ajax: {
//         url: '/admin/getspec',
//         data: {
//           pid : 1
//         },
//         dataSrc: 'productSpecs'
//     },
//     fixedHeader: true,
//     layout: {
//         topStart: {
//             buttons: [
//                 'colvis',
//                 {
//                     text: 'Chỉnh Sửa',
//                     className: 'green',
//                     action: function (e, dt, node, config) {
//                         let data = dt.row({ selected: true }).data();
//                         window.location.href = `/admin/productcrud?pid=${encodeURIComponent(data.id)}`;
//                     },
//                     enabled: false
//                 },
//                 {
//                     text: 'Xoá',
//                     className: 'red',
//                     action: function (e, dt, node, config) {
//                         console.log('Rows: ' + dt.rows({ selected: true }).count());
//                     },
//                     enabled: false
//                 }
//             ]
//         },
//     },
//     select: true,
//     columnDefs: [
//         {
//             targets: 0,
//             width: 20,
//             data: 'specName',
//             className: 'dt-center'
//         },
//         {
//             targets: 1,
//             data: 'value',
//             className: 'dt-center'
//         },
//     ],
//     'autoWidth': false,
//     language: {
//         lengthMenu: "Hiển thị _MENU_ mục mỗi trang",
//         zeroRecords: "Không tìm thấy kết quả",
//         info: "Hiển thị trang _PAGE_ của _PAGES_",
//         infoEmpty: "Không có dữ liệu",
//         infoFiltered: "(lọc từ _MAX_ tổng mục)"
//     },
//
//     createdRow: function (row, data, dataIndex) {
//         // Thêm lớp CSS để căn giữa các ô
//         $('td', row).css({
//             'text-align': 'center',
//             'vertical-align': 'middle'
//         });
//     }
//
// });




const productName = $('#productname').val();
const productSize = $('#size').val();
const productQuantity = $('#productquantity').val();
const productPrice = $('#productprice').val();
const productPricePromotion = $('#price_promotion').val();
const productCategory = $('#productform').val();
const productMaterial = $('#productmaterial').val();
const productManufacturer = $('#productmanufacturer').val();


// Danh sách đã chọn để kiểm tra trùng lặp
let selectedSpecs = new Set();

// Xử lý thêm mới
$('#add-spec-btn').click(function () {
    $('#spec-type').val('');
    $('#spec-value').val('');
    $('#addSpecModal').modal('show');
});

// Xử lý submit form thêm/sửa
$('#spec-form').submit(function (e) {
    e.preventDefault();

    let specType = $('#spec-type').val();
    let specValue = $('#spec-value').val();

    if (selectedSpecs.has(specType)) {
        alert('Thông số này đã được chọn!');
        return;
    }

    selectedSpecs.add(specType);

    specTable.row.add({
        specName: specType,
        specValue: specValue,
    }).draw();

    $('#addSpecModal').modal('hide');
});

// Xử lý xóa
$('#spec-table').on('click', '.btn-delete', function () {
    let row = specTable.row($(this).parents('tr'));
    let rowData = row.data();
    selectedSpecs.delete(rowData.specName); // Xóa khỏi danh sách đã chọn
    row.remove().draw();
});

// Xử lý sửa
$('#spec-table').on('click', '.btn-edit', function () {
    let row = specTable.row($(this).parents('tr'));
    let rowData = row.data();

    $('#spec-type').val(rowData.specName).prop('disabled', true); // Không cho sửa loại thông số
    $('#spec-value').val(rowData.specValue);
    $('#addSpecModal').modal('show');

    $('#spec-form').off('submit').submit(function (e) {
        e.preventDefault();
        rowData.specValue = $('#spec-value').val();
        row.data(rowData).draw();
        $('#addSpecModal').modal('hide');
    });
});


var specTable = new DataTable('#spec-table', {
    ajax: {
        url: '/admin/getspec',
        dataSrc: function (json) {
            json.specTypes.forEach(function (e) {
                $('#update_spec_type').append(
                    $('<option></option>').val(e.Id).text(e.Name)
                );
            });
        }
    },
    fixedHeader: true,
    layout: {
        topStart: {
            buttons: [
                {
                    text: 'Chỉnh Sửa',
                    className: 'blue',
                    action: function (e, dt, node, config) {
                        let data = dt.row({ selected: true }).data(); // Lấy dữ liệu của hàng được chọn
                        if (data) {
                            // Hiển thị modal chỉnh sửa
                            $('#update_spec_type').val(data.specName); // Gán giá trị tên thông số
                            $('#update_spec_value').val(data.specValue); // Gán giá trị
                            MicroModal.show('update_spec_modal', {
                                onClose: function () {
                                    specTable.rows().deselect(); // Hủy chọn sau khi đóng modal
                                }
                            });
                        } else {
                            notyf.error("Vui lòng chọn một dòng để chỉnh sửa.");
                        }
                    },
                    enabled: false // Mặc định nút bị vô hiệu
                },
                {
                    text: 'Thêm',
                    className: 'green',
                    action: function (e, dt, node, config) {
                        action = addEle; // Gán hành động hiện tại là thêm
                        var optionCount = $('#update_spec_type').find('option').length;

                        if (optionCount > 0) {
                            // Hiển thị modal thêm
                            MicroModal.show('add_spec', {
                                onClose: function () {
                                    specTable.rows().deselect(); // Hủy chọn khi đóng modal
                                }
                            });
                        } else {
                            notyf.error("Trường dữ liệu đã đầy");
                        }
                    },
                    enabled: true // Nút luôn được bật
                },
                {
                    text: 'Xoá',
                    className: 'red',
                    action: function (e, dt, node, config) {
                        var data = dt.rows({ selected: true }).data(); // Lấy các hàng được chọn
                        var specIdToDel = [];

                        // Thu thập tất cả specId của hàng đã chọn
                        data.each(function (rowData) {
                            specIdToDel.push(rowData.specId);
                        });

                        if (specIdToDel.length > 0) {
                            action = delEle; // Gán hành động hiện tại là xóa
                            deleteSpec(specIdToDel); // Gọi hàm xóa
                        } else {
                            notyf.error("Vui lòng chọn ít nhất một dòng để xóa.");
                        }
                    },
                    enabled: false // Mặc định nút bị vô hiệu
                }
            ]
        },
    },
    select: true, // Bật chức năng chọn hàng
    // columns: [
    //     { data: 'specName', title: 'Tên Thông Số' }, // Tên cột
    //     { data: 'specValue', title: 'Giá Trị' } // Giá trị cột
    // ],
    autoWidth: false, // Tắt auto-width để dễ kiểm soát
    language: {
        lengthMenu: "Hiển thị _MENU_ mục mỗi trang",
        zeroRecords: "Không tìm thấy kết quả",
        info: "Hiển thị trang _PAGE_ của _PAGES_",
        infoEmpty: "Không có dữ liệu",
        infoFiltered: "(lọc từ _MAX_ tổng mục)"
    },
    createdRow: function (row, data, dataIndex) {
        // Căn giữa các ô
        $('td', row).css({
            'text-align': 'center',
            'vertical-align': 'middle'
        });
    },
    paging: false, // Tắt phân trang
    searching: false, // Tắt tìm kiếm
});

// Xử lý khi chọn hoặc hủy chọn các hàng
specTable.on('select deselect', function () {
    var selectedRows = specTable.rows({ selected: true }).count();

    // Bật/tắt nút "Chỉnh Sửa" nếu chỉ có 1 hàng được chọn
    specTable.button(0).enable(selectedRows === 1);

    // Bật/tắt nút "Xoá" nếu có ít nhất 1 hàng được chọn
    specTable.button(2).enable(selectedRows > 0);
});
