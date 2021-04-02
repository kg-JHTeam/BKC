$(function(){
    //모바일 - 햄버거 메뉴 출력
    $(".m-toggle-btn").click(function(){
        $(".m-toggle-btn").toggleClass("on");
        $(".m-fix").toggleClass("on");
    });

    $(".m-fix-menu ul > li").click(function(){
        var m = $(this).children("ul").css("display");
        if(m=="none"){
            $(".m-fix-menu ul > li> ul").stop().slideUp();
            $(this).children("ul").stop().slideDown();
        }else{
            $(this).children("ul").stop().slideUp();
        }
    });

    //데스크탑 - 서브 메뉴 출력
    $("#header-wrap > nav").mouseover(function(){
        $(".full-cover").stop().fadeIn(300);
        $("nav .nav .menu-title .sub-con").stop().fadeIn(300);
    });

    $("#header-wrap > nav").mouseleave(function(){
        $(".full-cover").stop().fadeOut(300);
        $("nav .nav .menu-title .sub-con").stop().fadeOut(300);
    });
});
