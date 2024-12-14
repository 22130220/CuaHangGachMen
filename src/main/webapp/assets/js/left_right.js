// Chuyển sang trang trước
function prevPage() {
    if (currentPage > 0) {
        showPage(currentPage - 1);
    }
}

// Chuyển sang trang sau
function nextPage() {
    const totalPages = Math.ceil(document.querySelectorAll('.blog .item').length / blogsPerPage);
    if (currentPage < totalPages - 1) {
        showPage(currentPage + 1);
    }
}
