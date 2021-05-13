<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
	<!-- font google web font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <!-- favicon -->
    <link rel="shortcut icon" type="image/x-icon"
    href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />
	<!-- css -->
	<link rel="stylesheet" href="${contextPath}/resources/css/include/delivery-gnb2.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/delivery/ordercomplete.css">
	
	<!-- js -->
    <script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/resources/js/delivery/ordercomplete.js"></script>
	
	<title>주문완료</title>
</head>
<body>
	<div class="subWrap02">
	<!-- delivery desktop header -->
	<jsp:include page="../include/header/delivery_desktop_header2.jsp"/>
	<!-- desktop ordercomplete page -->
	<!-- contents 부분 -->
        <div class="contentsWrap">
            <div class="locationWrap">
                <div class="web_container">
                    <div class="page_navi">
                        <a href="${contextPath}/delivery/delivery.do">
                            <span>딜리버리</span>
                        </a>
                        <a href="${contextPath}/delivery/ordercomplete.do" class="gotomenu">
                            <span>주문완료</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="contentsBox02 bg_w">
                <div class="web_container">
                    <div class="order_complete">
                        <h2 class="tit">
                            <strong>주문이 완료</strong> 되었습니다!
                        </h2>
                        <p class="time_info">
                            <span class="tt">배달 예상시간</span>
                            <em class="txt">
                                <span>45~55</span>
                            </em>
                        </p>
                    </div>
                </div>
            </div>
            <div class="contentsBox02">
                <div class="web_container">
                    <div class="container02">
                        <h2 class="tit01">
                            <span>주문번호</span>
                        </h2>
                        <div class="container03 pd02">
                            <p class="txt_info01 w_bold">
                                <span>${order.order_serial}</span>
                            </p>
                        </div>
                    </div>
                    <div class="container02">
                        <h2 class="tit01 tit_ico location">
                            <span>배달지 주소</span>
                        </h2>
                        <div class="container03 pd02">
                            <p class="txt_info01 w_bold">
                                <span>${order.address}</span>
                            </p>
                        </div>
                    </div>
                    <div class="container02">
                        <h2 class="tit01 tit_ico bkc">
                            <span>BKC 매장</span>
                        </h2>
                        <div class="container03 pd02 order_shop_info">
                            <div class="info">
                                <p class="branch">
                                    <strong>
                                        <span>${order.store_name}</span>
                                    </strong>
                                </p>
                                <p class="tel">
                                    <strong>
                                        <span>070-1234-5678</span>
                                    </strong>
                                </p>
                            </div>
                            <div class="caution">
                                <p>
                                    <em>
                                        <strong>주문취소</strong>는
                                        <strong>주문접수 대기중</strong>일 경우에만 가능합니다.
                                    </em>
                                </p>
                                <p>
                                    <em>
                                        <strong>주문완료</strong>후에는
                                        <strong>고객센터</strong>로 문의 주세요
                                    </em>
                                </p>
                            </div>
                        </div>
                        <div class="info_command_UI">
                            <ul class="WEB txtlist01">
                                <li>
                                    주문 취소를 원하시는 경우, 주문 접수 후 주문내역 상세에서 3분내에 신청해 주셔야 합니다.
                                </li>
                                <li>
                                    주문내역은 MYBKC > 주문내역 에서 조회 가능합니다.
                                </li>
                            </ul>
                            <div class="c_btn item2">
                                <a href="${contextPath}/delivery/delivery.do" type="button" class="btn01 orange">
                                    <span>딜리버리주문</span>
                                </a>
                                <a href="${contextPath}/delivery/orderList.do" type="button" class="btn01">
                                    <span>주문내역확인</span>
                                </a>
                            </div>
                        </div>
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