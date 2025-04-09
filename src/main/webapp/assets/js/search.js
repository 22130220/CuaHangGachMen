document.addEventListener('DOMContentLoaded', function() {
    const searchBar = document.querySelector('.search-bar');
    const input     = document.getElementById('searchInput');
    const box       = document.getElementById('suggestionsBox');
    const boxproduct = document.getElementById('productbox1');
    // TTL = 7 ngày (ms)
    const TTL = 7 * 24 * 60 * 60 * 1000;

    // 1. Lấy history, lọc TTL
    function getHistory() {
        const now = Date.now();
        const raw = JSON.parse(localStorage.getItem('searchHistory') || '[]');
        const fresh = raw.filter(item => (now - item.time) < TTL);
        localStorage.setItem('searchHistory', JSON.stringify(fresh));
        return fresh.map(item => item.text);
    }

    // 2. Lưu mới kèm timestamp
    function saveHistory(q) {
        const now = Date.now();
        let history = JSON.parse(localStorage.getItem('searchHistory') || '[]');
        history = history.filter(item => item.text !== q);
        history.unshift({ text: q, time: now });
        if (history.length > 10) history.pop();
        localStorage.setItem('searchHistory', JSON.stringify(history));
    }

    // 3. Hiển thị history
    function showHistory() {
        const items = getHistory();
        box.innerHTML = '';
        if (!items.length) { box.style.display = 'none'; return; }
        items.forEach(text => {
            const div = document.createElement('div');
            div.textContent = text;
            div.className = 'suggestion-item';
            div.addEventListener('click', () => {
                input.value = text;
                box.style.display = 'none';
            });
            box.appendChild(div);
        });
        box.style.display = 'block';
    }

    // 4. Lưu khi cần (chỉ gọi từ mouseleave)
    function handleSave() {
        const q = input.value.trim();
        if (!q) return;
        saveHistory(q);
        showHistory();
    }

    // Sự kiện hiển thị history khi focus hoặc click vào input
    input.addEventListener('focus', showHistory);
    input.addEventListener('click', showHistory);

    // **Chỉ lưu** khi chuột rời khỏi toàn bộ vùng search-bar
    input.addEventListener('mouseleave', handleSave);

    // Ẩn suggestion khi click ngoài vùng search-bar
    document.addEventListener('click', e => {
        if (!input.contains(e.target)) {
            box.style.display = 'none';
            boxproduct.style.display='none';
        }
    });
});

function searchProducts(q) {
    if (!q) return;

    $.ajax({
        url: '/searchProducts',
        method: 'GET',
        data: { q: q },
        dataType: 'json',
        success: function(data) {
            console.log('Kết quả từ server:', data);

            const boxproduct = document.getElementById('productbox1');
            boxproduct.innerHTML = '';

            const products = data.products;
            products.forEach(item => {
                const div = document.createElement('div');
                div.className = 'suggestion-item';

                const a = document.createElement('a');
                a.href = '/pdetail?pid=' + item.id;
                a.textContent = item.name;

                div.appendChild(a);
                boxproduct.appendChild(div);
            });

            $('#productbox1').css('display', 'block');
        },
        error: function(xhr, status, err) {
            console.error('Lỗi AJAX:', err);
        }
    });
}


document.addEventListener('DOMContentLoaded', function() {
    const input = document.getElementById('searchInput');
    const box       = document.getElementById('suggestionsBox');

    // 1. Log mỗi khi thay đổi nội dung
    input.addEventListener('input', function(e) {
        console.log('Đang gõ:', e.target.value.trim());
        const q = input.value.trim();
        if (!q) return;
        $('#suggestionsBox').hide();
        searchProducts(q);
    });

    // 2. Hoặc chỉ log khi nhấn Enter
    input.addEventListener('keydown', function(e) {
        if (e.key === 'Enter') {
            e.preventDefault();
            const q = input.value.trim();
            if (!q) return;
            $('#suggestionsBox').hide();
            searchProducts(q);
        }
    });

});