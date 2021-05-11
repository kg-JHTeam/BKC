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
	href="${contextPath}/resources/css/delivery/nonmember.css">

<!-- js -->
<script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
<script src="${contextPath}/resources/js/delivery/delivery.js"></script>
<!-- kakao login -->
<title>로그인</title>
<script>
//업로드 성공하면 성공 
window.onload = function(){
	var check = "<c:out value='${check.success}'/>"
	
	if(check=="1"){
		alert("이미 회원입니다.");
	} else if(check=="3"){
		alert("비회원 등록에 실패하였습니다.");
	}
}

	var checkTimer = false; //default
	var checkCount = 3; //인증번호 재전송 횟수 
	var timer;
	var checkNumber; //인증번호 
	var valid = false;
	var check = false;
	$('.acc_tit .btn_acc').click(function() {
		$('acc_list').addClass('open');
	});

	//타이머 
	function startTimer() {
		checkTimer = true; //작동중
		var time = 120;
		var min = "";
		var sec = "";
		timer = setInterval(function() {
			min = parseInt(time / 60);
			sec = time % 60;
			if (sec == 0)
				sec = "00";

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
		document.getElementById("time").innerHTML = "";
	}

	var contextpath = "<c:out value='${contextPath}'/>";
	$(function() {
		//인증번호 발송할 경우 
		$(".send_btn").click(
			function() {
				var email = document.getElementById("email").value;
				var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				var name = document.getElementById("username").value;
				
				//개인정보 인증을 누른 경우 
				if(!$("#customerCheck").is(":checked")){
					alert("개인정보취급방침에 동의하여주십시오.");
					return;
				}
				if(name==""){
					alert("이름을 제대로 입력해주세요");
					return;
				}
				//이메일 형식에 맞는 경우. 
				if (regExp.test(email)) {
						var sendMessage = {
							"email" : email,
							"name" : name
						};

						//ajax로 서버로 문자를 보냄.
						$.ajax({
							url : contextpath + "/guestemail",
							data : sendMessage,
							type : "post",
							success : function(result) {
							if (result == "") {
								alert("인증번호 전송 실패");
							} else {
								//startTimer
								startTimer(); //타이머 스타트 시킴.

								//인증번호 나타나게함.
								$(".checkemail").css("display","none");
								$("#check01").css("display", "");

								//인증번호 발송 버튼 지우고
								$("#check03").css("display","none");

								//인증번호 확인 버튼 나타나게함
								$("#check04").css("display","block");

								checkNumber = result; //전역변수로 넣어둔다.
								check = true;
								
								}
							}
							});
						}
				else {
					alert("이메일을 확인해주세요.");
				}
			});

		//인증번호 확인 버튼 
		$(".send02_btn").click(function() {
			//이메일로 보낸 인증번호와 쓴 인증번호가 같은지 확인
			var userCheck = document.getElementById("userCheck").value;
			var email = document.getElementById("email").value;
			//인증번호가 맞다면, 
			if (userCheck == checkNumber) {

				alert("인증번호가 일치합니다.");
				//stoptimer
				stopTimer();

				//css변경
				$("#check01").css("display", "none");
				$("#check02").css("display", "");
				$("#check04").css("display","none");
				$("#name").attr('disabled', true);
				
				var userCheck2 = document.getElementById("userCheck02");
				userCheck2.value = email;
				
				$("#userCheck").attr('disabled', true);
			}

			//인증번호가 틀리다면,
			else {
				alert("인증번호가 틀립니다.");
				return;
			}
		});
	}) 
	
	function submitValid() {
		//1. 인증완료가 되지않은 경우 return 해준다.
		if(check == false){
			alert("인증을 먼저 완료해주세요.");
			return;
		} 
		var p1 =document.getElementById("p1").value;
		var p2 =document.getElementById("p2").value;
		
		//2. 인증유무 검증 
		if(p1==p2){
			document.getElementById("guestForm").submit();
		} else{
			alert("비밀번호가 불일치합니다. ");
			return;
		}
	}
	//function00 끝
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
		<form class="contentsBox01" method="post" action="${contextPath}/guestUserJoin" id="guestForm">
			<div class="web_container02 container01">
				<h2 class="tit02 WEB">비회원 주문</h2>
				<h2 class="tit01 tit_ico man">
					<img src=""> <span>개인정보 수집</span>
				</h2>
				<div class="accWrap01">
					<div class="container02 auth_list acc_list">
						<div class="acc_tit">
							<label class="tit_label"> 
							<input type="checkbox" class="check02" id="customerCheck"> <span>버거킹 이용약관</span>
							</label>
							<button type="button" class="btn_acc">
								<span>상세보기</span> <img class="btn_acc_rotate"src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/icon/direction/btn_rotate.png">
							</button>
						</div>
						<div class="acc_cont">
							<p>
								<strong>수집하는 개인정보 항목</strong> <br> - 전화번호, 성명 주소
							</p>
							<br>
						</div>
					</div>
				</div>
				<h2 class="tit01 tit_ico setting">
					<img src=""> <span>비회원 설정</span>
				</h2>
				<form></form>
				<div class="container02">
					<div class="dlist01">
						<dl>
							<dt class="WEB">이름</dt>
							<dd>
								<div class="inpbox st02">
									<input type="text" placeholder="받는 분의 이름을 입력해 주세요." class="st02" name="username" id="username"/>
									<button type="button" class="btn_de101" style="display: none;">
										<span>입력 텍스트 삭제</span>
									</button>
								</div>
							</dd>
						</dl>
						<dl class="checkemail">
							<dt class="WEB">이메일 주소</dt>
							<dd>
								<div class="inpbox st02">
								<input type="text" placeholder="이메일 주소를 입력해 주세요" id="email" name="email" class="st02" 
										autocapitalize="off" autocomplete="off"
										placeholder="이메일 주소를 입력해 주세요" />
								</div>
							</dd>
						</dl>

						<dl style="display: none;" id="check01">
							<dt class="WEB">인증번호</dt>
							<dd>
								<div class="inpbox st02">
									<input type="text" placeholder="인증번호를 입력하세요." class="st02"
										id="userCheck"> <em id="time"></em>
								</div>
							</dd>
						</dl>

						<dl style="display: none;" id="check02">
							<dt class="WEB">이메일 주소</dt>
							<dd>
								<div class="inpbox st02">
									<input type="text" readonly="readonly" class="st02" id="userCheck02"> <em
										class="tag st02"> <span>인증완료</span>
									</em>
								</div>
							</dd>
						</dl>
					</div>
				</div>
				<div class="c_btn">
					<div id="check03">
						<button type="button" class="btn01 l m_btn01 send_btn">
							<span>인증번호 발송</span>
						</button>
					</div>
					<div style="display: none;" id="check04">
						<button type="button" class="btn01 l m_btn01 send02_btn">
							<span>인증번호 확인</span>
						</button>
					</div>
				</div>
				
				<h2 class="tit01 tit_ico key">
					<img src=""> <span>주문서 비밀번호</span>
				</h2>
				<div class="container02">
					<div class="WEB titbox">
						<p>주문 내역 확인을 윈한 비밀번호를 입력하세요</p>
					</div>
					<div class="dlist01">
						<dl>
							<dt class="WEB vtop">비밀번호</dt>
							<dd>
								<div class="inpbox">
									<input placeholder="비밀번호를 입력하세요." maxlength="6" id="p1" name="password"
										type="password" class="st02" />
									<button type="button" tabindex="-1" class="btn_view01">
										<span>입력 텍스트 보기</span>
									</button>
								</div>
								<div class="inpbox">
									<input placeholder="비밀번호를 다시 입력하세요." maxlength="6" id="p2"
										type="password" class="st02">
									<button type="button" tabindex="-1" class="btn_view01">
										<span>입력 텍스트 보기</span>
									</button>
								</div>
							</dd>
						</dl>
					</div>
				</div>
				<p class="MOB txt04">주문 내역 확인을 위한 비밀번호를 입력하세요.</p>
				<div class="c_btn">
					<div>
						<button type="button" class="btn01 1 m_btn01" onclick="submitValid()">
							<span>비회원 주문</span>
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- delivery-desktop-footer -->
	<jsp:include page="../include/footer/delivery_desktop_footer.jsp" />
	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>