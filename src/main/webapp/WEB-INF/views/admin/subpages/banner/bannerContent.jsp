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
		width:898.8px;
		height:540.4px;
	}
	#imgDetail{
		text-align: center;
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
					<h1 class="mt-4">배너 수정</h1>
					<div class="card mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<form role="form" action="${contextPath}/admin/modifyBanner.ad" method="post" enctype="multipart/form-data">
									<div class="form-group" id="imgDetail">
										<h4>이미지 상세 </h4><br>
										<h5><input type="file" name="banner" value="배너변경" class="btn btn-success"/></h5><br/>
										<a href="${banner.path}" target="_blank"  target="_blank">
												<img src="${banner.path}" alt="이미지" id="bannerimg" class="img-responsive"/>
										</a>
										
									</div>
									<div class="form-row">
										<input class="form-control" name='img_seq' value="${banner.img_seq}" type="hidden"/>
										<div class="form-group col-md-12">
												<label>제목</label> 
												<input class="form-control" name='title' value="${banner.title}" />
										</div>
									</div>
									<div class="form-group">
										<label>세부내용</label>
										<textarea class="form-control" rows="3" name='content' style="resize:none;">${banner.content}</textarea>
									</div>
									<div class="form-group">
										<label>이미지 주소 </label>
										<input class="form-control" name='path' value="${banner.path}" disabled/>
									</div>
									<div>
										<button type="button" class="btn btn-success" onclick="window.location.href='${contextPath }/admin/bannerlist.ad'">목록으로</button>
										<button type="submit" class="btn btn-primary">수정 완료</button>
										<button type="reset" class="btn btn-danger">리셋</button>
										<input type="hidden" name='use_status' value="${banner.use_status}" id="use_status"/>
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
