const messengerIcon = document.getElementById("messenger");
const chatBox = document.getElementById("chat-box");

messengerIcon.addEventListener("click", function(event) {
  // Ngăn chặn việc đóng hộp thoại khi click vào bên trong
  chatBox.style.display = (chatBox.style.display === "none" || chatBox.style.display === "") ? "block" : "none";
});

// Ngăn chặn sự kiện click bên trong hộp thoại chat gây ẩn hộp thoại
chatBox.addEventListener("click", function(event) {
  event.stopPropagation();
});
