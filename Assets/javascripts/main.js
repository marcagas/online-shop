etrade = {};
etrade.is_user_logged_in = function () {
    
};

$(document).ready(function () {
    /*
    $('#menu > ul').dropotron({
    mode: 'fade',
    globalOffsetY: 11,
    offsetY: -15
    });

    if ($('#slider').length) {
    $('#slider').slidertron({
    viewerSelector: '.viewer',
    indicatorSelector: '.indicator span',
    reelSelector: '.reel',
    slidesSelector: '.slide',
    speed: 'slow',
    advanceDelay: 4000
    });
    }*/

    $('li.dropdown').click(function (e) {
        e.preventDefault();
        window.elem = e;
        if (e.target.nodeName == "A" && $(e.target).hasClass('sub-links')) {
            window.location.href = e.target.href;
        } else {
            $(this).toggleClass('open');
            return false;
        }
    });

    $('input[type="text"]').addClass('form-control widthAuto');
});