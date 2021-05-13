<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
<script src="../resources/jquery/jquery-3.6.0.min.js"></script>

<!-- js -->
<script src="${contextPath}/resources/js/include/main-gnb.js"></script>

<!--css-->
<link rel="stylesheet" href="${contextPath}/resources/css/include/main-gnb.css">
<link rel="stylesheet" href="${contextPath}/resources/css/subpages/law/term.css?v=<%=System.currentTimeMillis() %>" />

<title>이용약관</title>
</head>
<body>
	<!-- main-header -->
	<jsp:include page="../../include/header/main_desktop_header.jsp" />
	<jsp:include page="../../include/header/main_mobile_header.jsp" />
	<div class="contentsWrap">
		<div class="locationWrap WEB">
			<div class="term_web_container">
				<div class="page_navi">
					<a href="${contextPath}/"> <span>HOME &nbsp;</span>> 
					</a><span> &nbsp; 이용약관 및 정책 </span>
				</div>
			</div>
		</div>
		<div class="contentsBox01">
			<div class="term_web_container">
				<div class="subtitWrap">
					<h3 class="page_tit">이용약관 및 정책</h3>
					<div class="tab01 m_shadow">
						<ul>
							<li class='on'>
								<button class="btnlaw" type="button" onclick="location.href='${contextPath}/terms.do'">
									<span>이용약관</span>
								</button>
							</li>
							<li>
								<button class="btnlaw" type="button" onclick="location.href='${contextPath}/termsPrivacy.do'">
									<span>개인정보취급방침</span>
								</button>
							</li>
							<li>
								<button class="btnlaw" type="button" onclick="location.href='${contextPath}/termsEmail.do'">
									<span>이메일 약관</span>
								</button>
							</li>
						</ul>
					</div>
				</div>
				<div class="tab_cont">
					<h4 class="hide">이용약관</h4>
					<div class="container02 policyWrap">
						<div class="titbox">
							
						</div>
						<div class="auth_cont">
							<pre>${ terms.content01}</pre>							
							<pre>${ terms.content02}</pre>							
							<pre>${ terms.content03}</pre>
							<pre>${ terms.content04}</pre>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- js -->
	<script src="${contextPath}/resources/js/subpages/law/term.js"></script>

	<!-- main-footer -->
	<jsp:include page="../../include/footer/main_desktop_footer.jsp" />
	<jsp:include page="../../include/footer/main_mobile_footer.jsp" />
</body>
</html>