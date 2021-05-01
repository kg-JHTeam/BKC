<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />
<title>BKC 홈페이지 관리자 페이지</title>
<style>
#menuimgCol {
	text-align: center;
}

#menuimg {
	width: 233px;
	height: 160px;
}

#insertmenu {
	position: relative;
	margin-bottom: 0.5%;
	margin-left: 91%
}
</style>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="${contextPath}/resources/js/admin/menu/menu.js"></script>
</head>
<body class="sb-nav-fixed">
	<!-- firstHeader -->
	<jsp:include page="../../include/firstHeader.jsp" />
	<div id="layoutSidenav">
		<!-- secondHeader -->
		<jsp:include page="../../include/secondHeader.jsp" />
		<!-- 관리자 버전 화면 만들기  -->
		<!-- Begin Page Content -->
		<div id="layoutSidenav_content">
			<main>
			<div class="container-fluid">
				<h1 class="mt-4">메뉴 리스트</h1>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table mr-1"></i>메뉴 리스트
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<!-- 카테고리 선택  -->
							<form action="#">
								<div align="right">
									<select class="btn btn-info dropdown-toggle" id="select1"
										name="select" style="width: 150px" onchange="chageSelect()">
										<option value="all">전체조회</option>
										<option value="chicken">치킨메뉴</option>
										<option value="sidemenu">사이드 메뉴</option>
										<option value="beerzone" selected>비어존</option>
										<option value="newmenu">new메뉴</option>
									</select> <input class="btn btn-success" type="button"
										style="padding: 5px" value="메뉴업로드"
										onclick="location.href='${contextPath}/admin/menuUploadpage.ad'"
										id="insertMenu">
								</div>
								<div class="my-2"></div>
								<!-- 리스트 보여주는 table -->
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr align="center">
											<th width="15%">메뉴이름</th>
											<th width="25%">이미지</th>
											<th width="20%">가격</th>
											<th width="20%">판매상태</th>
											<th width="20%">수정삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${adbeerlist}" var="adbeerlist">
											<tr align="center">
												<td>${adbeerlist.product_name}</td>
												<td id="menuimgCol"><a href="${adbeerlist.path}"
													target="_blank"> <img src="${adbeerlist.path}"
														alt="메뉴사진" id="menuimg"
														class="img-responsive center-block" />
												</a></td>
												<td>${adbeerlist.price}원</td>
												<td><c:choose>
														<c:when test="${adbeerlist.use_status eq true }">
															<input class="btn btn-info" type="button" value="판매중"
																onclick="javascript:status(${adbeerlist.use_status} ,${adbeerlist.product_serial})"
																id="${adbeerlist.product_serial}" />
														</c:when>
														<c:otherwise>
															<input class="btn btn-danger" type="button" value="판매중지"
																onclick="javascript:status(${adbeerlist.use_status} ,${adbeerlist.product_serial})"
																id="${adbeerlist.product_serial}" />
														</c:otherwise>
													</c:choose></td>
												<td><input class="btn btn-primary" type="button"
													value="수정"
													onClick="location.href='${contextPath}/admin/menuDetail.ad?product_serial=${adbeerlist.product_serial}'" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- firstHeader --> <jsp:include page="../../include/footer.jsp" />
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${contextPath }/resources/js/admin/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="${contextPath }/resources/assets/demo/chart-area-demo.js"></script>
	<script src="${contextPath }/resources/assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="${contextPath }/resources/assets/demo/datatables-demo.js"></script>
</body>
</html>
