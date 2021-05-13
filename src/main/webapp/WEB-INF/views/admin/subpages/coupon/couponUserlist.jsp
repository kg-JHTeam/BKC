<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />
<script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<title>BKC 홈페이지 관리자 페이지</title>
	<style>
	#bannerimgCol {
		text-align: center;
	}
	
	#bannerimg {
		width: 385.2px;
		height: 231.6px;
	}
	
	#insertBanner {
		position: relative;
		margin-bottom: 0.5%;
		margin-left: 91%
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
					<h1 class="mt-4">유저 쿠폰 리스트</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i>유저 쿠폰 리스트
						</div>
						<div class="card-body">
							<div class="table-responsive" >
								<table class="table table-bordered" id="dataTable" width="100%">
									<thead>
										<tr>
											<th>쿠폰 넘버</th>
											<th>쿠폰 종류 </th>
											<th>소지자 아이디</th>
											<th>쿠폰 발급일</th>
											<th>사용여부</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="usercoupon" items="${usercoupons}">
											<tr>
												<td>${usercoupon.coupon_number}</td>
												<td>${usercoupon.coupon_title}</td>
												<td>${usercoupon.userid}</td>
												<td>
												<fmt:formatDate type="both" value="${usercoupon.startdate}"
												pattern="yyyy-MM-dd HH:mm:ss" />
												</td>
												<td>
												<c:choose>
													<c:when test="${usercoupon.use_status eq -1}">
													   <input type="button" class="btn btn-secondary" value="사용완료" disabled>
													</c:when>
													<c:otherwise>
														<input type="button" class="btn btn-danger" value="미사용">
													</c:otherwise>
												</c:choose>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</main>
			<!-- firstHeader -->
			<jsp:include page="../../include/footer.jsp" />
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