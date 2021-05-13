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
					<h1 class="mt-4">FAQ등록</h1>
					<div class="card mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<form action="${contextPath}/admin/faqUpload.ad" method="get">
									<div class="container-fluid">
										<br>
										<!-- DataTales Example -->
										<div class="card shadow mb-4">
											<div class="card-header py-3">
												<h6 class="m-1 font-weight-bold text-primary">FAQ등록</h6>
											</div>
											<div class="card-body">
												<!-- 전체 frame -->
												<ul>
													<!-- 제목 -->
													<li>
														<div>
															<a class="nav-link dropdown-toggle mytoggle" data-toggle="dropdown" href="#">카테고리</a>
															<div class="dropdown-menu mycategory">
															  <a class="dropdown-item" href="#">제품/품질/서비스</a>
															  <a class="dropdown-item" href="#">딜리버리 주문</a>
															  <a class="dropdown-item" href="#">임대/가맹</a>
															  <a class="dropdown-item" href="#">버거킹카드</a>
															  <a class="dropdown-item" href="#">기타</a>
															</div>
															<input class="categoryMy" type="text" name="category" style="width: 50%;" required /><br/>
														</div>
													</li>
														<div>
															<div class="index">제목</div>
															<input type="text" name="title" style="width: 50%;" required /><br/>
															<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
														</div>
													</li>
														<div>
															<div class="index">내용</div>
															<textarea type="text" name="contents" style="width: 100%;, height: 120px;"required /></textarea><br/>
														</div>
													</li>
												</ul>
												<div align="center">
													<input style="padding: 5px"
														class="btn btn-primary btn-icon-split" type="submit"
														 value="등록" />
												</div>
												<div align="right">
													<a href="${contextPath }/admin/faqlist.ad"
														class="btn btn-success btn-icon-split"> <span
														class="text">목록가기</span>
													</a>
												</div>
											</div>
										</div>
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
<script>

$('.dropdown-menu > a').on('click', function() {
    // 버튼에 선택된 항목 텍스트 넣기 
    $('.categoryMy').attr("value",$(this).text());
    
});

</script>
</html>
