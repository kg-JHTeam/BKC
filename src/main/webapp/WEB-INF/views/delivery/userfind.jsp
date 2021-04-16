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
	href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/icon/apple-icon.png" />

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
<script
	src="${contextPath}/resources/js/delivery/joindetail/joindetail.js"></script>

<script>
	function checkPhoneError(){
		var message= '<sf:errors path="phone" class="error" />' + '\n';
	    if (msg.length > 0 ) {
	    	 alert(message);
	    }
	}
    </script>

<title>회원가입</title>
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
					<li><a href="${contextPath}/">HOME</a></li>&nbsp;&nbsp;
					<li><a href="${contextPath}/login">로그인</a></li>&nbsp;&nbsp;
					<li><a href="${contextPath}/join">회원가입</a></li>
				</ul>
			</nav>
		</div>

		<div class="contentsBox01">
			<div class="web_container02">
				<div class="subtitWrap">
					<h2 class="page_tit">아이디/비밀번호 찾기</h2>
				</div>
				<div class="tab01 m_shadow">
					<ul class="item2">
						<li class="on">
							<button type="button" class="item1">
								<span>아이디 찾기</span>
							</button>
						</li>
						<li>
							<button type="button" class="item1">
								<span>비밀번호 찾기</span>
							</button>
						</li>
					</ul>
				</div>
				<div class="tab_cont">
					<h3 class="hide">아이디 찾기</h3>
					<p class="MOB txt03">
						가입시 회원정보로 등록한 <br>이름과 휴대폰 번호를 입력해 주세요.
					</p>
					<div class="container02">
						<div class="WEB titbox">
							<p>가입시 회원정보로 등록한 이름과 휴대폰 번호를 입력해 주세요.</p>
						</div>
						<div class="dlist01">
							<dl>
								<dt class="WEB vtop">이름</dt>
								<dd>
									<div class="inpbox">
										<label> <input type="text" placeholder="이름"
											class="st02">
											<button type="button" class="btn_del01"
												style="display: none;">
												<span>입력 텍스트 삭제</span>
											</button>
										</label>
										<p class="txt">이름을 입력해 주세요.</p>
									</div>
								</dd>
							</dl>
							<dl>
								<dt class="WEB vtop">휴대폰 번호</dt>
								<dd>
									<div class="inpbox">
										<label> <input type="tel" placeholder="휴대폰 번호"
											class="st02">
											<button type="button" class="btn_del01 "
												style="display: none;">
												<span>입력 텍스트 삭제</span>
											</button>
										</label>
										<p class="txt">휴대폰 번호를 입력해 주세요.</p>
										<p class="txt" style="display: none;">휴대폰 번호를 모두 입력해 주세요.</p>
									</div>
								</dd>
							</dl>
						</div>
						<ul class="WEB txtlist01">
							<li>가입 시 입력한 이름과 휴대폰번호로 아이디 정보를 찾을 수 있습니다.</li>
							<li>네이버, 카카오톡, 삼성 앱카드, 애플아이디로 가입하신 회원님께서는 해당 서비스에서 아이디/비밀번호
								찾기를 진행해 주세요.</li>
						</ul>
					</div>
					<div class="c_btn">
						<div>
							<button type="button" class="btn01 l">
								<span>아이디 찾기</span>
							</button>
						</div>
					</div>
					<ul class="MOB txtlist01">
						<li>가입 시 입력한 이름과 휴대폰번호로 아이디 정보를 찾을 수 있습니다.</li>
						<li>네이버, 카카오톡, 삼성 앱카드, 애플아이디로 가입하신 회원님께서는 해당 서비스에서 아이디/비밀번호
							찾기를 진행해 주세요.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- join-desktop-footer -->
	<jsp:include page="../include/footer/delivery_desktop_footer.jsp" />
	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>