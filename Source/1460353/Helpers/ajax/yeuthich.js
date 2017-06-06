$().ready(function () {
    $('.yt').off('click').on('click', function () {
        var total = parseInt($('#yeuthichtotal').html());//tong san pham yeu thich
        var idsanpham = $(this).data('idsanpham');
        if ($(this).hasClass('glyphicon-star-empty')) {
            $(this).removeClass('glyphicon-star-empty').addClass('glyphicon-star');
            //code ajax them yeu thich san pham nay vao

            $('#yeuthichtotal').html(total + 1);
            //them yeu thich
            $.ajax({
                type: 'get',
                data: { idsanpham: idsanpham },
                url: '@Url.Action("themyeuthich","Yeuthich")',
                success: function (str) { }
            });

        }
        else {
            $(this).removeClass('glyphicon-star').addClass('glyphicon-star-empty');
            //code ajax xoa yeu thich san pham nay
            $('#yeuthichtotal').html(total - 1);

            //Xoa yeu thich
            $.ajax({
                type: 'get',
                data: { idsanpham: idsanpham },
                url: '@Url.Action("xoayeuthich","Yeuthich")',
                success: function (str) { }
            });
        }
    });
});