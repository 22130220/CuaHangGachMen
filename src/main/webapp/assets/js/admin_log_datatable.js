const columns = [
    {
        targets: 0,
        data: 'level',
        render: function (data) {
          switch (data) {
              case 'INFO':
                  return `<td> <div class="isActive"> ${data} </div> </td>`
              case 'WARNING':
                  return `<td> <div class="deWarn"> ${data} </div> </td>`
              case 'ALERT':
                  return `<td> <div class="deAlert"> ${data} </div> </td>`
              case 'ERROR':
                  return `<td> <div class="deActive"> ${data} </div> </td>`
          }
          return data;
        },
        className: 'dt-center',
        searchPanes: {
            show: true
        }
    },
    {
        targets: 1,
        data: 'userId',
        className: 'dt-center',
        searchPanes: {
            show: true
        }
    },
    {
        targets: 2,
        data: 'location',
        className: 'dt-center',
        searchPanes: {
            show: true
        }
    },
    {
        targets: 3,
        data: 'time',
        className: 'dt-center',
        render: function (data, type, row) {
            if (type === 'display') {
                // Parse dữ liệu thời gian với định dạng tiếng Anh
                const parsedDate = moment(data, 'MMM DD, YYYY, h:mm:ss A', 'en');

                // Chuyển sang locale tiếng Việt để hiển thị
                moment.locale('vi');
                return parsedDate.format('DD/MM/YYYY HH:mm:ss');
            }
            return data;
        },
        searchPanes: {
            show: true
        }
    },

    {
        targets: 4,
        data: 'message',
        className: 'dt-center',
    },
    {
        targets: 5,
        data: 'requestId',
        className: 'dt-center',
        searchPanes: {
            show: true
        }
    },
];

let logTable = initDataTable('#log', '/admin/log', 'logs', null,
    columns,
    defaultButton,
    null,
    { paging: true, searching: true }
);