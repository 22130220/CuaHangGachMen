document.addEventListener("DOMContentLoaded", function() {
    try {
        MicroModal.init({
            awaitCloseAnimation: true,
            onShow: function(modal) {
                console.log(modal.id + ' is shown');
            },
            onClose: function(modal) {
                console.log(modal.id + ' is closed');
            },
            debugMode: true
        });

    } catch (e) {
        console.log("micromodal error: ", e);
    }

});
