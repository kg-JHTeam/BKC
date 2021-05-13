<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />
<script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
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
//업로드 성공하면 성공 
window.onload = function(){
	var chk = "<c:out value='${check.success}'/>"
	if(chk=="updatetrue"){
		alert("쿠폰 수정 성공");
	} else if(chk=="updatefalse"){
		alert("쿠폰 수정 실패");
	} else if(chk=="deletetrue"){
		alert("쿠폰 삭제 성공");
	} else if(chk=="deletefalse"){
		alert("쿠폰 삭제 실패");
	} 
}
//쿠폰 삭제 - 동기 처리 
function deleteCoupon(coupon_serial){
	if(!confirm("삭제를 하시겠습니까?")) {
		return;
	} else{
		var contextpath = "<c:out value='${contextPath}'/>";
	    window.location.href= contextpath+"/admin/couponDelete.ad?coupon_serial="+coupon_serial;
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
					<h1 class="mt-4">쿠폰 리스트</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i>쿠폰 리스트
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<input class="btn btn-success" type="button" value="쿠폰 업로드"
									onclick="location.href='${contextPath}/admin/couponUploadpage.ad'"
									id="insertBanner">
								<table class="table table-bordered" id="dataTable" width="100%">
									<thead>
										<tr>
											<th>쿠폰 시리얼</th>
											<th>쿠폰 이름</th>
											<th>카테고리</th>
											<th>할인 가격</th>
											<th>수정</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="coupon" items="${coupons}">
											<tr>
												<td>${coupon.coupon_serial}</td>
												<td>${coupon.coupon_title}</td>
												<td>${coupon.coupon_category}</td>
												<td>${coupon.price }</td>
												<td>
												<input class="btn btn-primary" type="button" value="수정"
																onclick="location.href='${contextPath}/admin/couponUpdatepage.ad?coupon_serial=${coupon.coupon_serial}'" />
												<!-- input class="btn btn-danger" type="button" value="발행중지"
																onclick="javascript:deleteCoupon('${coupon.coupon_serial}')" /> -->
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
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