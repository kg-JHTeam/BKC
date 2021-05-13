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
	href="${contextPath}/resources/css/delivery/userChange.css">
	
	<link rel="stylesheet"
	href="${contextPath}/resources/css/delivery/userDelete.css">
<!-- 추가 -->

<!-- js -->
<script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
<script src="${contextPath}/resources/js/delivery/delivery.js"></script>
<script
	src="${contextPath}/resources/js/delivery/joindetail/joindetail.js"></script>
<script>
window.onload = function(){
	var chk = "<c:out value='${check.success}'/>"
	if(chk=="deleteFail"){
		alert("비밀번호가 일치하지 않습니다.");
	}
}

function deleteuser(){
	var deleteu = document.deleteu;
	var userid = $('#userid').val();
	var password = $('#password').val();
	
	if($('#password').val() === ""){
		alert('비밀번호를 입력해주세요');
		return false;
	}
	if(!$(':input:checkbox[id=check02]:checked').val()) {   
		   alert("약관에 동의 해주세요.");
		   return;
		}	
	else {
		deleteu.submit();
	}
}
</script>
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
					<li><a href="${contextPath}/login">MY킹</a></li>&nbsp;>&nbsp;
					<li><a href="${contextPath}/join">회원 정보 변경</a></li>
				</ul>
			</nav>
			<div class="contentsBox01">
				<div class="web_container02">
					<div class="subtitWrap m_bg_basic">
						<h2 class="page_tit">회원탈퇴</h2>
					</div>
					<div class="container01">
						<h3 class="tit01 tit_ico noti">
							<span>회원 탈퇴시 유의사항</span>
						</h3>
						<div class="container02">
							<div class="titbox">
								아래 유의사항을 반드시 확인하세요.
							</div>
							<ol class="txtlist01">
								<li>
									<span>탈퇴 시 고객님의 정보는 전자상거래 상에서의 소비자 보호 법류에 의거한 버거킹의 개인정보보호정책에 따라 관리됩니다.</span>
								</li>
								<li>
									<span>탈퇴 시 보유한 쿠폰 정보는 모두 초기화 되며, 재가입 시 복구가 불가합니다.</span>
								</li>
								<li>
									<span>탈퇴후 어떠한 방법으로도 기존의 개인정보를 복원할수 없습니다.(단 결제 내역은 5년까지 보관)</span>
								</li>
								<li>
									<span>삭제되는 기록은 다음과 같습니다.</span>
									<p>- 아이디(이메일), 휴대폰 번호, MY 배달지, MY 매장, 마이 세트, 쿠폰, 주문 이력</p>
								</li>
							</ol>
						</div>
						<h2 class="tit01 tit_ico man">
							<span>계정확인</span>
						</h2>
						<form name="deleteu" action="${contextPath}/deletesubmit" method="GET">
						<div class="container02">
							<div class="dlist01">
								<dl>
									<dt class="WEB">이메일</dt>
									<dd>
										<span>${user.userid }</span>
									</dd>
								</dl>
								<dl>
									<dt class="WEB">현재 비밀번호</dt>
									<dd>
										<div class="inpbox">
											<label>
												<span class="hide">현재 비밀번호</span>
												<input type="password" placeholder="현재 비밀번호" class="st02" name="password" id="password">
												<input type="hidden" id="userid" name="userid" value="${user.userid }" />
											</label>
										</div>
									</dd>
								</dl>
							</div>
						</div>
						<div class="bot_btn_area">
							<p class="txt_chk">
								<label>
									<input type="checkbox" name="check02" id="check02" class="check02">
									<span>위 내용을 확인하였으며, 버거킹 탈퇴를 합니다.</span>
								</label>
							</p>
							<div class="c_btn">
								<button type="button" class="btn01 m">
									<a href="${contextPath}/modifyuser"><span>취소</span></a>
								</button>
								<button type="button" class="btn01 m" onclick="deleteuser()">
									<span>회원 탈퇴</span>
								</button>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- join-desktop-footer -->
	<jsp:include page="../include/footer/delivery_desktop_footer.jsp" />
	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>