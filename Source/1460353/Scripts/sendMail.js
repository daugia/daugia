var sendMail = setInterval(function () {

    $.ajax({
        type: 'get',
        dataType: 'json',
        content: 'application/json',
        url: 'Mail/load',
        success: function (list) {
            for (var i = 0; i < list.length;i++){
                var ngayketthuc = parseDate(list[i].ngayketthuc);
                if (ngayketthuc <= Date.parse(Date())) {
                    //ngay ket thuc <= hien tai goi ham gui mail cho cac ben lien quan
                    $.ajax({
                        type: 'get',
                        data: { idsp: list[i].id },
                        url: 'Mail/send',
                        success: function (str) { },
                        error: function () { }
                    });
                }
            }
        },
        error: function () { }
    });

   
}, 0);


function parseDate(value) {
    var pattern = /Date\(([^)]+)\)/;
    var results = pattern.exec(value);
   
    return results[1];
};