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
	function status(event_yn, id){
		   console.log(id);
			console.log(event_yn);
		   var btn = document.getElementById(id);
		   if(btn.value == "진행중"){
		      var input = confirm("이벤트를 종료처리 하시겠습니까?");
		      if(input == true){
		         
		         btn.className = "btn btn-danger";
		         btn.value = "종료";
		         
		         //DB에서 처리
		         var store_name = id;
		         var contextpath = "<c:out value='${contextPath}'/>";
		         
		         //비동기 처리로 변경 
		         window.location.href= contextpath+"/admin/newStatus.ad?store_name="+id;
		      } else{
		         return;
		      }
		   } else{
		      var input = confirm("이벤트를 진행처리 하시겠습니까?");
		      if(input == true){
		         btn.className = "btn btn-info";
		         btn.value = "진행중"
		         
		         //DB에서 처리
		         var store_name = id;
		         var contextpath = "<c:out value='${contextPath}'/>";
		         window.location.href= contextpath+"/admin/newStatus.ad?store_name="+id;
		         
		      } else{
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
					<h1 class="mt-4">신규 매장 목록</h1>
					<!-- 공지사항 목록 -->
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> 목록
						</div>
						<div class="card-body">
							<div class="table-responsive">
							
								<table class="table table-bordered" id="dataTable" width="100%">
									<thead>
										<tr>
											<th>NO</th>
											<th>매장명</th>
											<th>오픈 날짜</th>
											<th>이벤트 진행 여부</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="adStoreList" items="${adStoreList}">
											<tr>
												<td>${adStoreList.rn}</td>
												<td><a type="hidden" href="${contextPath }/admin/getStore.ad?store_name=${adStoreList.store_name}">${adStoreList.store_name }</a></td>
												<td>${adStoreList.store_open}</td>
												<td>
													<c:choose>
														<c:when test="${adStoreList.event_yn eq true }">
															<input class="btn btn-info" type="button" value="진행중"
																onclick="javascript:status(${adStoreList.event_yn} ,'${adStoreList.store_name}')"
																id="${adStoreList.store_name}" />
														</c:when>
														<c:otherwise>
															<input class="btn btn-danger" type="button" value="종료"
																onclick="javascript:status(${adStoreList.event_yn} ,'${adStoreList.store_name}')"
																id="${adStoreList.store_name}" />
															<input type="hidden" name="${_csrf.parameterName}"
																value="${_csrf.token}" />
														</c:otherwise>
													</c:choose>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<button type="button" class="btn btn-success"
								onclick="location.href='${contextPath}/admin/insertStore.ad'">등록</button>
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
