var desEditor = editor
let flmngr = null;
desEditor.on('instanceReady', function () {
    desEditor.getFlmngr((Flmngr) => {
        flmngr = Flmngr;
    });
});

// Khởi tạo DataTable cho bảng banner
let positions = null;
var bannerTable = initDataTable('#bannerTable', '/admin/get-banner', function(d) {
    positions = d.positions;
    return d.banners;
}, function(d) {
    console.log('Data loaded:', d);
    if (!d.banners || d.banners.length === 0) {
        console.warn('No banner data received from API');
    }
}, [
    { targets: 0, data: 'id', className: 'dt-center' },
    { targets: 1, data: 'title', className: 'dt-center' },
    {
        targets: 2,
        data: 'imageUrl',
        render: data => `<td style="background-color: #f5f5f5;"><img src="${data || '/assets/img/no-image.png'}" style="width:50px; height:auto;"></td>`,
        className: 'dt-center'
    },
    {
        targets: 3,
        data: 'link',
        render: data => data || 'N/A',
        className: 'dt-center'
    },
    {
        targets: 4,
        data: 'position',
        className: 'dt-center',
        searchPanes: { show: true }
    },
    {
        targets: 5,
        data: 'isActive',
        render: data => data ? `<td><div class="isActive">Hoạt động</div></td>` : `<td><div class="deActive">Không hoạt động</div></td>`,
        className: 'dt-center',
        searchPanes: { show: true }
    },
    {
        targets: 6,
        data: 'startDate',
        render: data => data ? new Date(data).toLocaleString('vi-VN') : '',
        className: 'dt-center'
    },
    {
        targets: 7,
        data: 'endDate',
        render: data => data ? new Date(data).toLocaleString('vi-VN') : '',
        className: 'dt-center'
    },
    { targets: 8, data: 'priority', className: 'dt-center' },
    {
        targets: 9,
        data: 'id',
        render: data => `<div class='table-icon-label'><a href="#" onclick="openUpdateBannerModal(${data})"><i class="fa-solid fa-note-sticky"></i></a></div>`,
        className: 'dt-center'
    }
], [
    { extend: 'copy', className: 'btn-secondary' },
    { extend: 'csv', className: 'btn-secondary' },
    { extend: 'excel', className: 'btn-secondary' },
    { extend: 'pdf', className: 'btn-secondary' },
    { extend: 'print', className: 'btn-secondary' },
    {
        text: 'In tất cả',
        className: 'btn-success',
        action: function(e, dt) {
            dt.page.len(-1).draw();
        }
    },
    {
        text: 'Trạng thái',
        className: 'btn-danger',
        action: (e, dt) => {
            const selectedRows = dt.rows({ selected: true }).count();
            if (selectedRows === 0) {
                new Notyf().error("Vui lòng chọn ít nhất một banner để cập nhật trạng thái");
                return;
            }
            MicroModal.show('update_id_modal');
        },
        enabled: false
    }
], function(e, dt) {
    const selectedRows = dt.rows({ selected: true }).count();
    dt.button(6).enable(selectedRows > 0); // Kích hoạt nút "Trạng thái" khi có hàng được chọn
}, { paging: true, searching: true, dom: 'lBfrtip', buttons: ['copy', 'csv', 'excel', 'pdf', 'print'], select: true });

// Hàm mở modal chỉnh sửa banner và điền dữ liệu
function openUpdateBannerModal(id) {
    const rowData = bannerTable.rows().data().toArray().find(data => data.id === id);
    if (!rowData) {
        new Notyf().error(`Không tìm thấy banner với ID: ${id}`);
        return;
    }

    // Điền dữ liệu vào form
    $('#banner_id').val(rowData.id);
    $('#banner_title').val(rowData.title);
    $('#banner_image_url').val(rowData.imageUrl);
    $('#banner_link').val(rowData.link);
    $('#banner_position').val(rowData.position);
    $('#banner_start_date').val(rowData.startDate ? new Date(rowData.startDate).toISOString().slice(0, 16) : '');
    $('#banner_end_date').val(rowData.endDate ? new Date(rowData.endDate).toISOString().slice(0, 16) : '');
    $('#banner_priority').val(rowData.priority);

    MicroModal.show('update_banner_modal');
}

