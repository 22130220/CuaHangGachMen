<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 17/04/2025
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý contact</title>

    <!-- Reset CSS -->
    <link rel="stylesheet" href="/assets/css/reset.css" />

    <!-- Thêm favicon -->
    <link rel="icon" type="image/x-icon" href="/assets/icons/logo2_no_text.svg">


    <!-- Nhúng phông chữ -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

    <!-- Font Awesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js"
            integrity="sha512-6sSYJqDreZRZGkJ3b+YfdhB3MzmuP9R7X1QZ6g5aIXhRvR1Y/N/P47jmnkENm7YL3oqsmI6AK+V6AD99uWDnIw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- Kiểu CSS -->
    <link rel="stylesheet" href="/assets/css/style.css" />
    <link rel="stylesheet" href="/assets/css/admin-ruleset.css">
    <link rel="stylesheet" href="/assets/css/basicinput.css">
    <link rel="stylesheet" href="/assets/css/InputViaIcon.css">
    <link rel="stylesheet" href="/assets/css/admin-manageproduct.css">
    <link rel="stylesheet" href="/assets/css/notification.css">
    <link rel="stylesheet" href="/assets/css/arccordion.css">
    <link rel="stylesheet" href="/assets/css/product-detail.css">

    <!-- Thêm Datatable-->
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.6/css/dataTables.dataTables.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/3.0.3/css/responsive.dataTables.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/4.0.1/css/fixedHeader.dataTables.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/3.2.0/css/buttons.dataTables.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/select/2.1.0/css/select.dataTables.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/searchpanes/2.3.3/css/searchPanes.dataTables.css">

    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/responsive/3.0.3/js/dataTables.responsive.js"></script>
    <script src="https://cdn.datatables.net/responsive/3.0.3/js/responsive.dataTables.js"></script>
    <script src="https://cdn.datatables.net/fixedheader/4.0.1/js/dataTables.fixedHeader.js"></script>
    <script src="https://cdn.datatables.net/fixedheader/4.0.1/js/fixedHeader.dataTables.js"></script>
    <script src="https://cdn.datatables.net/v/dt/jszip-3.10.1/dt-2.2.2/b-3.2.2/b-html5-3.2.2/b-print-3.2.2/datatables.min.js" integrity="sha384-XFeEEcuPa4foNB0cSctNhsnIdsGaxO8S8pGQmzblvpAIsSCNawP7jDpSeSI6+YuI" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/buttons/3.2.0/js/dataTables.buttons.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.2.0/js/buttons.dataTables.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.2.0/js/buttons.colVis.min.js"></script>
    <script src="https://cdn.datatables.net/select/3.0.0/js/dataTables.select.js"></script>
    <script src="https://cdn.datatables.net/select/3.0.0/js/select.dataTables.js"></script>
    <script src="https://cdn.datatables.net/searchpanes/2.3.3/js/dataTables.searchPanes.js"></script>
    <script src="https://cdn.datatables.net/searchpanes/2.3.3/js/searchPanes.dataTables.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js" integrity="sha384-VFQrHzqBh5qiJIU0uGU5CIW3+OWpdGGJM9LBnGbuIH2mkICcFZ7lPd/AAtI7SNf7" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js" integrity="sha384-/RlQG9uf0M2vcTw3CX7fbqgbj/h8wKxw7C3zu9/GxcBPRKOEcESxaxufwRXqzq6n" crossorigin="anonymous"></script>

    <!-- Jquery UI-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/jquery-ui.min.js" integrity="sha512-MSOo1aY+3pXCOCdGAYoBZ6YGI0aragoQsg1mKKBHXCYPIWxamwOE7Drh+N5CPgGI5SA9IEKJiPjdfqWFWmZtRA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/themes/base/jquery-ui.min.css" integrity="sha512-TFee0335YRJoyiqz8hA8KV3P0tXa5CpRBSoM0Wnkn7JoJx1kaq1yXL/rb8YFpWXkMOjRcv5txv+C6UluttluCQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/themes/base/theme.min.css" integrity="sha512-lfR3NT1DltR5o7HyoeYWngQbo6Ec4ITaZuIw6oAxIiCNYu22U5kpwHy9wAaN0vvBj3U6Uy2NNtAfiaKcDxfhTg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Jquery validate -->
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

    <!--Micromodal.js-->
    <script src="https://cdn.jsdelivr.net/npm/micromodal/dist/micromodal.min.js"></script>
    <link rel="stylesheet" href="/assets/css/micromodal.css">

    <!--Notyf-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Sweet alert 2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        div.container {
            max-width: 1200px;
        }
        th {
            vertical-align: middle !important;
            text-align: center !important;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.4);
            justify-content: center;
            align-items: center;
            z-index: 999;
        }

        /* Modal Box */
        .modal-content {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            width: 400px;
            position: relative;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }

        /* Close Button */
        .close-btn {
            position: absolute;
            top: 8px;
            right: 12px;
            font-size: 20px;
            cursor: pointer;
        }

        /* Textarea for admin reply */
        #adminReply {
            width: 100%;
            height: 80px;
            margin-top: 5px;
            resize: vertical;
            padding: 5px;
            font-size: 14px;
        }

        /* Gửi phản hồi button */
        #sendReplyBtn {
            margin-top: 10px;
            padding: 8px 14px;
            background-color: #4CAF50;
            border: none;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }

        #sendReplyBtn:hover {
            background-color: #45a049;
        }
        td{
            text-align: center;
        }
        .modal__button {
            display: inline-block;
            padding: 0.6em 1.4em;
            font-size: 1rem;
            font-weight: 600;
            color: #fff;
            background-color: #ff6f61;      /* Màu nền chính */
            border: none;
            border-radius: 0.4em;           /* Bo góc mềm mại */
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            cursor: pointer;
            transition:
                    background-color 0.3s ease,
                    transform 0.2s ease,
                    box-shadow 0.2s ease;
        }

        .modal__button:hover {
            background-color: #ff8a75;      /* Sáng hơn khi hover */
            transform: translateY(-2px);    /* Nâng nhẹ */
            box-shadow: 0 6px 10px rgba(0,0,0,0.15);
        }

        .modal__button:active {
            background-color: #e65b50;      /* Tối hơn khi nhấn */
            transform: translateY(0);
            box-shadow: 0 3px 5px rgba(0,0,0,0.1);
        }

        .modal__button:focus {
            outline: none;
            box-shadow: 0 0 0 3px rgba(255,111,97,0.4);
        }

    </style>
