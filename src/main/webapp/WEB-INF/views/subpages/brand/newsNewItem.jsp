<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">

<!-- jquery -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../resources/jquery/jquery-3.6.0.min.js"></script>

<!--css-->
<link rel="stylesheet" href="../resources/css/include/main-gnb.css">
<link rel="stylesheet"
	href="../resources/css/subpages/brand/newsNewItemview.css?v=<%=System.currentTimeMillis()%>" />

<!--font google web font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">

<link rel="shortcut icon" type="image/x-icon"
	href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/icon/apple-icon.png" />

<!-- js -->
<script src="../resources/js/include/main-gnb.js"></script>

<title>BrandStory</title>
</head>
<body>
	<!-- main-header -->
	<jsp:include page="../../include/header/main_desktop_header.jsp" />
	<jsp:include page="../../include/header/main_mobile_header.jsp" />

	<div class="contentsWrap eventWrap">
		<div class="locationWrap WEB">
			<div class="news_web_container">
				<div class="page_navi">
					<a href="#/home" class="arrow"> <span>HOME</span>&nbsp;>&nbsp;
					</a><a class="arrow"> <span>브랜드스토리 </span>&nbsp;>&nbsp;
					</a> <a class="arrow"><span> BKC NEWS </span></a>
				</div>
			</div>
		</div>
		<div class="contentsBox01 bg_w">
			<div class="news_web_container">
				<div class="subtitWrap">
					<h3 class="page_tit">브랜드 스토리</h3>
					<div class="tab01 bdBot">
						<ul>
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/brand/brandStory.do'">
									<span>BKC 스토리</span>
								</button>
							</li>
							<li>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/brand/whybkc.do'">
									<span>WHY BKC</span>
								</button>
							</li>
							<li class="on">
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/brand/newsNewItem.do'">
									<span>BKC NEWS</span>
								</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="news_web_container">
				<div class="tab_cont">
					<ul class="tab_storyBtn m_shadow">
						<li class="on">
							<button type="button" id="realchicken"
								onclick="location.href='${pageContext.request.contextPath }/brand/newsNewItem.do'">
								<span>신제품</span>
							</button>
						</li>
						<li>
							<button type="button" id="nature"
								onclick="location.href='${pageContext.request.contextPath }/brand/Advertising.do'">
								<span>광고(TV/Digital)</span>
							</button>
						</li>
					</ul>
					<div class="tab_cont">
						<div class="new_product">
							<h4 class="MOB m_subtit">신제품 소개</h4>
							<ul class="prdmenu_list">
							 <c:forEach var="newmenuList" items="${newmenuList}">
								<li>
									<div class="prd_img WEB">
										<span> <img src="${newmenuList.path}">
										</span>
									</div>
									<div class="cont">
										<p class="tit" style="text-align:center;">
											<strong>${newmenuList.product_name}</strong>
										</p>
										<p class="txt_intro">${newmenuList.description}</p>
									</div>
								</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- js -->
	<script src="../resources/js/subpages/brand/menuitem.js"></script>

	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>

	<!-- main-footer -->
	<jsp:include page="../../include/footer/main_desktop_footer.jsp" />
	<jsp:include page="../../include/footer/main_mobile_footer.jsp" />
</body>
</html>