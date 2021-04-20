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
					<h1 class="mt-4">사업자 정보 조회</h1>
					<div class="card mb-4">
						<div class="card-body">
							<form role="form" action="${contextPath}/admin/businessinformationUpdatelogic.ad" method="POST">
								<div class="table-responsive">
									<div class="form-row">
										<div class="form-group col-md-6">
											<label>주소</label> 
											<input name="address" class="form-control" value="${bi.address}" />
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
										</div>
										<div class="form-group col-md-6">
											<label>전화번호</label>
											<input name="tel" class="form-control" value="${bi.tel}" />
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label>사업자등록번호</label>
											<input name="business_num" class="form-control" value="${bi.business_num}"/>
										</div>
										<div class="form-group col-md-6">
											<label>저작권</label>
											<input name="copyright" class="form-control" value="${bi.copyright}"/>
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label>대표이사 이름</label>
											 <input name="ceo_name" class="form-control" value="${bi.ceo_name}"/>
										</div>
									</div>
									<button type="submit" class="btn btn-primary">수정 완료</button>
									<button type="reset" class="btn btn-success">리셋</button>
								</div>
							</form>
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
