// Lấy phần tử nút và hộp thoại
const contactButton = document.getElementById("lienhe");
const contactInfo = document.getElementById("contact-info");

// Thêm sự kiện click để chuyển đổi giữa ẩn/hiện hộp thoại
contactButton.onclick = () => {
  contactInfo.style.display = contactInfo.style.display === "block" ? "none" : "block";
};
