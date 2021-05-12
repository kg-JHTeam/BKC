

// 헤더 토글
function headerSearchToggle(){
	$('.search-group').stop().slideToggle(function (){
		if ($(this).is(':visible'))
			$(this).css('display','flex');
	});
}

// 서브메뉴 오픈
function subMenuOpen(){
	$('article.half__layout .left__layout').stop().slideToggle();
}

// 모바일 디테일 토글
function mobileDetailToggle(){

	if($('.detail-show-box').is(":visible")){
		$('.mobile-detail-menu').removeClass('on')
	}else{
		$('.mobile-detail-menu').addClass('on')

	}


}

function categoryClose(){
	$('.category-layer').hide();
}

function categoryOpen(){
	$('.category-layer').css('display','flex');
}

// 모바일 메뉴 열기
function mobileMenuOpen() {
	$('.container').addClass('overlay')
	$('header').addClass('active');
	$('nav.mobile-menu').show("slide", {direction: "up"});

	scrollDisable();


}

$('.depth1 .depth1-txt').on('click',function (){
	$(this).toggleClass('on');
})

// 모바일 메뉴 닫기
function mobileMenuClose() {

	$('nav.mobile-menu').hide("slide", {direction: "up"});
	$('.container').removeClass('overlay');
	$('header').removeClass('active');

	scrollAble();

}


function scrollDisable(){
	$('html, body').addClass('scrollHidden').on('scroll touchmove mousewheel', function(e){
		e.preventDefault();
	});
}
function scrollAble(){
	$('html, body').removeClass('scrollHidden');
}