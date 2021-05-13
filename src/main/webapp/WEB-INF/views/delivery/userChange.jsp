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
window.onload = function(){
	var chk = "<c:out value='${check.success}'/>"
	if(chk=="true"){
		alert("회원정보 수정 성공");
	} else if(chk=="false"){
		alert("회원정보 수정 실패");
	} 
}

		var contextpath = "<c:out value='${contextPath}'/>";
		var checkTimer = false; 
		var timer;
		
		//타이머 
		function startTimer() {
			checkTimer = true; //작동중
			var time = 120;
			var min = "";
			var sec = "";
			
			timer = setInterval(function() {
				min = parseInt(time / 60);
				sec = time % 60;
				if(sec == 0 ) sec = "00";
				
				document.getElementById("time").innerHTML = min + ":" + sec;
				time--;

				//타임 종료시
				if (time < 0) {
					clearInterval(timer);
					document.getElementById("time").inner("시간초과");
				}
			}, 1000);
		}
		
		//타이머 끄기
		function stopTimer() {
			clearInterval(timer);
			checkTimer = false;
			document.getElementById("time").innerHTML = "2:00";
		}
		
		//인증관련 
		function changePhoneNumber(){
			var phoneNumberCheckDiv = document.getElementById("phoneNumberCheckDiv");
			phoneNumberCheckDiv.style.display="";
		}
		
		var phoneNumber;
		var realNumber; //인증번호 
		function sendSMS(){
				//변경할 핸드폰 번호 넘겨주기
				phoneNumber = document.getElementById("changedPhoneNumber").value;
				var checkNumber = document.getElementById("checkNumberDiv");
				checkNumber.style.display="";
				var regExp = /(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
				
				if(regExp.test(phoneNumber)){
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
									//성공
									startTimer(); //타이머 스타트 시킴.
									realNumber = result; //전역변수로 넣어둔다.
									phoneNumberCheck.style.display="";
									document.getElementById("changedPhoneNumber").style.disabled = "true";
								} 
							}, 
							error: function(){
								alert("전송실패");
							}
						});
					} 
				else{
					alert("핸드폰 번호를 확인해주세요");
				}
		}
		
	function checkNumberFunction(){
		var inputNumber = document.getElementById("inputNumber").value;
		if(realNumber == inputNumber){
			alert("인증완료");
			
			document.getElementById("userPhone").innerHTML = document.getElementById("changedPhoneNumber").value
			var phoneNumberCheckDiv = document.getElementById("phoneNumberCheckDiv");
			var checkNumberDiv = document.getElementById("checkNumberDiv");
			var changeBtn = document.getElementById("changeBtn");
			
			phoneNumberCheckDiv.style.display="none";
			checkNumberDiv.style.display="none";
			changeBtn.innerHTML ="인증완료";
			
			stopTimer();
			checkTimer = false;
			
		} else{
			alert("인증번호가 틀렸습니다.");
		}
	}
	
	function sumitChange(){
		//인증완료 유효성검사
		let check = changeBtn.innerHTML;
		if(check != "인증완료"){
			alert("휴대폰 변경 인증을 완료해주세요.");
			return;
		}
		
		//새비밀번호 일치 유효성검사
		var newPass = $('#newPass').val();
		var newPass2 = $('#newPass2').val();
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
		} 
		
		//현재 비밀번호 일치 유효성 검사
		var password = $('#password').val();
		var sendMessage = { 
			"password" : password,
		};
		
		$.ajax({ 
			url: contextpath+"/checkpassword.do", 
			data: sendMessage, 
			type: "post", 
			success: function(result) { 
				if(result == "true"){
					 var changeInfo = document.changeInfo;
				        changeInfo.submit();
				} else if(result == "false"){
					alert("비밀번호가 틀렸습니다.");
					return;
				}
			}, 
			error: function(){
				alert("실패");
			}
		});
	}
	
</script>
<style>
.auth_numWrap{
font-size:1rem;
}
.timer{
	font-size:1.2rem;
	color:red;
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
							
							<form method="post" name="changeInfo" action="${contextPath}/changepassword.do">
							<div>
								<dl class="dlist01 st03">
									<dt class="vtop">핸드폰</dt>
									<dd>
										<div class="vtop m_rbtnWrap">
											<span id="userPhone">${user.phone }</span>
											<button type="button" class="btn04 h02 m_rcen_btn" onclick="changePhoneNumber()">
												<span id="changeBtn">변경</span>
											</button>
										</div>
										<div class="auth_numWrap">
											<div style="display: none;" id="phoneNumberCheckDiv">
												<input type="text" placeholder="변경할 번호를 입력" id="changedPhoneNumber" name="phoneNumber">
												<button type="button" class="btn04 h02" onclick="sendSMS()">
													<span>인증번호 발송</span>
												</button>
											</div>
											<div style="display:none;" id="checkNumberDiv">
												<input type="text" placeholder="인증번호 입력" id="inputNumber">
												<button type="button" class="btn04 h02" onclick="checkNumberFunction()">
													<span>인증</span>
												</button>
												<span class="timer" id="time">2:00</span>
											</div>
										</div>
									</dd>
								</dl>
							</div>
						</div>
						<h3 class="tit01 tit_ico key">
							<span>비밀번호 변경</span>
						</h3>
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
									</form>
								</div>
							</div>
					
						<div class="bot_btn_area">
							<div class="c_btn m_item2">
								<a href="${contextPath}/delivery/mybkc.do" class="btn01 m">
									<span>취소</span>
								</a> 
								<a href="javascript:sumitChange()" class="btn01 m red"> 
								<span>변경</span>
								</a>
							</div>
							<div class="withdrawal">
								<a class="btn_withdrawal"> <span> 
									<a href="${contextPath}/deleteuser">회원탈퇴</a></span>
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