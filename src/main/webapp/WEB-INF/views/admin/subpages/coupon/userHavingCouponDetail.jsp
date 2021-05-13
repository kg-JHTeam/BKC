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
#tmp {
	position: relative;
	margin-bottom: 0.5%;
	margin-left: 88%
}
</style>
<script>
//업로드 성공하면 성공 
window.onload = function(){
	var chk = "<c:out value='${check.success}'/>"
	if(chk=="true"){
		alert("쿠폰 삭제");
	} else if(chk=="false"){
		alert("쿠폰 삭제 실패 ");
	} 
}
function deleteUserCoupon(coupon_seq, userid) {
	if(!confirm("쿠폰 삭제를 하시겠습니까?")) {
		return;
	} else{
		var contextpath = "<c:out value='${contextPath}'/>";
	    window.location.href= contextpath+"/admin/deleteUserCoupon.ad?coupon_seq="+coupon_seq+"&userid="+userid;
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
					<h1 class="mt-4">회원 쿠폰</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> ${userid} 가 소지한 쿠폰 리스트
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<input class="btn btn-success" type="button" value="쿠폰 배포 페이지로"
									onclick="location.href='${contextPath }/admin/couponRelease.ad'"
									id="tmp">
									<table class="table table-bordered" id="dataTable" width="100%">
										<thead>
											<tr>
												<th>쿠폰 등록 날짜</th>
												<th>쿠폰 넘버</th>
												<th>쿠폰 내용</th>
												<th>삭제하기</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="usercoupon" items="${usercoupons}">
												<tr>
													<td>${usercoupon.startdate}</td>
													<td>${usercoupon.coupon_number}</td>
													<td>${usercoupon.coupon_title}</td>
													<td>
														<input class="btn btn-danger" type="button" value="쿠폰 삭제"
														onclick="javascript:deleteUserCoupon(${usercoupon.coupon_seq}, '${userid}');"/>
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
