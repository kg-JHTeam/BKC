//주문번호 입력 시 텍스트 지우는 버튼 생성 및 텍스트 내용 지우기
$(document).ready(function() {
    $(".order_num").keyup(function() {
        $(".btn_del01").toggle(Boolean($(this).val()));
    });
    $(".btn_del01").toggle(Boolean($(".order_num").val()));
    $(".btn_del01").click(function() {
        $(".order_num").val('').focus();
        $(this).hide();
    });
});

//눈 표시 클릭 시 패스워드 보이기
$(document).ready(function() {
    $('#pass button').on('click', function() {
        $('input').toggleClass('on');
        if ($('input').hasClass('on')) {
            $(this).attr('class', "btn_view01 on")
                .prev('input').attr('type', "text");
        } else {
            $(this).attr('class', "btn_view01")
                .prev('input').attr('type', 'password');
        }
    });

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