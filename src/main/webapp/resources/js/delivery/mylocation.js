//주소찾기 입력 시 텍스트 지우는 버튼 생성 및 텍스트 내용 지우기
$(document).ready(function() {
    $(".findaddr").keyup(function() {
        $(".btn_del01").toggle(Boolean($(this).val()));
    });
    $(".btn_del01").toggle(Boolean($(".findaddr").val()));
    $(".btn_del01").click(function() {
        $(".findaddr").val('').focus();
        $(this).hide();
    });
});

//menu tab 관련
$(document).ready(function() {
    $(".item2 li").click(function() {
        var idx = $(this).index();
        $(".item2 li").removeClass("on");
        $(".item2 li").eq(idx).addClass("on");
        $(".tab_cont").hide();
        $(".tab_cont").eq(idx).show();
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

//주소지 띄우기
$(document).ready(function() {
    $(".btn04 h02").click(function () { 
        $(".txt_addr").css("display", "none"); 
        $(".addr_new").css("display", "block"); 
    });
});