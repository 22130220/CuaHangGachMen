var editor = CKEDITOR.replace('editor');

function loadFileCKEditor() {
    $.ajax({
        url: '/view/view_shared/product_des/maxtot/introduce.jsp',
        type: 'GET',
        data: {
            pid: 1
        },
        dataType: 'text',
        success: function (data) {
            editor.setData(data);
        },
        error: function () {
            alert('Không thể tải danh sách sản phẩm.');
        }
    });
}

loadFileCKEditor();