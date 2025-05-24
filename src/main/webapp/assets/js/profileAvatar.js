var desEditor = null;
var flmngr = null;
var notyf = new Notyf(); // Initialize Notyf for notifications

// Initialize CKEditor and Flmngr
function initializeEditor() {
    desEditor = CKEDITOR.replace('editor', {
        versionCheck: false,
        allowedContent: true,
        entities: false,
        basicEntities: false,
        extraAllowedContent: '*[*]{*}(*);',
        disallowedContent: '',
        extraPlugins: "file-manager",
        Flmngr: {
            apiKey: "e4IUG3QtfZRv8gMv3WRRoiI3",
        },
    });

    desEditor.on('instanceReady', function () {
        desEditor.getFlmngr((Flmngr) => {
            flmngr = Flmngr;
            console.log("Flmngr initialized successfully");
        });
    });
}

// Function to select avatar image using Flmngr
function selectAvatarImage(button, name) {
    if (!flmngr) {
        console.error("Flmngr not initialized yet");
        notyf.error("Trình quản lý tệp chưa sẵn sàng. Vui lòng thử lại sau.");
        return;
    }

    const input = button.closest('.fui-basic-input').querySelector(`input[name="${name}"]`);
    const previewImg = document.getElementById('preview');
    console.log("Opening Flmngr for image selection");
    flmngr.open({
        isMultiple: false,
        acceptExtensions: ["png", "jpeg", "jpg", "webp", "gif"],
        onFinish: (files) => {
            if (files && files.length > 0) {
                const imageUrl = files[0].url;
                console.log("Selected image URL:", imageUrl);
                input.value = imageUrl;
                previewImg.src = imageUrl; // Update preview image
            } else {
                console.warn("No file selected");
                notyf.error("Vui lòng chọn một ảnh");
            }
        },
        onError: (error) => {
            console.error("Flmngr error:", error);
            notyf.error("Lỗi khi chọn ảnh: " + error.message);
        }
    });
}

// Handle avatar update button click
$(document).ready(function () {
    // Initialize CKEditor on page load
    initializeEditor();



    // Handle click event for the update button

});
// Initialize jQuery Validate for the form
$("#uploadAvatarForm").validate({
    rules: {
        avatar_url: {
            required: true,
            url: true // Ensure it's a valid URL
        }
    },
    messages: {
        avatar_url: {
            required: "Vui lòng chọn ảnh đại diện",
            url: "URL ảnh không hợp lệ"
        }
    },
    errorPlacement: function (error, element) {
        error.css("color", "red");
        error.insertAfter(element);
    }
});

$("#save-btn").on("click", function () {
    // Check if form is valid
    console.log("het")
    if (!$("#uploadAvatarForm").valid()) {
        console.log("Form validation failed");
        return;
    }

    const formData = $("#uploadAvatarForm").serialize();
    console.log("Sending AJAX request with data:", formData);

    $.ajax({
        url: '/uploadAvatar',
        type: 'POST',
        data: formData,
        success: function (resp) {
            console.log("Server response:", resp);
            if (resp.success) {
                notyf.success(resp.message); // Display success message
                // Update preview image
                const previewImg = document.getElementById('preview');
                previewImg.src = $("#avatar_url").val();
            } else {
                notyf.error(resp.message || "Cập nhật ảnh đại diện thất bại");
            }
        },
        error: function (xhr, status, error) {
            console.error("AJAX error:", status, error);
            notyf.error("Yêu cầu thất bại. Vui lòng thử lại.");
        }
    });
});