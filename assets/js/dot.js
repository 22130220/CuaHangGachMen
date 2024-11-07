// JavaScript: Quản lý hiển thị blog theo trang
const blogsPerPage = 3;
let currentPage = 0;

// Hiển thị blog của trang hiện tại
function showPage(pageIndex) {
    const items = document.querySelectorAll('.blog .item');
    const dots = document.querySelectorAll('.blog .dot');

    // Ẩn tất cả blog
    items.forEach((item) => item.classList.remove('active'));

    // Tính toán các blog để hiển thị cho trang
    const start = pageIndex * blogsPerPage;
    const end = start + blogsPerPage;

    for (let i = start; i < end && i < items.length; i++) {
        items[i].classList.add('active');
    }

    // Đổi trạng thái dot
    dots.forEach((dot) => dot.classList.remove('active'));
    dots[pageIndex].classList.add('active');

    currentPage = pageIndex;
}

// Khởi tạo hiển thị trang đầu tiên
showPage(currentPage);




