<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	href="${contextPath}/resources/css/delivery/delivery.css">


<!-- js -->
<script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
<script src="${contextPath}/resources/js/delivery/delivery.js"></script>

<!-- kakao login -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>로그인</title>
<script>
window.onload = function(){
	var chk = "<c:out value='${check.success}'/>"
	if(chk=="deleteUser"){
		alert("회원정보 삭제 성공");
	}
}

function loginWithKakao() {
	  $.ajax({
	     url: '/bkc/kakao',
	       type: 'get',
	       async: false,
	       dataType: 'text',
	       success: function (res) {
	         let _left = (window.screen.width/2) - (500/2);
	          let _top = (window.screen.height/2) - (500/2);
	         console.log(_left);
	         console.log(_top);
	         window.open(res, 'BKC', "width=500, height=500, location=no, menubar=no, top=" + _top + ", left=" + _left);
	       }
	   });
	}
function loginWithNaver() {
    $.ajax({
        url: '/bkc/naver',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
            let _left = (window.screen.width/2) - (500/2);
   			let _top = (window.screen.height/2) - (700/2);
			console.log(_left);
			console.log(_top);
			window.open(res, 'BKC', "width=500, height=700, location=no, menubar=no, top=" + _top + ", left=" + _left);
        }
    });
}

</script>
</head>
<body>
	<div id="wrap">
		<!-- delivery desktop header -->
		<jsp:include page="../include/header/delivery_desktop_header.jsp" />

		<!-- desktop delivery page -->
		<!--navigation bar-->
		<nav class="locationWrap">
			<ul>
				<li><a href="${contextPath}/" >HOME</a></li>
				<li><a href="${contextPath}/login"  class="gotomenu">로그인</a></li>
			</ul>
		</nav>
		<!--content login-->
		<div class="content">
			<div class="content_container">
				<h2 class="page_tit">
					<img
						src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/delivery_img/login/sun-flower.png"
						alt="해바라기"> <em>Better & Happier Choice</em> <span>어서오세요
						BKC 입니다.</span>
				</h2>
				<!-- default login -->
				<form class="login_container" method="post"
					action="<c:url value='login'/>" id="loginForm">
					<!-- 로그인 로직 수행 구현 필요 -->

					<div class="login">
						<h3 class="defaultlogin_tit">
							일반로그인<br>
							<!-- 로그인 실패시 에러메시지 여기다 나오게함.  -->
							<c:if test="${not empty errorMsg}">
								<span style="color: #ff0000"> ${errorMsg}</span>
							</c:if>
							<c:if test="${not empty logoutMsg}">
								<span style="color: #0000ff"> ${logoutMsg}</span>
							</c:if>
						</h3>
						<div class="cont">
							<div class="inpbox">
								<label> <span class="hide">ID</span> <input
									value="${cookie.user_check.value}" type="text" class="id_email"
									id="userid" name="userid" placeholder="아이디 (이메일)" required
									autofocus>
									<button type="button" tabindex="-1" class="btn_del01"
										style="display: none;">
										<span>입력 텍스트 삭제</span>
									</button>
								</label>
							</div>
							<div class="inpbox">
								<label class="pass"> <span class="hide">PASSWORD</span>
									<input type="password" id="password" name="password"
									placeholder="비밀번호" required>
									<button type="button" tabindex="-1" class="btn_view01">
										<span>입력텍스트보기</span>
									</button>
								</label>
							</div>
							<div class="login_option">
								<label> <c:if test="${not empty cookie.user_check }">
										<c:set value="checked" var="checked" />
									</c:if> <input type="checkbox" name="box" class="idsave_check"
									${checked}> <span>아이디 저장</span>
								</label> <label> <!-- 자동로그인 구현  --> <input name="remember-me"
									type="checkbox" id="remember" name="remember"
									class="autologin_check"> <span>자동 로그인</span>
								</label>
							</div>
							<div class="login_signup_btn">
								<a href="#" class="btn01 m orange"
									onclick="document.getElementById('loginForm').submit();"> <span>로그인</span>
								</a> <a href="${contextPath}/join" class="btn01 m"> <span>회원가입</span>
								</a>
							</div>
							<div class="login_menu">
								<a href="${contextPath}/userfind"> <span>아이디 찾기</span>
								</a> <a href="${contextPath}/userfind"> <span>비밀번호 찾기</span>
								</a>
							</div>
						</div>
					</div>
					<!-- simple login -->
					<div class="simple_login">
						<h3 class="simplelogin_tit tit_ico lock">간편로그인</h3>
						<ul class="list">
							<li class="naver"><a href="#" onclick="loginWithNaver()">
									<span>네이버 로그인</span>
							</a></li>
							<li class="kakao"><a href="#" onclick="loginWithKakao()">
							 <span>카카오톡로그인</span> <!-- 에이젝스로 해서 kakao로 보내기  -->
							</a></li>
						</ul>
					</div>
					<!-- csrf 토큰  -->
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
			</div>
		</div>
		<!--nonmember order-->
		<div class="nonmember_order-cover"></div>
		
	</div>

	<!-- delivery-desktop-footer -->
	<jsp:include page="../include/footer/delivery_desktop_footer.jsp" />
	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>