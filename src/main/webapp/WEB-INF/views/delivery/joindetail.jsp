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
<link href="${contextPath}/resources/css/delivery/joindetail.css"
	media="all" rel="stylesheet" type="text/css">

<!-- js -->
<script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
<script src="${contextPath}/resources/js/delivery/delivery.js"></script>
<script>
/**
 * 전체선택 관련
 */

$( document ).ready( function() {
        $( '.check-all' ).click( function() {
          $( '.ab' ).prop( 'checked', this.checked );
        } );
} );


	function submitValid() {
		var a1 =document.getElementById("agree_rule1");
		var a2 =document.getElementById("agree_rule2");
		
		//2. 인증유무 검증 
		if(valid == false){
			alert("인증을 완료해주세요.");
			return;
		}
		//1. 약관 필수 값들 검증 
		if ((a1.checked== "1" && a2.checked == "1")) {
			document.getElementById("smsForm").submit();
		} else{
			alert("이용약관에 모두 동의해주세요.");
			return;
		}
	}
	
	//업로드 성공하면 성공 
	window.onload = function(){
		var check = "<c:out value='${check.success}'/>"
		if(check=="0"){
			alert("회원가입에 성공하였습니다.");
		} else if(check=="1"){
			alert("중복된 아이디 입니다.");
		} else if(check=="2"){
			alert("아이디를 형식에 맞춰 입력하세요.");
		} else if(check =="3"){
			alert("회원가입에 실패하였습니다.");
		}
	}
	
		var contextpath = "<c:out value='${contextPath}'/>";
		var checkTimer = false; //default
		var checkCount = 3; //인증번호 재전송 횟수 
		var timer;
		var checkNumber; //인증번호 
		var valid = false;
		
		//타이머 
		function startTimer() {
			checkTimer = true; //작동중
			var time = 120;
			var min = "";
			var sec = "";
			
			//인증번호 재전송 횟수 감소
			checkCount--;
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
		
		//인증번호 재전송 버튼
		function smsReSummit(){
			//인증번호 재전송 횟수 초과
			if(checkCount < 0){
				stopTimer();
				checkTimer = false;
				alert("재전송 횟수가 초과되었습니다.");
				return;
			}
			
			stopTimer();
			startTimer(); //타이머 스타트 시킴.
			checkTimer = false;
			
			//재전송 로직 
			alert("재전송 되었습니다.");
		}
		
		//인증확인 누를시 생기는 로직
		function smsCheck(){
			var sms_code = document.getElementById("sms_code").value;
			if(sms_code == checkNumber){
				alert("인증성공");
				valid = true;
				var suc = document.getElementById("suc");
				
				$(".modal").css("display", "none");
				$(".btn_back").addClass("on").attr("disabled", true);
				
			} else{
				alert("인증실패")
			}
		}
		
		//인증 버튼을 누를시에 모달창이 열림. 
		$(function() {
				$(".btn_back").click(function() {
					//핸드폰 번호 넘겨주기
					var phoneNumber = document.getElementById("phoneNumber").value;
					var regExp = /(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
					if(regExp.test(phoneNumber)){
						$("#checkPhone").html(phoneNumber);
						$(".modal").css("display", "block");
						
						//false일경우
						if(!checkTimer){ 
							var sendMessage = { 
									"phoneNumber" : phoneNumber,
							};
							//ajax로 서버로 문자를 보냄.
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
									} 
								} 
							});
						} 
					} else{
						alert("핸드폰 번호를 확인해주세요");
					}
				});
			$(".modal .modal-content .close-button").click(function() {
				$(".modal").css("display", "none");
				stopTimer(); //타이머 정지 시킴 
			});

			$(".suc").click(function() {
				
			});
		});

