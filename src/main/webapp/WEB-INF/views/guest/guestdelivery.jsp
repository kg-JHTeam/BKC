<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
	<!-- font google web font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <!-- favicon -->
    <link rel="shortcut icon" type="image/x-icon"
    href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />
	<!-- css -->
	<link rel="stylesheet" href="${contextPath}/resources/css/include/guestdelivery-gnb.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/guest/guestdelivery.css">
	
	<!-- js -->
    <script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/resources/js/guest/guestdelivery.js"></script>
	
	<title>비회원 딜리버리</title>
</head>
<body>
<div class="subWrap02">
	<!-- delivery desktop header -->
	<jsp:include page="../include/header/guestdelivery_desktop_header.jsp"/>
	<!-- contents 부분 -->
        <div class="contentsWrap">
            <div class="locationWrap">
                <div class="web_container">
                    <div class="page_navi">
                        <a href="#">
                            <span>딜리버리</span>
                        </a>
                        <a href="#" class="gotomenu">
                            <span>메뉴</span>
                        </a>
                    </div>
                    <div class="location">
                        <span class="addr">
                        <span>서울특별시 서초구 잠원로 117 (잠원동, 아크로리버뷰신반포)(DB)</span>
                        </span>
                        <span class="shop">
                        <span>신논현역점(DB)</span>
                        </span>
                        <span class="btn">
                        <a href="#" class="addrchange">
                            <span>변경</span>
                        </a>
                        </span>
                    </div>
                </div>
            </div>
            <div class="contentsBox01">
                <div class="web_container">
                    <div class="subtitWrap">
                        <h3 class="page_tit">메뉴</h3>
                        <div class="tab01">
                            <ul class="item3">
                                <li class="on">
                                    <button type="button" class="button">
                                    <span>신 메뉴</span>
                                </button>
                                </li>
                                <li class="">
                                    <button type="button" class="button">
                                    <span>치킨메뉴</span>
                                </button>
                                </li>
                                <li class="">
                                    <button type="button" class="button">
                                    <span>사이드메뉴</span>
                                </button>
                                </li>
                                <li class="">
                                    <button type="button" class="button">
                                    <span>비어존메뉴</span>
                                </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab_cont">
                        <ul class="prdmenu_list">
                            <li>
                                <div class="prd_img">
                                    <span>
                                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/newmenu.png" alt="신 메뉴" style="display: inline; opacity: 1;">
                                </span>
                                </div>
                                <div class="cont">
                                    <p class="tit">
                                        <strong>신메뉴(DB)</strong>
                                    </p>
                                    <p class="menu_info">
                                        <span>신메뉴 설명(DB)</span>
                                    </p>
                                    <p class="price">
                                        <strong>
                                        <em>
                                            <span>&#8361; 신메뉴 가격(DB)</span>
                                        </em>
                                    </strong>
                                    </p>
                                </div>
                                <a href="${contextPath}/guestCart.do" class="btn_detail">
                                    <span>Details</span>
                                </a>
                            </li>
                        </ul>
                        <ul class="prdmenu_list">
                            <li>
                                <div class="prd_img">
                                    <span>
                                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/basak.png" alt="치킨메뉴" style="display: inline; opacity: 1;">
                                </span>
                                </div>
                                <div class="cont">
                                    <p class="tit">
                                        <strong>바삭클</strong>
                                    </p>
                                    <p class="menu_info">
                                        <span>담백깔끔! 정직하게 튀겨낸 BHC 후라이드에 바삭함을 더한 옛날 통닭의 귀환</span>
                                    </p>
                                    <p class="price">
                                        <strong>
                                        <em>
                                            <span>&#8361; 15000</span>
                                        </em>
                                    </strong>
                                    </p>
                                </div>
                                <a href="${contextPath}/guestCart.do" class="btn_detail">
                                    <span>Details</span>
                                </a>
                            </li>
                        </ul>
                        <ul class="prdmenu_list">
                            <li>
                                <div class="prd_img">
                                    <span>
                                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/colpop.png" alt="사이드메뉴" style="display: inline; opacity: 1;">
                                </span>
                                </div>
                                <div class="cont">
                                    <p class="tit">
                                        <strong>콜팝치킨</strong>
                                    </p>
                                    <p class="menu_info">
                                        <span>한 입에 쏙 들어가는 치킨과 콜라의 추억의 맛</span>
                                    </p>
                                    <p class="price">
                                        <strong>
                                        <em>
                                            <span>&#8361; 2500</span>
                                        </em>
                                    </strong>
                                    </p>
                                </div>
                                <a href="${contextPath}/guestCart.do" class="btn_detail">
                                    <span>Details</span>
                                </a>
                            </li>
                        </ul>
                        <ul class="prdmenu_list">
                            <li>
                                <div class="prd_img">
                                    <span>
                                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/beerzone01.png" alt="비어존메뉴" style="display: inline; opacity: 1;">
                                </span>
                                </div>
                                <div class="cont">
                                    <p class="tit">
                                        <strong>치즈닭똥집</strong>
                                    </p>
                                    <p class="menu_info">
                                        <span>쭈~욱 늘어나는 치즈에 돌돌 말아먹는 바삭하고 쫄깃한 매운 닭똥집튀김</span>
                                    </p>
                                    <p class="price">
                                        <strong>
                                        <em>
                                            <span>&#8361; 비어존메뉴 가격(DB)</span>
                                        </em>
                                    </strong>
                                    </p>
                                </div>
                                <a href="${contextPath}/guestCart.do" class="btn_detail">
                                    <span>Details</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="order_caution">
                        <div class="tit03">
                            <h4 class="WEB">유의사항</h4>
                            <a href="#" class="btn_infoallergy">
                                <strong>알레르기 정보</strong>
                            </a>
                        </div>
                        <ul class="WEB txtlist01">
                            <li>매장상황 및 거리에 따라 배달비가 발생할 수 있습니다.</li>
                            <li>온라인 주문은 15,000원 이상일때 가능합니다.</li>
                            <li>주문가능 수량은 최대 9개 입니다.</li>
                            <li>온라인 주문은 예약배달이 불가합니다.</li>
                            <li>제주지역 및 일부 매장은 판매 가격이 상이하여 추가금이 발생할 수 있습니다.</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="popWrap">
                <div class="popbox01">
                    <button type="button" class="btn_close" style="z-index: 100;"></button>
                    <div class="popcont pd02">
                        <dl class="addr_chk">
                            <dt>배달지 주소</dt>
                            <dd>
                                <strong style="word-break: break-all;">
                                    <span>선택된 주소가 없습니다.</span>
                                </strong>
                            </dd>
                            <dd>
                                <strong class="nick"></strong>
                                <span class="txt"></span>
                            </dd>
                        </dl>
                        <p class="txt02">배달받을 주소를 검색해보세요!</p>
                    </div>
                    <div class="pop_btn c_btn item2">
                        <a href="#" class="btn02 dark">
                            <span>취소</span>
                        </a>
                        <a href="#" class="btn02 orange">
                            <span>배달지검색</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <jsp:include page="../include/footer/delivery_desktop_footer.jsp"/>
    <a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>