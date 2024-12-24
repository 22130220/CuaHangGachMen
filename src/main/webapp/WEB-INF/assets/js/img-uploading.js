// Hàm xử lý hiển thị ảnh
function handleFileUpload(inputElement) {
    const files = inputElement.files; // Lấy danh sách file
    const previewContainer = inputElement.closest('.upload-area').querySelector('.image-preview');
    previewContainer.innerHTML = ''; // Xóa nội dung cũ

    if (files.length > 0) {
        Array.from(files).forEach((file) => {
            if (file.type.startsWith('image/')) {
                const reader = new FileReader();
                const imageContainer = document.createElement('div');
                imageContainer.className = 'image-container';

                const img = document.createElement('img');
                const fileName = document.createElement('p');

                reader.onload = (e) => {
                    img.src = e.target.result;
                    img.alt = file.name;
                };

                reader.readAsDataURL(file);

                fileName.textContent = file.name;

                imageContainer.appendChild(img);
                imageContainer.appendChild(fileName);
                previewContainer.appendChild(imageContainer);
            }
        });
    }
}

// Gắn sự kiện cho tất cả các thẻ input trong trang
document.querySelectorAll('.upload-area input[type="file"]').forEach((inputElement) => {
    inputElement.addEventListener('change', () => handleFileUpload(inputElement));
});
