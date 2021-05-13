<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	href="../resources/css/subpages/customerService/inquiry.css?v=<%=System.currentTimeMillis() %>" />
<link rel="stylesheet" type="text/css"
	href="slick-1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="slick-1.8.1/slick/slick-theme.css" />

<!--jQuery-->
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="slick-1.8.1/slick/slick.min.js"></script>

<!--js-->
<script src="../resources/js/include/main-gnb.js"></script>
<script src="../resources/js/subpages/customerService/cs.js"></script>

<!--font-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">

<!--logo-->
<link rel="shortcut icon" type="image/x-icon"
	href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/logo/mainlogo.png">

<title>문의</title>
</head>
<body>
	<!-- main-header -->
	<jsp:include page="../../include/header/main_desktop_header.jsp" />
	<jsp:include page="../../include/header/main_mobile_header.jsp" />
	<div id="contents-wrap">
		<div class="locationWrap">
			<div class="inquiry1_web_container">
				<div class="page_navi">
					<a href="#/home"> <span>HOME &nbsp;</span>>
					</a> <span> &nbsp;고객센터 &nbsp;> &nbsp; </span> <span>공지사항</span>
				</div>
			</div>
		</div>
		<div class="contentsBox01">
			<div class="inquiry_web_container">
				<div class="subtitleWrap">
					<h3 class="page_tit">고객센터
					<div class="tab01">
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
									<span>bkc앱 이용안내</span>
								</button>
							</li>
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/faq.do'">
									<span>FAQ</span>
								</button>
							</li>
							<li class="on">
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
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/customerService/recruit.do'">
									<span>인재채용</span>
								</button>
							</li>
						</ul>
					</div></h3>
				</div>
				<div class="tab_content">
					<div class="cs">
						<div class="cs-wrap">

							<div class="infotxt">
								<p class="cs_tit">
									<span>고객의 의견에</span> <span>귀 기울입니다</span>
								</p>
								<p class="txt">
									<span>bkc는 언제나 고객의 의견에 귀 기울이며 더 나은 서비스 이용 경험을 제공하고자 노력하고
										있습니다.</span> <span>궁금하신 사항이 있거나 문제를 해결하는데 도움이 필요하신 경우 <a>
											<strong>앱 이용안내 페이지</strong>
									</a>와 <a> <strong>FAQ 페이지</strong>
									</a>에서도 도움을 받으실 수 있습니다.
									</span>
								</p>
							</div>
						</div>
						<div class="help-info">
							<dl>
								<dt>대표 소비자 상담</dt>
								<dd>
									<div>
										<strong>080. 022. 8163</strong>
									</div>
								</dd>
								<dd>
									<p>
										상담가능 시간 : 월~일 09:00 ~ 18:00<br>(점심시간 12:00 ~ 13:00)
									</p>
								</dd>
							</dl>
							<dl class="cs_email">
								<dt>온라인 문의</dt>
								<dd>
									<p>
										서비스를 이용하시면서 궁금하시거나 <br>불편한사항은 온라인으로 접수 해주세요
									</p>
									<div class="btn_area">
										<br> <br>
									</div>
								</dd>
							</dl>
							<ul>
								<li class="service"><span>서비스/제품 관련</span> <strong>080.
										022. 8163</strong></li>
								<li class="shop"><span></span>매장/SITE 개설상담<strong>02.
										6331. 8335</strong></li>
								<li class="proposal hide"><span>제휴/프로모션 개설상담</span> <strong>Burgerking_media@bkr.co.kr</strong>
								</li>
							</ul>
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