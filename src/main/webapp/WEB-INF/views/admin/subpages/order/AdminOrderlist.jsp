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

function SaveAsPdf(){
	
	
	location.href="/pdfDownloadForMenu.mdo?";
}

//pdf function (미완성 건들지마시오 .)

function acyncOrderPage(url) {

   $.ajax({
      url : url,
      type : "POST",
      // data : JSON.stringify(json),
      contentType : "application/json",
      success : function(data) {
         $('#bodyContents').children().remove();
         $('#bodyContents').html(data);
      },
      error : function() {
         alert("error");
      }
   });
}

//PDF 이름값 저장을 하기 위한..
function acyncpdf(url) {
   $.ajax({
      url : url,
      type : "POST",
      data : {
         'newpdf' : $('#newpdf').val()
      },
      dataType : "json",
      success : function(data) {
         if (data == 1) {
            alert("PDF가 저장 되었습니다");

         } else {
            alert("PDF 저장 실패 했습니다.");
         }
      },
      error : function() {
         alert("PDF 저장 실패 했습니다.");
      }
   });
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
				<h1 class="mt-4">주문 리스트</h1>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table mr-1"></i> 주문 리스트
						<button type="button" class="btn btn-danger btn-sm"
                        data-toggle="modal" data-target="#testpdf" style="float: right;" >
                        <i class="fas fa-download fa-sm text-white-50"></i>PDF</button> <!-- pdf버튼입니다. 모달창이 열립니다. -->

						<!-- 여기가 pdf 버튼 클릭시 나오는 모달 내용입니다. ----------------------------------------------------------------->
						<div class="modal fade" id="testpdf">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title">PDF 경로 지정</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>

									<div class="modal-body">
										PDF파일 이름을 적어주세요 예)TEST <br> <input type="text"
											class="form-control input-lg" id="newpdf" value="">
									</div>

									<div class="modal-footer">
										<input type="button" class="btn btn-success"
											onclick="acyncpdf('${contextPath}/admin/orderlist.ad')" value="PDF저장"											
											data-dismiss="modal">
										<button type="button" class="btn btn-danger"
											onclick="acyncOrderPage'${contextPath}/admin/orderlist.ad')"		
											data-dismiss="modal">아니요</button>
									</div>
								</div>
							</div>
						</div> 
						<!--------------------------------------------------------------------------------------------------->

					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%">
								<thead>
									<tr>
										<th class="sorting_desc" tabindex="0"
											aria-controls="dataTable" rowspan="1" colspan="1"
											aria-label="주문번호: activate to sort column ascending"
											aria-sort="descending" style="width: 85px;">주문번호</th>
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
												<button type="button" class="btn btn-secondary"
													data-toggle="modal" data-target="#s${order.order_serial}"
													data-id="${order.order_serial}">상세보기</button>
												<div class="modal fade" id="s${order.order_serial}"
													tabindex="-1" role="dialog"
													aria-labelledby="exampleModalLabel" aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">주문
																	상세 보기</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span>&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<div class="form-row">
																	<div class="form-group col-md-6">
																		<label class="col-form-label">주문번호</label> <input
																			type="text" class="form-control"
																			value="${order.order_serial}" disabled>
																	</div>
																	<div class="form-group col-md-6">
																		<label for="message-text" class="col-form-label">주문상태</label>
																		<c:choose>
																			<c:when test="${order.order_status eq -1 }">
																				<input type="text" class="form-control" value="주문취소"
																					disabled>
																			</c:when>
																			<c:when test="${order.order_status eq 1 }">
																				<input type="text" class="form-control" value="주문접수"
																					disabled>
																			</c:when>
																			<c:when test="${order.order_status eq 2 }">
																				<input type="text" class="form-control" value="배달중"
																					disabled>
																			</c:when>
																			<c:otherwise>
																				<input type="text" class="form-control" value="주문완료"
																					disabled>
																			</c:otherwise>
																		</c:choose>
																	</div>
																</div>
																<div class="form-row">
																	<div class="form-group col-md-6">
																		<label class="col-form-label">주문자 아이디</label> <input
																			type="text" class="form-control"
																			value="${order.userid}" disabled>
																	</div>
																	<div class="form-group col-md-6">
																		<label for="recipient-name" class="col-form-label">주문자
																			전화번호</label> <input type="text" class="form-control"
																			value="${order.phonenumber}" disabled>
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-form-label">주문자 주소 </label> <input
																		type="text" class="form-control"
																		value="${order.address}" disabled>
																</div>
																<div class="form-group">
																	<label class="col-form-label">매장명</label> <input
																		type="text" class="form-control"
																		value="${order.store_name}" disabled>
																</div>
																<div class="form-row">
																	<div class="form-group col-md-6">
																		<label class="col-form-label">쿠폰사용여부</label>
																		<c:choose>
																			<c:when test="${order.coupon_seq eq -1 }">
																				<input type="text" class="form-control"
																					value="쿠폰미사용" disabled>
																			</c:when>
																			<c:otherwise>
																				<input type="text" class="form-control"
																					value="쿠폰사용" disabled>
																			</c:otherwise>
																		</c:choose>
																	</div>
																	<div class="form-group col-md-6">
																		<label for="recipient-name" class="col-form-label">결제타입</label>
																		<input type="text" class="form-control"
																			value="${order.payment_type}" disabled>
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-form-label">총가격</label> <input
																		type="text" class="form-control"
																		value="${order.userid}" disabled>
																</div>
																<div class="form-group">
																	<label for="message-text" class="col-form-label">주문
																		상품</label>
																	<c:forEach var="orderDetail"
																		items="${order.orderDetails}">
																		<input type="text" class="form-control"
																			value="${orderDetail.product_name } ${orderDetail.quantity }개"
																			disabled>
																	</c:forEach>
																</div>
																<div class="form-group">
																	<label for="message-text" class="col-form-label">요구사항</label>
																	<textarea class="form-control" id="message-text"
																		disabled>${order.description}</textarea>
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-dismiss="modal">닫기</button>
															</div>
														</div>
													</div>
												</div>
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
