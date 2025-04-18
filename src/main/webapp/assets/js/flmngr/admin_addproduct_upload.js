let flmngr = null;
editor.on('instanceReady', function () {
    // ...and get Flmngr API
    editor.getFlmngr((Flmngr) => {
        // Flmngr API is ready to use
        // You can use it to open file manager, upload files, etc.
        // In this demo we pass Flmngr API into inner functions and callbacks.
        // You can save it somewhere and reuse without passing as an argument.

        flmngr = Flmngr;
        attachOnClickListenerToButton(Flmngr);
    });
});

function attachOnClickListenerToButton(Flmngr) {
    let elBtn = document.getElementById("btn");

    // Style button as ready to be pressed
    elBtn.style.opacity = 1;
    elBtn.style.cursor = "pointer";
    let elLoading = document.getElementById("loading");
    elLoading.parentElement.removeChild(elLoading);

    // Add a listener for selecting files
    elBtn.addEventListener("click", () => {
        selectFiles(Flmngr);
    });
}

function selectFiles(Flmngr) {
    Flmngr.open({
        isMultiple: false,
        acceptExtensions: ["png", "jpeg", "jpg", "webp", "gif"],
        onFinish: (files) => {
            showSelectedImage(files);
        }
    });
}

function showSelectedImage(files) {
    let elImages = document.getElementById("image-thumb");
    elImages.innerHTML = "";
    //
    let file = files[0];

    let el = document.createElement("div");
    el.className = "image";
    elImages.appendChild(el);

    let elImg = document.createElement("img");
    elImg.src = file.url;
    elImg.alt = "Image selected in Flmngr";
    el.appendChild(elImg);

    // let elP = document.createElement("p");
    // elP.textContent = file.url;
    // el.appendChild(elP);
    document.getElementById("img_thumbnail").value = file.url;
}

function selectImage(button) {
    const input = button.closest('.fui-basic-input').querySelector('input');

    flmngr.open({
        isMultiple: false,
        acceptExtensions: ["png", "jpeg", "jpg", "webp", "gif"],
        onFinish: (files) => {
            if (files && files.length > 0) {
                const imageUrl = files[0].url;
                input.value = imageUrl;
            }
        }
    });
}




