<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
	<link rel="stylesheet" href="${contextPath}/resources/css/include/delivery-gnb2.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/delivery/mybkc.css">
	
	<!-- js -->
    <script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/resources/js/delivery/mybkc.js"></script>
	
	<title>마이비케이씨</title>
</head>
<body>
	<div class="subWrap02">
	<!-- delivery desktop header -->
	<jsp:include page="../include/header/delivery_desktop_header2.jsp"/>
	<!-- desktop mybkc page -->
	<!-- contents 부분 -->
        <div class="contentsWrap">
            <div class="locationWrap">
                <div class="web_container2">
                    <div class="page_navi">
                        <a href="${contextPath}/delivery/delivery.do">
                            <span>딜리버리</span>
                        </a>
                        <a href="${contextPath}/delivery/mybkc.do" class="gotomenu">
                            <span>MYBKC</span>
                        </a>
                    </div>
                    <div class="location">
                        <span class="addr">
                        <span>${location.addr} ${location.addr_detail}</span>
                        </span>
                        <span class="shop">
                        <span>신논현역점(DB)</span>
                        </span>
                        <span class="btn">
                        <a href="${contextPath}/delivery/mylocation.do" class="addrchange">
                            <span>변경</span>
                        </a>
                        </span>
                    </div>
                </div>
            </div>
            <div class="contentsBox01 bg_w">
                <div class="web_container2">
                    <div class="subtitWrap">
                        <h2 class="page_tit st02">MYBKC</h2>
                    </div>
                    <div class="mybkc_info">
                        <div class="member_info">
                            <p class="user">
                                <strong>${user.name } 님!</strong>
                                <span>반갑습니다</span>
                            </p>
                            <a href="${contextPath}/modifyuser">
                                <span>정보변경</span>
                            </a>
                        </div>
                        <div class="coupon_info">
                            <dl class="info_coupon">
                                <dt>나의 쿠폰</dt>
                                <dd>
									<strong> ${couponcount}장</strong>
                                    <a href="${contextPath}/delivery/mycoupon.do" class="btn_detail">
                                        <span>details</span>
                                    </a>
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>
            </div>
            <div class="contentsBox01 bg_b">
                <div class="web_container2 container01">
                    <h3 class="tit01 tit_ico list">
                        <span>최근 주문내역</span>
                    </h3>
                    <div class="container02 pd02 order_list_sum">
                        <div class="titbox">
                            <p class="tit">
                                <strong>바삭클 외 1건</strong>
                                <em class="tag">
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
                                    <dt>매장</dt>
                                    <dd>
                                        <strong>종로점</strong>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>주문시간</dt>
                                    <dd>
                                        <strong>2021.04.27 AM 03:48</strong>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>결제수단</dt>
                                    <dd>
                                        <strong>신용카드 결제</strong>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>배달 예상시간</dt>
                                    <dd>
                                        <strong>55-60</strong>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                    <div class="c_btn">
                        <a href="${contextPath}/delivery/orderList.do" class="btn01">
                            <span>전체보기</span>
                        </a>
                    </div>
                    <div class="qmenuWrap02">
                        <ul>
                            <li class="qmenu_myplace">
                                <a href="#">
                                    <span>MY 배달지</span>
                                </a>
                            </li>
                        </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <jsp:include page="../include/footer/delivery_desktop_footer.jsp"/>
    <a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>