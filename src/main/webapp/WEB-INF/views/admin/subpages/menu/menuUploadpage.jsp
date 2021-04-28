<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon"  href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />
<title>BKC 홈페이지 관리자 페이지</title>
<style>
li{
   list-style:none;
   }
</style>
<script>
//업로드 성공하면 성공 
window.onload = function(){
	var chk = "<c:out value='${chk.success}'/>"
	if(chk=="true"){
		alert("메뉴 업로드 성공");
	} else if(chk=="false"){
		alert("메뉴 업로드 실패");
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
					<h1 class="mt-4">메뉴 등록</h1>
					<div class="card mb-4">
						<div class="card-body">
							<div class="table-responsive">
							
								<form role="form" action="${pageContext.request.contextPath }/admin/menuUpload.ad" method="post" enctype="multipart/form-data">
									<div class="container-fluid">
										<br>
										<!-- DataTales Example -->
										<div class="card shadow mb-4">
											<div class="card-header py-3">
												<h6 class="m-1 font-weight-bold text-primary">메뉴 등록</h6>
											</div>
											<div class="card-body">
												<!-- 전체 frame -->
												<ul>
													<!-- 카테고리 -->
												<li>
													<div>
														<c:if test="${select == 'new_menu' || select == 'chicken_menu' || select == 'side_menu' || select == 'beerzone'}">
														<input type="text" class="form-control"	name="type_serial" id="type_serial" value="${vo.type_serial}"></c:if>
														<select class="btn btn-secondary dropdown-toggle" id="type_serial" name="type_serial" style="width: 150px" onchange="chageType()"required>
															<option value="new_menu" selected>new메뉴</option>
															<option value="chicken_menu">치킨메뉴</option>
															<option value="side_menu">사이드 메뉴</option>
															<option value="beerzone">비어존</option>
														</select>																	
													</div>
												</li>
													<!-- 이름 -->
													<li><div>
															<div class="index">메뉴이름</div>
															<input class="title_text" type="text" name="product_name" style="width: 50%" required /><br/>
															<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
														</div></li>
														
													<!-- 메뉴 이미지 업로드 -->
													<li>
														<div>
															<div class="index">메뉴 이미지</div>
															<input type="file" name="menu" required /><br/>
														</div><br/>
													</li>
													
													<!-- 메뉴 내용 -->
													<li>
														<div>
															<div class="index">상세 내용</div>
															<input type="text" name="description" style="width: 50%;" required /><br/>
														</div>
													</li>
												
												<!-- 메뉴 내용 -->
													<li>
														<div>
															<div class="index">가격</div>
															<input type="text" name="price" style="width: 50%;" required /><br/>
														</div>
													</li>
												</ul>
												<div align="center">
													<input style="padding: 5px"
														class="btn btn-primary btn-icon-split" type="submit"
														 value="메뉴 등록하기" />
												</div>
												<div align="right">
													<a href="${contextPath }/admin/adminAllList.ad"
														class="btn btn-success btn-icon-split"> <span
														class="text">목록가기</span>
													</a>
												</div>
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
