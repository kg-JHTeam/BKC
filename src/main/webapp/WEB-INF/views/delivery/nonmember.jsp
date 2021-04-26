<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <!-- font google web font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <!-- favicon -->
        <link rel="shortcut icon" type="image/x-icon"
        href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />
    <!-- css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/include/delivery-gnb.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/delivery/delivery.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/delivery/nonmember.css">
    
    <!-- js -->
    <script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/resources/js/delivery/delivery.js"></script>
    

    <!-- kakao login -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script src="${contextPath}/resources/js/delivery/kakaoLogin.js"></script>
    <title>로그인</title>
    
</head>
<body>
   <div id="wrap">
   <!-- delivery desktop header -->
   <jsp:include page="../include/header/delivery_desktop_header.jsp"/>
   
   <!-- desktop delivery page -->
    <!--navigation bar-->
        <nav class="locationWrap">
            <ul>
                <li><a href="${contextPath}/">HOME</a></li>&nbsp;&nbsp; 
                <li><a href="${contextPath}/login">로그인</a></li>
            </ul>
        </nav>
        <div class="contentsBox01">
        	<div class="web_container02 container01">
        		<h2 class="tit02 WEB">비회원 주문</h2>
        		<h2 class="tit01 tit_ico man">
        			<img src="">
        			<span>개인정보 수집</span>
        		</h2>
        		<div class="accWrap01">
        			<div class="container02 auth_list acc_list">
        				<div class="acc_tit">
        					<label class="tit_label">
        						<input type="checkbox" class="check02">
        						<span>버거킹 이용약관</span>
        					</label>
        					<button type="button" class="btn_acc">
        						<span>상세보기</span>
        						<img class="btn_acc_rotate" src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/icon/direction/btn_rotate.png">
        					</button>
        				</div>
        				<div class="acc_cont">
        					<p>
        						<strong>수집하는 개인정보 항목</strong>
        						<br>
        						- 전화번호, 성명 주소
        					</p>
        					<br>
        				</div>
        			</div>
        		</div>
        		<h2 class="tit01 tit_ico setting">
        			<img src="">
        			<span>비회원 설정</span>
        		</h2>
        		<div class="container02">
        			<div class="dlist01">
        				<dl>
        					<dt class="WEB">이름</dt>
        					<dd>
        						<div class="inpbox st02">
        							<input type="text" placeholder="받는 분의 이름을 입력해 주세요." class="st02">
        							<button type="button" class="btn_de101" style="display: none;">
        								<span>입력 텍스트 삭제</span>
        							</button>
        						</div>
        					</dd>
        				</dl>
        				<dl>
        					<dt class="WEB">이메일 주소</dt>
        					<dd>
        						<div class="inpbox st02">
        							<input type="text" placeholder="이메일 주소를 입력해 주세요" class="st02" name="email" method="post">
        						</div>
        					</dd>
        				</dl>
        				<dl style="diplay: none;">
        					<dt class="WEB">인증번호</dt>
        					<dd>
        						<div class="inpbox st02">
        							<input type="text" placeholder="인증번호를 입력하세요." class="st02">
        							<em class="time"></em>
        						</div>
        					</dd>
        				</dl>
        				<dl style="display: none;">
        					<dt class="WEB">인증번호</dt>
        					<dd>
        						<div class="inpbox st02">
        							<input type="text" readonly="readonly" class="st02">
        							<em class="tag st02">
        								<span>인증완료</span>
        							</em>
        						</div>
        					</dd>
        				</dl>
        			</div>
        		</div>
        		<div class="c_btn">
        			<div>
        				<button type="button" class="btn01 l m_btn01 send_btn">
        					<span>인증번호 발송</span>
        				</button>
        			</div>
        			<div style="display: none;">
        				<button type="button" class="btn01 l m_btn01">
        					<span>인증번호 확인</span>
        				</button>
        			</div>
        			<div style="display: none;">
        				<button type="button" class="btn01 l m_btn01">
        					<span>재설정</span>
        				</button>
        			</div>
        		</div>
        		<h2 class="tit01 tit_ico key">
        			<img src="">
        			<span>주문서 비밀번호</span>
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
        							<input placeholder="4~6자리 이내의 숫자로만 입력하세요." maxlength="6" type="password" class="st02">
        							<button type="button" tabindex="-1" class="btn_view01">
        								<span>입력 텍스트 보기</span>
        							</button>
        						</div>
        						<div class="inpbox">
        							<input placeholder="비밀번호를 다시 입력하세요." maxlength="6" type="password" class="st02">
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
        				<button type="button" class="btn01 1 m_btn01">
        					<span>비회원 주문</span>
        				</button>
        			</div>
        		</div>
        	</div>
        </div>
	</div>
    <script src="${contextPath}/resources/js/delivery/nonmember.js"></script>
    
   <!-- delivery-desktop-footer -->
   <jsp:include page="../include/footer/delivery_desktop_footer.jsp"/>
   <a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>