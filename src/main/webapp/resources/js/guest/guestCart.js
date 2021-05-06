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

function fCalCount(type, ths) {
    var $input = $(ths).parents("div").find(".second_menu");
    var tCount = Number($input.val());
    var tEqCount = Number($(ths).parents("div"));

    if (type == 'p') {
        $input.val(Number(tCount) + 1);

    } else {
        $input.val(Number(tCount) - 1);
    }
}

//x버튼 클릭시 해당 부분 삭제

function deleteRow(ths) {
    var ths = $(ths);

    ths.parents(".contWrap").remove();
}


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