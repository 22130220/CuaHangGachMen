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



var specTable = new DataTable('#spec-table', {
    fixedHeader: true,
    ordering: false,
    layout: {
        topStart: {
            buttons: [
                {
                    text: 'Thêm',
                    className: 'green',
                    action: function (e, dt, node, config) {
                        action = addEle; // Gán hành động hiện tại là thêm
                        var optionCount = $('#add_spec_type').find('option').length;


                            // Hiển thị modal thêm
                            MicroModal.show('add_spec');
                    },
                    enabled: true
                },
                {
                    text: 'Xoá',
                    className: 'red',
                    action: function (e, dt, node, config) {
                        var data = dt.rows({ selected: true }).data();// Lấy các hàng được chọn
                        //console.log(data);
                        //var specIdToDel = [];

                        data.each(function (rowData, index) {
                            const text = rowData[0];
                            const value = rowData[1];
                            const sel = rowData[2];
                            let valueMatches = value.match(/name="value".*?value="([^"]*)"/);
                            let idMatches = sel.match(/name="id".*?value="([^"]*)"/);

                            let extractedValue = valueMatches ? valueMatches[1] : null;
                            let extractedId = idMatches ? idMatches[1] : null;
                            $('#add_spec_type').append(
                                $('<option></option>').val(extractedId).text(text)
                            )
                        });
                        specTable.rows({ selected: true }).remove().draw();

                    },
                    enabled: true
                }
            ]
        },
    },
    select: true, // Bật chức năng chọn hàng
    columnDefs: [
        {
            targets: 0,
            className: 'dt-center'
        },
        {
            targets: 1,
            className: 'dt-center '
        },
        {
            targets: 2,
            visible: true,
        }
    ],
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

$(document).ready(function () {
    $.ajax({
        url: '/admin/spec',
        type: 'GET',
        success: function (data) {
            data.specTypes.forEach(function (e) {
                $('#add_spec_type').append(
                    $('<option></option>').val(e.Id).text(e.Name)
                );
            });

            data.colors.forEach(function (e) {
                $('#add_color_type').append(
                    $('<option></option>').val(e.Id).text(e.Name)
                );
            });
        },
        error: function () {
            notyf.error(action + " thất bại");
        }
    })
});

$("#add_spec_btn").on('click', function () {
    const value =  $("#add_spec_val").val();
    const sel = $("#add_spec_type").val();
    const text = $("#add_spec_type").find(`option[value=${sel}]`).text();
    if((isNullOrEmptyOrWhitespace(value) || isNullOrEmptyOrWhitespace(sel))) {
        notyf.error("Cần nhập đủ thông tin");
    } else {
       specTable.row.add([
           text,
           `<div class="fui-basic-input flex-column gap-6">
                <input type="text" name="spec" value="${value}" class="input input-bordered f-s-14"  autocomplete="off" required/>
            </div>`,
           `<input type="hidden" name="spec_id" value="${sel}" readonly required>`]).draw();
       $('#add_spec_type').find(`option[value=${sel}]`).remove();
        MicroModal.close('add_spec');
        $("#add_spec_val").val("");
    }
});

var colorTable = new DataTable('#color', {
    fixedHeader: true,
    ordering: false,
    layout: {
        topStart: {
            buttons: [
                {
                    text: 'Thêm',
                    className: 'green',
                    action: function (e, dt, node, config) {
                        action = addEle; // Gán hành động hiện tại là thêm
                        var optionCount = $('#add_color_type').find('option').length;

                        // Hiển thị modal thêm
                        MicroModal.show('add_color');
                    },
                    enabled: true
                },
                {
                    text: 'Xoá',
                    className: 'red',
                    action: function (e, dt, node, config) {
                        var data = dt.rows({ selected: true }).data();
                        colorTable.rows({ selected: true }).remove().draw();

                    },
                    enabled: true
                }
            ]
        },
    },
    select: true, // Bật chức năng chọn hàng
    columnDefs: [
        {
            targets: 0,
            className: 'dt-center'
        },
        {
            targets: 1,
            className: 'dt-center '
        },
        {
            targets: 2,
            visible: true,
        }
    ],
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

$("#add_color_btn").on('click', function () {
    // const value =  $("#add_color_val").val();
    const sel = $("#add_color_type").val();
    const text = $("#add_color_type").find(`option[value=${sel}]`).text();
    // if((isNullOrEmptyOrWhitespace(value) || isNullOrEmptyOrWhitespace(sel))) {
    //     notyf.error("Cần nhập đủ thông tin");
    // } else {
        colorTable.row.add([
            text,

            `<div class="fui-basic-input flex-column gap-6">
                <input type="file" name="color" class="input input-bordered f-s-14" accept=".jpg, .jpeg, .png" required>
            </div>`,
            `<input type="hidden" name="color_id" value="${sel}" readonly>`]).draw();
        MicroModal.close('add_color');
        $("#add_color_val").val("");
    // }
});

