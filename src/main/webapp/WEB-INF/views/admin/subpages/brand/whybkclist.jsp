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
<style type="text/css">
#whybkcimg {
	width: 385.2px;
	height: 231.6px;
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
					<h1 class="mt-4">AboutBKC 리스트</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i>AboutBKC 리스트
						</div>
						<div class="card-body">
							<div class="table-responsive">
							<!-- start -->
								<table class="table" id="dataTable" width="100%">
									<colgroup>
										<col width="8%">
										<col width="42%">
										<col width="27%">
										<col width="27%">
									</colgroup>
									<thead>
										<tr>
											<th>번호</th>
											<th>내용</th>
											<th>이미지</th>
											<th>이미지2</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="RealchickenList" items="${RealchickenList}">
										<tr>
											<td>${RealchickenList.seq }</td>
											<td><a href="${contextPath}/admin/realchickenDetail.ad?seq=${RealchickenList.seq }">${RealchickenList.content }</a></td>
											<td><img src="${RealchickenList.path }" id="whybkcimg"></td>
											<td>없음</td>
										</tr>
										</c:forEach>
										<c:forEach var="ContributionList" items="${ContributionList}">
										<tr>
											<td>${ContributionList.seq }</td>
											<td><a href="${contextPath}/admin/contributionDetail.ad?seq=${ContributionList.seq }">${ContributionList.content }</a></td>
											<td><img src="${ContributionList.path }" id="whybkcimg"></td>
											<td>없음</td>
										</tr>
										</c:forEach>
										<c:forEach var="MaterialList" items="${MaterialList }">
										<tr>
											<td>${MaterialList.seq }</td>
											<td><a href="${contextPath}/admin/materialDetail.ad?seq=${MaterialList.seq }">${MaterialList.content}</a></td>
											<td><img src="${MaterialList.path }" id="whybkcimg"></td>
											<td><img src="${MaterialList.path_ }" id="whybkcimg"></td>
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
