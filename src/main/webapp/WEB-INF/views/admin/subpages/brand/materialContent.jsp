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
					<h1 class="mt-4">MATERIAL수정</h1>
					<div class="card mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<form role="form" action="${contextPath}/admin/modifyMaterial.ad" method="post" enctype="multipart/form-data">
									<div class="form-row">
										<div class="form-group col-md-2">
												<label>번호</label> 
												<input class="form-control" name='seq' value="${MaterialVO.seq}" />
										</div>
										<div class="form-group col-md-12">
												<label>내용</label> 
												<textarea class="form-control" name='content' value="${MaterialVO.content}" />${MaterialVO.content}</textarea>
										</div>
										<div class="form-group col-md-12">
												<label>이미지</label> 
												<input class="form-control" name='path' value="${MaterialVO.path}" disabled/>
										</div>
										<div class="form-group col-md-12">
												<label>이미지2</label> 
												<input class="form-control" name='path_' value="${MaterialVO.path_}" disabled/>
										</div>
										<div class="form-group col-md-2">
												<label>파일 이미지</label> 
												<input multiple="mutiple" type="file" name="img" value="이미지변경" class="btn btn-success"/><br/>
										</div>
										<div class="form-group col-md-2">
												<label>파일 이미지2</label> 
												<input multiple="mutiple" type="file" name="img2" value="이미지변경" class="btn btn-success"/><br/>
										</div>
									</div>
									<div>
										<button type="submit" class="btn btn-primary">수정 완료</button>
										<button type="reset" class="btn btn-success">리셋</button>
										<a href="${contextPath }/admin/whybkclist.ad" class="btn btn-success btn-icon-split"> <span class="text">목록가기</span></a>
										<input class="btn btn-danger" type="button" value="삭제" onclick="javascript:deleteMaterial(${MaterialVO.seq})">
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
<script>
function deleteAboutbkc(seq) {
	var chk = confirm("정말 삭제하시겠습니까?");
	if (chk) {
		var contextpath = "<c:out value='${contextPath}'/>";
		location.href= contextpath+'/admin/deleteAboutbkc.ad?seq='+seq;
	}
}
</script>
</html>