</head>
<body>
<div class="admin-container grid-layout">
    <jsp:include page="../view_shared/admin/admin-grid.jsp"/>
    <div class="content grid-item content-grid">
        <div class="main-grid">
            <nav class="navbar tag-line _4c _1r">
                <div class="nav-back-prev">
                    <div class="breadcumb">
                        <div class="breadcumb-icon f-s-25">
                            <i class="fa-regular fa-envelope"></i>
                        </div>
                        <a href="#" class="f-bold f-s-25 breadcumb-text">Quản lý contact</a>
                    </div>
                </div>
                <div class="funcproduct">
                </div>
            </nav>
            <div class="product-table table _4c _6r">
                <table id="example" class="display compact" style="width:100%">
                    <thead>
                    <tr>
                        <th>Tên người dùng</th>
                        <th>Email</th>
                        <th>Tiêu đề</th>
                        <th>Ngày gửi</th>
                        <th>Check</th>
                        <th>Chức năng</th>
                    </tr>
                    </thead>
                    <tfoot></tfoot>
                </table>
            </div>
        </div>
    </div>
</div>



<div class="modal micromodal-slide" id="contactModal" aria-hidden="true">
    <div class="modal__overlay" tabindex="-1" data-micromodal-close>
        <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
            <header class="modal__header">
                <h2 class="modal__title">Chi tiết liên hệ</h2>
                <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
            </header>

            <form id="replyForm" class="modal__content">
                <div class="modal__field">
                    <label><strong>Email:</strong></label>
                    <div id="modalEmail" class="modal__value"></div>
                </div>
                <div class="modal__field">
                    <label><strong>Tiêu đề:</strong></label>
                    <div id="modalTitle" class="modal__value"></div>
                </div>
                <div class="modal__field">
                    <label><strong>Nội dung:</strong></label>
                    <div id="modalContent" class="modal__value"></div>
                </div>

                <!-- input ẩn để gửi id -->
                <input type="hidden" id="contactIdHidden" name="id" />

                <div class="modal__field">
                    <label for="adminReply"><strong>Phản hồi:</strong></label>
                    <textarea id="adminReply" name="reply" class="modal__textarea" placeholder="Nhập phản hồi của bạn..." required></textarea>
                </div>

                <div class="modal__actions">
                    <button type="submit" class="modal__button">Gửi phản hồi</button>
                </div>
            </form>
        </div>
    </div>
