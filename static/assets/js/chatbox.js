// Lấy các phần tử cần thiết
const chatMessages = document.getElementById('chat-messages');
const userInput = document.getElementById('user-input');
const sendBtn = document.getElementById('send-btn');

// Hàm để gửi tin nhắn của người dùng
function sendMessage() {
    const messageText = userInput.value.trim();

    if (messageText) {
        // Tạo phần tử tin nhắn mới cho người dùng
        const messageDiv = document.createElement('div');
        messageDiv.classList.add('message', 'user');

        // Tạo nội dung tin nhắn
        const messageContentDiv = document.createElement('div');
        messageContentDiv.classList.add('message-content');
        messageContentDiv.innerHTML = `
            <p>${messageText}</p>
            <span>${new Date().toLocaleTimeString().slice(0, 5)}</span>
        `;

        // Tạo avatar người dùng
        const userAvatar = document.createElement('img');
        userAvatar.src = 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2024/04/anh-con-gai-24.jpg';
        userAvatar.alt = 'User Avatar';

        // Thêm avatar và nội dung tin nhắn vào messageDiv
        messageDiv.appendChild(userAvatar);
        messageDiv.appendChild(messageContentDiv);
       

        // Thêm tin nhắn vào phần hiển thị
        chatMessages.appendChild(messageDiv);

        // Cuộn xuống tin nhắn mới
        chatMessages.scrollTop = chatMessages.scrollHeight;

        // Xóa nội dung ô nhập tin nhắn
        userInput.value = '';
    }
}

// Sự kiện khi nhấn nút Gửi
sendBtn.addEventListener('click', sendMessage);

// Sự kiện khi nhấn Enter
userInput.addEventListener('keypress', function (e) {
    if (e.key === 'Enter' && !e.shiftKey) {
        e.preventDefault(); // Ngừng hành động mặc định của Enter (thêm dòng mới)
        sendMessage();
    }
});


// Lấy các phần tử cần thiết cho đóng chatbox
const chatbox = document.getElementById('chat-box');
const closeBtn = document.getElementById('chat-close');

// Hàm đóng chatbox
function closeChatbox() {
    chatbox.style.display = 'none';  // Ẩn chatbox
}

// Sự kiện khi nhấn vào dấu X
closeBtn.addEventListener('click', closeChatbox);


