<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<!-- font google web font-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/icon/apple-icon.png" />
<!-- css -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/include/delivery-gnb.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/delivery/delivery.css">

<!-- js -->
<script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
<script src="${contextPath}/resources/js/delivery/delivery.js"></script>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="${contextPath}/resources/js/delivery/kakaoLogin.js"></script>
<title>딜리버리</title>
</head>
<body>
	<div id="wrap">
		<!-- join desktop header -->
		<jsp:include page="../include/header/delivery_desktop_header.jsp" />
		<!-- desktop join page -->
		<!--navigation bar-->
		<nav class="locationWrap">
			<!--<ul>
	        <li><a href="${contextPath}/">HOME</a></li>&nbsp;&nbsp;
	        <li><a href="${contextPath}/login">로그인</a></li>&nbsp;&nbsp;
	        <li><a href="${contextPath}/join">회원가입</a></li>
	    </ul>
	    -->
			<div class="personal_logon ">
				<a>
					<div class="personal_order">
						<dl>
							<dt>
								<strong>딜리버리 주문내역</strong>
							</dt>
							<dd>주문내역이 없습니다.</dd>
						</dl>
					</div>
				</a> <a>
					<div class="personal_cart">
						<dl>
							<dt>
								<strong>카트</strong><em class="count" style="display: none;"><span>0</span></em>
							</dt>
							<dd>카트에 담은 상품이 없습니다</dd>
						</dl>
					</div>
				</a>
			</div>
		</nav>
		

		<!--content login-->



	</div>

	<div class="line" style="height: 176px;"></div>
	<div class="locationWrap">
			<div class="web_container">
				<div class="page_navi">
					<a href="#/deliveryHome"
						class="router-link-exact-active router-link-active"><span>딜리버리</span></a><a><span>메뉴</span></a>
				</div>
				<div class="location">
					<span class="addr"><span>배달지를 선택하세요</span></span><span class="shop"
						style="display: none;"><span></span></span><span class="no"
						style="display: none;"></span><span class="btn "><a
						href="#/location" class=""><span>변경</span></a></span>
				</div>
			</div>
		</div>
		<div class="contentsBox01 bg_w">
			<div class="web_container">
				<div class="subtitWrap">
					<h3 class="page_tit">메뉴</h3>
					<div class="tab01 m_shadow m_multi">
						<ul class="item3"></ul>
					</div>
				</div>
				<div class="tab_cont">
					<h4 class="hide">프리미엄</h4>
					<div class="nodata ">
						<p>
							<span>메뉴 준비중 입니다</span>
						</p>
					</div>
					<ul class="prdmenu_list"></ul>
				</div>
				
			</div>
		</div>
	
	<div class="order_caution">
					<div class="tit03">
						<h4 class="WEB">유의사항</h4>
						<button type="button" class="btn_infoingredient">
							<strong>원산지, 영양분석, 알레르기 유발성분</strong>
						</button>
					</div>
					<ul class="WEB txtlist01">
						
						<li>매장별 주문금액이 상이하니, 반드시 최소금액을 확인하기 바랍니다.</li>
						<li>배달 소요시간은 기상조건이나 매장 사정상 지연 또는 제한될 수 있습니다.</li>
						<li>고객님과 수 차례 연락을 시도한 후 연락이 되지 않는 경우 배달음식이 변질되거나 부패될 우려로
							식품위생법상 위반될 여지가 있어 별도로 보관 하지 않으며, <strong>재배달 또는 환불처리가
								어려울 수 있습니다.</strong>
						</li>
						<li>딜리버리 서비스 메뉴의 가격은 매장 가격과 상이하며, 딜리버리 시 타쿠폰을 사용하실 수 없습니다.
							(일부품목 배달 제외)</li>
						<li>배달 제품은 매장 행사(할인가격)에서 제외됩니다.</li>
						<li>제품 가격 및 메뉴 구성은 본사 사정상 변경될 수 있습니다.</li>
						<li>대량 주문의 경우 콜센터(1599-0505)주문으로만 가능합니다.</li>
						<li>주문 완료 후 변경 및 취소는 콜센터(1599-0505)에서만 가능합니다.</li>
					</ul>
				</div>
	
	<!-- join-desktop-footer -->
	<jsp:include page="../include/footer/delivery_desktop_footer.jsp" />
	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>