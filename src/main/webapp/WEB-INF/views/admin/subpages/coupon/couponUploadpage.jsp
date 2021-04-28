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
<script>
//업로드 성공하면 성공 
window.onload = function(){
	var chk = "<c:out value='${check.success}'/>"
	if(chk=="true"){
		alert("쿠폰 업로드 성공");
	} else if(chk=="false"){
		alert("쿠폰 업로드 실패");
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
					<h1 class="mt-4">쿠폰 등록</h1>
					<div class="card mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<form action="${contextPath}/admin/couponUpload.ad" method="post">
									<div class="container-fluid">
										<br>
										<!-- DataTales Example -->
										<div class="card shadow mb-4">
											<div class="card-header py-3">
												<h6 class="m-1 font-weight-bold text-primary">쿠폰 등록</h6>
											</div><br><br>
											<ul>
												<!-- 카테고리 -->
												<li>
													<div>
														<p>적용 카테고리</p>
														<select class="btn btn-secondary dropdown-toggle" id="coupon_category" name="coupon_category" style="width: 150px" onchange="chageType()"required>
															<option value="all" selected>전체 메뉴</option>
															<option value="chicken_menu">치킨메뉴</option>
															<option value="side_menu">사이드 메뉴</option>
															<option value="beerzone">비어존</option>
														</select>
													</div>
													<br>
												</li>
													<!-- 쿠폰이름 -->
													<li><div>
															<div class="index">쿠폰시리얼</div>
															<input class="title_text" type="text" name="coupon_serial" style="width: 50%" required /><br/>
														</div><br>
													</li>
													<!-- 이름 -->
													<li><div>
															<div class="index">쿠폰이름</div>
															<input class="title_text" type="text" name="coupon_title" style="width: 50%" required /><br/>
														</div><br>
													</li>
													<!-- 할인가격  -->
													<li>
														<div>
															<div class="index">할인 가격</div>
															<input type="text" name="price" style="width: 50%;" required /><br/>
														</div>
													</li><br>
												</ul>
												<div align="center">
													<input style="padding: 5px"
														class="btn btn-primary btn-icon-split" type="submit"
														 value="쿠폰 등록하기" />
												</div>
												<div align="right">
													<a href="${contextPath }/admin/couponlist.ad"
														class="btn btn-success btn-icon-split"> <span
														class="text">목록가기</span>
													</a>
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
