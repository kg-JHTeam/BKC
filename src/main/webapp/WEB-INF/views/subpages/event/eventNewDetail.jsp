<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

<!-- jQuery -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../resources/jquery/jquery-3.6.0.min.js"></script>

<!--css-->
<link rel="stylesheet" href="../resources/css/include/main-gnb.css">
<link rel="stylesheet"
	href="../resources/css/subpages/event/eventDetail.css">

<!--font google web font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon"
	href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/icon/apple-icon.png" />

<!-- js -->
<script src="../resources/js/include/main-gnb.js"></script>

<title>이벤트</title>
</head>
<body>
	<!-- main-header -->
	<jsp:include page="../../include/header/main_desktop_header.jsp" />
	<jsp:include page="../../include/header/main_mobile_header.jsp" />

	<div class="contentsBox01 bg_w">
		<div class="web_container">
			
			<div class="subtitWrap">
			
				<!-- Title -->
				<h3 class="page_tit">이벤트</h3>
				<!-- 이벤트 제목, 이미지, 내용 -->
				<div class="ev_tit WEB">
					<h4 class="title">${store.store_name} GRAND OPEN</h4>
					<div class="valid">
						<p class="start">${store.store_open}</p> ~ 
					</div>
				</div>
				<div class="ev_con">
					<img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/event/detail/new_detail.png" style="z-index: -1;">
					<div style="position: absolute; left: 500px; top: 260px; font-size: 4rem; color:#6F3C2F; display: block">${store.store_name }</div>
					<img class="qr" src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/event/detail/evenr_qr.png"> 
				</div>
				
			</div>
			<!-- 목록보기 -->
			<div class="c_btn">
					<a class="btn01 m" a href="${pageContext.request.contextPath }/event/eventPageAll.do">
						<span>목록보기</span>
					</a>
			</div>
		</div>
	</div>
	
	<!-- 맨 위로 가기 -->
	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>

	<!-- js -->
	<script src="../resources/js/subpages/event/event.js"></script>

	<!-- main-footer -->
	<jsp:include page="../../include/footer/main_desktop_footer.jsp" />
	<jsp:include page="../../include/footer/main_mobile_footer.jsp" />
</body>
</html>