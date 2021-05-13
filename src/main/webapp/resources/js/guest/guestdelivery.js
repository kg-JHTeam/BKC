//Goto Page Top
$(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() > 500) {
            $('.btn_top').fadeIn();
        } else {
            $('.btn_top').fadeOut();
        }
    });
    $(".btn_top").click(function() {
        $('html, body').animate({
            scrollTop: 0
        }, 400);
        return false;
    });
});

//메뉴에 따른 menu tab
$(document).ready(function() {
    $(".tab_cont > ul").hide();
    $(".item3 li").click(function() {
        var idx = $(this).index();
        $(".item3 li").removeClass("on");
        $(".item3 li").eq(idx).addClass("on");
        $(".tab_cont > ul").hide();
        $(".tab_cont > ul").eq(idx).show();
    })


});

//팝업창
$(document).ready(function() {
    $(".btn_close").click(function() {
        $(".popWrap").hide();
    })
    $(".btn02.orange").click(function() {
        $(".popWrap").hide();
    })
    $(".btn02.dark").click(function() {
        $(".popWrap").hide();
    })
});