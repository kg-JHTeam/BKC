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
<script
	src="${contextPath}/resources/js/delivery/joindetail/joindetail.js"></script>

<title>계정</title>
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
				<div class="tab01 m_shadow">
					<ul class="items">
						<li class="on" id="item1">
							<button type="button">
								<span>아이디 찾기</span>
							</button>
						</li>
						<li id="item2">
							<button type="button">
								<span>비밀번호 찾기</span>
							</button>
						</li>
					</ul>
				</div>
				
				<form class="tab_cont" method="post" id="findUserForm" action="<c:url value='/finduser'/>">
					<!-- 아이디 찾기   -->
					<h3 class="hide">아이디 찾기</h3>
					<div class="container02">
						<div class="WEB titbox">
							<p id="info1">가입시 회원정보로 등록한 이름과 휴대폰 번호를 입력해 주세요.</p>
							<p id="info2" style="display: none;">회원님의 정보(이메일)로 비밀번호 재설정을 위한 경로를 보내 드립니다.</p>
						</div>
						<div class="dlist01">
							<dl>
								<dt class="WEB vtop">이름</dt>
								<dd>
									<div class="inpbox">
										 <input type="text" placeholder="이름" class="st02" id="st01" name="name"><label>
											<button type="button" class="btn_del01" style="display: none;">
												<span style="display: none;">입력 텍스트 삭제</span>
											</button>
										</label>
										<!-- error -->
										<p id="name1" class="txt">이름을 입력해 주세요.</p>
									</div>
								</dd>
							</dl>
							<dl>
								<dt id="info5" class="WEB vtop">휴대폰 번호</dt>
								<dt id="info6" class="WEB vtop" style="display: none;">이메일</dt>
								<dd>
									<div class="inpbox">
										<input type="tel" placeholder="휴대폰 번호" class="st02" id="st02" value="" name="checkStr"/>
										<label> 
											<button type="button" class="btn_del02"
												style="display: none;">
												<span>입력 텍스트 삭제</span>
											</button>
										</label>
										<p id="phone1" class="txt">휴대폰 번호를 입력해 주세요.</p>
										<p id="phone2" class="txt" style="display: none;">휴대폰 번호를 정확히 입력해 주세요.</p>
										<p id="phone3" class="txt" style="display: none;">이메일 주소를 입력해 주세요.</p>
										<p id="phone4" class="txt" style="display: none;">정확한 이메일 주소를 입력해 주세요.</p>
									</div>
								</dd>
							</dl>
						</div>
						<ul class="WEB txtlist01">
						<li id="info4" style="display: none;">가입시 입력한 이메일로 비밀번호 재설정을 위한 경로가 발송 됩니다.</li>
							<li id="info3">가입시 입력한 이름과 휴대폰번호로 아이디 정보를 찾을 수 있습니다.</li>
							<li>네이버, 카카오톡, 구글 아이디로 가입하신 회원님께서는 해당 서비스에서 아이디/비밀번호
								찾기를 진행해 주세요.</li>
						</ul>
					</div>
					<div class="c_btn">
						<div>
							<button type="submit" class="btn01 userfinds">
								<span id="submit_id">아이디 찾기</span><span id="submit_pw" style="display: none;">비밀번호 찾기 </span>
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