// Hàm gửi yêu cầu AJAX
function sendAjaxRequest(config) {
    $.ajax({
        url: config.url,
        type: config.type || 'POST',
        data: config.data,
        processData: false,
        contentType: false,
        success: function(resp) {
            if (resp.success) {
                new Notyf().success(config.successMessage);
                if (config.onSuccess) config.onSuccess(resp);
                if (config.tableToReload) config.tableToReload.ajax.reload();
                if (config.modalToClose) MicroModal.close(config.modalToClose);
            } else {
                new Notyf().error(resp.message || config.errorMessage || "Lỗi không xác định");
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX Error:", status, error);
            new Notyf().error(config.errorMessage || "Yêu cầu thất bại");
        }
    });
}

// Hàm gửi yêu cầu AJAX từ form
function formAjaxRequest(config) {
    const formData = new FormData($(config.formSelector)[0]);
    $.ajax({
        url: config.url,
        type: config.type || 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function(resp) {
            if (resp.success) {
                new Notyf().success(config.successMessage);
                if (config.onSuccess) config.onSuccess(resp);
                if (config.tableToReload) config.tableToReload.ajax.reload();
                if (config.modalToClose) MicroModal.close(config.modalToClose);
            } else {
                new Notyf().error(resp.message || config.errorMessage || "Lỗi không xác định");
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX Error:", status, error);
            new Notyf().error(config.errorMessage || "Yêu cầu thất bại");
        }
    });
}

// Xử lý cập nhật trạng thái
$("#update_id_btn").on('click', function() {
    const form = $('#updateIdForm')[0];
    const formData = new FormData(form);

    const data = bannerTable.rows({ selected: true }).data();
    const setActive = [];
    data.each((rowData) => setActive.push(rowData.id));

    if (setActive.length === 0) {
        new Notyf().error("Vui lòng chọn ít nhất một banner để cập nhật trạng thái");
        return;
    }

    formData.append('setActive', JSON.stringify(setActive));

    sendAjaxRequest({
        url: '/admin/get-banner',
        data: formData,
        successMessage: "Cập nhật trạng thái thành công",
        errorMessage: "Cập nhật trạng thái thất bại",
        tableToReload: bannerTable,
        modalToClose: 'update_id_modal',
        type: 'DELETE',
        onSuccess: function(resp) {
            if (resp.activated) {
                resp.activated.forEach(function(item) {
                    const row = bannerTable.row((idx, rowData) => rowData.id === item);
                    if (row.any()) {
                        const rowData = row.data();
                        rowData.isActive = resp.active;
                        row.data(rowData).draw(false);
                    }
                });
            }
        }
    });
});

// Xử lý chỉnh sửa banner
$(document).ready(function() {
    $("#updateBannerForm").validate({
        rules: {
            title: { required: true, minlength: 2 },
            image_url: { required: true },
            priority: { required: true, number: true, min: 0 }
        },
        messages: {
            title: {
                required: "Vui lòng nhập tiêu đề banner",
                minlength: "Tiêu đề phải dài ít nhất 2 ký tự"
            },
            image_url: { required: "Vui lòng nhập URL hình ảnh" },
            priority: {
                required: "Vui lòng nhập mức ưu tiên",
                number: "Ưu tiên phải là số",
                min: "Ưu tiên không được âm"
            }
        },
        submitHandler: function(form) {
            formAjaxRequest({
                url: '/admin/get-banner',
                formSelector: '#updateBannerForm',
                successMessage: "Cập nhật banner thành công",
                errorMessage: "Cập nhật banner thất bại",
                tableToReload: bannerTable,
                modalToClose: 'update_banner_modal',
                type: 'PUT',
                onSuccess: function(resp) {}
            });
        }
    });

    $('#update_banner_btn').click(function(e) {
        e.preventDefault();
        $("#updateBannerForm").submit();
    });
});

// Xử lý chọn ảnh
function selectImageChange(button, name) {
    const input = button.closest('.fui-basic-input').querySelector(`input[name="${name}"]`);
    flmngr.open({
        isMultiple: false,
        acceptExtensions: ["png", "jpeg", "jpg", "webp", "gif"],
        onFinish: (files) => {
            if (files && files.length > 0) {
                const imageUrl = files[0].url;
                input.value = imageUrl;
            }
        }
    });
}

// Xử lý thêm banner mới
$(document).ready(function() {
    $("#addBannerForm").validate({
        rules: {
            title: { required: true, minlength: 2 },
            image_url: { required: true },
            priority: { required: true, number: true, min: 0 }
        },
        messages: {
            title: {
                required: "Vui lòng nhập tiêu đề banner",
                minlength: "Tiêu đề phải dài ít nhất 2 ký tự"
            },
            image_url: { required: "Vui lòng nhập URL hình ảnh" },
            priority: {
                required: "Vui lòng nhập mức ưu tiên",
                number: "Ưu tiên phải là số",
                min: "Ưu tiên không được âm"
            }
        },
        submitHandler: function(form) {
            formAjaxRequest({
                url: '/admin/manage-banner',
                formSelector: '#addBannerForm',
                successMessage: "Thêm banner thành công",
                errorMessage: "Thêm banner thất bại",
                tableToReload: bannerTable,
                modalToClose: 'add_banner_modal',
                type: 'POST',
                onSuccess: function(resp) {
                    // Reset form sau khi thêm thành công
                    $('#addBannerForm')[0].reset();
                }
            });
        }
    });

    $('#add_banner_btn').click(function(e) {
        e.preventDefault();
        $("#addBannerForm").submit();
    });
});