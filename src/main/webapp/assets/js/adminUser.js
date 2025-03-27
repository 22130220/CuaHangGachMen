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

const columns = [
    {
        targets: 0,
        data: 'fullname',
        className: 'dt-center',
        searchPanes: {
            show: true
        }
    },
    {
        targets: 1,
        data: 'status',
        render: function (data) {
            if (data) {
                return `<td> <div class="isActive"> Đang bật </div> </td>`;
            } else {
                return `<td> <div class="deActive"> Khoá </div> </td>`;
            }
        },
        className: 'dt-center',

        searchPanes: {
            show: true
        }
    },
    {
        targets: 2,
        data: 'email',
        className: 'dt-center dt-nowrap',

        searchPanes: {
            show: true
        }

    },
    {
        targets: 3,
        data: 'phone',
        className: 'dt-center dt-nowrap',
        render: data => `<td>${data}</td>`,
        searchPanes: {
            show: true
        }

    },
    {
        targets: 4,
        data: 'birthtime',
        render: function (data) {
            const style = data === 0 ? 'background-color: #ffe0e0;' : '';
            return `<td style="${style}">${data}</td>`;
        },
        className: 'dt-center',
        searchPanes: {
            show: true
        }

    },
    {
        targets: 5,
        data: 'sex',
        render: function (data) {
            if (data === 1) {
                return `<td> Nam </td>`;
            } else {
                return `<td> Nữ </td>`;
            }
        },
        className: 'dt-center',

        searchPanes: {
            show: true
        }
    },
    {
        targets: 6,
        data: 'createtime',
        className: 'dt-center',
        searchPanes: {
            show: true
        }
    }
];

const buttonConfigs = [
    [defaultButton],
    {
        text: 'Thêm',
        className: 'green',
        action: function (e, dt, node, config) {
            action = addEle;
            MicroModal.show('add_modal');
        },
        enabled: true
    },
    {
        text: 'Chỉnh sửa',
        className: 'red',
        action: function (e, dt, node, config) {
            let data = dt.row({ selected: true }).data();
            vid = data.id;
            $("#update_fullname").val(data.fullname);
            $("#update_status").val(data.status.toString());
            $("#update_email").val(data.email);
            $("#update_birth").val(data.birthtime);
            $("#update_sex").val(data.sex);
            $("#update_address").val(data.address);
            $("#update_userphone").val(data.phone);
            action = updateEle;
            MicroModal.show('update_modal');
        },
        enabled: false
    },
    {
        text: 'Đổi mật khẩu',
        className: 'red',
        action: function (e, dt, node, config) {
            var data = dt.row({ selected: true }).data();
            vid = data.id;
            action = "Đổi MK";
            MicroModal.show('update_password_modal');
        },
        enabled: false
    }
];

const buttonShow = function () {
    var selectedRows = table.rows({ selected: true }).count();
    table.button(9).enable(selectedRows === 1);
    table.button(10).enable(selectedRows === 1);
};

