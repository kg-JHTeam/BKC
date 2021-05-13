/* 탭바 클릭시 빨간불 */
$('li').click(function(){
    $(this).addClass('on').siblings().removeClass('on');
});

/* 이전 이용약관 보기 */
var i = 1;
$('.historyWrap').click(function(){
	if(i == 0){
		$(this).removeClass('open');
		i = 1;
	}else {
		$(this).addClass('open');
		i = 0;
	}
});

/* 추가할 내용 */