</div>



<div class="modal micromodal-slide" id="contactModalDetail" aria-hidden="true">
    <div class="modal__overlay" tabindex="-1" data-micromodal-close>
        <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
            <header class="modal__header">
                <h2 class="modal__title">Chi tiết liên hệ</h2>
                <button class="modal__close" aria-label="Close modal" data-micromodal-close></button>
            </header>

            <form id="replyFormDetail" class="modal__content">
                <div class="modal__field">
                    <label><strong>Họ và tên:</strong></label>
                    <div id="modalNameDetail" class="modal__value"></div>
                </div>
                <div class="modal__field">
                    <label><strong>Email:</strong></label>
                    <div id="modalEmailDetail" class="modal__value"></div>
                </div>
                <div class="modal__field">
                    <label><strong>Tiêu đề:</strong></label>
                    <div id="modalTitleDetail" class="modal__value"></div>
                </div>
                <div class="modal__field">
                    <label><strong>Nội dung:</strong></label>
                    <textarea id="modalContentDetail" rows="6" cols="80"  class="modal__textarea" disabled ></textarea>
                </div>
                <div class="modal__field">
                    <label for="adminReply"><strong>Phản hồi:</strong></label>
                    <textarea id="adminReplyDetail" rows="6" cols="80"  class="modal__textarea" disabled ></textarea>
                </div>
            </form>
        </div>
    </div>
</div>





















