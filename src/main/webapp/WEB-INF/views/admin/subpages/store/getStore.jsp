<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>신규매장 등록</title>
<script>
function deleteStore(store_name){
	   var check = confirm("정말 삭제하시겠습니까");
	   var contextpath = "<c:out value='${contextPath}'/>";
	   if(check==true){	 
	         window.location.href= contextpath+"deleteStoreDB.ad?store_name=${store.store_name}";
	   } 
	   else{
	      return;
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
					<h1 class="mt-4">신규매장 상세보기</h1>
					<!-- 신규매장 목록 -->
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> 신규매장 상세
						</div>
						<div class="card-body">

							<div class="row">
								<!-- /.col-lg-12 -->
							</div>
							<!-- /.row -->

							<div class="row">
								<div class="col-lg-12">
									<div class="panel panel-default">

										<div class="panel-heading"></div>
										<!-- /.panel-heading -->
										<div class="panel-body">

											<form role="form" action="/admin/getStore.ad" method="post">
												<div class="form-row">
													
													<div class="form-group col-md-6">
														<label>매장명</label> <input class="form-control"
															name='store_name' value = '<c:out value="${store.store_name}"/>' readonly="readonly">
													</div>
													<div class="form-group col-md-6">
														<label>매장 연락처</label> <input class="form-control"
															name='store_call' value = '<c:out value="${store.store_call}"/>' readonly="readonly">
													</div>
												</div>
												<div class="form-row">
													<div class="form-group col-md-6">
														<label>오픈 날짜</label> <input class="form-control"
															name='store_open' value = '<c:out value="${store.store_open}"/>' readonly="readonly">
													</div>
													
													<div class="form-group col-md-6">
														<label>주소</label> <input class="form-control"
															name='store_address' value = '<c:out value="${store.store_address}"/>' readonly="readonly">
													</div>
												</div>

												<div class="form-group">
													<label>작성자</label> <input class="form-control"
														name='writer' value='관리자' readonly="readonly">
												</div>
												<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath }/admin/storelist.ad?'">목록 가기</button>
												<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath }/admin/updateStore.ad?store_name=${store.store_name}'">수정</button>
												<button type=button class="btn btn-danger" onclick="javascript:deleteStore('${store.store_name}')">삭제</button>
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
