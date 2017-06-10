// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () { scrollFunction() };

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("myBtn").style.display = "block";
    } else {
        document.getElementById("myBtn").style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0; // For Chrome, Safari and Opera 
    document.documentElement.scrollTop = 0; // For IE and Firefox
}

$(function () {
    var x = $('.top-loading');
    x.addClass('top-loading-show');
    setTimeout(function () { x.removeClass('top-loading-show'); }, 1500);

    //icon danh muc
    $('.icon-danhmuc').on('click', function () {
        var height = $(window).height();

        var body = $('#body');
        var dashboard = $('#dashboard');
        var container = $('#container');
        if (dashboard.hasClass('display-none')){
            dashboard.removeClass('display-none').addClass('display-block');
            $('.dashboard').css("height", 0.85 * height);
            $('#icon-danhmuc').removeClass('glyphicon glyphicon-chevron-right').addClass('glyphicon glyphicon-chevron-left');
            container.addClass('col-md-10 col-md-offset-2');
            body.removeClass('container').addClass('container-fluid');
        }
        else if (dashboard.hasClass('display-block')) {
            $('#icon-danhmuc').removeClass('glyphicon glyphicon-chevron-left').addClass('glyphicon glyphicon-chevron-right');
            dashboard.removeClass('display-block').addClass('display-none');
            container.removeClass('col-md-10 col-md-offset-2');
            body.removeClass('container-fluid').addClass('container');
        }
    });
});
var x = document.getElementById("snackbar")
x.className = "show";
setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);

