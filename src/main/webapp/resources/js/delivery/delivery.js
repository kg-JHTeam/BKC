/**
 * 딜리버리 페이지(로그인 페이지)관련 자바 스크립트 
 */

//아이디 입력 시 텍스트 지우는 버튼 생성 및 텍스트 내용 지우기
$(document).ready(function() {
    $(".id_email").keyup(function() {
        $(".btn_del01").toggle(Boolean($(this).val()));
    });
    $(".btn_del01").toggle(Boolean($(".id_email").val()));
    $(".btn_del01").click(function() {
        $(".id_email").val('').focus();
        $(this).hide();
    });
    $(".order_num").keyup(function() {
        $(".btn_del02").toggle(Boolean($(this).val()));
    });
    $(".btn_del02").toggle(Boolean($(".order_num").val()));
    $(".btn_del02").click(function() {
        $(".order_num").val('').focus();
        $(this).hide();
    });
});

//눈 표시 클릭 시 패스워드 보이기
$(document).ready(function() {
    $('.pass button').on('click', function() {
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

//자동 로그인 클릭시 아이디 저징도 같이 클릭
$(document).ready(function() {
    $(".autologin_check").click(function() {
        var checked = $(".autologin_check").is(":checked");

        if (checked)
            $("input:checkbox").prop("checked", true);
    });
});

//nonmemberorder menu tab
$(document).ready(function() {
    $(".menu_tab li").click(function() {
        var idx = $(this).index();
        $(".menu_tab li").removeClass("on");
        $(".menu_tab li").eq(idx).addClass("on");
        $(".menu-contents > div").hide();
        $(".menu-contents > div").eq(idx).show();
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