

    let index = 0;
    const slides = document.querySelectorAll('.slide');
    const dots = document.querySelectorAll('.dot');
    let interval;

    function showSlide(n) {
        // Đảm bảo chỉ mục nằm trong giới hạn số ảnh
        index = (n + slides.length) % slides.length;
        
        slides.forEach((slide, i) => {
            slide.style.transform = `translateX(${-index * 100}%)`;
        });
        
        dots.forEach((dot, i) => {
            dot.classList.remove('active');
            if (i === index) dot.classList.add('active');
        });
    }

    function nextSlide() {
        showSlide(index + 1);
    }

    function changeSlide(n) {
        clearInterval(interval); // Dừng tự động khi người dùng bấm nút
        showSlide(index + n);
        startAutoSlide(); // Bắt đầu lại chế độ tự động
    }

    function currentSlide(n) {
        clearInterval(interval); // Dừng tự động khi người dùng chọn slide
        showSlide(n);
        startAutoSlide(); // Bắt đầu lại chế độ tự động
    }

    function startAutoSlide() {
        interval = setInterval(nextSlide, 5000);
    }

    // Bắt đầu với slide đầu tiên và chế độ tự động
    showSlide(index);
    startAutoSlide();

