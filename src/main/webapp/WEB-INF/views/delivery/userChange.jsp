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
	href="${contextPath}/resources/css/delivery/delivery.css">
	
<link rel="stylesheet"
	href="${contextPath}/resources/css/delivery/userChange.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/include/delivery-gnb2.css">
<!-- js -->
<script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
<script src="${contextPath}/resources/js/delivery/delivery.js"></script>

<title>계정</title>


<script>
		var checkNumber; //인증번호 
		//인증관련 
		function changePhoneNumber(){
			var phoneNumberCheckDiv = document.getElementById("phoneNumberCheckDiv");
			phoneNumberCheckDiv.style.display="";
		}
		
		function sendSMS(){
				//변경할 핸드폰 번호 넘겨주기
				alert("-휴대폰인증-")
				var phoneNumber = document.getElementById("changedPhoneNumber").value;
				var checkNumber = document.getElementById("checkNumberDiv");
				checkNumber.style.display="";
				var regExp = /(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
				
				if(regExp.test(phoneNumber)){
					alert("start ajax");
					var sendMessage = { 
							"phoneNumber" : phoneNumber,
					};
						$.ajax({ 
							url: contextpath+"/sendsms.do", 
							data: sendMessage, 
							type: "post", 
							success: function(result) { 
								if (result == "false") { 
									alert("인증번호 전송 실패");
								} else { 
									startTimer(); //타이머 스타트 시킴.
									checkNumber = result; //전역변수로 넣어둔다.
									phoneNumberCheck.style.display="";
								} 
							} 
						});
					} 
				else{
					alert("핸드폰 번호를 확인해주세요");
				}
		}
		
	function checkNumaber(){
		
	}
	
	//check
	function changepw() {
		var change = document.change;
		var userid = $('#userid').val();
		var password = $('#password').val();
		var newPass = $('#newPass').val();
		var newPass2 = $('#newPass2').val();
		if ($('#password').val() === "") {
			alert('비밀번호를 입력해주세요');
			return false;
		}
		if ($('#newPass').val() === "") {
			alert('새 비밀번호를 입력해주세요');
			return false;
		}
		if ($('#newPass2').val() === "") {
			alert('새 비밀번호를 입력해주세요');
			return false;
		}
		if ($('#newPass2').val() != $('#newPass').val()) {
			alert('새 비밀번호를 정확히 입력해주세요');
			return false;
		} else {
			change.submit();
		}
	}
</script>
<style>
.auth_numWrap{
font-size:1rem;
}
</style>
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
			<br><br><br>
			<div class="contentsBox01">
				<div class="web_container02">
					<div class="container01">
						<h3 class="tit01 tit_ico man">
							<span>기본정보</span>
						</h3>
						<div class="container02">
							<div class="dlist01 st03">
								<dl>
									<dt>이메일</dt>
									<dd>
										<span>${user.userid }</span>
									</dd>
								</dl>
								<dl>
									<dt>이름</dt>
									<dd>
										<span>${user.name }</span>
									</dd>
								</dl>
							</div>
							<div>
								<dl class="dlist01 st03">
									<dt class="vtop">핸드폰</dt>
									<dd>
										<div class="vtop m_rbtnWrap">
											<span>${user.phone }</span>
											<button type="button" class="btn04 h02 m_rcen_btn" onclick="changePhoneNumber()">
												<span>변경</span>
											</button>
											<button type="button" class="btn04 h02 m_rcen_btn"
												style="display: none;">
												<span>취소</span>
											</button>
										</div>
										<div class="auth_numWrap">
											<div style="display: none;" id="phoneNumberCheckDiv">
												<input type="text" placeholder="변경할 번호를 입력" id="changedPhoneNumber">
												<button type="button" class="btn04 h02" onclick="sendSMS()">
													<span>인증번호 발송</span>
												</button>
											</div>
											<div style="display:none;" id="checkNumberDiv">
												<input type="text" placeholder="인증번호 입력">
												<button type="button" class="btn04 h02" onclick="checkNumber()">
													<span>인증</span>
												</button>
											</div>
										</div>
									</dd>
								</dl>
							</div>
						</div>
						<h3 class="tit01 tit_ico key">
							<span>비밀번호 변경</span>
						</h3>
						<form name="change" action="${contextPath}/changepassword"
							method="GET">
							<div class="container02">
								<div class="dlist01 m_dlist02">
									<dl>
										<dt class="vtop">현재 비밀번호</dt>
										<dd>
											<div class="inpbox">
												<label> <span class="hide">현재 비밀번호</span> <input
													type="password" placeholder="현재 비밀번호" class="st02"
													name="password" id="password"> <input type="hidden"
													id="userid" name="userid" value="${user.userid }" />
													<button type="button" class="btn_view01">
														<span>입력 텍스트 보기</span>
													</button>
												</label>
												<p class="txt">
													<span>비밀번호를 입력해 주세요.</span>
												</p>
											</div>
										</dd>
									</dl>
									<dl>
										<dt class="vtop">새 비밀번호</dt>
										<dd>
											<div class="inpbox">
												<label> <span class="hide">새 비밀번호</span> <input
													type="password" placeholder="새 비밀번호" name="newPass"
													id="newPass" class="st02">
													<button type="button" class="btn_view01">
														<span>입력 텍스트 보기</span>
													</button>
												</label>
												<p class="txt">
													<span>새 비밀번호에 비밀번호를 입력해 주세요.</span>
												</p>
											</div>
											<div class="inpbox">
												<label> <span class="hide">새 비밀번호 확인</span> <input
													type="password" placeholder="새 비밀번호 확인" name="newPass2"
													id="newPass2" class="st02">
													<button type="button" class="btn_view01">
														<span>입력 텍스트 보기</span>
													</button>
												</label>
												<p class="txt">
													<span>새 비밀번호 확인을 입력해 주세요.</span>
												</p>
											</div>
										</dd>
									</dl>
								</div>
								<ul class="txtlist01">
									<li><span>비밀번호는 숫자와영문, 특수문자를 조합하여 10~20자리로 입력하세요.</span></li>
									<li><span>비밀번호는 대소문자 입력을 구분합니다.</span></li>
									<li><span>띄어쓰기가 들어가거나 로그인 아이디와 같은 비밀번호는 입력하실 수
											없습니다.</span></li>
									<li><span>숫자를 연속으로 나열하거나, 키보드 배열, 생년월일과 전화번호 등 추측하기
											쉬운 정보로 이루어진 비밀번호 조합은 사용하지 않는 것이 안전합니다.</span></li>
								</ul>
							</div>
						</form>
					
						<div class="bot_btn_area">
							<div class="c_btn m_item2">
								<a href="${contextPath}/delivery/mybkc.do" class="btn01 m">
									<span>취소</span>
								</a> 
								<a href="#" class="btn01 m red"> 
								<span>변경</span>
								</a>
							</div>
							<div class="withdrawal">
								<a class="btn_withdrawal"> <span> 
								<a href="${contextPath}/deleteuser">회원탈퇴</a>
								</span>
								</a>
							</div>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- join-desktop-footer -->
	<jsp:include page="../include/footer/delivery_desktop_footer.jsp" />
	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>