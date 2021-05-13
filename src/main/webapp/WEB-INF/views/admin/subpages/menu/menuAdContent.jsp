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
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />
<title>메뉴등록</title>
<style>
li{
   list-style:none;
   }
</style>


<script>
//메뉴삭제
function deleteMenu(product_serial){
		var input= confirm("메뉴를 정말로 삭제하시겠습니까?");
		var contextpath = "<c:out value ='${contextpath}'/>";
		
		if(input == true){
			
			
			window.location.href= contextpath + "deleteMenu.ad?product_serial="+${menu.product_serial};
			alert("삭제에 성공했습니다.");
		}else{
			alert("메뉴 삭제 실패");
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
				<h1 class="mt-4">메뉴 수정</h1>
				<div class="card mb-4">
					<div class="card-body">
						<div class="table-responsive">
							<form action="${contextPath}/admin/modifyMenu.ad" method="post"
								enctype="multipart/form-data">
								<div class="form-group" id="imgDetail">							
									<h4>이미지 수정</h4>
									<br> <br /> <a href="${menu.path}" target="_blank"
										target="_blank"> <img src="${menu.path}" alt="이미지"
										id="menuimg" class="img-responsive"  />
										<h5>
											<input type="file" name="menu" value="메뉴변경" class="btn btn-primary" />
										</h5>
									</a></div>
								<!-- 카테고리 -->
									<li><div>
										<c:if test="${select == 'new_menu' || select == 'chicken_menu' || select == 'side_menu' || select == 'beerzone'}">
											<input type="text" class="form-control"	name="type_serial" id="type_serial" value="${vo.type_serial}"></c:if>
											<div class ="btn-group">
											<div class ="dropdown">
																					
											<select class="btn btn-secondary dropdown-toggle" id="type_serial" name="type_serial" style="width: 150px" onchange="chageType()">
												<option value="new_menu" selected>new메뉴</option>
												<option value="chicken_menu">치킨메뉴</option>
												<option value="side_menu">사이드 메뉴</option>
												<option value="beerzone">비어존</option></select>																	
										</div>
										</div></li>
														
								<div class="form-row">
									<input class="form-control" name='product_serial' value="${menu.product_serial}" type="hidden" />
									<div class="form-group col-md-12">
										<label>메뉴이름</label> <input class="form-control"
											name='product_name' value="${menu.product_name}" />
									</div>
								</div>
								
								<div class="form-group">
									<label>가격</label> <input class="form-control" name='price'
										value="${menu.price}" />
								</div>
								<div class="form-group">
									<label>세부내용</label>
									<textarea class="form-control" rows="3" name='description'
										style="resize: none;">${menu.description}</textarea>
								</div>
								<div class="form-group">
									<label>이미지 주소 </label> <input class="form-control" name='path'
										value="${menu.path}" disabled />
								</div>
								<div>
									<button type="button" class="btn btn-success"
										onclick="window.location.href='${contextPath }/admin/adminAllList.ad'">목록으로</button>
									<button type="submit" class="btn btn-primary">수정 완료</button>
									<button type="button" class="btn btn-danger"
										onclick="javascript:deleteMenu(${menu.product_serial}); return false;">삭제</button>
									<input type="hidden" name='use_status'
										value="${menu.use_status}" id="use_status" />
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
