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
					<h1 class="mt-4">회원 리스트</h1>
					<!-- 회원 리스트  -->
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> 회원리스트
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%">
									<thead>
										<tr>
											<th>아이디(이메일)</th>
											<th>이름</th>
											<th>핸드폰번호</th>
											<th>회원/비회원 정보</th>
											<th>이메일 동의여부</th>
											<th>SNS 동의여부</th>
											<th>탈퇴/휴면 여부</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="user" items="${users}">
											<tr>
												<td><c:out value="${user.userid}" /></td>
												<td>${user.name}</td>
												<td>${user.phone}</td>
												<td><c:choose>
														<c:when test="${user.regist_type eq 1 }">
															회원
														</c:when>
														<c:otherwise>
															비회원
														</c:otherwise>
													</c:choose></td>
												<td><c:choose>
														<c:when test="${user.sms_agree eq true }">
															동의
														</c:when>
														<c:otherwise>
															미동의
														</c:otherwise>
													</c:choose></td>
												<td><c:choose>
														<c:when test="${user.email_agree eq true }">
															동의
														</c:when>
														<c:otherwise>
															미동의
														</c:otherwise>
													</c:choose></td>
												<td><c:choose>
														<c:when test="${user.enabled eq true }">
															- 
														</c:when>
														<c:otherwise>
															휴면회원 
														</c:otherwise>
													</c:choose></td>
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
