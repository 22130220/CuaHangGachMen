var editor = CKEDITOR.replace('editor', {
    allowedContent: true,
    entities: false,
    basicEntities: false,
    extraAllowedContent: '*[*]{*}(*);',
    disallowedContent: '',
    extraPlugins: "file-manager",
    Flmngr: {
        apiKey: "e4IUG3QtfZRv8gMv3WRRoiI3",
        urlFileManager: 'https://upload.webtmdt.site/flmngr',
        urlFiles: 'https://upload.webtmdt.site/files',
    },
});