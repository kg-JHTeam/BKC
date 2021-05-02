<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
					<a href="#/home"> <span>HOME</span>
					</a> <span> 고객센터 </span> <span>인재채용</span>
				</div>
			</div>
		</div>
		<div class="contentsBox01 bg_w">
			<div class="chain_web_container">
				<div class="subtitWrap">
					<h3 class="page_tit">고객센터</h3>
					<div class="tab01 m_shadow">
						<ul>
							<li class="on">
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
					</div>
				</div>
			</div>
			<div class=" bg_w recruit_intro">
				<div class="web_container">
					<div class="msgbox">
						<h5 class="tit">
							<span>버거킹에서 </span><span>인재를 찾습니다.</span>
						</h5>
						<p>
							<span>버거킹의 차별화된 맛과 서비스의 팬이신 분,</span><span>버거킹을 더 크게 발전시킬
								수 있으신 분,</span><span>버거킹과 함께 동반성장 하실 분,</span><span>지금 버거킹에서
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
			</div>


<div class="notice_web_container">
				<div class="tab_cont">
					<h4 class="hide">공지사항</h4>
					<div class="board_list">
						<table class="tlist01">
							<colgroup>
								<col style="width: 10%;">
								<col>
								<col style="width: 20%;">
								<col style="width: 20%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">No.</th>
									<th scope="col">제목</th>
									<th scope="col">날짜</th>
									<th scope="col">조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr style="display: none;">
									<td colspan="4">
										<div class="nodata">
											<span>검색 결과가 없습니다.</span>
										</div>
									</td>
								</tr>
								<c:if test="${totalSize == 0}">
									<tr>
										<td colspan="3">등록된 게시물이 없습니다</td>
									</tr>
								</c:if>
								<c:if test="${totalSize > 0}">
									<c:forEach var="notice" items="${noticeList}"
										varStatus="status">
										<tr>
											<td><span>${notice.rn}</span></td>
											<td>
												<div class="title">
													<a type="hidden" href="getNotice.do?seq=${notice.seq}">${notice.title}</a>
												</div>
											</td>
											<td><span>${notice.post_date}</span></td>
											<td><span>${notice.hits}</span></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						<div class="board_paging">
							<div class="VuePagination">
								<ul>
									${pageing}
								</ul>
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