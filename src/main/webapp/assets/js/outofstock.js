
document.addEventListener('alpine:init', () => {
    Alpine.data('changeSelectToText', () => ({
        isInputText: true,
        isNhanText: true,
        colors: [
        ],
        dataInput: '',
        dataInputID: '',
        danhsachsearch() {
            if (!this.dataInput || this.dataInput.trim() === '') {
                this.colors = []; // reset nếu input trống
                return;
            }
            this.isNhanText=true;

            $.ajax({
                url: `/GetDanhSanPhamSearch?data=${this.dataInput}`,
                type: 'GET',
                success: (res) => {
                    this.colors = res.data;
                },
                error: function () {
                    alert("Không thể tải danh sách.");
                }
            });
        },
        nhanTen(colorIs){
            this.dataInput = colorIs.name;
            this.dataInputID=colorIs.id;
            this.isNhanText = false;
        },
        toggleChangeInput() {
            this.isInputText = !this.isInputText;
            if(this.isInputText===false){
                $.ajax({
                    url: '/GetListProdudctAndColor',
                    type: 'GET',
                    success: function (res) {
                        const productList = res.productList;
                        const colorList = res.colorList;
                        const typeList = res.typeoutList;
                        const $select = $("#productId");
                        $select.empty().append(`<option value="">-- Chọn sản phẩm --</option>`);
                        productList.forEach(t => {
                            $select.append(`<option value="${t.id}">${t.name}</option>`);
                        });

                        const $selectcolor = $("#colorId");
                        $selectcolor.empty().append(`<option value="">-- Chọn màu --</option>`);
                        colorList.forEach(c => {
                            $selectcolor.append(`<option value="${c.ID}">${c.Name}</option>`);
                        });

                        const $selecttype = $("#typeId");
                        $selecttype.empty().append(`<option value="">-- Thể loại --</option>`);
                        typeList.forEach(c => {
                            $selecttype.append(`<option value="${c.id}">${c.name}</option>`);
                        });

                        MicroModal.show('add_modal');
                    },
                    error: function () {
                        alert("Không thể tải danh sách.");
                    }
                });
            }
        },

    }))
})




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
                        openModal3('modifiStockInModal', data.id,data.userId,data.isActive,data.typeId,data.userName);
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
                return `<i style="align-items: center" data-target="${data}" title="Xem chi tiết"  class="fa-solid fa-file" onclick="getModel('phieuChiTietModal',${data})"></i>`;
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

const addButton = document.getElementById("add");
if (addButton) {
    addButton.addEventListener("click", function () {
        $.ajax({
            url: '/GetListProdudctAndColor',
            type: 'GET',
            success: function (res) {
                const productList = res.productList;
                const colorList = res.colorList;
                const typeList = res.typeoutList;
                const $select = $("#productId");
                $select.empty().append(`<option value="">-- Chọn sản phẩm --</option>`);
                productList.forEach(t => {
                    $select.append(`<option value="${t.id}">${t.name}</option>`);
                });

                const $selectcolor = $("#colorId");
                $selectcolor.empty().append(`<option value="">-- Chọn màu --</option>`);
                colorList.forEach(c => {
                    $selectcolor.append(`<option value="${c.ID}">${c.Name}</option>`);
                });


                const $selecttype = $("#typeId");
                $selecttype.empty().append(`<option value="">-- Thể loại --</option>`);
                typeList.forEach(c => {
                    $selecttype.append(`<option value="${c.id}">${c.name}</option>`);
                });




                MicroModal.show('add_modal');
            },
            error: function () {
                alert("Không thể tải danh sách.");
            }
        });
        action='Thêm';

    });
}

$("#addDetailBtn").on("click", function () {
    let productId = $("#productId").val();
    const productId2=$("#productId3").val();
    if (productId2 !== undefined && productId2 !== "") {
        productId = productId2;
    }
    let productText = $("#productId option:selected").text();
    const productText2=$("#productId1").val();
    if(productText2!=='' && productText2 !== undefined){
        productText =productText2;
    }
    const colorId = $("#colorId").val();
    const colorText = $("#colorId option:selected").text();
    const quantity = parseInt($("#quantity").val(), 10);
    const unitPriceRaw = $("#unitPrice").val().replace(/\./g, '');
    const unitPrice = parseFloat(unitPriceRaw);

    if (!productId || !colorId || !quantity || !unitPrice) {
        alert("Vui lòng nhập đầy đủ.");
        return;
    }

    outOfStocDetails.push({
        productId: parseInt(productId, 10),
        colorId: parseInt(colorId, 10),
        quantity,
        unitPrice
    });

    console.log(outOfStocDetails)
    const rowHtml = `
    <tr>
      <td>${productText}</td>
      <td>${colorText}</td>
      <td>${quantity}</td>
      <td>${unitPrice.toFixed(2)}</td>
      <td><button type="button" class="btn-delete">X</button></td>
    </tr>
  `;
    $("#stockInDetailTable tbody").append(rowHtml);
});

