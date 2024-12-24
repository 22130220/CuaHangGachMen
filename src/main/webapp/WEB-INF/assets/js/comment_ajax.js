
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
    const value = $("#pid").val();
    const comment = $("#comment-input").val();
    const rating =  $('input[name="rating"]:checked').val();
    $.ajax({
        url: '/comment',
        type: 'POST',
        data: {
            comment_text : comment,
            productId : value,
            rating : rating
        },
        success: function (data) {
            if(data.redirectUrl) {
                window.location.href = data.redirectUrl;
            }
            if(data.sucess === true) {

                getComment(value);
            } else {
                alert("Thêm bình luận thất bại")
            }
        },
        error: function () {
            alert('Không thể tải danh sách sản phẩm.');
        }
    });
}