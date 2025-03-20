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

var editor = CKEDITOR.replace('des');

function isNullOrEmptyOrWhitespace(str) {
    return str === null || str === undefined || /^\s*$/.test(str) || str === "";
}

function openModal(modalSelector, inputSelector, bind) {
    MicroModal.show(modalSelector);
    $("#" + inputSelector).val(bind);
}

var specTable = null;
var colorTable = null;

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
                return`<div class='table-icon-label'>  <a href="#" onclick="openUpdateProductModal(${data})"><i class="fa-solid fa-note-sticky"></i></a><a href="#" onclick="openSpecModal(${data})"><i class="fa-solid fa-eraser"></i></a> <a href="#" onclick="openColorModal(${data})"><i class="fa-solid fa-eraser"></i></a> </div>`
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

    table.button(1).enable(selectedRows === 1);
    table.button(2).enable(selectedRows > 0);
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
    let rowIndex = table.rows().data().toArray().findIndex(function (data) {
        return data.id === id;
    });
    if (rowIndex !== -1) {
        MicroModal.show('update_product_modal');
        let row = table.row(rowIndex);
        let rowData = row.data();
        vid = rowData.id;
        $("#productname").val(rowData.name);
        $("#size").val(rowData.sizeId);
        $("#productquantity").val(rowData.quantityPerBox);
        $("#productprice").val(rowData.pricePerBox);
        $("#productprice").val(rowData.pricePerBox);
        $("#category").val(rowData.categoryId);
        $("#productprice").val(rowData.pricePerBox);
        $("#productmaterial").val(rowData.materialId);
        $("#productmanufacturer").val(rowData.manufacturerId);
        $("#price_promotion").val(rowData.promotionPrice === "null" ? "" : rowData.promotionPrice) ;
        $("#productimg").val(rowData.imgThumbnail);
    } else {
        notyf.error('Không tìm thấy dòng có id:', id);
    }
}