</body>
<script src="/assets/js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
<script>
    // KHỞI TẠO BẢNG
    let table = new DataTable('#example', {
        ajax: "/ContactManager",
        columns: [
            { "data": "fullname" },
            { "data": "email" },
            { "data": "title" },
            {"data":"SendDate"},
            {
                "data": "isReply",
                render: function (data) {
                    return data ? 'true' : 'false';
                }
            },
            {
                "data": "id",
                render: function (data, type, row) {
                    if (!row.isReply) {
                        return `<i style="align-items: center" data-target="\${data}" title="phản hồi" class="fa-solid fa-envelope" onclick="getModel(\${data})"></i>`;
                    } else {
                        return `<i data-target="\${data}" title="chi tiết" class="fa-regular fa-comment" onclick="getModelChiTiet(\${data})"></i>`;
                    }
                }
            },

        ]
    });

    table.on('init', function () {
        const colIndex = 4; // cột "Check"
        const headerCell = document.querySelectorAll('#example thead tr')[0].children[colIndex];

        // Reset CSS th
        headerCell.style.padding = "8px";
        headerCell.style.verticalAlign = "middle";
        headerCell.style.textAlign = "center";

        // Tạo wrapper chứa tiêu đề + select
        const wrapper = document.createElement("div");
        wrapper.style.display = "flex";
        wrapper.style.flexDirection = "column";
        wrapper.style.alignItems = "center";
        wrapper.style.justifyContent = "center";
        wrapper.style.gap = "4px"; // tạo khoảng cách giữa tiêu đề và select

        // Lấy tiêu đề cũ
        const title = headerCell.innerText || headerCell.textContent;

        // Gán lại tiêu đề vào div
        const titleDiv = document.createElement("div");
        titleDiv.textContent = title;
        titleDiv.style.fontWeight = "bold";
        titleDiv.style.fontSize = "14px";

        // Tạo dropdown
        const select = document.createElement("select");
        select.style.width = "90px";
        select.style.fontSize = "13px";
        select.style.padding = "2px 4px";
        select.style.textAlign = "center";

        select.innerHTML = `
        <option value="">-- Tất cả --</option>
        <option value="true">true</option>
        <option value="false">false</option>
    `;
        select.onchange = function () {
            table.column(colIndex).search(this.value).draw();
        };

        // Xóa nội dung cũ và gắn lại wrapper
        headerCell.innerHTML = '';
        wrapper.appendChild(titleDiv);
        wrapper.appendChild(select);
        headerCell.appendChild(wrapper);
    });
    function getModel(id) {
        const contactId = id;
        console.log("Click icon ✉ với id:", contactId);

        $.ajax({
            url: `/ContactManagerDetailController?id=\${contactId}`,
            method: "GET",
            dataType: "json",
            success: function (response) {
                const contact = response.data;

                $('#modalEmail').text(contact.email);
                $('#modalTitle').text(contact.title);
                $('#modalContent').text(contact.content);
                $('#contactIdHidden').val(contactId);
                $('#adminReply').val('');
                $('#sendReplyBtn').attr('data-id', contactId);

                // $('#contactModal').css('display', 'flex');
                MicroModal.show('contactModal');
            },
            error: function (xhr, status, error) {
                alert("Không thể tải dữ liệu liên hệ");
                console.error("Lỗi AJAX:", status, error);
            }
        });
    }

    function getModelChiTiet(id){
        const contactId = id;

        $.ajax({
            url: `/ContactDetailController?id=\${contactId}`,
            method: "GET",
            dataType: "json",
            success: function (response) {
                const contact = response.data;
                $('#modalNameDetail').text(contact.fullname);
                $('#modalEmailDetail').text(contact.email);
                $('#modalTitleDetail').text(contact.title);
                $('#modalContentDetail').val(contact.content);
                $('#adminReplyDetail').val(contact.response);

                // $('#contactModal').css('display', 'flex');
                MicroModal.show('contactModalDetail');
            },
            error: function (xhr, status, error) {
                alert("Không thể tải dữ liệu liên hệ");
                console.error("Lỗi AJAX:", status, error);
            }
        });
    }









    $(document).ready(function () {
        $('#replyForm').on('submit', function (e) {
            e.preventDefault();

            let formData = $(this).serialize(); // Dữ liệu sẽ là id=123&reply=abc

            $.ajax({
                url: '/ResponseController',
                type: 'POST',
                data: formData,
                success: function (response) {
                    MicroModal.close('contactModal'); // ✅ sửa đúng tên hàm

                    const notyf = new Notyf();
                    if (response.success) {
                        notyf.open({
                            duration: 1000,
                            position: { x: 'right', y: 'bottom' },
                            type: "success",
                            message: "Phản hồi thành công",
                        });
                        table.ajax.reload(null, false);
                    } else {
                        notyf.open({
                            duration: 1000,
                            position: { x: 'right', y: 'bottom' },
                            type: "error",
                            message: "Phản hồi không thành công",
                        });
                    }
                },
                error: function (xhr, status, error) {
                    console.error('Lỗi khi gửi phản hồi:', error);
                    const notyf = new Notyf();
                    notyf.open({
                        duration: 1000,
                        position: { x: 'right', y: 'bottom' },
                        type: "error",
                        message: "Có lỗi xảy ra khi gửi phản hồi",
                    });
                }
            });
        });
    });

</script>




</html>
