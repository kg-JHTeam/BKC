<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<!-- font google web font-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
	
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />
<!-- css -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/include/delivery-gnb.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/delivery/join.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/delivery/joindetail.css">
	
<!-- 추가 -->
<link href="${contextPath}/resources/css/delivery/joindetail.css" media="all" rel="stylesheet" type="text/css" >

<!-- js -->
<script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
<script src="${contextPath}/resources/js/delivery/delivery.js"></script>
<script src="${contextPath}/resources/js/delivery/joindetail/joindetail.js"></script>

	<script>
	function checkPhoneError(){
		var message= '<sf:errors path="phone" class="error" />' + '\n';
	    if (msg.length > 0 ) {
	    	 alert(message);
	    }
	}
   
    //제출시에 form값 검증 작업 필요
    function submitValid(){
    	var loginForm = document.loginForm;
        var userId = loginForm.userId.value;
        var password = loginForm.password.value;
		
        smsForm
    }
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
				<li><a href="${contextPath}/">HOME</a></li>&nbsp;&nbsp;
				<li><a href="${contextPath}/login">로그인</a></li>&nbsp;&nbsp;
				<li><a href="${contextPath}/join">회원가입</a></li>
			</ul>
		</nav>
	</div>

<div id="join_wrapper" >
<h1 class="h_logo"><img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/bkclogo.png"/></h1>
<div id="content" class="join_cont_wrap">
        <!-- e: 회원가입 탭 -->
        <div class="caution_stxt">*필수입력정보입니다.</div>
    <div>
    <!-- s: 개인회원 -->
	<div id="member_personal" class="member_cate">
	<!-- form 시작  -->
    <sf:form method="post" action="${pageContext.request.contextPath}/joinuser" modelAttribute="user" id="smsForm">
            <!-- Default 값 들어감 -->
            <sf:hidden path="enabled" value="1"/>
            <sf:hidden path="regist_type" value="1"/>
            <sf:hidden path="usergrade" value="3"/>
            <!-- ID/PW -->
            <h3 class="tit_join_member personal"><span class="input_personal">아이디 / 비밀번호</span></h3>
            <div class="cont_division">
                <ul class="write_base">
                    <li class="item must">
                        <sf:input class="control" type="text" path="userid" maxlength="40" style="ime-mode:disabled" autocapitalize="off" autocomplete="off" placeholder="아이디 (이메일 형식)"/>
                        <sf:errors path="userid" class="error"/><br>
                    </li>
                    <li class="item must">
                        <sf:password class="control" path="password" autocapitalize="off" maxlength="16" autocomplete="off" 
                        placeholder="비밀번호 (8자 ~20자리 영문 대소문자와 숫자,특수기호가 적어도 1개 이상 조합 )"/>
                        <sf:errors path="password" class="error"/><br>
                    </li>
                </ul>
            </div>
            
            <!-- 간단인증 -->
            <h3 class="tit_join_member"><span class="terms_agree">간단인증</span></h3>
            <div class="cont_division">
                <!-- 인증방법 -->
                <div class="tab_identify" id="pos_cert_num">
                    <span class="blind">인증하기</span>
                    <div class="identify_select person">
                        <button class="btn_identify btn_phone" id="identify_phone" type="button"><span>휴대폰 인증</span></button>
                        <button class="btn_identify btn_email" id="identify_email" type="button"><span>이메일 인증</span></button>
                    </div>
                    <p class="alert_column good_txt" id="confirm_remain_time_area" style="display:none;">휴대폰 인증 성공. 아래 필수정보를 입력해주세요.</p>
                </div>

                <!-- 휴대폰 인증 -->
                <div class="identify_phone">
                    <ul class="write_base select_input">
                        <li class="certi_list item must" id="phone_certi_list">
                            <div class="input_collect item">
                                <label for="sms_cellnum" class="tit_inp fullsize_input except">연락처</label> 
                                <sf:input class="control" type="text" path="phone" placeholder="'-' 없이 입력" onblur="checkPhoneError();"/>
                        		<sf:errors path="phone" class="error" /><br>
                            </div>
                            <button type="button" onclick="sendSMS('sendSms')" class="btn_back btn_cert_pop" data-popupid="layer_pop_byphone"><span>인증</span></button>
                        </li>
                        <li class="item must">
                            <label class="tit_inp">이름</label>
                            <sf:input class="control" type="text" path="name" autocapitalize="off" placeholder=""/>
                        	<sf:errors path="name" class="error"/><br>
                        </li>
                    </ul>
                </div>
              </div>
              <!-- //휴대폰 인증 -->
              
        <!-- 약관동의 -->
        <h3 class="tit_join_member" id="person_terms_title"><span class="terms_agree">약관 동의</span></h3>
   		<div class="cont_division">
        <ul class="agree_article">
            <li class="end">
                <div class="check_mail">
                    <strong class="anterior_txt">전체동의</strong>
                </div>
                <label for="agreeAllPersonal" class="check_custom check_all check_off">
                	<input type="checkbox" id="agreeAllPersonal" class="check-all"> <!-- 누르면, 모드 checked 되게  -->
                </label>
            </li>
        </ul>
        <ul class="agree_article depth2">
            <li class="must">
                <div class="agree_desc">
                    <strong class="anterior_txt">개인회원 약관에 동의</strong>
                </div>
                <a href="" class="view_indetail" target="_blank">상세보기</a>
                <label for="agree_rule1" class="check_custom check_on"><input type="checkbox" id="agree_rule1" class="ab"></label>
            </li>

            <li class="must">
                <div class="agree_desc">
                    <strong class="anterior_txt">개인정보 수집 및 이용에 동의</strong>
                </div>
                <a id="popupClausePrivacyPerson" href="" class="view_indetail popup_clause_open" target="_blank">상세보기</a>
                <label for="agree_rule2" class="check_custom check_on"><input type="checkbox" id="agree_rule2" class="ab"></label>
            </li>
            <li>
                <div class="agree_desc">
                    <strong class="anterior_txt">마케팅 정보 수신 동의 - 이메일</strong>
                    <strong class="desc_txt">(선택)</strong>
                </div>
                <label for="termsAgree" id="termsAgreeLb" class="check_custom check_on">
                	<sf:checkbox path="email_agree" id="termsAgree" class="ab"/>
                </label>
            </li>
            <li>
                <div class="agree_desc">
                    <strong class="anterior_txt">마케팅 정보 수신 동의 - SMS/MMS</strong>
                    <strong class="desc_txt">(선택)</strong>
                </div>
                <label for="sms_receive_fl" class="check_custom check_on">
                	<sf:checkbox path="sms_agree" id="sms_receive_fl" name="sms_receive_fl" value="y" class="ab"/>
                </label>
            </li>
            <li class="">
                <div class="agree_desc">
                    <strong class="anterior_txt">개인정보 제 3자 제공 및 위탁사항 이용약관</strong>
                </div>
                <a id="popupClauseThirdPartyPerson" href="" class="view_indetail popup_clause_open" target="_blank">상세보기</a>
            </li>
        </ul>
    </div>
    	<div class="btn_join">
    		<input type="submit" value="회원가입 완료"  id="btn_submit" class="inp_join" onclick="submitValid()"/>
        </div>
        
        
     <!-- 팝업 될 레이어 --> 
     <div class="modal"> 
         <div class="modal-content"> 
             <span class="close-button">&times;</span> 
             <h1 class="title">인증번호 확인</h1> 
               <label for="email"><p class="txt" id="sms_layer_sub_title" name="sms_layer_sub_title">010-6313-5712로 인증번호가 발송되었습니다.<br>카카오톡으로 전달받은 인증번호를 입력해주세요.<br>(실패 시 SMS 전송)</p>
        </label> 
        <table class="tbl_fieldset">
            <caption></caption>
            <colgroup>
                <col style="width:130px;">
                <col>
            </colgroup>
            <tbody>
            <tr>
                <th>인증번호</th>
                <td>
                    <input type="text" id="sms_code" name="sms_code" value="" class="sri_input" style="width:96px;">
                    <button type="button" class="btn_basic_type04 confirm-action person">확인</button>
                    <span class="expiredin" id="confirm_remain_sms_time_area" name="confirm_remain_sms_time_area"></span>
                </td>
            </tr>
            </tbody>
        </table><!-- 
               <textarea name="message" placeholder="Test Message" required="required"></textarea> -->
               <div class="bottom_btn_wrap">
              
               <input type="button" id="cancel" value="인증번호 재발송"> 
               <input type="button" id="cancel" value="인증번호 완료"> 
            </div> 
         </div> 
     </div>
     <script>
     
     //<button class="btn_identify btn_phone" id="identify_phone" type="button"><span>휴대폰 인증</span></button>
    function sendSMS(pageName){

        console.log("문자를 전송합니다.");
        $("#smsForm").attr("action", pageName + ".do"); //위에 있는 폼태그를 컨트롤러로 전송한다.
        $("#smsForm").submit();
        
         var modal = document.querySelector(".modal"); 
         var trigger = document.querySelector(".btn_cert_pop"); 
         var closeButton = document.querySelector(".close-button"); 
         var cancelButton = document.querySelector("#cancel");

        console.log(modal);
        function toggleModal() { 
             modal.classList.toggle("show-modal"); 
         }

        function windowOnClick(event) { 
             if (event.target === modal) { 
                 toggleModal(); 
             } 
         }
         trigger.addEventListener("click", toggleModal); 
         closeButton.addEventListener("click", toggleModal); 
         cancel.addEventListener("click", toggleModal); 
         window.addEventListener("click", windowOnClick); 
    }
     </script>
    </sf:form>	<!-- form 태그 끝 -->
    </div>
</div>
</div>
</div>

	<!-- join-desktop-footer -->
	<jsp:include page="../include/footer/delivery_desktop_footer.jsp" />
	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</html>