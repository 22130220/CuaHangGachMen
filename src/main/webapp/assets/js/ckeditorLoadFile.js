var editor = CKEDITOR.replace('editor', {
    versionCheck: false,
    allowedContent: true,
    entities: false,
    basicEntities: false,
    extraAllowedContent: '*[*]{*}(*);',
    disallowedContent: '',
    extraPlugins: "file-manager",
    Flmngr: {
        apiKey: "e4IUG3QtfZRv8gMv3WRRoiI3",
    },
});

function loadCKEditorTextarea(text) {
    return CKEDITOR.replace(text, {
        versionCheck: false,
        allowedContent: true,
        entities: false,
        basicEntities: false,
        extraAllowedContent: '*[*]{*}(*);',
        disallowedContent: '',
        extraPlugins: "file-manager",
        Flmngr: {
            apiKey: "e4IUG3QtfZRv8gMv3WRRoiI3",
        },
    });
}

