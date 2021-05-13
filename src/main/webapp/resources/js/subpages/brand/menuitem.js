$('li').click(function(){
    $(this).addClass('on').siblings().removeClass('on');
});


$(function(){
    $("#about").click(function(){
        $("#abo").show();
        $("#his").hide();
    });
});
$(function(){
    $("#history").click(function(){
        $("#abo").hide();
        $("#his").show();
    });
});


$(function(){
    $("#realchicken").click(function(){
        $("#chickentab").show();
        $("#freshtab").hide();
        $("#naturetab").hide();
    });
});
$(function(){
        $("#freshmaterial").click(function(){
        $("#freshtab").show();
        $("#chickentab").hide();
        $("#naturetab").hide();
    });
});
$(function(){
    $("#nature").click(function(){
        $("#naturetab").show();
        $("#chickentab").hide();
        $("#freshtab").hide();
    });
});

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
