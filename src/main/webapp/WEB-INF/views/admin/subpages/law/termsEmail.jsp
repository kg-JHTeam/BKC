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
					<h1 class="mt-4">이메일약관 상세조회</h1>
					<!-- 이메일약관 목록 -->
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> 이메일약관 상세조회
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered"  width="100%">
									<thead>
										<tr>
											<th>NO</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${termsEmail.seq }</td>
										</tr>
									</tbody>
									<thead>
										<tr>
											<th>게시날짜</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${termsEmail.regdate }</td>
										</tr>
									</tbody>
									<thead>
										<tr>
											<th>내용1</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><pre>${termsEmail.content01 }</pre></td>
										</tr>
									</tbody>									
									<thead>
										<tr>
											<th>작성자</th>
										</tr>
									</thead>										
									<tbody>										
										<tr>
											<td>관리자</td>
										</tr>
									</tbody>
								</table>
							</div>
							<button type="button" class="btn btn-success" onclick="location.href='${contextPath }/admin/updateTermsEmail.ad'">수정하러가기</button>
						</div>
					</div>
				</div>
			</main>
			<!-- firstHeader -->
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
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
