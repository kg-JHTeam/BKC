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
		var sale_status = document.getElementById("sale_status");
		if (value == "사용") {
			var input = confirm("판매 중지로 변경 하시겠습니까?");
			if (input == true) {
				//판매중지로  변경. 
				//use_status -> false
				btn.className = "btn btn-danger";
				btn.value = "판매중지"
				sale_status.value = false;
			} else {
				return;
			}
		} else {
			var input = confirm("판매중으로 변경하시겠습니까?");
			if (input == true) {
				//판매중으로 변경.
				//use_status -> true
				btn.className = "btn btn-info";
				btn.value = "판매중"
				sale_status.value = true;
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
				<h1 class="mt-4">메뉴 수정</h1>
				<div class="card mb-4">
					<div class="card-body">
						<div class="table-responsive">
							<form role="form" action="${contextPath}/admin/modifysidemenu.ad"
								method="post">
								<div class="form-group" id="imgDetail">
									<h4>이미지 상세</h4>
									<br> <a href="${sidemenu.img_path}" target="_blank"
										target="_blank"> <img src="${sidemenu.img_path}" alt="이미지"
										id="sidemenuimg" class="img-responsive" />
									</a>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<label>제품번호</label> <input class="form-control" name='product_serial'
											value="${sidemenu.product_serial}" disabled />
									</div>
									<div class="form-group col-md-6">
										<label>메뉴이름</label> <input class="form-control" name='product_name'
											value="${sidemenu.product_name}" />
									</div>
								</div>
								<div class="form-group">
									<label>세부내용</label>
									<textarea class="form-control" rows="3" name='descriptiont'
										style="resize: none;">${sidemenu.description}</textarea>
								</div>
								<div class="form-group">
									<label>이미지 주소 </label> <input class="form-control" name='path'
										value="${sidemenu.img_path}" disabled />
								</div>
			
								 <div class="form-group">
									<label>사용여부</label>
								</div>
								<div>
									<button type="submit" class="btn btn-primary">수정 완료</button>
									<button type="reset" class="btn btn-success">리셋</button>
									<c:choose>
										<c:when test="${sidemenu.status eq true }">
											<input class="btn btn-info" type="button" value="판매중"
												onclick="javascript:status(true)" id="status_id" />
										</c:when>
										<c:otherwise>
											<input class="btn btn-danger" type="button" value="판매중지"
												onclick="javascript:status(false)" id="status_id" />
										</c:otherwise>
									</c:choose>
									<input type="hidden" name='sale_status'
										value="${sidemenu.status}" id="sale_status" />
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
