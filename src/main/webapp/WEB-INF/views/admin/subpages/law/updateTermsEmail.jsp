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
					<h1 class="mt-4">이메일약관 수정</h1>
					<!-- 공지사항 목록 -->
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> 이메일약관 수정
						</div>
						<div class="card-body">

							<div class="row">
								<div class="col-lg-12">
									<div class="panel panel-default">
										<div class="panel-heading"></div>
										<!-- /.panel-heading -->
										<div class="panel-body">
											<form role="form" action="${contextPath }/admin/updateTermEmailDB.ad" method="post">
												<div class="form-row">
													<div class="form-group col-md-6">
														<label>NO.</label> 
														<input readonly class="form-control" name='seq' value = '<c:out value="${termsEmail.seq}"/>' >
													</div>
													<div class="form-group col-md-6">
														<label>게시날짜</label> 
														<textarea rows="1" class="form-control" name='regdate' value = '<c:out value="${termsEmail.regdate}"/>' >${termsEmail.regdate }</textarea>
													</div>
												</div>
												<div class="form-group">
													<label>내용1</label>
													<textarea rows="10" class="form-control" rows="3" name='content01' value='<c:out value= "${termsEmail.content01}"/>' >${termsEmail.content01}</textarea>
												</div>												
												<div class="form-group">
													<label>작성자</label> <input readonly class="form-control"
														name='writer' value='관리자' >
												</div>
												<button type="button" class="btn btn-success" onclick="window.history.back();">목록으로</button>
												<button type="submit" class="btn btn-primary">수정 완료</button>
												<button type="reset" class="btn btn-danger">리셋</button>
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
