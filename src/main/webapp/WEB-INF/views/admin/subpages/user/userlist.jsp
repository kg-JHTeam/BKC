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
	//changeStatus
	function chageStatus(userid) {
		var input = confirm("회원의 휴면을 해제하시겠습니까? ");
		if (input) {
			var objParams = {
				"userid" : userid, // id값
			};
			$
					.ajax({
						url : "/bkc/admin/userChangeStatus.ad",
						dataType : "json",
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						type : "post", //post로 보냄
						data : objParams,
						success : function(retVal) {
							if (retVal.code == "OK") {
								alert("해제되었습니다.");
							} else {
								alert("해제되었습니다.");
							}
							//성공한 경우 html REFRESH
							var user = document.getElementById('tt' + userid);
							user.innerHTML = "";
						},
						error : function(request, status, error) {
							alert("실패하였습니다.");
						}
					});
		} else {
			return;
		}
	}
	var userid = "";
	var phonenumber = "";

	function showModal(tuserid, tphonenumber) {
		userid = tuserid;
		phonenumber = tphonenumber;
	}

	function sendSMS() {
		var smstext = document.getElementById('text');
		var objParams = {
			"userid" : userid, // id값
			"text" : smstext.value
		};
		$.ajax({
			url : "/bkc/admin/sendSMS.ad",
			dataType : "json",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			type : "post", //post로 보냄
			data : objParams,
			success : function(retVal) {
				if (retVal.code == "OK") {
					alert("문자전송이 완료되었습니다");
				} else {
					alert("문자전송이 완료되었습니다");
				}
			},
			error : function(request, status, error) {
				console.log("문자 전송이 실패하였습니다.");
			}
		});
	}

	//모달창 마다 아이디를 다르게 줘야함. 
	$(document).ready(
			function() {
				//문자 보내기 모달창
				function alignModal() {
					let modalDialog = $(this).find(".modal-dialog");
					modalDialog.css("margin-top", Math.max(0, ($(window)
							.height() - modalDialog.height()) / 2));
				}

				$(".modal").on("shown.bs.modal", alignModal);

				$(window).on("resize", function() {
					$(".modal:visible").each(alignModal);
				});
			});
</script>
<style>
textarea {
	width: 450px;
	height: 500x;
	resize: none; /* 크기고정 */
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
					<h1 class="mt-4">회원 리스트</h1>
					<!-- 회원 리스트  -->
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> 회원리스트
						</div>
						<div class="card-body">
							<div id="myModal" class="modal">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">회원에게 문자 보내기</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
										</div>
										<div class="modal-body">
											<p class="text-warning">
												<textarea id="text">[BKC] </textarea>
											</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">닫기</button>
											<a href="#" onclick="sendSMS()">전송</a>
										</div>
									</div>
								</div>
							</div>

							<div class="table-responsive">
								<br> <br>
								<table class="table table-bordered" id="dataTable" width="100%">
									<thead>
										<tr>
											<th>아이디(이메일)</th>
											<th>이름</th>
											<th>핸드폰번호</th>
											<th>SMS 동의여부</th>
											<th>이메일 동의여부</th>
											<th>휴면 여부</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="user" items="${users}">
											<tr id="t${users}">
												<td><a href="#">${user.userid}</a></td>
												<td>${user.name}</td>
												<td>${user.phone}</td>
												<td><c:choose>
														<c:when test="${user.email_agree eq true }">
															<!-- 한사람 모달 -->
															<a onclick="showModal('${user.userid}', '${user.phone }');"
																href="#myModal" data-toggle="modal">문자전송</a>
														</c:when>
														<c:otherwise>
															미동의
														</c:otherwise>
													</c:choose></td>
												<td><c:choose>
														<c:when test="${user.sms_agree eq true }">
															동의
														</c:when>
														<c:otherwise>
															미동의
														</c:otherwise>
													</c:choose></td>
												<td id="tt${user.userid}"><c:choose>
														<c:when test="${user.enabled eq true }">
														</c:when>
														<c:otherwise>
															<input class="btn btn-primary" type="button" value="휴면회원"
																onclick="javascript:chageStatus('${user.userid}');">
														</c:otherwise>
													</c:choose></td>
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
	<script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${contextPath }/resources/js/admin/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="${contextPath }/resources/assets/demo/datatables-demo.js"></script>
</body>
</html>
