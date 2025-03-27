var notyf = new Notyf();
let defaultButton = [
    {
        extend: 'searchPanes',
        config: {
            cascadePanes: true,
            initCollapsed: false,
            orderable: false
        }
    },
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
    }
]

function initDataTable(tableId, ajaxUrl, dataSrc, sendData, columns, buttonConfigs, buttonShow, extraOptions = {}) {
    const table = new DataTable(tableId, {
        ajax: {
            url: ajaxUrl,
            data: sendData,
            dataSrc: dataSrc
        },
        layout: {
            topStart: {
                buttons: buttonConfigs
            }
        },
        select: true,
        columnDefs: columns,
        autoWidth: false,
        language: {
            lengthMenu: "Hiển thị _MENU_ mục mỗi trang",
            zeroRecords: "Không tìm thấy kết quả",
            info: "Hiển thị trang _PAGE_ của _PAGES_",
            infoEmpty: "Không có dữ liệu",
            infoFiltered: "(lọc từ _MAX_ tổng mục)"
        },
        createdRow: function (row) {
            $('td', row).css({
                'text-align': 'center',
                'vertical-align': 'middle'
            });
        },
        paging: extraOptions.paging || false,
        searching: extraOptions.searching || false,
        ordering: extraOptions.ordering || false,
        pageLength: extraOptions.pageLength || 25,
        language: {
            searchPanes: {
                clearMessage: 'Bỏ chọn toàn bộ',
                collapse: { 0: 'Lọc', _: 'Đã lọc (%d)' },
                collapseAll: 'Ẩn',
                showAll: 'Hiển thị',
                title: {
                    _: 'Đã lọc (%d)',
                    0: 'Lọc',
                }
            }
        },
    });
    table.on('select deselect', buttonShow);
    return table;
}


function openModalWithData(modalId, inputValues = {}, onClose) {
    MicroModal.show(modalId, { onClose });
    if (inputValues) {
        Object.entries(inputValues).forEach(([inputId, value]) => $(`#${inputId}`).val(value));
    }
}

function sendAjaxRequest(config) {
     const { url, data, successMessage, errorMessage, tableToReload, modalToClose, onSuccess, type } = config;

    $.ajax({
        url: url,
        type: type,
        processData: false,
        contentType: false,
        data: data,
        success: function (response) {
            if (response.success) {
                notyf.success(successMessage);
                if (modalToClose) MicroModal.close(modalToClose);
                if (tableToReload) tableToReload.ajax.reload();
                if (onSuccess) onSuccess(response);
                if (tableToReload) tableToReload.rows().deselect();
            } else {
                notyf.error(errorMessage);
            }
        },
        error: function () {
            if (tableToReload) tableToReload.rows().deselect();
            notyf.error(errorMessage);
        }
    });
}


function formAjaxRequest(config) {
    const { url, formSelector, successMessage, errorMessage, tableToReload, modalToClose, type, onSuccess, extraData } = config;
    const form = $(formSelector)[0];
    const formData = new FormData(form);
    console.log([formData])
    // Thêm dữ liệu bổ sung nếu có
    if (extraData) {
        Object.entries(extraData).forEach(([key, value]) => formData.append(key, value));
    }

//     const form = document.querySelector(formSelector);
//     if (!form) {
//         console.error(`Form with selector ${formSelector} not found`);
//         return;
//     }
//
//     // Tạo FormData từ form và chuyển thành object
//     const formDataRaw = new FormData(form);
//     const formDataObject = Object.fromEntries(formDataRaw.entries());
//
//     const combinedData = {
//         ...formDataObject,
//         ...(extraData || {})
//     };
//     const jsonData = JSON.stringify(combinedData);
//
//     // Tạo FormData mới và thêm JSON vào
//     const formData = new FormData();
//     formData.append('data', jsonData);

    $.ajax({
        url: url,
        type: type,
        data: formData,
        processData: false,
        contentType: false,
        success: function (response) {
            if (response.success) {
                notyf.success(successMessage);
                if (modalToClose) MicroModal.close(modalToClose);
                if (tableToReload) tableToReload.ajax.reload();
                if (onSuccess) onSuccess(response);
                if (tableToReload) tableToReload.rows().deselect();
            } else {
                notyf.error(errorMessage);
            }
        },
        error: function () {
            notyf.error(errorMessage);
        }
    });
}
