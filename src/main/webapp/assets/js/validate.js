let validate_password = false;
let confirm_password = false;
let validate_phone = false;

function aciveRegisterBtn() {
    if(validate_password && validate_phone && confirm_password) {
        $("#register_btn").prop("disabled", false);
    } else {
        $("#register_btn").prop("disabled", true);
    }

}

$(document).ready(function () {
    function validatePassword(password) {
        let result = [];
        if (password.length < 8) {
            result.push(1);
        }

        if (!/[A-Z]/.test(password)) {
            result.push(2);
        }

        if (!/[0-9]/.test(password)) {
            result.push(3);
        }

        return result.length !== 0 ? result : null;
    }

    $("#password").keyup("input", function () {
        const password = $(this).val();
        const result = validatePassword(password);

        $("#message").empty();

        if(result != null) {
            for(const error of result) {
                if(error === 1) {
                    $("#message").append("<div>" +
                        "<i class=\"fa-solid fa-xmark\" style=\"color: #ff0000;\"></i>" +
                        " Mật khẩu phải từ 8 ký tự </div>");
                }
                if(error === 2) {
                    $("#message").append("<div> " +
                        "<i class=\"fa-solid fa-xmark\" style=\"color: #ff0000;\"></i>" +
                        "Mật khẩu phải có ký tự in hoa " +
                        "</div>");
                }
                if(error === 3) {
                    $("#message").append("<div> " +
                        "<i class=\"fa-solid fa-xmark\" style=\"color: #ff0000;\"></i>" +
                        "Mật khẩu phải chứa số </div>");
                }
            }

            validate_password = false;
        } else {
            $("#message").append("<div> " +
                "<i class=\"fa-solid fa-check\" style=\"color: #00970c;\"></i>" +
                "Mật khẩu hợp lệ </div>");
            validate_password = true;
        }
        aciveRegisterBtn();
    });
});

$(document).ready(function () {
    function validateConfirmPassword(password, confirmPassword) {
        return (password === confirmPassword) ? null : "Mật khẩu không khớp";
    }

    $("#confirm_password").blur("input", function () {
        const confirmPassword = $(this).val();
        const password  = $("#password").val();

        const result = validateConfirmPassword(password, confirmPassword);

        $("#confirmPasswordMessage").empty();

        if(result != null) {
            $("#confirmPasswordMessage").append("<div> " +
                "<i class=\"fa-solid fa-xmark\" style=\"color: #ff0000;\"></i>" +
                result + "</div>");
            confirm_password = false;
        } else confirm_password  = true;
        aciveRegisterBtn();
    });
});

$(document).ready(function () {
    function validatePhoneNumber(phoneNumber) {
        return (phoneNumber.length <= 10) ? " " : null;
    }

    $("#tel").blur("input", function () {
        const confirmPhone = $(this).val();

        const result = validatePhoneNumber(confirmPhone);

        $("#tel-message").empty();
        if(result == null) {
            $("#tel-message").append("<div> " +
                "<i class=\"fa-solid fa-xmark\" style=\"color: #ff0000;\"></i>" +
                "Số điện thoại không khớp (+84)" + "</div>");
            validate_phone = false;
        } else validate_phone = true;
        aciveRegisterBtn();
    });
});

$(document).ready(function () {
    $("#email").focus("input", function () {
        $("#email_message").empty();
    });
});

aciveRegisterBtn();
