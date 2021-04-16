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
	#bannerimgCol{
		text-align: center;
	}
	#bannerimg{
		width:385.2px;
		height:231.6px;
	}
	#insertBanner{
		position: relative;
        margin-bottom: 0.5%;
    	margin-left: 93%
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
					<h1 class="mt-4">메인 배너 리스트</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i>메인 배너 리스트
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<input class="btn btn-success" type="button" value="배너 추가" id="insertBanner">
								<table class="table" id="dataTable" width="100%">
									<thead>
										<tr>
											<th>아이디값</th>
											<th>제목</th>
											<th>이미지(이미지를 클릭하면 자세히 볼 수 있습니다.)</th>
											<th>사용여부</th>
											<th>수정</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="banner" items="${banners}">
											<tr>
												<td>${banner.img_seq}</td>
												<td>${banner.title}</td>
												<td id="bannerimgCol">
													<a href="${banner.path}" target="_blank" >
														<img src="${banner.path}" alt="이미지" id="bannerimg" class="img-responsive center-block"/>
													</a>
												</td>
												<td>
													<c:choose>
														<c:when test="${banner.use_status eq true }">
															<input class="btn btn-info" type="button" value="사용중"/>
														</c:when>
														<c:otherwise>
															<input class="btn btn-danger" type="button" value="미사용중"/>
														</c:otherwise>
													</c:choose>
												</td>
												<td>
													<input class="btn btn-primary" type="button" value="수정" onClick="location.href='${contextPath}/admin/bannerDetail.ad?seq=${banner.img_seq}'"/>
												</td>
												<td>
													<input class="btn btn-danger" type="button" value="삭제">
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
