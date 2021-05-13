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
	href="../resources/css/subpages/customerService/chain.css?v=<%=System.currentTimeMillis()%>" />



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
					</a> <span>&nbsp; 고객센터&nbsp;>&nbsp; </span> <span>가맹점모집</span>
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
									onclick="location.href='${pageContext.request.contextPath }/customerService/app.do'">
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
							<li class="on">
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/chain.do'">
									<span>가맹점모집</span>
								</button>
							</li>
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/recruit.do'">
									<span>인재채용</span>
								</button>
							</li>
						</ul>
					</div>
				</div>
			</div>

				<div class="tab_content">
					<div class="branch">
						<div class="branch-wrap">
							<div class="msgbox">
								<p class="keyword"></p>
								<h5 class="branch_tit">
									<span>bkc가 여러분과 </span> <span>함께 새로운 성공을 준비합니다.</span>
								</h5>
								<p>세계 최대 글로벌 외식 브랜드 중 하나인 bkc는 1954년 미국 마이애미에서 시작하여 괄목할 만한
									성장과 함께 1,400만명 이상의 bkc 매니아들에게 큰 사랑을 받고 있습니다. 'TASTE IS KING'
									이라는 슬로건으로 그 어떤 햄버거보다 최고의 맛과 품질을 선보이고 있으며 고객을 위한 버거킹의 최고의 서비스는
									앞으로도 계속 될 것입니다.</p>
							</div>
						</div>
						<hr/>
						<div class="branch-wrapbg">
							<div class="msgbox">
								<p class="branch_tit">
									<strong> <span>bkc와 함께<br> 새로운 성공의 파트너가<br>
											되시길 기원합니다
									</span>
									</strong>
								</p>
								<div class="txt">
									<p>bkc 코리아에서 뜨거운 열정과 강한 의지로 새로운 성공 신화를 만드실 '사업파트너를 모십니다.
										bkc 코리아는 1984년 종로에 처음으로 개점한 이후 지금까지 뛰어난 맛과 품질 그리고 최선을 다하는 고객
										서비스를 바탕으로 성장해왔습니다.</p>
									<p>고객들의 많은 성원에 보답하고자 bkc 코리아에서는 2013년부터 '프랜차이즈'사업을 진행해 오고
										있습니다. 많은 관심을 부탁드리며 저희 bkc는 사업 파트너분들의 성공을 위해 최고의 프랜차이즈 서비스를 제공할
										것입니다. 자세한 내용은 현재 준비중에 있으며 빠른 시간 내에 정식 안내 드릴 예정입니다.</p>
									<p>프랜차이즈 매장 운영 외에도 다양한 투자에 대한 사전 상담을 할 수 있는 코너를 개설하였으니 많은
										관심과 성원, 그리고 참여를 부탁드립니다.</p>
								</div>
							</div>
							<div class="condition">
								<dl>
									<dt class="tit01 tit_ico location">
										<div class="condition-img1 cons"></div>
										<span>입지 조건</span>
									</dt>
									<dd>
										<ul class="txtlist01">
											<li><span>역세권에 위치하여 유동인원이 풍부하고 </span> <span>배후에
													사무실 및 아파트 밀집 지역</span></li>
											<li><span>서울을 중심으로 수도권이 우선이며 그 외 지역은 </span> <span>광역시
													중심 주거 인구 증가 지역</span></li>
											<li>도로변이며 접근성과 가시성이 좋은 지역</li>
											<li>교통 및 유동인구 통행량이 많은 지역</li>
										</ul>
									</dd>
								</dl>
								<dl>
									<dt class="tit01 tit_ico king">
										<div class="condition-img1 cons"></div>
										<span>임대 면적</span>
									</dt>
									<dd>
										<ul class="txtlist01">
											<li><span>실평수 60평 이상 (1, 2층일 경우 1층과 2층 각 30평 이상)<br>/Drive
													Thru, Food court 또는 특수 상권 내 점포의 경우 협의
											</span></li>
										</ul>
									</dd>
								</dl>
							</div>
							<div class="branch_form">
								<div class="form-wrap">
									<h4 class="form_tit">가맹점 신청방법</h4>
									<ul class="step">
										<li class="step1"><strong>신청서 작성</strong></li>
										<li class="step2"><strong>신청서 접수</strong></li>
										<li class="step3"><strong>전화 상담</strong></li>
										<li class="step4"><strong>대면 상담</strong></li>
									</ul>
									<a class="btn_regform"> <span>신청서작성</span></a>
								</div>
							</div>
						</div>
						<div class="popup-wrap">
							<div class="popup">
								<div class="pop_tit">
									<h1>가맹 신청서</h1>
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
								<div class="btn_regform_full">
									<button type="button" class="c_btn_big">
										<span>신청서 작성</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- main-footer -->
	<jsp:include page="../../include/footer/main_desktop_footer.jsp" />
	<jsp:include page="../../include/footer/main_mobile_footer.jsp" />
	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>