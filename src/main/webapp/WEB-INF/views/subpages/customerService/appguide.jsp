<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon"
    href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />
<!--css-->
<link rel="stylesheet" href="../resources/css/include/main-gnb.css">
<link rel="stylesheet"
	href="../resources/css/subpages/customerService/appguide.css?v=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" type="text/css"
	href="../resources/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/slick/slick-theme.css" />

<!--jQuery-->
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>

<!--js-->
<script src="../resources/slick/slick.js"></script>
<script src="../resources/js/include/main-gnb.js"></script>
<script src="../resources/js/customerService/cs.js"></script>

<!--font-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">

<!--logo-->
<link rel="shortcut icon" type="image/x-icon"
	href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/logo/mainlogo.png">
<title>앱이용안내</title>
</head>
<body>
	<!-- main-header -->
	<jsp:include page="../../include/header/main_desktop_header.jsp" />
	<jsp:include page="../../include/header/main_mobile_header.jsp" />
	<div id="contents-wrap">
		<div class="locationWrap">
			<div class="appguide1_web_container">
				<div class="page_navi">
					<a href="#/home"> <span>HOME &nbsp;</span>>
					</a> <span> &nbsp;고객센터 &nbsp;> &nbsp; </span> <span>공지사항</span>
				</div>
			</div>
		</div>
		<div class="contentsBox01">
			<div class="appguide_web_container">
				<div class="subtitleWrap">
					<h3 class="page_tit">고객센터
					<div class="tab01">
						<ul>
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/notice.do'">
									<span>공지사항</span>
								</button>
							</li>
							<li class="on">
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/appUse.do'">
									<span>bkc앱 이용안내</span>
								</button>
							</li>
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/faq.do'">
									<span>FAQ</span>
								</button>
							</li>
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/inquiry.do'">
									<span>문의</span>
								</button>
							</li>
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/chain.do'">
									<span>가맹점모집</span>
								</button>
							</li>
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/recruit.do'">
									<span>인재채용</span>
								</button>
							</li>
						</ul>
					</div></h3>
				</div>
				<div class="tab_content">
					<div class="app-down">
						<h4 class="subtitle-wrap">
							<span>bkc APP[앱] 다운로드</span>
						</h4>
						<p class="txt">
							<span>아래 방법 중 편리한 방법으로 <strong>bkc앱을</strong>
							</span> <span> <strong>다운로드</strong> 하세요.
							</span>
						</p>
						<div class="app-down-img">
							<img
								src=" https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/customercenter/img_appdownload.png"
								alt="앱 화면 이미지">
						</div>
						<div class="store-down">
							<dl class="store_down">
								<dt>스토어 다운로드</dt>
								<dd>
									<p>
										애플 앱스토어와 구글 플레이스토어에서 <strong>bkc 앱</strong>을 다운로드 해보세요.
									</p>
									<div class="btn_area">
										<a
											href="https://play.google.com/store/apps/details?id=kr.co.bkc.android"
											target="_blank" class="btn_googleplay"> <span>Google
												Play</span></a> <a
											href="https://itunes.apple.com/kr/app/apple-store/id834094750"
											target="_blank" class="btn_appstore"> <span>App
												Store</span></a>
									</div>
								</dd>
							</dl>
							<dl class="WEB">
								<dt>QR코드 다운로드</dt>
								<dd>
									<p>
										QR코드를 스캔하여 <strong>bkc 앱</strong>을 다운로드 해보세요.
									</p>
									<div class="QRcode">
										<img
											src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/customercenter/qrcode.png"
											alt="QR">
									</div>
								</dd>
							</dl>
						</div>
						<div class="app-guide">
							<h4 class="subtitle-wrap">
								<span>앱 이용방법</span>
							</h4>
							<p class="txt">bkc 앱으로 편리하게 주문할 수 있는 방법과 고객님이 누릴 수 있는 혜택들을
								소개해드립니다.</p>
							<ul class="guide-list">
								<li><a href="javascript:popOpen(0)" class="delivery"><strong>딜리버리
											<br>이용안내
									</strong></a></li>
								<li><a href="javascript:popOpen(3)" class="search"><strong>매장찾기<br>
											이용안내
									</strong></a></li>
								<li><a href="javascript:popOpen(4)" class="coupon"><strong>쿠폰
											<br>이용안내
									</strong></a></li>
							</ul>
							<div class="web_order_caution">
								<h4 class="title-wrap">
									<span>유의사항</span>
								</h4>
								<button type="button" class="btn_caution"></button>
								<div class="subtxt">
									<h5 class="subtitle1">이용 가능 단말기 안내</h5>
									<ul class="txtlist1">
										<li>Android 4.4 이상, IOS 9.0 이상</li>
										<li>이 버전 이하의 단말기에서는 구글 플레이스토어 또는 애플 앱스토어에 bkc앱이 표시되지
											않습니다.</li>
										<li>단말기 OS 업그레이드 후 bkc앱을 다운로드하거나 모바일 홈페이지를 이용하시길 바랍니다.</li>
										<li>단말기의 보안 유지를 위해 운영체제와 사용하는 백신프로그램을 최신 버전으로 업데이트하시길
											권장합니다.<br>또한, 백신프로그램을 이용하여 수시로 바이러스 검사하시길 바랍니다.
										</li>
										<li>bkc 홈페이지, bkc앱을 통한 주문 또는 개인정보를 입력해야 하는 서비스 이용할 경우 출처가
											불분명하거나 보안 설정이 없는 무선 랜(Wi-Fi)을 이용하기보다는 무선 인터넷(4G, LTE)을 이용하시기
											바랍니다.</li>
									</ul>
									<h5 class="subtitle2">이용 가능 회원</h5>
									<ul class="txtlist2">
										<li>정상적으로 이용 가능한 온라인회원, SNS로그인 회원 또는 본인인증을 완료한 회원은 이용할 수
											있습니다.</li>
										<li>온라인회원가입은 bkc 홈페이지, bkc앱에서 가능합니다.</li>
									</ul>
									<h5 class="subtitle3">참고사항</h5>
									<ul class="txtlist3">
										<li>무선 인터넷(4G, LTE)을 이용할 경우, 회원님이 가입한 이동통신사의 요금제에 따라 데이터
											이용요금이 부과될 수 있습니다.<br>단, 무선 랜(Wi-Fi) 이용 시, 데이터 요금이 발생하지
											않습니다.
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="popWrap m_FullpopWrap">
							<div class="popbox01 nobtn">
								<div class="M_headerWrap">
									<div class="titleBar">
										<h1 class="page_tit w_alignL">
											<span>앱 이용방법</span>
										</h1>
										<div class="close-box">
											<a href="#none" class="btn_close btn_head_close"
												type="button"></a>
										</div>
									</div>
								</div>
								<div class="popcont nopadding appguide_contWrap">
									<div class="tab02" style="margin-left: 0px;">
										<ul>
											<li class="on"><a href="#"><span>딜리버리
														이용안내</span></a></li>
											<li class=""><a href="#"><span>매장찾기이용안내</span></a></li>
											<li class=""><a href="#"><span>쿠폰 이용안내</span></a></li>
										</ul>
										<div class="btn_area">
											<a class="btn_prev" href="#none"><span>Previous</span></a> <a
												class="btn_next" href="#none"><span>Next</span></a>
										</div>
									</div>
									<div class="tab_cont">
										<div class="tutorial">
											<div class="slide-list">
												<div>
													<div class="cont"
														style="width: 100%; display: inline-block;">
														<div class="guide">
															<dl>
																<dt>배달지 설정</dt>
																<dd>
																	배달받을 곳의 주소를 <br>확인해주세요.
																</dd>
															</dl>
														</div>
														<div class="guide_image">
															<img alt="배달지 설정"
																src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/customercenter/img_guide_delivery.png">
														</div>
													</div>
												</div>

												<div>
													<div class="cont"
														style="width: 100%; display: inline-block;">
														<div class="guide">
															<dl>
																<dt>메뉴 선택</dt>
																<dd>딜리버리 메뉴를 선택해 주세요. 재료를 추가 하거나 음료와 사이드를 변경 할 수
																	있어요.</dd>
															</dl>
														</div>
														<div class="guide_image">
															<img alt="메뉴 선택"
																src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/customercenter/img_guide_delivery2.png">
														</div>
													</div>
												</div>

												<div>
													<div class="cont"
														style="width: 100%; display: inline-block;">
														<div class="guide">
															<dl>
																<dt>카트 담기</dt>
																<dd>
																	선택한 메뉴를 카트에 담고 <br>주문금액을 확인해 주세요.
																</dd>
															</dl>
														</div>
														<div class="guide_image">
															<img alt="카트 담기"
																src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/customercenter/img_guide_delivery3.png">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="tab_cont" style="display: none;">
										<div class="tutorial">

											<div class="slide-list">
												<div>
													<div class="cont"
														style="width: 100%; display: inline-block;">
														<div class="guide">
															<dl>
																<dt>가까운 매장</dt>
																<dd>
																	위치설정을 켜두시면 현재 내 위치와 <br>가장 가까운 매장을 바로 찾을 수 있어요.
																</dd>
															</dl>
														</div>
														<div class="guide_image">
															<img alt="" src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/customercenter/img_guide_shop.png">
														</div>
													</div>
												</div>

												<div>
													<div class="cont"
														style="width: 100%; display: inline-block;">
														<div class="guide">
															<dl>
																<dt>매장명 검색</dt>
																<dd>
																	매장이름을 입력하시면 <br>바로 찾을 수 있어요.
																</dd>
															</dl>
														</div>
														<div class="guide_image">
															<img alt="" src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/customercenter/img_guide_shop2.png">
														</div>
													</div>
												</div>

												<div>
													<div class="cont"
														style="width: 100%; display: inline-block;">
														<div class="guide">
															<dl>
																<dt>지역검색</dt>
																<dd>
																	지역 이름을 선택하시면 <br>지역별 매장을 찾을 수 있어요.
																</dd>
															</dl>
														</div>
														<div class="guide_image">
															<img alt="" src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/customercenter/img_guide_shop3.png">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="tab_cont" style="display: none;">
										<div class="tutorial">
											<div class="slide-list">
												<div>
													<div class="cont"
														style="width: 100%; display: inline-block;">
														<div class="guide">
															<dl>
																<dt>매장용 쿠폰</dt>
																<dd>
																	매장 방문 시 키오스크 에서 쿠폰 바코드를 <br>스캔하시면 쿠폰을 사용하실 수 있어요.
																</dd>
															</dl>
														</div>
														<div class="guide_image">
															<img alt="" src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/customercenter/img_guide_coupon.png">
														</div>
													</div>
												</div>

												<div>
													<div class="cont"
														style="width: 100%; display: inline-block;">
														<div class="guide">
															<dl>
																<dt>할인 쿠폰</dt>
																<dd>할인된 금액으로 주문 하실 수 있어요.</dd>
															</dl>
														</div>
														<div class="guide_image">
															<img alt="" src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/customercenter/img_guide_coupon2.png">
														</div>
													</div>
												</div>

												<div>
													<div class="cont"
														style="width: 100%; display: inline-block;">
														<div class="guide">
															<dl>
																<dt>딜리버리용 쿠폰</dt>
																<dd>할인된 금액으로 주문 하실 수 있어요.</dd>
															</dl>
														</div>
														<div class="guide_image">
															<img alt="" src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/customercenter/img_guide_coupon3.png">
														</div>
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- main-footer -->
	<jsp:include page="../../include/footer/main_desktop_footer.jsp" />
	<jsp:include page="../../include/footer/main_mobile_footer.jsp" />
	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
	<script src="../resources/js/customerService/jquery-3.1.1.min.js"></script>
	<script src="../resources/js/customerService/jquery-ui-1.12.1.js"></script>
	<script src="../resources/js/ui.js"></script>
	<script src="../resources/js/customerService/slick.min.js"></script>
	<script src="../resources/js/customerService/datepicker.min.js"></script>
	<script src="../resources/js/customerService/datepicker.ko.js"></script>
	<script>

	$(window).on('scroll', function () {

		var _current = $(document).scrollTop();
		var _top = $('a.top-btn')
		console.log(_current)

		if (_current > 100) {
			_top.fadeIn();
		} else {
			_top.fadeOut();

		}
	})

	$('.slide-list').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		dots: true,
		infinite: true,
	})


	$('.popWrap .close-box a').on('click',function (){
		$('.popWrap').hide();
	});

	$('.popWrap .tab02 li a').on('click',function (){
		$('.popWrap .tab02 li').removeClass('on')
		$(this).parent().addClass('on');

		var _order = $('.popWrap .tab02 li.on').index()


		move(_order)
	})


	function popOpen(_order){
		$('.popWrap').show();
		$('.popWrap .tab02 li').eq(_order).find('a').trigger('click');

		$('.tab_cont .slide-list').slick('refresh')


	}


	function move(_order){

		switch (_order){
			case 0 :
				$('.popWrap .tab02').css('margin-left',0);
				$('.tab_cont').hide().eq(_order).show();
				break;
			case 3 :
				$('.popWrap .tab02').css('margin-left',-390);
				$('.tab_cont').hide().eq(_order).show();
				break;
			case 4 :
				$('.popWrap .tab02').css('margin-left',-390);
				$('.tab_cont').hide().eq(_order).show();
				break;
		}

		$('.tab_cont').eq(_order).find('.slide-list').slick('refresh')
	}




	$('.popWrap .tab02 .btn_area .btn_prev').on('click',function (){

		var _order = $('.popWrap .tab02 li.on').index()

		if(_order != 0){
			$('.popWrap .tab02 li').removeClass('on')
			$('.popWrap .tab02 li').eq(_order-1).addClass('on')

			var _order2 = $('.popWrap .tab02 li.on').index()

			move(_order2)
		}
	})

	$('.popWrap .tab02 .btn_area .btn_next').on('click',function (){


		var _order = $('.popWrap .tab02 li.on').index()

		if(_order != 2){
			$('.popWrap .tab02 li').removeClass('on')
			$('.popWrap .tab02 li').eq(_order+1).addClass('on')

			var _order2 = $('.popWrap .tab02 li.on').index()

			move(_order2)
		}
	})

</script>
</body>
</html>