$("#update_product_btn").on('click', function () {
    action = updateEle;
    const name = $("#productname").val();
    const size = $("#size").val();
    const quantity = $("#productquantity").val();
    const price = $("#productprice").val();
    const category =  $("#category").val();
    const material = $("#productmaterial").val();
    const manufacturer = $("#productmanufacturer").val();
    const promotion = $("#price_promotion").val();
    const img = $("#productimg").val();
    if((isNullOrEmptyOrWhitespace(name) || isNullOrEmptyOrWhitespace(size)
        || isNullOrEmptyOrWhitespace(quantity) || isNullOrEmptyOrWhitespace(price) ||
    isNullOrEmptyOrWhitespace(category) || isNullOrEmptyOrWhitespace(material) || isNullOrEmptyOrWhitespace(manufacturer))) {
        notyf.error("Cần nhập đủ thông tin");
    } else{
        $.ajax({
            url: '/admin/get-product',
            type: 'POST',
            data: {
                action: action,
                name: name,
                size: size,
                quantity: quantity,
                price: price,
                category: category,
                material: material,
                manufacturer: manufacturer,
                promotion: promotion,
                img : img,
                vid: vid
            },
            success: function (data) {
                if(data.success) {
                    notyf.success(action + " thành công");
                    MicroModal.close('update_product_modal');
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

$("#add_spec_btn").on('click', function () {
   const value =  $("#add_spec_val").val();
   const sel = $("#add_spec_type").val();
    if((isNullOrEmptyOrWhitespace(value) || isNullOrEmptyOrWhitespace(sel))) {
        notyf.error("Cần nhập đủ thông tin");
    } else {
        $.ajax({
            url: '/admin/getspec',
            type: 'POST',
            data: {
                action: action,
                value: value,
                sel: sel,
                pid: pid,
                specId: specId,
                vid: vid
            },
            success: function (data) {
                if(data.success) {
                    notyf.success(action + " thành công");
                    MicroModal.close('add_spec');
                    specTable.ajax.reload();
                    specTable.rows().deselect();
                    $("#add_spec_val").val("");
                } else {
                    notyf.error(action + " thất bại");
                    specTable.rows().deselect();
                }
            },
            error: function () {
                notyf.error(action + " thất bại");
            }
        });
    }

});

$("#update_spec_btn").on('click', function () {
    const value =  $("#update_spec_val").val();
    if((isNullOrEmptyOrWhitespace(value))) {
        notyf.error("Cần nhập đủ thông tin");
    } else {
        $.ajax({
            url: '/admin/getspec',
            type: 'POST',
            data: {
                action: action,
                value: value,
                pid: pid,
                specId: specId,
                vid: vid
            },
            success: function (data) {
                if(data.success) {
                    notyf.success(action + " thành công");
                    MicroModal.close('update_spec');
                    specTable.ajax.reload();
                    specTable.rows().deselect();
                    $("#update_spec_val").val("");
                } else {
                    notyf.error(action + " thất bại");
                    specTable.rows().deselect();
                }
            },
            error: function () {
                notyf.error(action + " thất bại");
            }
        });
    }

});

function deleteSpec(specIdToDel) {
    $.ajax({
        url: '/admin/getspec',
        type: 'POST',
        data: {
            action: action,
            pid: pid,
            specIdToDel: JSON.stringify(specIdToDel),
        },
        success: function (data) {
            if(data.success) {
                notyf.success(action + " thành công");
                specTable.ajax.reload();
                specTable.rows().deselect();

            } else {
                notyf.error(action + " thất bại");
                specTable.rows().deselect();
            }
            $("#add_spec_type").empty();
        },
        error: function () {
            notyf.error(action + " thất bại");
        }
    });
}

function openSpecModal(productId) {
    pid = productId;
    $("#add_spec_type").empty();
    var object2Data = null;
    if (specTable === null) {
        specTable = new DataTable('#spec', {
            ajax: {
                url: '/admin/getspec',
                data: function(d) {
                    d.pid = productId;
                },
                dataSrc: function (json) {
                   json.specTypes.forEach(function (e) {
                       $('#add_spec_type').append(
                           $('<option></option>').val(e.Id).text(e.Name)
                       );
                    });

                    return json.productSpecs;
                }
            },
            fixedHeader: true,
            layout: {
                topStart: {
                    buttons: [
                        'colvis',
                        {
                            text: 'Chỉnh Sửa',
                            className: 'blue',
                            action: function (e, dt, node, config) {
                                let data = dt.row({ selected: true }).data();
                                action = updateEle;
                                specId = data.specId;
                                MicroModal.close('update_spec_modal');
                                $("#update_spec_val").val(data.value);
                                MicroModal.show('update_spec', {
                                    onClose: function() {
                                        openSpecModal(pid);
                                    }
                                });

                            },
                            enabled: false
                        },
                        {
                            text: 'Thêm',
                            className: 'green',
                            action: function (e, dt, node, config) {
                                let data = dt.row({ selected: true }).data();
                                action = addEle;
                                var optionCount = $('#add_spec_type').find('option').length;
                                if(optionCount > 0) {
                                    MicroModal.close('update_spec_modal');
                                    MicroModal.show('add_spec', {
                                        onClose: function() {
                                            openSpecModal(pid);
                                        }
                                    });
                                } else notyf.error("Trường dữ liệu đã đầy");

                            },
                            enabled: true
                        },
                        {
                            text: 'Xoá',
                            className: 'red',
                            action: function (e, dt, node, config) {
                                var data = dt.rows({ selected: true }).data();
                                var specIdToDel = [];
                                data.each(function(rowData, index) {
                                    specIdToDel.push(rowData.specId);
                                });
                                action = delEle;
                                deleteSpec(specIdToDel);
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
            },
            paging: false,
            searching: false,
        });

        specTable.on('select deselect', function () {
            var selectedRows = specTable.rows({ selected: true }).count();

            specTable.button(1).enable(selectedRows === 1);
            specTable.button(3).enable(selectedRows > 0);
        });
    } else {
        specTable.settings()[0].ajax.data = function (d) {
            d.pid = productId;
        };
        specTable.ajax.reload();
    }
    MicroModal.show('update_spec_modal');
}

function openColorModal(productForColorId) {
    pid = productForColorId;
    $("#add_color_type").empty();
    if (colorTable === null) {
        colorTable = new DataTable('#color', {
            ajax: {
                url: '/admin/productColorImg',
                data: function(d) {
                    d.pid = productForColorId;
                },
                dataSrc: function (json) {
                    json.colors.forEach(function (e) {
                        $('#add_color_type').append(
                            $('<option></option>').val(e.Id).text(e.Name)
                        );
                    });

                   json.productColors.forEach(function (e) {
                       console.log(e);
                   })
                    return json.productColors;
                }
            },
            fixedHeader: true,
            layout: {
                topStart: {
                    buttons: [
                        'colvis',
                        {
                            text: 'Chỉnh Sửa',
                            className: 'blue',
                            action: function (e, dt, node, config) {
                                let data = dt.row({ selected: true }).data();
                                action = updateEle;
                                colorRowId = data.id;
                                MicroModal.close('update_color_modal');
                                $("#update_color_val").val(data.url);
                                MicroModal.show('update_color', {
                                    onClose: function() {
                                        openColorModal(pid);
                                    }
                                });

                            },
                            enabled: false
                        },
                        {
                            text: 'Thêm',
                            className: 'green',
                            action: function (e, dt, node, config) {
                                let data = dt.row({ selected: true }).data();
                                action = addEle;

                                    MicroModal.close('update_color_modal');
                                    MicroModal.show('add_color', {
                                        onClose: function() {
                                            openColorModal(pid);
                                        }
                                    });
                            },
                            enabled: true
                        },
                        {
                            text: 'Xoá',
                            className: 'red',
                            action: function (e, dt, node, config) {
                                var data = dt.rows({ selected: true }).data();
                                var colorRowIdToDel = [];
                                data.each(function(rowData, index) {
                                    colorRowIdToDel.push(rowData.id);
                                });
                                action = delEle;
                                deleteColor(colorRowIdToDel);
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
                    data: 'colorName',
                    className: 'dt-center'
                },
                {
                    targets: 1,
                    data: 'url',
                    render: function (data) {
                        return `<td style="background-color: #f5f5f5;">
                            <img src="${data}" style="width:50px; height:auto;">
                        </td>`;
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
                    'vertical-align': 'middle'
                });
            },
            paging: false,
            searching: false,
        });

        colorTable.on('select deselect', function () {
            var selectedRows = colorTable.rows({ selected: true }).count();

            colorTable.button(1).enable(selectedRows === 1);
            colorTable.button(3).enable(selectedRows > 0);
        });
    } else {
        colorTable.settings()[0].ajax.data = function (d) {
            d.pid = productForColorId;
        };
        colorTable.ajax.reload();
    }
    MicroModal.show('update_color_modal');
}

$("#add_color_btn").on('click', function () {
    const value =  $("#add_color_val").val();
    const sel = $("#add_color_type").val();
    if((isNullOrEmptyOrWhitespace(value) || isNullOrEmptyOrWhitespace(sel))) {
        notyf.error("Cần nhập đủ thông tin");
    } else {
        $.ajax({
            url: '/admin/productColorImg',
            type: 'POST',
            data: {
                action: action,
                value: value,
                sel: sel,
                pid: pid,
                vid: vid
            },
            success: function (data) {
                if(data.success) {
                    notyf.success(action + " thành công");
                    MicroModal.close('add_color');
                    colorTable.ajax.reload();
                    colorTable.rows().deselect();
                    $("#add_color_val").val("");
                } else {
                    notyf.error(action + " thất bại");
                    colorTable.rows().deselect();
                }
            },
            error: function () {
                notyf.error(action + " thất bại");
            }
        });
    }

});

$("#update_color_btn").on('click', function () {
    const value =  $("#update_color_val").val();
    if((isNullOrEmptyOrWhitespace(value))) {
        notyf.error("Cần nhập đủ thông tin");
    } else {
        $.ajax({
            url: '/admin/productColorImg',
            type: 'POST',
            data: {
                action: action,
                value: value,
                colorRowId: colorRowId,
                vid: vid
            },
            success: function (data) {
                if(data.success) {
                    notyf.success(action + " thành công");
                    MicroModal.close('update_color');
                    colorTable.ajax.reload();
                    colorTable.rows().deselect();
                    $("#update_color_val").val("");
                } else {
                    notyf.error(action + " thất bại");
                    colorTable.rows().deselect();
                }
            },
            error: function () {
                notyf.error(action + " thất bại");
            }
        });
    }

});

function deleteColor(colorIdToDel) {
    $.ajax({
        url: '/admin/productColorImg',
        type: 'POST',
        data: {
            action: action,
            colorIdToDel: JSON.stringify(colorIdToDel),
        },
        success: function (data) {
            if(data.success) {
                notyf.success(action + " thành công");
                colorTable.ajax.reload();
                colorTable.rows().deselect();
                $("#add_color_type").empty();

            } else {
                notyf.error(action + " thất bại");
                colorTable.rows().deselect();
                $("#add_color_type").empty();
            }
        },
        error: function () {
            notyf.error(action + " thất bại");
        }
    });
}

function loadFileCKEditor(linkDescription, productId) {
    $.ajax({
        url: '/admin/des',
        type: 'GET',
        data: {
            pid: pid,
            linkDes: linkDescription
        },
        dataType: 'text',
        success: function (data) {
            console.log(data);
            editor.setData(data);
            MicroModal.show('update_des');

        },
        error: function () {
            alert('Không thể tải danh sách sản phẩm.');
        }
    });
}

$("#update_des_btn").on('click', function () {
    const value =  editor.getData();
    if((isNullOrEmptyOrWhitespace(value))) {
        notyf.error("Cần nhập đủ thông tin");
    } else {
        var decodedContent = $('<div/>').html(value).text();
        $.ajax({
            url: '/admin/des',
            type: 'POST',
            data: {
                action: action,
                value: decodedContent,
                linkDes: linkDes
            },
            success: function (data) {
                if(data.success) {
                    notyf.success(action + " thành công");
                    MicroModal.close('update_des');
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

