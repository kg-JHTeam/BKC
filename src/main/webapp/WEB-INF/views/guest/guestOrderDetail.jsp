<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<link rel="stylesheet" href="${contextPath}/resources/css/guest/guestOrderDetail.css">
	
	<!-- js -->
    <script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/resources/js/guest/guestOrderDetail.js"></script>
	
	<title>비회원 주문상세</title>
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
                        <a href="${contextPath}/guestdelivery.do">
                            <span>딜리버리</span>
                        </a>
                        <a href="${contextPath}/guestOrderDetail.do" class="gotomenu">
                            <span>주문상세</span>
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
            <div class="contentsBox01 bg_w">
                <div class="web_container">
                    <div class="container01">
                        <div class="orderstatusWrap">
                            <div class="resultBox delivery">
                                <span class="tit">
                                    <strong>2021.04.27 AM 03:48</strong>
                                </span>
                                <em class="txt_stat">&nbsp;
                                    <span>주문완료</span>
                                </em>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="contentsBox01">
                <div class="web_container">
                    <div class="container01">
                        <div class="titbox tit01">
                            <h3 class="tit_ico list">
                                <span>주문내역</span>
                            </h3>
                        </div>
                        <ul class="order_list">
                            <li>
                                <div class="prd_img">
                                    <span>
                                        <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/basak.png" alt="제품상세" style="display: inline; opacity: 1;">
                                    </span>
                                </div>
                                <div class="cont">
                                    <p class="tit">
                                        <strong>바삭클</strong>
                                    </p>
                                    <p class="price">
                                        <strong>
                                            <span>15,000</span>
                                            <span class="unit">원</span>
                                        </strong>
                                    </p>
                                    <div class="menu_info">
                                        <span class="txt">담백깔끔! 정직하게 튀겨낸 BHC 후라이드에 바삭함을 더한 옛날 통닭의 귀환</span>
                                        <span class="order_count tag st03">
                                            <span>수량 1개</span>
                                        </span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="prd_img">
                                    <span>
                                        <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/colpop.png" alt="제품상세" style="display: inline; opacity: 1;">
                                    </span>
                                </div>
                                <div class="cont">
                                    <p class="tit">
                                        <strong>콜팝치킨</strong>
                                    </p>
                                    <p class="price">
                                        <strong>
                                            <span>2,500</span>
                                            <span class="unit">원</span>
                                        </strong>
                                    </p>
                                    <div class="menu_info">
                                        <span class="txt">한 입에 쏙 들어가는 치킨과 콜라의 추억의 맛</span>
                                        <span class="order_count tag st03">
                                            <span>수량 1개</span>
                                        </span>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <h2 class="tit01 tit_ico chicken">
                            <span>주문정보</span>
                        </h2>
                        <div class="container02 pd02 order_list_sum">
                            <div class="titbox02">
                                <p class="tit">
                                    <strong>서울특별시 서초구 잠원로 117 (잠원동, 아크로리버뷰신반포)</strong>
                                    <em class="tag_brown">
                                        <span>주문완료</span>
                                    </em>
                                </p>
                            </div>
                            <div class="cont">
                                <div class="info">
                                    <dl>
                                        <dt>주문번호</dt>
                                        <dd>
                                            <strong>000000001</strong>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>주문시간</dt>
                                        <dd>
                                            <strong>2021.04.27 AM 03:48</strong>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>연락처</dt>
                                        <dd>
                                            <strong>01012345678</strong>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>매장</dt>
                                        <dd>
                                            <strong>종로점</strong>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>매장 전화번호</dt>
                                        <dd>
                                            <strong>070-1234-5678</strong>
                                        </dd>
                                    </dl>
                                    <dl class="cancelInfo" style="display: none;">
                                        <dt>취소사유</dt>
                                        <dd>
                                            <span></span>
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                        <h2 class="tit01 tit_ico money">
                            <span>결제내역</span>
                        </h2>
                        <div class="container02 pd02">
                            <div class="order_payment_list w_st02">
                                <div>
                                    <dl>
                                        <dt>주문금액</dt>
                                        <dd>
                                            <span>17,500</span>
                                            <span class="unit">원</span>
                                        </dd>
                                    </dl>
                                    <dl class="group">
                                        <dt>쿠폰</dt>
                                        <dd>
                                            <span>0</span>
                                            <span class="unit">원</span>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>결제방법</dt>
                                        <dd>
                                            <span>신용카드 결제</span>
                                        </dd>
                                    </dl>
                                    <dl class="tot02">
                                        <dt>결제금액</dt>
                                        <dd>
                                            <em>
                                                <span>17,500</span>
                                                <span class="unit">원</span>
                                            </em>
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="c_btn m_itme2"></div>
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