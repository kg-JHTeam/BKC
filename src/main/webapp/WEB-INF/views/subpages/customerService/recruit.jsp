<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon"
    href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />
<!--css-->
<link rel="stylesheet" href="../resources/css/include/main-gnb.css">
<link rel="stylesheet"
	href="../resources/css/subpages/customerService/recruit.css?v=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet"
	href="../resources/css/subpages/customerService/notice.css?v=<%=System.currentTimeMillis()%>" />



<!--jQuery-->
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>


<!--js-->
<script src="../resources/js/include/main-gnb.js"></script>
<script src="../resources/js/customerService/cs.js"></script>

<!--font-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">

<!--logo-->
<link rel="shortcut icon" type="image/x-icon"
	href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/logo/mainlogo.png">
<title>인재채용</title>

</head>
<body>
	<!-- main-header -->
	<jsp:include page="../../include/header/main_desktop_header.jsp" />
	<jsp:include page="../../include/header/main_mobile_header.jsp" />
	<div class="contentsWrap">
		<div class="locationWrap">
			<div class="chain_web_container">
				<div class="page_navi">
					<a href="#/home"> <span>HOME&nbsp;</span>>
					</a> <span>&nbsp; 고객센터&nbsp;>&nbsp; </span> <span>인재채용</span>
				</div>
			</div>
		</div>
		<div class="contentsBox01 bg_w">
			<div class="chain_web_container">
				<div class="subtitWrap">
					<h3 class="page_tit">고객센터</h3>
					<div class="tab01 m_shadow">
						<ul>
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/notice.do'">
									<span>공지사항</span>
								</button>
							</li>
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/appguide.do'">
									<span>BKC앱이용안내</span>
								</button>
							</li>
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/faq.do'">
									<span>FAQ</span>
								</button>
							</li>
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/inquiry.do'">
									<span>문의</span>
								</button>
							</li>
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/chain.do'">
									<span>가맹점모집</span>
								</button>
							</li>
							<li class="on">
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/recruit.do'">
									<span>인재채용</span>
								</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class=" bg_w recruit_intro">
				<div class="web_container">
					<div class="msgbox">
						<h5 class="tit">
							<span>BKC에서 </span><span>인재를 찾습니다.</span>
						</h5>
						<p>
							<span>BKC의 차별화된 맛과 서비스의 팬이신 분,</span><span>BKC을 더 크게 발전시킬
								수 있으신 분,</span><span>BKC과 함께 동반성장 하실 분,</span><span>지금 버거킹에서
								여러분의 열정을 펼치세요!</span>
						</p>
					</div>
					<ol class="step">
						<li><strong>서류전형</strong></li>
						<li><strong>1. OJT<br>2. 매장실습/평가
						</strong></li>
						<li><strong>면접심사</strong></li>
						<li><strong>신체검사</strong></li>
						<li><strong>최종합격</strong></li>
					</ol>
			</div>

						<div class="popup-wrap">
							<div class="popup">
								<div class="pop_tit">
									<h1>입사 신청서</h1>
									<button type="button" class="btn_close"></button>
								</div>
								<div class="poptxt">
									<div class="row">
										<dl>
											<dt>성명</dt>
											<dd class="reg_name">
												<input type="text" placeholder="이름">
											</dd>
										</dl>
									</div>
									<div class="row">
										<dl>
											<dt>생년월일</dt>
											<dd class="reg_date">
												<select>
													<script>
                                                        var date = new Date();
                                                        var year = date.getFullYear();
                                                        for (i = year; i >= 1922; i--) {
                                                            document.write("<option value='" + i + "'>" + i + "</option>");
                                                        }
                                                    </script>
												</select> <span>년</span> <select>
													<script>
                                                        for (i = 1; i < 13; i++) {
                                                                document.write("<option value='" + i + "'>" + i + "</option>");
                                                            }
                                                    </script>
												</select> <span>월</span> <select>
													<script>
                                                        for (i = 1; i < 32; i++) {
                                                            document.write("<option value='" + i + "'>" + i + "</option>");
                                                        }
                                                    </script>
												</select> <span>일</span>
											</dd>
										</dl>
									</div>

									<div class="row">
										<dl>
											<dt>희망개설지역</dt>
											<dd class="reg_region">
												<div class="region_list">
													<select name="sido" id="sido"></select> <select
														name="gugun" id="gugun"></select>

												</div>
											</dd>
										</dl>
									</div>

									<div class="row">
										<dl>
											<dt>이메일</dt>
											<dd class="reg_email">
												<input type="text" placeholder="email"> <span>@</span>
											</dd>
										</dl>
									</div>

									<div class="row">
										<dl>
											<dt>전화번호</dt>
											<dd>
												<input type="text">
											</dd>
										</dl>
									</div>

									<div class="row">
										<dl class="popup-opinion">
											<dt>추가 의견</dt>
											<dd>
												<textarea rows="5" cols="50" placeholder="내용 입력"
													maxlength="500" style="width: 100%;"></textarea>
												<div class="page_count">
													<span>0</span> / <span>500</span>
												</div>
											</dd>
										</dl>
									</div>

								</div>
								<div class="popup-agree">
									<div class="agree-wrap">
										<div class="divide">
											<label> <span>약관 동의</span>
											</label>
										</div>
										<div class="agree-cont">
											<textarea class="cont" readonly="">
                                            비회원 개인정보보호정책은 비회원으로 (주)bkc에서 운영하는 주식회사 bkc 홈페이지 서비스(이하 bkc)를 이용하는 고객님의 개인정보 보호를 위하여, 개인정보 수집의 목적과 그 정보의 정책적, 시스템적 보안에 관한 규정입니다.
                                             * 개인정보의 수집 및 이용목적 1. bkc는 고객님께서 비회원으로 창업문의 서비스를 이용하는데 있어, 원할하게 문의사항의 접수 및 답변이 이루어질 수 있도록 하기 위한 최소한의 정보를 수집합니다. 
                                             2. 비회원으로 제공하신 모든 정보는 상기 목적에 필요한 용도 이외로는 사용되지 않습니다. 
                                             * 수집하는 개인정보의 항목 
                                            - SMS상담: 전화번호 - 온라인상담: 이름, 휴대전화, 이메일 : 고지의 전달 또는 원활한 의사소통 경로의 확보. 
                                             * 보유기간 및 이용기간 귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다.
                                              단, 상법 등 관련법령의 규정에 의하여 다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 일정기간 보유합니다. 
                                            - 창업문의로 연락 가능한 업무 처리에 관한 기록 : 1달
                                            </textarea>
											<p class="agree-check">
												<label> <input type="checkbox" name="check_yn"
													id="check_yn"> 동의합니다.
												</label>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
				<a class="btn_regform"> <span>신청서작성</span></a>
			</div>
		</div>
	</div>
	<!-- main-footer -->
	<jsp:include page="../../include/footer/main_desktop_footer.jsp" />
	<jsp:include page="../../include/footer/main_mobile_footer.jsp" />
	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>