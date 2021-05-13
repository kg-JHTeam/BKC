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