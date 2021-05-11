<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" /><jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

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
<script>
//업로드 성공하면 성공 
window.onload = function(){
	var chk = "<c:out value='${check.success}'/>"
	if(chk=="true"){
		alert("유튜브 수정 완료");
	} else if(chk=="false"){
		alert("유튜브 수정 실패");
	} 
}
</script>
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
				<h1 class="mt-4">썸네일 등록</h1>
				<div class="card mb-4">
					<div class="card-body">
						<div class="table-responsive">

							<form action="${contextPath}/admin/insertYoutube.ad"
								method="post">
								<div class="container-fluid">
									<br>
									<!-- DataTales Example -->
									<div class="card shadow mb-4">
										<div class="card-header py-3">
											<h6 class="m-1 font-weight-bold text-primary">썸네일 등록</h6>
										</div>
										<div class="card-body">
											<!-- 전체 frame -->
											<ul>
												<!-- 제목 -->
												<li>
													<div>
														<div class="index">제목</div>
														<input class="title_text" type="text" name="title"
															style="width: 50%" required /><br /> <input
															type="hidden" name="${_csrf.parameterName}"
															value="${_csrf.token}" />
													</div>
												</li>
												<br />
												<!-- 유튜브 광고 최초 업로드 날짜 -->
												<li>
													<div>
														<div class="index">날짜</div>
														<input type="text" name="date" style="width: 50%;"
															value="${today}" required /><br />
													</div><br>
												</li>
												<!-- 유튜브 광고 경로 -->
												<li>
													<div>
														<div class="index">유튜브 경로</div>
														<input type="text" name="path" style="width: 50%;"
															required /><br />
													</div><br>
												</li>
												<!-- 유튜브 광고 내용 -->
												<li>
													<div>
														<div class="index">내용</div>
														<input type="text" name="content" style="width: 50%;"
															required /><br />
													</div><br>
												</li>
												<!-- 유튜브 썸네일 내용 -->
												<li>
													<div>
														<div class="index">내용</div>
														<input type="text" name="thumbnail" style="width: 50%;"
															required /><br />
													</div><br>
												</li>
											</ul>
											<div align="center">
												<input style="padding: 5px"
													class="btn btn-primary btn-icon-split" type="submit"
													value="유튜브 광고 등록" />
											</div><br>
											<div align="right">
												<a href="${contextPath }/admin/youtubeList.ad"
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
</html>
