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
	width: 385.2px;
	height: 231.6px;
}

#insertBanner {
	position: relative;
	margin-bottom: 0.5%;
	margin-left: 91%
}
</style>

<script>
	function status(status, id) {
		var btn = document.getElementById(id);
		var value = btn.value;
		if (value == "판매중") {
			var input = confirm("메뉴를 판매중지 하시겠습니까?");
			if (input == true) {

				//판매중지로 변경. 
				//use_status -> false
				btn.className = "btn btn-danger";
				btn.value = "판매중지";

				//DB에서 처리
				var img_seq = id;
				var contextpath = "<c:out value='${contextPath}'/>";

				window.location.href = contextpath
						+ "/admin/changeStatusSidemenu.ad?img_seq=" + id;
			} else {
				return;
			}
		} else {
			var input = confirm("판매중으로 변경하시겠습니까?");
			if (input == true) {
				//배너 사용으로 변경.
				//use_status -> true
				btn.className = "btn btn-info";
				btn.value = "판매중"

				//DB에서 처리
				var img_seq = id;
				var contextpath = "<c:out value='${contextPath}'/>";

				window.location.href = contextpath
						+ "/admin/changeStatusSidemenu.ad?img_seq=" + id;

			} else {
				return;
			}
		}
	}

	function deleteSidemenu(id) {
		var btn = document.getElementById(id);
		var value = btn.value;
		var input = confirm("정말로 메뉴를 삭제 하시겠습니까?");
		if (input == true) {
			//DB에서 처리
			var img_seq = id;
			var contextpath = "<c:out value='${contextPath}'/>";

			window.location.href = contextpath
					+ "/admin/deleteSidemenu.ad?img_seq=" + id;

			alert("삭제되었습니다.");
		} else {
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
		<!-- 관리자 버전 화면 만들기  -->
		<!-- Begin Page Content -->
		<div id="layoutSidenav_content">
			<main>
			<div class="container-fluid">
				<h1 class="mt-4">사이드메뉴 리스트</h1>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table mr-1"></i>사이드메뉴 리스트
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<!-- 카테고리 선택 s -->
							<div class="mb-3">
								<div class="col-sm-3">
									<div class="small mb-1"></div>
									<div class="dropdown mb-4">
										<span class="form_select" style="width: 300px"> <select
											class="btn btn-primary dropdown-toggle" id="select1"
											name="select" style="width: 150px">
												<option value="chiken">치킨메뉴</option>
												<option value="sidemenu">사이드 메뉴</option>
												<option value="beerzone">비어존</option>
										</select>
										</span>
									</div>
								</div>
							</div>
							<!-- 카테고리 선택  -->
							<form action="/menu.ad">
								<div align="right">
									<input type="submit" class="btn btn-warning btn-icon-split"
										style="padding: 5px" value="메뉴 등록">
								</div>
								<div class="my-2"></div>
								<!-- 리스트 보여주는 table -->
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr align="center">
											<th width="15%">메뉴이름</th>
											<th width="15%">code</th>
											<th width="25%">메뉴 설명</th>
											<th width="35%">이미지</th>
											<th width="10%">판매상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${sidemenu}" var="sidemenu">
											<tr>
												<td>${sidemenu.product_name}</td>
												<td>${sidemenu.description}</td>
												<td><a type="hidden"
													href="/menuDetail.ad?code=${sidemenu.product_serial}&select=${select}">${sidemenu.product_serial}</a></td>
												<td><img src="${sidemenu.img_path}" width="200px"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- firstHeader --> <jsp:include page="../../include/footer.jsp" />
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
