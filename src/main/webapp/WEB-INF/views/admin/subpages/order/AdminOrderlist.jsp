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
<script>
//주문상태 변경 메서드 
function changeOrderStatus(status, serial){
	if(status == "1"){
		let input = confirm("배달을 출발하시겠습니까?");
		if(input == false) return;
	}
	
	if(status == "2"){
		let input = confirm("주문완료 처리하시겠습니까?");
		if(input == false) return;
	}
	
	var objParams = {
            "order_serial"      : parseInt(serial),
            "order_status"      : parseInt(status)
    };
	  
	  $.ajax({
        url         :   "/bkc/admin/changeOrderStatus.ad",
        dataType    :   "json",
        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
        type        :   "post",
        data        :   objParams,
        success     :   function(retVal){
        	var orderStatus_btn = document.getElementById(serial);
        	if(status == "1"){
        		orderStatus_btn.value="배달중";
        		orderStatus_btn.className="btn btn-primary";
        	} else if(status == "2"){
        		orderStatus_btn.value="주문완료";
        		orderStatus_btn.className="btn btn-danger";
        		orderStatus_btn.disabled="true";
        	}
        },
        error       :   function(){
        	console.log("실패")
        }
    });
}

$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('New message to ' + recipient)
	  modal.find('.modal-body input').val(recipient)
	})
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
					<h1 class="mt-4">주문 리스트</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> 주문 리스트
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
											<th>주문상세보기</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="order" items="${orders}">
											<tr>
												<td>${order.order_serial}</td>
												<td>${order.order_date}</td>
												<td><a href="#" onclick="checkStore()">${order.store_name}</a></td>
												<td>${order.userid}</td>
												<td>${order.payment_type}</td>
												<td>${order.total_price}원</td>
												<td><c:choose>
														<c:when test="${order.order_status eq -1 }">
															<input class="btn btn-warning" type="button" value="주문취소"
																disabled />
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
															<input class="btn btn-danger" type="button" value="주문완료"
																disabled />
														</c:otherwise>
													</c:choose></td>
													<td>
													<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">상세보기</button>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- 모달 -->		
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
										8. 주문상태 
									 -->							
									<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog" role="document">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h5 class="modal-title" id="exampleModalLabel">주문 상세 보기 </h5>
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									          <span aria-hidden="true">&times;</span>
									        </button>
									      </div>
									      <div class="modal-body">
									      	  <div class="form-group">
									            <label for="message-text" class="col-form-label">주문상태</label>
									            <input type="text" class="form-control" id="recipient-name" disabled>
									          </div>
										      <div class="form-group">
										            <label for="recipient-name" class="col-form-label">주문자 아이디:</label>
										            <input type="text" class="form-control" id="recipient-name" disabled>
										      </div>
										      <div class="form-row">
										          <div class="form-group col-md-6">
										            <label for="recipient-name" class="col-form-label">주문자 주소 :</label>
										            <input type="text" class="form-control" id="recipient-name" disabled>
										          </div>
										          <div class="form-group col-md-6">
										            <label for="recipient-name" class="col-form-label">매장명:</label>
										            <input type="text" class="form-control" id="recipient-name" disabled>
										          </div>
									          </div>
									          <div class="form-row">
										          <div class="form-group col-md-6">
										            <label for="recipient-name" class="col-form-label">쿠폰사용여부:</label>
										            <input type="text" class="form-control" id="recipient-name" disabled>
										          </div>
										          <div class="form-group col-md-6">
										            <label for="recipient-name" class="col-form-label">결제타입:</label>
										            <input type="text" class="form-control" id="recipient-name" disabled>
										          </div>
									          </div>
									          
									          <div class="form-group">
									            <label for="recipient-name" class="col-form-label">총가격:</label>
									            <input type="text" class="form-control" id="recipient-name" disabled>
									          </div>
									          <div class="form-group">
									            <label for="message-text" class="col-form-label">주문 상품</label>
									            <textarea class="form-control" id="message-text" disabled></textarea>
									          </div>
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
									      </div>
									    </div>
									  </div>
									</div>
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
