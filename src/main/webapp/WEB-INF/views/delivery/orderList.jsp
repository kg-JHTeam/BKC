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
	<link rel="stylesheet" href="${contextPath}/resources/css/delivery/orderList.css">
	
	<!-- js -->
    <script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/resources/js/delivery/orderList.js"></script>
	
	<title>주문목록</title>
</head>
<body>
	<div class="subWrap02">
	<!-- delivery desktop header -->
	<jsp:include page="../include/header/delivery_desktop_header2.jsp"/>
	<!-- desktop orderList page -->
	 <!-- contents 부분 -->
        <div class="contentsWrap">
            <div class="locationWrap">
                <div class="web_container">
                    <div class="page_navi">
                        <a href="${contextPath}/delivery/delivery.do">
                            <span>딜리버리</span>
                        </a>
                        <a href="#" class="gotomenu">
                            <span>MYBKC</span>
                        </a>
                        <a href="${contextPath}/delivery/orderList.do" class="gotomenu">
                            <span>주문내역</span>
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
                        <h2 class="page_tit">주문내역</h2>
                        <div class="tab01">
                            <ul class="item2">
                                <li class="on">
                                    <button type="button" class="button">
                                        <span>딜리버리</span>
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="container01">
                        <div class="tab_cont">
                            <h3 class="hide">딜리버리</h3>
                            <div class="nodata" style="display: none;">
                                <p>주문내역이 없습니다.</p>
                            </div>
                            <ul class="order_list">
                                <li>
                                    <div class="prd_img">
                                        <span>
                                            <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/basak.png" alt="주문상품" style="display: inline; opacity: 1;">
                                        </span>
                                    </div>
                                    <div class="cont">
                                        <p class="tit">
                                            <strong>바삭클외 2건</strong>
                                            <em class="tag">
                                                <span>주문완료</span>
                                            </em>
                                        </p>
                                        <div class="info">
                                            <dl>
                                                <dt>주문번호</dt>
                                                <dd>
                                                    <span>000000002</span>
                                                </dd>
                                            </dl>
                                            <dl>
                                                <dt>주문시간</dt>
                                                <dd>
                                                    <span>2021.04.27 AM 04:48</span>
                                                </dd>
                                            </dl>
                                        </div>
                                    </div>
                                    <a href="#" class="btn_detail">
                                        <span>Details</span>
                                    </a>
                                </li>
                                <li>
                                    <div class="prd_img">
                                        <span>
                                        <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/basak.png" alt="주문상품" style="display: inline; opacity: 1;">
                                    </span>
                                    </div>
                                    <div class="cont">
                                        <p class="tit">
                                            <strong>바삭클외 1건</strong>
                                            <em class="tag">
                                            <span>주문완료</span>
                                        </em>
                                        </p>
                                        <div class="info">
                                            <dl>
                                                <dt>주문번호</dt>
                                                <dd>
                                                    <span>000000001</span>
                                                </dd>
                                            </dl>
                                            <dl>
                                                <dt>주문시간</dt>
                                                <dd>
                                                    <span>2021.04.27 AM 03:48</span>
                                                </dd>
                                            </dl>
                                        </div>
                                    </div>
                                    <a href="#" class="btn_detail">
                                        <span>Details</span>
                                    </a>
                                </li>
                            </ul>
                            <div class="c_btn">
                                <div>
                                    <a href="#" class="btn01 more" style="display: none;">
                                        <span>더보기</span>
                                    </a>
                                </div>
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