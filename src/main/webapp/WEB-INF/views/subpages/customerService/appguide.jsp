<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--css-->
<link rel="stylesheet" href="../resources/css/include/main-gnb.css">
<link rel="stylesheet"
	href="../resources/css/subpages/customerService/appguide.css?v=<%=System.currentTimeMillis() %>" />
<link rel="stylesheet" type="text/css" href="../resources/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="../resources/slick/slick-theme.css" />

<!--jQuery-->
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="slick-1.8.1/slick/slick.min.js"></script>

<!--js-->
<script src="../resources/slick/slick.js"></script>
<script src="../resources/js/include/main-gnb.js"></script>
<script src="../resources/js/subpages/customerService/cs.js"></script>

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
		<div class="locationWrap_WEB">
			<div class="story_web_container">
				<div class="page_navi">
					<a href="#/home"> <span>HOME</span>
					</a> <span> 고객센터 </span> <span> 앱이용안내 </span>
				</div>
			</div>
		</div>
		<div class="contentsBox">
			<div class="web_container">
				<div class="subtitle-wrap">
					<h3 class="page_title">고객센터</h3>
					<div class="tabmenu">
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
					</div>
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
							<ul class="guide_list">
								<div class="guide-wrap">
									<li><a class="delivery"> <strong>딜리버리 <br>이용안내
										</strong>
									</a></li>
									<li><a class="store_search"> <strong>매장찾기<br>
												이용안내
										</strong>
									</a></li>
									<li><a class="coupon"> <strong>쿠폰 <br>이용안내
										</strong>
									</a></li>
								</div>
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
						<div class="popup-wrap">
							<div class="popup-app">
								<div class="popup-app_tit">
									<h1>앱이용안내</h1>
									<button type="button" class="btn_close"></button>
								</div>
								<div class="popup-tabmenu">
									<ul>
										<li class="on">
											<button type="button">
												<span>딜리버리 이용안내</span>
											</button>
										</li>
										<li>
											<button type="button">
												<span>매장찾기 이용안내</span>
											</button>
										</li>
										<li>
											<button type="button">
												<span>쿠폰 이용안내</span>
											</button>
										</li>
									</ul>
								</div>
								<div class="popup-tabcont">
									<div class="on">
										<div class="slick-delivery">
											<div>
												<img
													src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/customercenter/img_delivery.png">
											</div>
											<div>
												<img
													src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/customercenter/img_guide_delivery2.png">
											</div>
											<div>
												<img
													src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/customercenter/img_guide_delivery3.png">
											</div>
										</div>
									</div>
									<div class="slick-store">
										<div>
											<img
												src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/img_guide_shop.png">
										</div>
										<div>
											<img
												src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/img_guide_shop2.png">
										</div>
										<div>
											<img
												src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/img_guide_shop3.png">
										</div>
									</div>
									<div class="slick-coupon">
										<div>
											<img
												src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/img_guide_coupon.png">
										</div>
										<div>
											<img
												src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/img_guide_coupon2.png">
										</div>
										<div>
											<img
												src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/img_guide_coupon3.png">
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
		<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>