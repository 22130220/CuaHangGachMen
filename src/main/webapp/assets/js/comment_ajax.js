
function getComment(id) {
    $.ajax({
        url: '/comment',
        type: 'GET',
        data: {
            productId : id
        },
        success: function (data) {
            $("#comment").empty();
            let htmlContent = '';
            data.review.forEach(function (item) {
                htmlContent += "<div class=\"comment\">\n" +
                    "<img src=\"" + item.avatar +"\" alt=\"Avatar\" class=\"avatar\">\n" +
                    "<div class=\"comment-content\">\n" +
                    "<p class=\"username\">" + item.userName + "</p>\n" +
                    "<p class=\"content\">" + item.reviewText + "</p>\n" +
                    "<p class=\"content\">" + item.rating +" ⭐"+"</p>\n" +
                    "</div>\n" +
                    "</div>"
            })

            $("#comment").html(htmlContent);


        },
        error: function () {
            alert('Không thể tải danh sách sản phẩm.');
        }
    });
}

function addReview() {
    const value = $("#pid").val(); // Lấy ID sản phẩm
    const comment = $("#comment-input").val().trim(); // Lấy nội dung bình luận và loại bỏ khoảng trắng thừa
    const rating = $('input[name="rating"]:checked').val(); // Lấy giá trị rating

    // Kiểm tra nếu chưa nhập nội dung hoặc chưa chọn sao
    if (!comment && !rating) {
        Swal.fire({
            title: 'Lỗi',
            text: 'Vui lòng nhập nội dung và chọn đánh giá sao!',
            icon: 'error',
            confirmButtonText: 'OK',
            buttonsStyling: true,
            customClass: {
                confirmButton: 'btn btn-primary'
            }
        });
        return; // Dừng hàm nếu có lỗi
    }

    // Kiểm tra nếu chưa nhập nội dung
    if (!comment) {
        Swal.fire({
            title: 'Lỗi',
            text: 'Vui lòng nhập nội dung bình luận!',
            icon: 'error',
            confirmButtonText: 'OK',
            buttonsStyling: true,
            customClass: {
                confirmButton: 'btn btn-primary'
            }
        });
        return; // Dừng hàm nếu có lỗi
    }

    // Kiểm tra nếu chưa chọn sao
    if (!rating) {
        Swal.fire({
            title: 'Lỗi',
            text: 'Vui lòng chọn đánh giá sao!',
            icon: 'error',
            confirmButtonText: 'OK',
            buttonsStyling: true,
            customClass: {
                confirmButton: 'btn btn-primary'
            }
        });
        return; // Dừng hàm nếu có lỗi
    }

    // Nếu đã nhập đủ thông tin, gửi yêu cầu AJAX
    $.ajax({
        url: '/comment',
        type: 'POST',
        data: {
            comment_text: comment,
            productId: value,
            rating: rating
        },
        success: function (data) {
            if (data.redirectUrl) {
                Swal.fire({
                    title: 'Xác nhận',
                    text: 'Bạn chưa đăng nhập, vui lòng đăng nhập để gửi bình luận?',
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonText: 'Đăng nhập ngay',
                    cancelButtonText: 'Quay lại',
                    buttonsStyling: true,
                    customClass: {
                        confirmButton: 'btn btn-primary',
                        cancelButton: 'btn btn-secondary'
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = data.redirectUrl;
                    }
                });
            } else if (data.error) {
                Swal.fire({
                    title: 'Lỗi',
                    text: data.error,
                    icon: 'error',
                    confirmButtonText: 'OK',
                    buttonsStyling: true,
                    customClass: {
                        confirmButton: 'btn btn-primary'
                    }
                });
            } else if (data.success === true) {
                getComment(value); // Load lại danh sách bình luận
            }
        },
        error: function () {
            Swal.fire({
                title: 'Lỗi',
                text: 'Không thể gửi bình luận. Vui lòng thử lại!',
                icon: 'error',
                confirmButtonText: 'OK',
                buttonsStyling: true,
                customClass: {
                    confirmButton: 'btn btn-primary'
                }
            });
        }
    });
}