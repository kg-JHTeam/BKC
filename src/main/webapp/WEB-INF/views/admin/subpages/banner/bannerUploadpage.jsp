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
#bannerimgCol {
	text-align: center;
}

#bannerimg {
	width: 898.8px;
	height: 540.4px;
}

#imgDetail {
	text-align: center;
}
</style>
<script>
	// 사용 미사용  변경  
	function status(status) {
		var btn = document.getElementById("status_id");
		var value = btn.value;
		var use_status = document.getElementById("use_status");
		if (value == "사용") {
			var input = confirm("배너를 사용하지 않겠습니까?");
			if (input == true) {
				//배너 미사용으로 변경. 
				//use_status -> false
				btn.className = "btn btn-danger";
				btn.value = "미사용"
				use_status.value = false;
			} else {
				return;
			}
		} else {
			var input = confirm("배너를 사용하도록 변경하시겠습니까?");
			if (input == true) {
				//배너 사용으로 변경.
				//use_status -> true
				btn.className = "btn btn-info";
				btn.value = "사용"
				use_status.value = true;
			} else {
				return;
			}
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
					<h1 class="mt-4">배너 등록</h1>
					<div class="card mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<form action="${contextPath}/admin/bannerUpload.ad" method="get"
									enctype="multipart/form-data">
									<div class="container-fluid">
										<br>
										<!-- DataTales Example -->
										<div class="card shadow mb-4">
											<div class="card-header py-3">
												<h6 class="m-1 font-weight-bold text-primary">배너 등록</h6>
											</div>
											<div class="card-body">
												<!-- 전체 frame -->
												<ul>
													<!-- 제목 -->
													<li>
														<div>
															<div class="index">제목</div>
															<!-- 사용여부 추가  -->
															<input class="title_text" type="text" name="title"
																style="width: 50%" required /><br/>
														</div>
													</li><br/>
													<!-- 베너 이미지 업로드 -->
													<li>
														<div>
															<div class="index">배너 이미지</div>
															<input type="file" name="banner" required /><br/>
														</div>
													</li>
													<!-- 베너 내용 -->
													<li>
														<div>
															<div class="index">내용</div>
															<input type="text" name="content" style="width: 50%;"
																required /><br/>
														</div>
													</li>
												</ul>
												<div align="center">
													<input style="padding: 5px"
														class="btn btn-primary btn-icon-split" type="submit"
														id="registerBtn" value="등록하기" />
												</div>
												<div align="right">
													<a href="${contextPath }/admin/bannerlist.ad"
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
