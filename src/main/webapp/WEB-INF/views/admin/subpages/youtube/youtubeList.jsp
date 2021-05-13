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
#youtubeimgCol {
	text-align: center;
}

#youtubeimg {
	width: 385.2px;
	height: 231.6px;
}

#insertYoutube {
	position: relative;
	margin-bottom: 0.5%;
	margin-left: 91%
}
</style>

<script>
function status(status,id){
	var btn = document.getElementById(id);
	var value = btn.value;
	if(value == "사용"){
		var input = confirm("유튜브를 사용하지 않겠습니까?");
		if(input == true){
			
			//배너 미사용으로 변경. 
			//use_status -> false
			btn.className = "btn btn-danger";
			btn.value = "미사용";
			
			//DB에서 처리
			var img_seq = id;
			var contextpath = "<c:out value='${contextPath}'/>";
			
		    window.location.href= contextpath+"/admin/changeStatusYoutube.ad?img_seq="+id;
		} else{
			return;
		}
	} else{
		var input = confirm("유튜브를 사용하도록 변경하시겠습니까?");
		if(input == true){
			//배너 사용으로 변경.
			//use_status -> true
			btn.className = "btn btn-info";
			btn.value = "사용"
			
			//DB에서 처리
			var img_seq = id;
			var contextpath = "<c:out value='${contextPath}'/>";
			
			window.location.href= contextpath+"/admin/changeStatusYoutube.ad?img_seq="+id;
			
		} else{
			return;
		}
	}
} 

function deleteYoutube(id){
	var btn = document.getElementById(id);
	var value = btn.value;
		var input = confirm("정말로 유튜브광고를 삭제 하시겠습니까?");
		if(input == true){
			//DB에서 처리
			var img_seq = id;
			var contextpath = "<c:out value='${contextPath}'/>";
		    window.location.href= contextpath+"/admin/deleteYoutube.ad?img_seq="+id;
			alert("삭제되었습니다.");
		} else{
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
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1 class="mt-4">메인 유튜브 광고 리스트</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i>메인 유튜브 광고 리스트
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<input class="btn btn-success" type="button" value="광고 업로드"
									onclick="location.href='${contextPath}/admin/youtubeUploadpage.ad'"
									id="insertYoutube">
								<table class="table" id="dataTable" width="100%">
									<thead>
										<tr>
											<th>등록일</th>
											<th>제목</th>
											<th>유튜브 썸네일</th>
											<th>사용여부(1개만 등록 가능)</th>
											<th>수정</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="youtubes" items="${youtubes}">
											<tr>
												<td>${youtubes.date}</td>
												<td>${youtubes.title}</td>
												<td>
													<iframe id="youtube" src="${youtubes.path}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
										                allowfullscreen>
										              </iframe>
												</td>
												 
												<td><c:choose>
														<c:when test="${youtubes.use_status eq true }">
															<input class="btn btn-info" type="button" value="사용"
																onclick="javascript:status(${youtubes.use_status} ,${youtubes.img_seq})"
																id="${youtubes.img_seq}" />
														</c:when>
														<c:otherwise>
															<input class="btn btn-danger" type="button" value="미사용"
																onclick="javascript:status(${youtubes.use_status} ,${youtubes.img_seq})"
																id="${youtubes.img_seq}" />
																<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
														</c:otherwise>
													</c:choose></td>
													<td>
													<input class="btn btn-primary" type="button"
													value="수정"
													onClick="location.href='${contextPath}/admin/youtubeContent.ad?img_seq='+${youtubes.img_seq}" />
												</td>
												<td><input class="btn btn-danger" type="button" value="삭제" onclick="javascript:deleteYoutube(${youtubes.img_seq})"></td>
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
