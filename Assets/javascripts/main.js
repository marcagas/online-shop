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

        $(this).toggleClass('open');

        return false;
    });
});