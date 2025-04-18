import Flmngr from "https://cdn.skypack.dev/flmngr";

Flmngr.load({
    apiKey: "e4IUG3QtfZRv8gMv3WRRoiI3",
    urlFileManager: 'https://upload.webtmdt.site/flmngr',
    urlFiles: 'https://upload.webtmdt.site/files',
    eventListeners: {
        onFileUploaded: (data) => {
            console.log("onFileUploaded:");
            console.log(data);
        },
        onFileDeleted: (data) => {
            console.log("onFileDeleted:");
            console.log(data);
        },
        onFileRenamed: (data) => {
            console.log("onFileRenamed:");
            console.log(data);
        },
        onFileMoved: (data)=> {
            console.log("onFileMoved:");
            console.log(data);
        },
        onFileCopied: (data) => {
            console.log("onFileCopied:");
            console.log(data);
        },
        onDirCreated: (data) => {
            console.log("onDirCreated:");
            console.log(data);
        },
        onDirRenamed: (data) => {
            console.log("onDirRenamed:");
            console.log(data);
        },
        onDirMoved: (data) => {
            console.log("onDirMoved:");
            console.log(data);
        },
        onDirCopied: (data) => {
            console.log("onDirCopied:");
            console.log(data);
        },
        onDirDeleted: (data) => {
            console.log("onDirDeleted:");
            console.log(data);
        },
    }
},
//     {
//     onFlmngrLoaded: () => {
//         attachOnClickListenerToButton();
//     }
// }
);