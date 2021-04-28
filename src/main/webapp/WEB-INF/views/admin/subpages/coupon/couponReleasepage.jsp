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
<title>BKC 홈페이지 관리자 페이지</title>
<style>
#insertButton {
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
					<h1 class="mt-4">쿠폰 배포 </h1>
					<!-- 회원 리스트  -->
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> 일반 회원 리스트
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<input class="btn btn-success" type="button" value="배너 업로드"
									onclick="location.href='${contextPath}/admin/bannerUploadpage.ad'"
									id="insertButton">
								<table class="table table-bordered" id="dataTable" width="100%">
									<thead>
										<tr>
											<th><input type="checkbox"/></th>
											<th>아이디(이메일)</th>
											<th>이름</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="user" items="${users}">
											<tr>
												<td><input type="checkbox"/></td>
												<td>${user.userid}</td>
												<td>${user.name}</td>
												<td>${user.phone}</td>
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
