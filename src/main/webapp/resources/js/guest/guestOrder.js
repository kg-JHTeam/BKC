//버튼 클릭시 input type=number 증가 감소
function fnCalCount(type, ths) {
    var $input = $(ths).parents("div").find(".first_menu");
    var tCount = Number($input.val());
    var tEqCount = Number($(ths).parents("div"));

    if (type == 'p') {
        $input.val(Number(tCount) + 1);

    } else {
        $input.val(Number(tCount) - 1);
    }
}

//메뉴에 따른 menu tab
$(document).ready(function() {
    //$(".tab_cont > ul").hide();
    $(".tab01 li").click(function() {
        var idx = $(this).index();
        $(".tab01 li").removeClass("on");
        $(".tab01 li").eq(idx).addClass("on");
        $(".payment_tabcont").addClass("w_none");
        $(".payment_tabcont").eq(idx).removeClass("w_none");
    })
});

//네이버페이 카카오페이 누를시 달라지게
$(document).ready(function() {
    $('.kakao input[type=radio]').click(function() {
        $('.txtlist03 li').hide();
    })
    $('.naver input[type=radio]').click(function() {
        $('.txtlist03 li').show();
    })
});

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