<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<a href="#/home" class="arrow" > <span>HOME</span>&nbsp;>&nbsp;
					</a><a class="arrow"> <span> 이벤트</span>&nbsp;>&nbsp;</a> <a class="arrow"><span> 전체 </span></a>
				</div>
			</div>
		</div>
		<div class="contentsBox01 bg_w">
			<div class="event_web_container">
				<div class="subtitWrap">
					<h3 class="page_tit">이벤트</h3>
					<div class="tab01 m_shadow">
						<ul>
							<li class='on'>
								<button type="button">
									<span>전체</span>
								</button>
							</li>
							<li>
								<button type="button" onclick="location.href='${pageContext.request.contextPath }/event/eventPageContinue.do'">
									<span>진행중</span>
								</button>
							</li>
							<li>
								<button type="button" onclick="location.href='${pageContext.request.contextPath }/event/eventPageEnd.do'">
									<span>종료</span>
								</button>
							</li>
						</ul>
					</div>
				</div>
				<ul class="tab_storyBtn m_shadow">
					<li class="on">
						<button type="button">이벤트</button>
					</li>
					<li>
						<button type="button" onclick="location.href='${pageContext.request.contextPath}/event/eventPageNew.do'">신규매장</button>
					</li>
				</ul>
				<div class="tab_cont m_bg_basic">
					<ul class="eventBox">
						<c:forEach var="eventList" items="${eventList}">
								<li>
									<div class="event_list_img">
										 <img src="${eventList.img_title}" style="display: inline; opacity: 1;">	
									</div>
									<div class="cont">
										<p class="tit">
											<a type="hidden" href="${pageContext.request.contextPath}/event/eventDetail.do?seq=${eventList.seq}">
												<strong>${eventList.start_date}</strong> ~ 
												<strong>${eventList.end_date}</strong>
											</a>
										</p>
									</div>							
								</li>
							</c:forEach>
					</ul>
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