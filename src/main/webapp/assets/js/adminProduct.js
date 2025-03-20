var specTable = null;
var productTable = initDataTable('#example', '/admin/get-product', 'products', function (d) {}, [
    {
        targets:0,
        data: 'imgThumbnail',
        render: data => `<td style="background-color: #f5f5f5;"><img src="${data}" style="width:50px; height:auto;"></td>`,
        className: 'dt-center'
    },
    { targets: 1, data: 'name', className: 'dt-center' },
    {
        targets: 2,
        data: 'pricePerBox',
        render: data => `<td style="color: red;">${data.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' })}</td>`,
        className: 'dt-center dt-nowrap'
    },
    {
        targets: 3,
        data: 'stock',
        render: data => `<td style="${data === 0 ? 'background-color: #ffe0e0;' : ''}">${data}</td>`,
        className: 'dt-center'
    },
    {
        targets: 4,
        data: 'status',
        render: data => data ? `<td><div class="isActive"> Còn hàng </div></td>` : `<td><div class="deActive"> Hết hàng </div></td>`,
        className: 'dt-center'
    },
    {
        targets: 5,
        data: 'id',
        render: data => `<div class='table-icon-label'><a href="#" onclick="openUpdateProductModal(${data})"><i class="fa-solid fa-note-sticky"></i></a><a href="#" onclick="openSpecModal(${data})"><i class="fa-solid fa-eraser"></i></a><a href="#" onclick="openColorModal(${data})"><i class="fa-solid fa-eraser"></i></a></div>`,
        className: 'dt-center'
    }
], [
    {
        extend: 'colvis',
        text: 'Cột hiển thị',
    },
    {
        extend: 'copy',
        text: 'Sao chép',
        exportOptions: {
            columns: ':visible'
        }
    },
    {
        extend: 'csv',
        exportOptions: {
            columns: ':visible'
        }
    },
    {
        extend: 'excel',
        exportOptions: {
            columns: ':visible'
        }
    },
    {
        extend: 'pdf',
        exportOptions: {
            columns: ':visible'
        }
    },

    {
        extend: 'print',
        text: 'In',
        exportOptions: {
            columns: ':visible',
        }
    },
    {
        extend: 'print',
        text: 'In tất cả',
        exportOptions: {
            columns: ':visible',
            modifier: {
                selected: null
            }
        }
    },
    {
        text: 'Mô tả',
        className: 'green',
        action: (e, dt) => {
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
        action: (e, dt) => {
            // let data = dt.rows({ selected: true }).data();
            // setActive = [];
            // data.each((rowData) => setActive.push(rowData.id));
            MicroModal.show('update_id_modal');
        },
        enabled: false
    }
], function (e, dt) {
    const selectedRows = dt.rows({ selected: true }).count();
    dt.button(1).enable(selectedRows === 1); // Button chỉnh sửa
    dt.button(2).enable(selectedRows > 0); // Button xóa
},{ paging: true, searching: true });

function openSpecModal(productId) {
    pid = productId;
    $("#add_spec_type").empty();
    if (!specTable) {
        specTable = initDataTable('#spec', '/admin/getspec', function (json) {
            json.specTypes.forEach(e => $('#add_spec_type').append($('<option></option>').val(e.Id).text(e.Name)));
            return json.productSpecs;
        }, function (d) {
           d.pid = productId;
        }, [
            { targets: 0, data: 'specName', className: 'dt-center' },
            { targets: 1, data: 'value', className: 'dt-center' }
        ], [
            'colvis',
            {
                text: 'Chỉnh Sửa',
                className: 'blue',
                action: (e, dt) => {
                    let data = dt.row({ selected: true }).data();
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
                action: (e, dt, node, config) => {
                    let data = dt.row({ selected: true }).data();
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
                action: (e, dt) => {
                    let data = dt.rows({ selected: true }).data();
                    let specIdToDel = [];
                    data.each(rowData => specIdToDel.push(rowData.specId));
                    let pid = data[0].productId;
                    deleteSpec(pid, specIdToDel, specTable);
                },
                enabled: false
            }
        ], function (e, dt) {
            const selectedRows = dt.rows({ selected: true }).count();
            dt.button(1).enable(selectedRows === 1); // Button chỉnh sửa
            dt.button(2).enable(); // Button
            dt.button(3).enable(selectedRows > 0); // Button xóa
        });
    } else {
        specTable.settings()[0].ajax.data = function (d) {
            d.pid = productId;
        };
        specTable.ajax.reload();
    }
    MicroModal.show('update_spec_modal');
}

function openUpdateProductModal(id) {
    let rowData = productTable.rows().data().toArray().find(data => data.id === id);
    if (rowData) {
        vid = rowData.id;
        openModalWithData('update_product_modal', {
            productname: rowData.name,
            size: rowData.sizeId,
            productquantity: rowData.quantityPerBox,
            productprice: rowData.pricePerBox,
            category: rowData.categoryId,
            productmaterial: rowData.materialId,
            productmanufacturer: rowData.manufacturerId,
            price_promotion: rowData.promotionPrice === "null" ? "" : rowData.promotionPrice,
            productimg: rowData.imgThumbnail,
            vid: rowData.id
        });
    } else {
        notyf.error(`Không tìm thấy dòng có id: ${id}`);
    }
}

$("#update_id_btn").on('click', function () {
    const form = $('#updateIdForm')[0];
    const formData = new FormData(form);

    // const dt = productTable.DataTable();
    let data = productTable.rows({ selected: true }).data();
    setActive = [];
    data.each((rowData) => setActive.push(rowData.id));

    formData.append('setActive', JSON.stringify(setActive));

    sendAjaxRequest({
        url: '/admin/get-product',
        data: formData,
        successMessage: "Cập nhật trạng thái thành công",
        errorMessage: "Cập nhật trạng thái thất bại",
        tableToReload: null,
        modalToClose: 'update_id_modal',
        type: 'DELETE',
        onSuccess: function (resp) {
            resp.activated.forEach(function(item) {
                let row = productTable.row((idx, rowData) => rowData.id === item);
                if (row.any()) {
                    let rowData = row.data();
                    rowData.status = resp.active;
                    row.data(rowData).draw(false);
                }
            });
        }
    });
});

$(document).ready(function() {
    $("#updateProductForm").validate({
        rules: {
            name: {
                required: true,
                minlength: 2
            },
            quantity: {
                required: true,
                number: true,
                min: 1
            },
            price: {
                required: true,
                number: true,
                min: 0
            },
            promotion: {
                required: false,
                number: true,
                min: 0
            }
        },
        messages: {
            name: {
                required: "Vui lòng nhập tên sản phẩm",
                minlength: "Tên sản phẩm phải dài ít nhất 2 ký tự"
            },
            quantity: {
                required: "Vui lòng nhập số lượng",
                number: "Số lượng phải là số",
                min: "Số lượng phải lớn hơn 0"
            },
            price: {
                required: "Vui lòng nhập giá",
                number: "Giá phải là số",
                min: "Giá không được âm"
            },
            promotion: {
                required: "Vui lòng nhập giá khuyến mãi",
                number: "Giá khuyến mãi phải là số",
                min: "Giá khuyến mãi không được âm"
            }
        },
        submitHandler: function(form) {
            // Gửi Ajax khi form hợp lệ
            formAjaxRequest({
                url: '/admin/get-product',
                formSelector: '#updateProductForm',
                successMessage: "Cập nhật thành công",
                errorMessage: "Cập nhật thất bại",
                tableToReload: productTable,
                modalToClose: 'update_product_modal',
                type: 'PUT',
                onSuccess: function (resp) {
                }
            });
        }
    });

    // Gắn sự kiện cho button
    $('#update_product_btn').click(function(e) {
        e.preventDefault();
        $("#updateProductForm").submit();
    });
});

function deleteSpec(pid, sid, specTable) {
    const formData = new FormData();
    formData.append("action", 'Xoá');
    formData.append("specIdToDel", sid);
    formData.append("pid", pid);
   sendAjaxRequest({
       url: '/admin/getspec',
       data: formData,
       successMessage: "Xoá thành công",
       errorMessage: "Xoá thất bại",
       tableToReload: specTable,
       modalToClose: null,
       type: 'POST',
       onSuccess: function (resp) {
       }
   })
}

$("#add_spec_btn").on('click', function () {
    const value =  $("#add_spec_val").val();
    const sel = $("#add_spec_type").val();

    const formData = new FormData();
    formData.append("action", 'Thêm');
    formData.append("sel", sel);
    formData.append("pid", pid);
    formData.append("value", value);
    sendAjaxRequest({
        url: '/admin/getspec',
        data: formData,
        successMessage: "Xoá thành công",
        errorMessage: "Xoá thất bại",
        tableToReload: specTable,
        modalToClose: 'add_spec',
        type: 'POST',
        onSuccess: function (resp) {
            $("#add_spec_val").val("");
        }
    })

});

$("#update_spec_btn").on('click', function () {
    const value =  $("#update_spec_val").val();
    let data = specTable.rows({ selected: true }).data();
    let pid = 0;
    let specId = 0;
    if(data) {
        pid = data[0].productId;
        specId = data[0].specId;
    } else return;

    const formData = new FormData();
    formData.append("action", "Cập nhật");
    formData.append("value", value);
    formData.append("pid", pid);
    formData.append("specId", specId);

    sendAjaxRequest({
        url: '/admin/getspec',
        data: formData,
        successMessage: "Chỉnh sửa thành công",
        errorMessage: "Chỉnh sửa thất bại",
        tableToReload: specTable,
        modalToClose: 'update_spec',
        type: 'POST',
        onSuccess: function (resp) {
            $("#update_spec_val").val("");
        }
    })

});
