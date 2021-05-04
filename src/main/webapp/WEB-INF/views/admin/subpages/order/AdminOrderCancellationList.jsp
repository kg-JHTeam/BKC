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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>BKC 홈페이지 관리자 페이지</title>
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
					<h1 class="mt-4">주문 취소 리스트</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> 주문 취소 리스트
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%">
									<thead>
										<tr>
											<th>주문번호</th>
											<th>주문시간</th>
											<th>매장명</th>
											<th>주문자아이디</th>
											<th>결제타입</th>
											<th>총가격</th>
											<th>주문상태</th>
										</tr>
									</thead>
									<!-- 상세정보  -->
									<!-- 
										order_serial을 누르면 나오는 정보 모달. 
										1. 주문자 아이디
										2. 주문자 주소
										3. 주문자 전화번호
										4. 총가격
										5. 쿠폰사용여부
										6. 결제타입
										7. 상품  - 상품 갯수
									 -->
									<tbody>
										<c:forEach var="order" items="${orders}">
											<tr>
												<td><a href="#" onclick="checkOrder()">${order.order_serial}</a></td>
												<td>${order.order_date}</td>
												<td><a href="#" onclick="checkStore()">${order.store_name}</a></td>
												<td>${order.userid}</td>
												<td>${order.payment_type}</td>
												<td>${order.total_price} 원</td>
												<td>
												<c:choose>
														<c:when test="${order.order_status eq -1 }">
															<input class="btn btn-warning" type="button" value="주문취소" disabled/>
														</c:when>
														<c:when test="${order.order_status eq 1 }">
															<input class="btn btn-info" type="button" value="주문접수"
																onclick="javascript:changeOrderStatus(${order.order_status} ,${order.order_serial})"
																id="${order.order_serial}" />
														</c:when>
														<c:when test="${order.order_status eq 2 }">
															<input class="btn btn-primary" type="button" value="배달중"
																onclick="javascript:changeOrderStatus(${order.order_status} ,${order.order_serial})"
																id="${order.order_serial}" />
														</c:when>
														<c:otherwise>
															<input class="btn btn-danger" type="button" value="주문완료" disabled />
														</c:otherwise>
													</c:choose>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${contextPath }/resources/js/admin/scripts.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="${contextPath }/resources/assets/demo/datatables-demo.js"></script>
</body>
</html>
