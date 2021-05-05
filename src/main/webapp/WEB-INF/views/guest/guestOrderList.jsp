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
	<link rel="stylesheet" href="${contextPath}/resources/css/guest/guestOrderList.css">
	
	<!-- js -->
    <script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/resources/js/guest/guestOrderList.js"></script>
	
	<title>비회원 주문목록</title>
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
                        <a href="${contextPath}/guestOrderList.do" class="gotomenu">
                            <span>비회원 주문내역</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="contentsBox01 nonmember_order">
                <div class="web_container container01">
                    <div class="tab_cont">
                        <h3 class="hide">비회원 주문내역</h3>
                        <div class="container02">
                            <dl>
                                <dt>주문번호</dt>
                                <dd>
                                    <div class="inpbox">
                                        <input class="order_num" type="tel" placeholder="주문번호 입력">
                                        <button type="button" class="btn_del01" style="display: none;">
                                            <span>입력 텍스트 삭제</span>
                                        </button>
                                    </div>
                                </dd>
                                <dt>비밀번호</dt>
                                <dd>
                                    <div class="inpbox" id="pass">
                                        <input type="password" placeholder="비밀번호">
                                        <button type="button" class="btn_view01">
                                            <span>입력 텍스트 보기</span>
                                        </button>
                                    </div>
                                </dd>
                            </dl>
                        </div>
                        <div class="c_btn">
                            <a href="${contextPath}/guestOrderDetail.do" class="btn01">
                                <span>조회하기</span>
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