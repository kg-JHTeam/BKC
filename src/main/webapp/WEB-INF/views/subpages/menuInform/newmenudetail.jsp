<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

<!--font-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">

<!--fabicon-->
<link rel="shortcut icon" type="image/x-icon"
	href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />

<!-- menuInformdetail.css-->
<link rel="stylesheet"
	href="${contextPath }/resources/css/include/main-gnb.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath }/resources/css/subpages/menuInform/menuInformdetail.css">

<!--slick & jQuery-->
<link rel="stylesheet" href="${contextPath }/resources/slick/slick.css">
<link rel="stylesheet"
	href="${contextPath }/resources/slick/slick-theme2.css">
<script src="${contextPath }/resources/jquery/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/slick/slick.js"></script>
<script src="${contextPath }/resources/slick/slide2.js"></script>

<!-- js -->
<script
	src="${contextPath }/resources/js/subpages/menuInform/menuInformdetail.js"></script>
<script src="${contextPath }/resources/js/include/main-gnb.js"></script>
<title>메뉴 정보 상세</title>
</head>
<body>
	<div class="menudetailWrap">
		<!-- header 들어갈 자리 -->
		<jsp:include page="../../include/header/main_desktop_header.jsp" />
		<div style="height: 100px"></div>
		<div class="menudetaillocationWrap">
			<div class="menudetailcontainer">
				<div class="menudetailpage_navi">
					<a href="${contextPath }/">
                          <span>  HOME </span>&nbsp;>&nbsp; </a>
                       <a href="#"><span>메뉴소개 </span>&nbsp;>&nbsp;</a>
					<a href="${contextPath}/menuInform/newMenu.do">
						<span>new메뉴</span>&nbsp;>&nbsp;</a>
						<a href="#" >
						<span> ${newmenu.product_name}</span>
					</a>
				</div>
			</div>
		</div>
		<div class="menudetailcontentsbox02">
			<div class="menudetailweb_container">

				<div class="intro_txt">
					<strong class="tit"> <span>${newmenu.product_name}</span>
					</strong>
					<p class="subtxt">
						<span>${newmenu.description}</span>
					</p>
				</div>

			</div>
		</div>
		<div class="menuInformdetail_subinfoWrap">
			<div class="web_container">
				<a href="${contextPath}/menuInform/newMenu.do" class="btn_back">
					<span>메뉴 목록으로 돌아가기</span>
				</a>
			</div>
		</div>
		<div class="menudetailcontents">
			<div class="web_container">
				<div class="txt_menudetailintro" style="display: none;">
					<span></span>
				</div>
				<ul class="prd_submenu">

					<li>
						<div class="prd_img">
							<span> <img src="${newmenu.path}">
							</span>
						</div>
						<div class="cont">
							<p class="tit">
								<strong>${newmenu.product_name}</strong>
							</p>
							<p class="tit_content">
								<span>${newmenu.description}</span>
							</p>
						</div>
					</li>

				</ul>
			</div>
		</div>
		<div class="other_menuWrap">
			<div class="web_container">
				<div class="titbox">
					<h3>신메뉴의 다른 메뉴</h3>
					<div class="slide">
						<div class="othermenu_slider">
							<div class="slider prd_img responsive">
								<c:forEach var="vo" items="${ newmenuList}">
									<a
										href="${contextPath}/menuInform/newmenudetail.do?product_serial=${vo.product_serial}"
										class="btn_detail"> <span style="display: block;">
											<img src="${vo.path}">
											<div class="cont">
												<p class="tit">
													<strong>${vo.product_name}</strong>
												</p>
											</div>
									</span>
									</a>
								</c:forEach>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- footer들어갈 자리 -->

	<jsp:include page="../../include/footer/main_desktop_footer.jsp" />


	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>