</script>
<title>회원가입</title>
</head>
<body>
	<div id="wrap">
		<!-- join desktop header -->
		<jsp:include page="../include/header/delivery_desktop_header.jsp" />
		<!-- desktop join page -->
		<!--navigation bar-->
		<nav class="locationWrap">
			<ul>
				<li><a href="${contextPath}/">HOME</a></li>&nbsp;&nbsp;>
				<li><a href="${contextPath}/login">로그인</a></li>&nbsp;&nbsp;>
				<li><a href="${contextPath}/join">회원가입</a></li>
			</ul>
		</nav>
	</div>
	<div id="join_wrapper">
		<h1 class="h_logo">
			<img
				src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/bkclogo.png" />
		</h1>
		<div id="content" class="join_cont_wrap">
			<!-- e: 회원가입 탭 -->
			<div class="caution_stxt">*필수입력정보입니다.</div>
			<div>
				<!-- s: 개인회원 -->
				<div id="member_personal" class="member_cate">
					<!-- form 시작  -->
					<sf:form method="post"
						action="${pageContext.request.contextPath}/joinuser"
						modelAttribute="user" id="smsForm">
						<!-- Default 값 들어감 -->
						<sf:hidden path="enabled" value="1" />
						<sf:hidden path="regist_type" value="1" />
						<sf:hidden path="usergrade" value="3" />
						<!-- ID/PW -->
						<h3 class="tit_join_member personal">
							<span class="input_personal">아이디 / 비밀번호</span>
						</h3>
						<div class="cont_division">
							<ul class="write_base">
								<li class="item must"><sf:input class="control" type="text"
										path="userid" maxlength="40" style="ime-mode:disabled"
										autocapitalize="off" autocomplete="off"
										placeholder="아이디 (이메일 형식)" /> <sf:errors path="userid"
										class="error" /><br></li>
								<li class="item must"><sf:password class="control"
										path="password" autocapitalize="off" maxlength="16"
										autocomplete="off"
										placeholder="비밀번호 (8자 ~20자리 영문 대소문자와 숫자,특수기호가 적어도 1개 이상)" /> <sf:errors
										path="password" class="error" /><br></li>
							</ul>
						</div>

						<!-- 간단인증 -->
						<h3 class="tit_join_member">
							<span class="terms_agree">휴대폰 인증</span>
						</h3>
						<div class="cont_division">

							<!-- 휴대폰 인증 -->
							<div class="identify_phone">
								<ul class="write_base select_input">
									<li class="certi_list item must" id="phone_certi_list">
										<div class="input_collect item">
											<label for="sms_cellnum"
												class="tit_inp fullsize_input except">연락처</label>
											<sf:input class="control" type="text" path="phone"
												placeholder="'-' 없이 입력" onblur="checkPhoneError();"
												id="phoneNumber" />
											<sf:errors path="phone" class="error" />
											<br>
										</div> <!-- 인증 버튼  -->
										<button type="button" class="btn_back btn_cert_pop">
											<span>인증</span>
										</button>
									</li>
									<li class="item must"><label class="tit_inp">이름</label> <sf:input
											class="control" type="text" path="name" autocapitalize="off"
											placeholder="" /> <sf:errors path="name" class="error" /><br>
									</li>
								</ul>
							</div>
						</div>
						<!-- //휴대폰 인증 -->

						<!-- 약관동의 -->
						<h3 class="tit_join_member" id="person_terms_title">
							<span class="terms_agree">약관 동의</span>
						</h3>
						<div class="cont_division">
							<ul class="agree_article">
								<li class="end">
									<div class="check_mail">
										<strong class="anterior_txt">전체동의</strong>
									</div> <label for="agreeAllPersonal"
									class="check_custom check_all check_off"> <input
										type="checkbox" id="agreeAllPersonal" class="check-all">
										<!-- 누르면, 모드 checked 되게  -->
								</label>
								</li>
							</ul>
							<ul class="agree_article depth2">
								<li class="must">
									<div class="agree_desc">
										<strong class="anterior_txt">개인회원 약관에 동의</strong>
									</div> <a href="${contextPath }/terms.do" class="view_indetail"
									target="_blank">상세보기</a> <label for="agree_rule1"
									class="check_custom check_on"> <sf:checkbox
											path="agree_rule2" id="agree_rule1" class="ab" />
								</label>
								</li>

								<li class="must">
									<div class="agree_desc">
										<strong class="anterior_txt">개인정보 수집 및 이용에 동의</strong>
									</div> <a id="popupClausePrivacyPerson"
									href="${contextPath }/termsPrivacy.do"
									class="view_indetail popup_clause_open" target="_blank">상세보기</a>
									<label for="agree_rule2" class="check_custom check_on">

										<sf:checkbox path="agree_rule2" id="agree_rule2" class="ab" />

								</label>
								</li>
								<li>
									<div class="agree_desc">
										<strong class="anterior_txt">마케팅 정보 수신 동의 - 이메일</strong> <strong
											class="desc_txt">(선택)</strong>
									</div> <label for="termsAgree" id="termsAgreeLb"
									class="check_custom check_on"> <sf:checkbox
											path="email_agree" id="termsAgree" class="ab" />
								</label>
								</li>
								<li>
									<div class="agree_desc">
										<strong class="anterior_txt">마케팅 정보 수신 동의 - SMS/MMS</strong> <strong
											class="desc_txt">(선택)</strong>
									</div> <label for="sms_receive_fl" class="check_custom check_on">
										<sf:checkbox path="sms_agree" id="sms_receive_fl"
											name="sms_receive_fl" value="y" class="ab" />
								</label>
								</li>
							</ul>
						</div>
						<div class="btn_join">
							<input type="button" value="회원가입 완료" onclick="submitValid()"
								id="btn_submit" class="inp_join" />
						</div>

						<!-- 팝업 될 레이어 -->
						<div class="modal">
							<div class="modal-content">
								<span class="close-button">&times;</span>
								<h1 class="title">인증번호 확인</h1>
								<br>
								<p class="txt" id="sms_layer_sub_title"
									name="sms_layer_sub_title">
									<span id="checkPhone"> </span> 로 인증번호가 발송되었습니다.<br> 휴대폰으로
									전달받은 인증번호를 입력해주세요.
								</p>
								<table class="tbl_fieldset">
									<caption></caption>
									<colgroup>
										<col style="width: 130px;">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th>인증번호</th>
											<td><input type="text" id="sms_code" name="sms_code"
												value="" class="sri_input" style="width: 96px;">
												<button type="button"
													class="btn_basic_type04 confirm-action person"
													onclick="smsCheck()">확인</button> <span class="expiredin"
												id="time" name="confirm_remain_sms_time_area">2:00</span></td>
										</tr>
									</tbody>
								</table>
								<div class="bottom_btn_wrap">
									<input type="button" id="cancel" value="인증번호 재발송"
										onclick="smsReSummit();"> <input type="button"
										id="cancel" class="suc" onclick="smsCheck();" value="인증번호 완료">
								</div>
							</div>
						</div>
					</sf:form>
					<!-- form 태그 끝 -->
				</div>
			</div>
		</div>
	</div>
	<!-- join-desktop-footer -->
	<jsp:include page="../include/footer/delivery_desktop_footer.jsp" />
	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</html>