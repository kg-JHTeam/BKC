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
<title>쿠폰수정</title>
<style>
li {
	list-style: none;
}
</style>
</head>
<body class="sb-nav-fixed">
	<!-- firstHeader -->
	<jsp:include page="../../include/firstHeader.jsp" />
	<div id="layoutSidenav">
		<!-- secondHeader -->
		<jsp:include page="../../include/secondHeader.jsp" />
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1 class="mt-4">쿠폰수정</h1>
					<div class="card mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<form action="${contextPath}/admin/couponUpdate.ad"
									method="post">
									<input class="form-control" name='coupon_serial' value="${coupon.coupon_serial}" type="hidden" />
									<!-- 카테고리 -->
									<ul>
									<li>
										<div>
											<p>적용 카테고리</p>
											<select class="btn btn-secondary dropdown-toggle"
												id="coupon_category" name="coupon_category" 
												style="width: 150px" onchange="chageType()" required>
												<option value="all">전체 메뉴</option>
												<option value="chicken_menu">치킨메뉴</option>
												<option value="side_menu">사이드 메뉴</option>
												<option value="beerzone">비어존</option>
											</select>
										</div> <br>
									</li>

									<!-- 이름 -->
									<li><div>
											<div class="index">쿠폰이름</div>
											<input class="title_text" type="text" name="coupon_title"
												style="width: 50%" required value="${coupon.coupon_title}" /><br />
										</div> <br></li>

									<!-- 할인가격  -->
									<li>
										<div>
											<div class="index">할인 가격</div>
											<input type="text" name="price" style="width: 50%;" required value="${coupon.price}" /><br />
										</div>
									</li> <br>
									</ul>
									<div align="center">
										<button type="submit" class="btn btn-primary">수정 완료</button>
									</div>
									<div align="right">
										<a href="${contextPath }/admin/couponlist.ad"
											class="btn btn-success btn-icon-split"> <span
											class="text">목록가기</span>
										</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</main>

			<!-- firstHeader -->
			<jsp:include page="../../include/footer.jsp" />
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
