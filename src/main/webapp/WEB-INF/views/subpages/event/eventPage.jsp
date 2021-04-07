<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <!-- jQuery -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="../resources/jquery/jquery-3.6.0.min.js"></script> 
     
    <!-- CSS -->
    <link rel="stylesheet" href="../resources/css/include/main-gnb.css">
    <link rel="stylesheet" href="../resources/css/subpages/event/eventPage.css">

    <!-- Font Google Web Font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/icon/apple-icon.png" />
        
    <!-- JS -->
    <script src="../resources/js/include/main-gnb.js"></script>

<title>이벤트</title>
</head>
<body>
	<!-- Main-Header -->
	<jsp:include page="../../include/header/main_desktop_header.jsp" />
	<jsp:include page="../../include/header/main_mobile_header.jsp" />
	
	<div class="contentsBox01">
		<div class="web_container">
			<div class="subtitWrap">
				<!-- Title -->
				<h3 class="page_tit">이벤트</h3>
				<!-- Menu -->
				<div class="tab01">
					<ul>
						<li id="all" class="on">
							<button type="button">
								<strong>전체</strong>
							</button>
						</li>
						<li id="ing" class="ing">
							<button type="button">
								<strong>진행중</strong>
							</button>
						</li>
						<li id="end" class="end">
							<button type="button">
								<strong>종료</strong>
							</button>
						</li>
					</ul>
				</div>
			</div>
	
		<div class="tab_storyWrap">
			<ul class="web_container tab_storyBtn m_shadow">
				<!-- Tab Bar -->
				<li id="event" class="on">
					<button type="button">이벤트</button>
				</li>
				<li id="new">
					<button type="button">신규매장</button>
				</li>
			</ul>
			<!-- 이벤트, 신규 매장 이미지 -->
			<ul class="eventBox">
				<button class="contents1" onclick="location.href='${pageContext.request.contextPath }/event/eventDetail.do'">
					<img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imagesB/buggerking/2/3.Whopper/stacker4W.png">
					<p>2021.03.15~</p>
				</button>
				<button class="contents2">
					<img src="image/img_main_banner_.PNG">
					<p>2021.03.15~</p>
				</button>
				<button class="contents3">
					<img src="image/img_main_banner_.PNG">
					<p>2021.03.15~</p>
				</button>
			</ul>
			<ul class="eventBox">
				<button class="contents01">
					<img src="image/new1.PNG" width="547" height="229">
					<p>2021.03.15~</p>
				</button>
				<button class="contents02">
					<img src="image/new2.PNG" width="547" height="229">
					<p>2021.03.15~</p>
				</button>
				<button class="contents03">
					<img src="image/new3.PNG" width="547" height="229">
					<p>2021.03.15~</p>
				</button>
			</ul>
		</div>
	</div>	</div>
	<!-- 더보기 -->
	<div class="c_btn">
		<li class="moreview">
			<button class="moreviews" type="button">
				<img src="image\moreview.PNG">
			</button>
		</li>
	</div>
	<!-- 맨 위로 가기 -->
	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>



	<!-- JS -->
    <script src="../resources/js/subpages/event/event.js"></script>
	<!-- main-footer -->
   <jsp:include page="../../include/footer/main_desktop_footer.jsp"/>
   <jsp:include page="../../include/footer/main_mobile_footer.jsp"/>
</body>
</html>
