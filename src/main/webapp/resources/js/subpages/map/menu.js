//매장명 입력 시 텍스트 지우는 버튼 생성 및 텍스트 내용 지우기
$(document).ready(function() {
    $("#keyword").keyup(function() {
        $(".btn_del01").toggle(Boolean($(this).val()));
    });
    $(".btn_del01").toggle(Boolean($("#keyword").val()));
    $(".btn_del01").click(function() {
        $("#keyword").val('').focus();
        $(this).hide();
    });

    $(".btn_mapsearch_open").click(function() {

        $("#menu_wrap").toggleClass('on');
        $(".btn_mapsearch_open").toggleClass('rotate');
    });
});