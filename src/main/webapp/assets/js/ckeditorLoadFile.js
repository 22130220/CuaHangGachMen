var editor = CKEDITOR.replace('editor', {
    allowedContent: true,
    entities: false, // Tắt mã hóa ký tự đặc biệt
    basicEntities: false, // Tắt mã hóa ký tự cơ bản (như &)
    extraAllowedContent: '*[*]{*}(*);', // Cho phép mọi thẻ và thuộc tính
    disallowedContent: '', // Không loại bỏ bất kỳ nội dung nào
});