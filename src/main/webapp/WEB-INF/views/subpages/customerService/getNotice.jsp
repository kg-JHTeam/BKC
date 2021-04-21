<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!--css-->
<link rel="stylesheet" href="../resources/css/include/main-gnb.css">
<link rel="stylesheet"
	href="../resources/css/subpages/customerService/getNotice.css?v=<%=System.currentTimeMillis()%>" />



<!--jQuery-->
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>


<!--js-->
<script src="../resources/js/include/main-gnb.js"></script>

<!--font-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">

<!--logo-->
<link rel="shortcut icon" type="image/x-icon"
	href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/logo/mainlogo.png">
<title>공지사항</title>
</head>
<body>
	<!-- main-header -->
	<jsp:include page="../../include/header/main_desktop_header.jsp" />
	<jsp:include page="../../include/header/main_mobile_header.jsp" />
	
	<div id="contents-wrap">
		<div class="locationWrap">
			<div class="story_web_container">
				<div class="page_navi">
					<a href="#/home"> <span>HOME</span>
					</a> <span> 고객센터 </span> <span> 공지사항 </span>
				</div>
			</div>
		</div>
		<div class="contentsBox">
			<div class="web_container">
				<div class="subtitle-wrap">
					<h3 class="page_title">고객센터</h3>
					<div class="tabmenu">
						<ul>
							<li class="on">
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/noticeOne.do'">
									<span>공지사항</span>
								</button>
							</li>
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/appguide.do'">
									<span>bkc앱 이용안내</span>
								</button>
							</li>
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/faq.do'">
									<span>FAQ</span>
								</button>
							</li>
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/inquiry.do'">
									<span>문의</span>
								</button>
							</li>
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/chain.do'">
									<span>가맹점모집</span>
								</button>
							</li>
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/recruit.do'">
									<span>인재채용</span>
								</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="web_container">
				<div class="tab_cont">
					<div class="board_titWrap">
						<h1 class="tit">
							<span>${notice.title }</span>
						</h1>
						<div class="reg_info">
							<span class="date">${notice.post_date }</span>
							<dl class="hits">
								<dt>조회수</dt>
								<dt>${notice.hits }</dt>
							</dl>
						</div>
					</div>
					<div class="board_cont">
						<div class="img_cont" style="display: none;">
							<img class="WEB" src=""><img class="MOB" src="">
						</div>
						<div class="txt_cont prewrap">
						${notice.contents }
						</div>
					</div>
					<div class="board_view_btns">
						<div class="btn01 m"><a href="${pageContext.request.contextPath }/customerService/notice.do">목록보기</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>