window.onload = function() {
    $(".contents1").show();
    $(".contents2").show();
    $(".contents3").show();
    $(".contents01").hide();
    $(".contents02").hide();
    $(".contents03").hide();
}
$("#event").click(function(){
    $(this).addClass('on').siblings().removeClass('on');
    $(".contents1").show();
    $(".contents2").show();
    $(".contents3").show();
    $(".contents01").hide();
    $(".contents02").hide();
    $(".contents03").hide();
    $('#all').show();
    $('#ing').show();
    $('#end').show();
});
$("#new").click(function(){
    $(this).addClass('on').siblings().removeClass('on');
    $(".contents01").show();
    $(".contents02").show();
    $(".contents03").show();
    $(".contents1").hide();
    $(".contents2").hide();
    $(".contents3").hide();
    $('#all').hide();
    $('#ing').hide();
    $('#end').hide();
});

$("#all").click(function(){
    $(this).addClass('on').siblings().removeClass('on');
});
$("#ing").click(function(){
    $(this).addClass('on').siblings().removeClass('on');
});
$("#end").click(function(){
    $(this).addClass('on').siblings().removeClass('on');
});

var a = 1;
$(".c_btn").click(function(){
    if($("#event").hasClass("on")==true){
        $(".contents0" + a).show();
        a += 1;
        $(".contents0" + a).show();
        a += 1;
        $(".contents0" + a).show();
        if(a >= 3){
            $(".moreviews").hide();
        }
    }else {
        $(".contents" + a).show();
        a += 1;
        $(".contents" + a).show();
        a += 1;
        $(".contents" + a).show();
        if(a >= 3){
            $(".moreview").hide();
        }
    }
});
$(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() > 100) {
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