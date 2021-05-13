<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<!--font-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<!--fabicon-->
<link rel="shortcut icon" type="image/x-icon"
	href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />
<title>매장찾기</title>
<!-- css -->
<link rel="stylesheet" href="../resources/css/include/main-gnb.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/subpages/map/mapstyle.css">
<!-- js -->

<script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
<script src="${contextPath}/resources/js/include/main-gnb.js"></script>
<script src="${contextPath}/resources/js/subpages/map/menu.js"></script>

</head>
<body>
	<jsp:include page="../../include/header/main_desktop_header.jsp" />
	<div id="wrap">
		<!-- header 들어갈 자리-->
		
	
		<div style="height: 100px"></div>	
		<!-- navigation bar -->
		<div class="locationWrap">
            <div class="page_navi">
				<ul>		
					<li><a href="${contextPath }/"> <span>HOME</span> </a>>
					<a href="${contextPath}/map/store.do" class="arrow"><span>매장찾기</span></a></li>
				</ul>
			</div>
		</div>
		<div class="map_wrap">
			<div id="map"
				style="width: 100%; height: 100%; position: absolute; overflow: hidden;"></div>

			<div id="menu_wrap">
				<div class="option">
					<div class="tab01">
						<ul class="item01">
							<li class>
								<button type="button" class="storesearch">
									<span>매장명검색</span>
								</button>
							</li>
						</ul>
					</div>
					<div class="container01">
						<div class="r_srch01 st02">
							<form onsubmit="searchPlaces(); return false;" class="inpbox">
								<input type="text" id="keyword" size="15">
								<button type="button" class="btn_del01" style="display: none;">
									<span>입력 텍스트 삭제</span>
								</button>
								<button type="submit" class="submit"></button>
							</form>
						</div>
						<button type="button" class="WEB btn_mapsearch_open"></button>
					</div>
				</div>
				<hr>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5fcd23b6f44b5e83841c6b29763ecd62&libraries=services"></script>
	<script src="${contextPath}/resources/js/subpages/map/map.js"></script>
</body>
</html>