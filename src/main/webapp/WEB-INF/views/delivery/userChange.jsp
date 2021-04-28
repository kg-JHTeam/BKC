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
<!-- 추가 -->

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
					<li><a href="${contextPath}/login">MY킹</a></li>&nbsp;>&nbsp;
					<li><a href="${contextPath}/join">회원 정보 변경</a></li>
				</ul>
			</nav>
			<div class="contentsBox01">
				<div class="web_container02">
					<div class="subtitWrap m_bg_basic">
						<h2 class="page_tit">회원 정보 변경</h2>
					</div>
					<div class="container01">
						<h3 class="tit01 tit_ico man">
							<span>기본정보</span>
						</h3>
						<div class="container02">
							<div class="dlist01 st03">
								<dl>
									<dt>이메일</dt>
									<dd>
										<span>df@naver.com</span>
									</dd>
								</dl>
								<dl>
									<dt>이름</dt>
									<dd>
										<span>기진현</span>
									</dd>
								</dl>
							</div>
							<div>
								<dl class="dlist01 st03">
									<dt class="vtop">핸드폰</dt>
									<dd>
										<div class="vtop m_rbtnWrap">
											<span>01012345678</span>
											<button type="button" class="btn04 h02 m_rcen_btn">
												<span>변경</span>
											</button>
											<button type="button" class="btn04 h02 m_rcen_btn" style="display:none;">
												<span>취소</span>
											</button>
										</div>
										<div class="auth_numWrap" style="display:none;">
											<div>
												<input type="text" placeholder="휴대폰 번호를 입력해 주세요">
												<button type="button" disabled="disabled" class="btn04 h02">
													<span>인증번호 발송</span>
												</button>
											</div>
											<div style="display: none;">
												<input type="text" placeholder="인증번호 입력">
												<button type="button" disabled="disabled" class="btn04 h02" style="display: none;">
													<span>인증</span>
												</button>
												<button type="button" class="btn04 h02">
													<span>재설정</span>
												</button>
												<em class="time"></em>
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
											<label>
												<span class="hide">현재 비밀번호</span>
												<input type="password" placeholder="현재 비밀번호" class="st02">
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
											<label>
												<span class="hide">새 비밀번호</span>
												<input type="password" placeholder="새 비밀번호" class="st02">
												<button type="button" class="btn_view01">
													<span>입력 텍스트 보기</span>
												</button>
											</label>
											<p class="txt">
												<span>새 비밀번호에 비밀번호를 입력해 주세요.</span>
											</p>
										</div>
										<div class="inpbox">
											<label>
												<span class="hide">새 비밀번호 확인</span>
												<input type="password" placeholder="새 비밀번호 확인" class="st02">
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
								<li>
									<span>비밀번호는 숫자와영문, 특수문자를 조합하여 10~20자리로 입력하세요.</span>
								</li>
								<li>
									<span>비밀번호는 대소문자 입력을 구분합니다.</span>
								</li>
								<li>
									<span>띄어쓰기가 들어가거나 로그인 아이디와 같은 비밀번호는 입력하실 수 없습니다.</span>
								</li>
								<li>
									<span>숫자를 연속으로 나열하거나, 키보드 배열, 생년월일과 전화번호 등 추측하기 쉬운 정보로 이루어진 비밀번호 조합은 사용하지 않는 것이 안전합니다.</span>
								</li>
							</ul>
						</div>
						<div class="c_btn m_item2">
							<button type="button" class="btn01 m">
								<span>취소</span>
							</button>
							<button type="button" class="btn01 m red">
								<span>변경</span>
							</button>
						</div>
						<h3 class="tit01 tit_ico marketing">
							<span>마케팅 정보 수신동의</span>
						</h3>
						<div class="container02 auth_list">
							<div>
								<label>
									<input type="checkbox" class="check02">
									<span>
										이메일을 통한 이벤트/ 주문 정보의 수신에 동의합니다.
									</span>
								</label>
							</div>
							<div>
								<label>
									<input type="checkbox" class="check02">
									<span>
										SMS를 통한 이벤트/ 주문 정보의 수신에 동의합니다.
									</span>
								</label>
							</div>
						</div>
						<div class="bot_btn_area">
							<div class="c_btn m_item2">
								<a href="#" class="btn01 m">
									<span>취소</span>
								</a>
								<a href="#" class="btn01 m red">
									<span>변경</span>
								</a>
							</div>
							<div class="withdrawal">
								<a class="btn_withdrawal">
									<span>
										회원탈퇴
									</span>
								</a>
							</div>
						</div>
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