var table = initDataTable(
    '#example',
    '/admin/user',
    'users',
    null,
    columns,
    buttonConfigs,
    buttonShow,
    { paging: true, searching: true }
);
function addUser () {
    const fullname =  $("#add_fullname").val();
    const status = $("#add_status").val();
    const email = $("#add_email").val();
    const birthTime =  $("#add_birth").val();
    const sex = $("#add_sex").val();
    const address = $("#add_address").val();
    const password = $("#add_password").val();
    const phone = $("#userphone").val();
    if((isNullOrEmptyOrWhitespace(fullname) || isNullOrEmptyOrWhitespace(status) || isNullOrEmptyOrWhitespace(email)
        || isNullOrEmptyOrWhitespace(birthTime) || isNullOrEmptyOrWhitespace(sex) || isNullOrEmptyOrWhitespace(address))) {
        notyf.error("Cần nhập đủ thông tin");
    } else {
        $.ajax({
            url: '/admin/user',
            type: 'POST',
            data: {
                action: action,
                fullname: fullname,
                status: status,
                email: email,
                birth: birthTime,
                sex: sex,
                address: address,
                password: password,
                phone : phone,
            },
            success: function (data) {
                if(data.success) {
                    notyf.success(action + " thành công");
                    MicroModal.close('add_modal');
                    table.ajax.reload();
                    table.rows().deselect();
                    $("#add_password").val();
                    $("#add_sex").val("");
                    $("#add_birth").val("");
                    $("#add_email").val("");
                    $("#add_address").val("");
                    $("#add_fullname").val("");
                    $("#add_status").val("");
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
}

$("#update_btn").on('click',function updateUser () {
    const fullname =  $("#update_fullname").val();
    const status = $("#update_status").val();
    const email = $("#update_email").val();
    const birthTime =  $("#update_birth").val();
    const sex = $("#update_sex").val();
    const address = $("#update_address").val();
    const phone = $("#update_userphone").val();
    if((isNullOrEmptyOrWhitespace(fullname) || isNullOrEmptyOrWhitespace(status) || isNullOrEmptyOrWhitespace(email)
        || isNullOrEmptyOrWhitespace(birthTime) || isNullOrEmptyOrWhitespace(sex) || isNullOrEmptyOrWhitespace(address)
        || isNullOrEmptyOrWhitespace(phone))) {
        notyf.error("Cần nhập đủ thông tin");
    } else {
        $.ajax({
            url: '/admin/user',
            type: 'POST',
            data: {
                action: action,
                fullname: fullname,
                status: status,
                email: email,
                birth: birthTime,
                sex: sex,
                address: address,
                phone : phone,
                id : vid
            },
            success: function (data) {
                if(data.success) {
                    notyf.success(action + " thành công");
                    MicroModal.close('update_modal');
                    table.ajax.reload();
                    table.rows().deselect();
                    $("#update_password").val();
                    $("#update_sex").val("");
                    $("#update_birth").val("");
                    $("#update_email").val("");
                    $("#update_address").val("");
                    $("#update_fullname").val("");
                    $("#update_status").val("");
                    $("#update_userphone").val("");
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

$("#update_password_btn").on('click',function updateUser () {
    $(".error-message").remove();
    const password = $("#update_password").val();
    const passwordRegex = /^(?=.*[A-Z])(?=.*\d).{8,20}$/;
    if (password.trim() === "") {
        $("#update_password").after("<span class='error-message' style='color: red;'>Mật khẩu không được để trống.</span>");
        isValid = false;
    } else if (!passwordRegex.test(password)) {
        $("#update_password").after("<span class='error-message' style='color: red;'>Mật khẩu phải có từ 8-20 ký tự, bao gồm ít nhất một chữ số và một ký tự in hoa.</span>");
        isValid = false;
    } else {
        $.ajax({
            url: '/admin/user',
            type: 'POST',
            data: {
                action: action,
                password : password,
                id : vid
            },
            success: function (data) {
                if(data.success) {
                    notyf.success(action + " thành công");
                    MicroModal.close('update_password_modal');
                    table.ajax.reload();
                    table.rows().deselect();
                    $("#update_password").val("");
                    $("#update_sex").val("");
                    $("#update_birth").val("");
                    $("#update_email").val("");
                    $("#update_address").val("");
                    $("#update_fullname").val("");
                    $("#update_status").val("");
                    $("#update_userphone").val("");
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

$(document).ready(function () {
    $("#add_form").on("submit", function (e) {
        e.preventDefault(); // Ngăn form gửi đi mặc định
        let isValid = true;

        // Xóa các thông báo lỗi cũ
        $(".error-message").remove();

        // Kiểm tra tên người dùng
        const fullname = $("#add_fullname").val();
        if (fullname.trim() === "") {
            $("#add_fullname").after("<span class='error-message' style='color: red;'>Tên người dùng không được để trống.</span>");
            isValid = false;
        }

        // Kiểm tra trạng thái
        const status = $("#add_status").val();
        if (!status) {
            $("#add_status").after("<span class='error-message' style='color: red;'>Trạng thái không được để trống.</span>");
            isValid = false;
        }

        // Kiểm tra giới tính
        const sex = $("#add_sex").val();
        if (!sex) {
            $("#add_sex").after("<span class='error-message' style='color: red;'>Giới tính không được để trống.</span>");
            isValid = false;
        }

        // Kiểm tra số điện thoại
        const phone = $("#userphone").val();
        if (phone.trim() === "" || isNaN(phone) || phone.length > 10) {
            $("#userphone").after("<span class='error-message' style='color: red;'>Số điện thoại không hợp lệ. Vui lòng nhập số hợp lệ.</span>");
            isValid = false;
        }

        // Kiểm tra email
        const email = $("#add_email").val();
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (email.trim() === "" || !emailRegex.test(email)) {
            $("#add_email").after("<span class='error-message' style='color: red;'>Email không hợp lệ. Vui lòng nhập đúng định dạng email.</span>");
            isValid = false;
        }

        // Kiểm tra địa chỉ
        const address = $("#add_address").val();
        if (address.trim() === "") {
            $("#add_address").after("<span class='error-message' style='color: red;'>Địa chỉ không được để trống.</span>");
            isValid = false;
        }

        // Kiểm tra mật khẩu
        const password = $("#add_password").val();
        const passwordRegex = /^(?=.*[A-Z])(?=.*\d).{8,20}$/;
        if (password.trim() === "") {
            $("#add_password").after("<span class='error-message' style='color: red;'>Mật khẩu không được để trống.</span>");
            isValid = false;
        } else if (!passwordRegex.test(password)) {
            $("#add_password").after("<span class='error-message' style='color: red;'>Mật khẩu phải có từ 8-20 ký tự, bao gồm ít nhất một chữ số và một ký tự in hoa.</span>");
            isValid = false;
        }

        // Nếu tất cả đều hợp lệ
        if (isValid) {
            addUser();
        }
    });
});
