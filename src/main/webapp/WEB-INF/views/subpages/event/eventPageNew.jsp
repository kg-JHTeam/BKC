<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">

<!--font google web font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon"
	href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/icon/apple-icon.png" />

<!-- jQuery -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../resources/jquery/jquery-3.6.0.min.js"></script>

<!-- js -->
<script src="../resources/js/include/main-gnb.js"></script>

<!--css-->
<link rel="stylesheet" href="../resources/css/include/main-gnb.css">
<link rel="stylesheet"
	href="../resources/css/subpages/event/eventPage.css?v=<%=System.currentTimeMillis() %>" />

<title>이벤트</title>
</head>
<body>
	<!-- main-header -->
	<jsp:include page="../../include/header/main_desktop_header.jsp" />
	<jsp:include page="../../include/header/main_mobile_header.jsp" />
	<div class="contentsWrap eventWrap">
		<div class="locationWrap WEB">
			<div class="event_web_container">
				<div class="page_navi">
					<a href="#/home"> <span>HOME</span>
					</a> <span> 신규매장 </span> <span> 전체 </span>
				</div>
			</div>
		</div>
		<div class="contentsBox01 bg_w">
			<div class="event_web_container">
				<div class="subtitWrap">
					<h3 class="page_tit">신규매장</h3>
				</div>
				<ul class="tab_storyBtn m_shadow">
					<li>
						<button type="button"onclick="location.href='${pageContext.request.contextPath }/event/eventPageAll.do'">이벤트</button>
					</li>
					<li class="on">
						<button type="button">신규매장</button>
					</li>
				</ul>
				<div class="tab_cont m_bg_basic">
					<div class="nodata" style="display: none;">
						<span>이벤트가 없습니다</span>
					</div>
					<ul class="eventBox">
						<li>
							<button>
								<span> <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/footer/footerimg.png" style="display: inline; opacity: 1;">
								</span>
							</button>
							<p>
								<span>2021.04.01~2021.04.30</span>
							</p>
						</li>
						<li>
							<button>
								<span> <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/footer/footerimg.png" style="display: inline; opacity: 1;">
								</span>
							</button>
							<p>
								<span>2021.04.01~2021.04.30</span>
							</p>
						</li>
						<li>
							<button>
								<span> <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/footer/footerimg.png" style="display: inline; opacity: 1;">
								</span>
							</button>
							<p>
								<span>2021.04.01~2021.04.30</span>
							</p>
						</li>
						<li>
							<button>
								<span> <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/footer/footerimg.png" style="display: inline; opacity: 1;">
								</span>
							</button>
							<p>
								<span>2021.04.01~2021.04.30</span>
							</p>
						</li>
					</ul>
					<div class="c_btn">
						<button type="button" class="btn01 more">
							<span> 더보기 </span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- js -->
	<script src="../resources/js/subpages/brand/menuitem.js"></script>

	<!-- main-footer -->
	<jsp:include page="../../include/footer/main_desktop_footer.jsp" />
	<jsp:include page="../../include/footer/main_mobile_footer.jsp" />
</body>
</html>