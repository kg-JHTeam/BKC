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
<title>이용약관 수정</title>
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
					<h1 class="mt-4">이용약관 수정</h1>
					<!-- 공지사항 목록 -->
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> 이용약관 수정
						</div>
						<div class="card-body">

							<div class="row">
								<div class="col-lg-12">
									<h1 class="page-header">이용약관 수정</h1>
								</div>
								<!-- /.col-lg-12 -->
							</div>
							<!-- /.row -->

							<div class="row">
								<div class="col-lg-12">
									<div class="panel panel-default">

										<div class="panel-heading"></div>
										<!-- /.panel-heading -->
										<div class="panel-body">

											<form role="form" action="${contextPath }/admin/updateTermDB.ad" method="post">'
												<div class="form-row">
													<div class="form-group col-md-6">
														<label>NO.</label> <input class="form-control"
															name='seq' value = '<c:out value="${terms.seq}"/>' >
													</div>
													<div class="form-group col-md-6">
														<label>게시날짜</label> 
														<textarea class="form-control" name='regdate' value = '<c:out value="${terms.regdate}"/>' >${terms.regdate }</textarea>
													</div>
												</div>
												<div class="form-group">
													<label>내용1</label>
													<textarea class="form-control" rows="3" name='content01' value='<c:out value= "${terms.content01}"/>' >${terms.content01}</textarea>
												</div>
												<div class="form-group">
													<label>내용2</label>
													<textarea class="form-control" rows="3" name='content02' value='<c:out value= "${terms.content02}"/>' >${terms.content02}</textarea>
												</div>
												<div class="form-group">
													<label>내용3</label>
													<textarea class="form-control" rows="3" name='content03' value='<c:out value= "${terms.content03}"/>' >${terms.content03}</textarea>
												</div>
												<div class="form-group">
													<label>내용4</label>
													<textarea class="form-control" rows="3" name='content04' value='<c:out value= "${terms.content04}"/>' >${terms.content04}</textarea>
												</div>
												<div class="form-group">
													<label>작성자</label> <input class="form-control"
														name='writer' value='관리자' >
												</div>
												<button type="submit" class="btn btn-success">수정</button>
											</form>
										</div>
										<!-- end panel-body -->
									</div>
									<!-- end panel-body -->
								</div>
								<!-- end panel -->
							</div>
							<!-- /.row -->
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