$("#stockInDetailTable").on("click", ".btn-delete", function () {
    const rowIndex = $(this).closest("tr").index();
    outOfStocDetails.splice(rowIndex, 1); // Xóa trong mảng
    $(this).closest("tr").remove();     // Xóa trong HTML
    console.log(outOfStocDetails)
});

$("#add_btn").on("click", function () {
    let typeid = document.getElementById('typeId').value;
    $.ajax({
        url: "/AddOutOfStock",
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify({
            outOfStocDetails: outOfStocDetails,
            typeid: typeid
        }),
        success: function (response) {
            table.ajax.reload(null, false);
            outOfStocDetails = [];
            const notyf = new Notyf();
            $("#stockInDetailTable tbody").empty();
            MicroModal.close("add_modal");
            if (response.success) {
                table.rows().deselect();
                notyf.open({
                    duration: 1000,
                    position: { x: 'right', y: 'bottom' },
                    type: "success",
                    message: "Nhập kho thành công",
                });
                $("#productId1").val('');
                $("#quantity").val('');
                $("#unitPrice").val('');

            } else {
                table.rows().deselect();
                notyf.open({
                    duration: 1000,
                    position: { x: 'right', y: 'bottom' },
                    type: "error",
                    message: "Nhập kho không thành công",
                });
            }
        },
        error: function () {
            alert("Có lỗi khi lưu dữ liệu.");
        }
    });
});

























$("#update_id_btn3").on('click', function () {
    const active = $("#update_active_id").val();
    console.log(setActive)
    $.ajax({
        url: '/GetSetOutOfStock',
        type: 'POST',
        traditional: true,
        data: {
            id: setActive,
            active: active,
            action: action

        },
        success: function (data) {
            MicroModal.close('update_id_modal2');
            const notyf = new Notyf();
            if(data.success) {
                notyf.success( " thành công");
                table.ajax.reload();
                table.rows().deselect();
            } else {
                notyf.error(" thất bại");
                table.rows().deselect();
            }
        },
        error: function () {
            MicroModal.close('update_id_modal2');
            const notyf = new Notyf();
            notyf.error(" thất bại");
        }
    })
});


function openModal3(modalSelector, id, userId,isActive, typeId,userName ) {
    $.ajax({
        url: "/GetAllTypeOutOfStock",
        method: "GET",
        success: function (typeList) {
            const $select = $("#type");
            $select.empty();
            $select.append(`<option value="">-- Chọn thể loại --</option>`);
            typeList.forEach(t => {
                $select.append(`<option value="${t.id}">${t.name}</option>`); // <-- CHỈ CẦN SỬA LẠI ĐÂY
            });
            $("#userName").val(userName);
            $("#idmodify").val(id);
            $("#userId").val(userId);
            $("#update_active").val(isActive ? "true" : "false");
            $select.val(typeId);
            MicroModal.show(modalSelector);
        },
        error: function () {
            alert("Không thể tải danh sách thể loại phiếu nhập.");
        }
    });
}

$(document).ready(function () {
    $('#OutofStockupdateForm').on('submit', function (e) {
        e.preventDefault();

        let formData = $(this).serializeArray();
        formData.push({ name: 'action', value: action });
        $.ajax({
            url: '/GetSetOutOfStock',
            type: 'POST',
            data: formData,
            success: function (response) {
                MicroModal.close('modifiStockInModal');

                const notyf = new Notyf();
                if (response.success) {
                    table.rows().deselect();
                    notyf.open({
                        duration: 1000,
                        position: { x: 'right', y: 'bottom' },
                        type: "success",
                        message: "Sửa thành công",
                    });
                    table.ajax.reload(null, false);
                } else {
                    table.rows().deselect();
                    notyf.open({
                        duration: 1000,
                        position: { x: 'right', y: 'bottom' },
                        type: "error",
                        message: "Sửa không thành công",
                    });
                }
            },
            error: function (xhr, status, error) {
                console.error('Lỗi khi Sửa:', error);
                const notyf = new Notyf();
                table.rows().deselect();
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




function getModel(modalSelector,id){
    const tableId = '#outofstockdetail';
    const dataUrl = '/GetSetOutOfStockDetail';
    if ($.fn.DataTable.isDataTable(tableId)) {
        const table = $(tableId).DataTable();
        table.ajax.url(dataUrl + '?id=' + id).load();
    } else {
        var table=new DataTable('#outofstockdetail',{
            ajax: {
                url: dataUrl,
                data:{id:id},
                dataSrc: 'data'
            },
            fixedHeader: true,
            layout: {
                topStart: {
                    buttons: [
                        'colvis',
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
                    data: 'outOfStockId',
                    className: 'dt-center'
                },
                {
                    targets: 2,
                    data: 'product',
                    className: 'dt-center',
                },
                {
                    targets: 3,
                    data: 'color',
                    className: 'dt-center'
                },
                {
                    targets: 4,
                    data: 'quantity',
                    className: 'dt-center'
                },
                {
                    targets: 5,
                    data: 'unitPrice',
                    className: 'dt-center'
                },
                {
                    targets: 6,
                    data: 'totalPrice',
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

    }
    MicroModal.show(modalSelector);
}


























