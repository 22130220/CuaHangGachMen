
const $$doc = document.querySelectorAll.bind(document);

// Xây dựng cấu trúc Accordion
class Accordion {
    constructor(element) {
        this.accordItem = element;
        this.iconPlus = this.accordItem.querySelector(".icon-plus");
        this.iconMinus = this.accordItem.querySelector(".icon-minus");
        this.title = this.accordItem.querySelector(".boxTitle");
        this.content = this.accordItem.querySelector(".boxContent");
    }

    // thay đổi chiều cao của content dựa vào tham số boolean
    activeHeight = (boolean) => {
        const height = (boolean && this.content?.scrollHeight) || '0';

        if (Boolean(this.content)) {
            this.content.style.height = `${height}px`;
        }
        return this;
    }

    // Chức năng thay đổi trạng thái đóng mở accordion, hoặc tự gán trạng thái thông qua tham số boolean
    changeAccordion = (boolean) => {
        this.accordItem?.classList?.toggle("open", boolean);
        const isOpen = this.accordItem?.classList?.contains("open");

        this.iconPlus?.classList?.toggle("active", !isOpen);
        this.iconMinus?.classList?.toggle("active", isOpen);
        this.activeHeight(isOpen);

        return this;
    }
}
//-- end xây dựng cấu trúc Accordion


//-- Xây dựng các chức năng accordion
const Accorder = function () {
    this.accordList = $$doc(`.fui-accordion-HL1 .wrapBox`);
    let listStorage = []; // lưu trữ danh sách class accordion

    // Khởi tạo danh sách accordion
    this.accordList.forEach((item) => {
        listStorage.push(new Accordion(item));
    });


    // Đóng tất cả ngoại trừ 1 accordion mà bạn muốn giữ lại là vị trí mà tham số được truyền vào là keepIndex
    this.clearItemRemaining = (keepIndex) => {
        listStorage.forEach((accordion, index) => {
            if (index !== keepIndex) {
                accordion.changeAccordion(false);
            }
        });
        return this;
    }

    // Chạy các chức năng chính của accordion
    this.run = () => {
        listStorage.forEach((accordion, index) => {
            // refresh các accordion
            accordion.changeAccordion(false);

            accordion.iconPlus?.addEventListener("click", () => {
                accordion.changeAccordion();

              //  this.clearItemRemaining(index)
            })

            accordion.iconMinus?.addEventListener("click", () => {
                accordion.changeAccordion();

                //  this.clearItemRemaining(index)
            })

        });
        return this;
    }
}
//-- end xây dựng các chức năng accordion

//-- run accordion
new Accorder().run();