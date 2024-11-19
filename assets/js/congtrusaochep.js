// Xử lý tăng/giảm số lượng sản phẩm
document.querySelectorAll('.quantity-control').forEach(control => {
    const decreaseButton = control.querySelector('button:nth-child(1)');
    const quantityInput = control.querySelector('input');
    const increaseButton = control.querySelector('button:nth-child(3)');

    decreaseButton.addEventListener('click', () => {
        let currentValue = parseInt(quantityInput.value, 10) || 0;
        if (currentValue > 1) {
            quantityInput.value = currentValue - 1;
            updateTotal(control, currentValue - 1);
        }
    });

    increaseButton.addEventListener('click', () => {
        let currentValue = parseInt(quantityInput.value, 10) || 0;
        quantityInput.value = currentValue + 1;
        updateTotal(control, currentValue + 1);
    });

    quantityInput.addEventListener('input', () => {
        let currentValue = parseInt(quantityInput.value, 10);
        if (isNaN(currentValue) || currentValue < 1) {
            quantityInput.value = 1;
            currentValue = 1;
        }
        updateTotal(control, currentValue);
    });
});

// Xử lý sự kiện xóa sản phẩm
document.querySelectorAll('.btn-remove').forEach(button => {
    button.addEventListener('click', () => {
        const cartItem = button.closest('.cart-item');
        cartItem.remove(); // Xóa phần tử sản phẩm khỏi giao diện
        updateCartSummary(); // Cập nhật tổng giá tiền
        updateProductCount(); // Cập nhật số lượng sản phẩm
    });
});





// Xử lý sao chép mã giảm giá
document.querySelectorAll('.btn-copy').forEach(button => {
    button.addEventListener('click', () => {
        const voucherCode = button.closest('.voucher-card').querySelector('.voucher-info b.a').textContent;

        navigator.clipboard.writeText(voucherCode).then(() => {
            alert(`Đã sao chép mã: ${voucherCode}`);
        }).catch(err => {
            console.error('Không thể sao chép mã:', err);
        });
    });
});
