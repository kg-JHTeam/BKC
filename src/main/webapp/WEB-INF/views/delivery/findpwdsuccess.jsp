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
<link href="${contextPath}/resources/css/delivery/userfind.css"
	media="all" rel="stylesheet" type="text/css">

<!-- js -->
<script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
<script src="${contextPath}/resources/js/delivery/delivery.js"></script>
<script src="${contextPath}/resources/js/delivery/joindetail/joindetail.js"></script>
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
					<li><a href="${contextPath}/join">아이디/비밀번호 찾기</a></li>
				</ul>
			</nav>
		</div>

		<div class="contentsBox01">
			<div class="web_container02">
				<div class="subtitWrap">
					<h2 class="page_tit">아이디/비밀번호 찾기</h2>
				</div>
				
				<form class="tab_cont" method="post" id="findUserForm" action="<c:url value='/login'/>">
					<h3 class="hide">비밀번호 찾기 완료 </h3>
					<div class="container02">
						<div class="WEB titbox">
							<h1>비밀번호 찾기 완료  </h1>
						</div>
						<div class="dlist01">
							<h3>비밀번호 재설정 경로 발송 완료</h3>
							<h3>회원님의 이메일로 비밀번호 재설정 경로를 발송하였습니다.</h3>
							<h3> ${vo.userid}</h3>
						</div>
					</div>
					<div class="c_btn">
						<div>
							<button type="button" class="btn01 l" onclick="location.href='${contextPath}/'">
								<span id="login">Home</span>
							<button type="button" class="btn01 l" onclick="location.href='${contextPath}/login'">
								<span id="password">로그인</span>
							</button>
						</div>
					</div>
					<ul class="MOB txtlist01">
						<li>가입 시 입력한 이름과 휴대폰번호로 아이디 정보를 찾을 수 있습니다.</li>
						<li>네이버, 카카오톡, 삼성 앱카드, 애플아이디로 가입하신 회원님께서는 해당 서비스에서 아이디/비밀번호
							찾기를 진행해 주세요.</li>
					</ul>
					<!-- true일경우 아이디 찾기  / false 일 경우 비밀번호 ㅊ -->
					<input type="hidden" name="check" value="true" id="check"/>
				</form>
			</div>
		</div>
	</div>
<script
	src="${contextPath}/resources/js/delivery/userfind.js"></script>
	<!-- join-desktop-footer -->
	<jsp:include page="../include/footer/delivery_desktop_footer.jsp" />
	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>