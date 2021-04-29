//MY세트 등록
$(document).ready(function() {
    $('.btn_my').on('click', function() {
        $('.btn_my').toggleClass('on');
    })
});

//전체선택 클릭시 다른것도 같이 클릭
$(document).ready(function() {
    $(".check02").change(function() {
        if ($(".check02").is(":checked")) {
            $(".checkmenu").prop("checked", true);
        }
    });
});

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

// 체크된 체크박스 삭제
$(document).ready(function() {
    // 체크된 체크박스 삭제 
    $('.btn04').click(function() {
        // var nodata = document.getElementsByClassName('.nodata');
        // var container02 = document.getElementsByClassName('.container02');
        if (confirm("삭제하시겠습니까?")) {
            $("input[name=menu]:checked").each(function() {
                var ths = $(this)
                ths.parents(".contWrap").remove();
                // if ($('.contWrap').length == 0) {
                //     nodata.style.display = 'block';
                //     container02.style.display = 'none';
                // }
            });
        } else {
            return false;
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