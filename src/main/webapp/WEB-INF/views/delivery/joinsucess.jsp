<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
	href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />
<!-- css -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/include/delivery-gnb.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/delivery/join.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/delivery/joindetail.css">

<!-- 추가 -->
<link href="${contextPath}/resources/css/delivery/joinsucess.css"
	media="all" rel="stylesheet" type="text/css">

<!-- js -->
<script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
<script src="${contextPath}/resources/js/delivery/delivery.js"></script>
<script
	src="${contextPath}/resources/js/delivery/joindetail/joindetail.js"></script>
<title>BKC</title>
</head>
<body>
	<div class="all">
		<div id="wrap">
			<!-- join desktop header -->
			<jsp:include page="../include/header/delivery_desktop_header.jsp" />
			<!-- desktop join page -->
			<!--navigation bar-->
			<nav class="locationWrap">
				<ul>
					<li><a href="${contextPath}/delivery/delivery.do">딜리버리</a></li>&nbsp;>&nbsp;
					<li><a href="${contextPath}/login">로그인</a></li>&nbsp;>&nbsp;
					<li><a href="${contextPath}/join">회원가입 완료</a></li>
				</ul>
			</nav>
		</div>

		<div class="contentsBox01">
			<div class="web_container02">
				<div class="subtitWrap">
					<h2 class="page_tit">BKC 가입이 완료되었습니다.</h2>
				</div>
				<div class="tab_cont">
					<!-- 아이디 찾기   -->
					<div class="container02">
						<div class="WEB titbox">
							<h1 style="text-align:center;">${youtube.path }</h1>
						</div>
						<div class="dlist01">
							<h1 style="text-align:center;">BKC 회원가입을 환영합니다<br>
							이제부터 BKC의 다양한 혜택과 서비스를 이용해보세요</h1>
						</div>
					</div>
					<div class="c_btn">
						<div>
							<a href="${contextPath }/login">
								<button class="btn01 l">
									로그인 하기
								</button>
							</a>
						</div>
					</div>
			</div>
		</div>
	</div>
	<!-- join-desktop-footer -->
	<jsp:include page="../include/footer/delivery_desktop_footer.jsp" />
	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>