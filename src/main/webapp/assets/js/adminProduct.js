var productTable = initDataTable('#example', '/admin/get-product', 'products', [
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
    'colvis',
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
], { paging: true, searching: true });

function openSpecModal(productId) {
    pid = productId;
    $("#add_spec_type").empty();
    if (!specTable) {
        specTable = initDataTable('#spec', '/admin/getspec', function (json) {
            json.specTypes.forEach(e => $('#add_spec_type').append($('<option></option>').val(e.Id).text(e.Name)));
            return json.productSpecs;
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
                    action = updateEle;
                    specId = data.specId;
                    $("#update_spec_val").val(data.value);
                    MicroModal.show('update_spec', { onClose: () => openSpecModal(pid) });
                },
                enabled: false
            },
            {
                text: 'Thêm',
                className: 'green',
                action: () => {
                    action = addEle;
                    if ($('#add_spec_type option').length > 0) {
                        MicroModal.show('add_spec', { onClose: () => openSpecModal(pid) });
                    } else {
                        notyf.error("Trường dữ liệu đã đầy");
                    }
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
                    action = delEle;
                    deleteSpec(specIdToDel);
                },
                enabled: false
            }
        ], { ajaxData: d => d.pid = productId });
    } else {
        specTable.settings()[0].ajax.data = d => d.pid = productId;
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
