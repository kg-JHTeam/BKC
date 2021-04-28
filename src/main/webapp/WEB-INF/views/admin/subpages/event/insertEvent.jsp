<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>이벤트 등록</title>
<style>

#imgbox{
	width: 100%;
	height: 400px;
}

</style>
<script>
function deleteEvent(seq){
	   var check = confirm("정말 삭제하시겠습니까");
	   var contextpath = "<c:out value='${contextPath}'/>";
	   if(check==true){	 
	         window.location.href= contextpath+"deleteEventDB.ad?seq=${event.seq}";
	   } 
	   else{
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
					<h1 class="mt-4">이벤트 등록</h1>
					<!-- 이벤트 목록 -->
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> 이벤트 등록
						</div>
						<div class="card-body">

							<div class="row">
								<!-- /.col-lg-12 -->
							</div>
							<!-- /.row -->

							<div class="row">
								<div class="col-lg-12">
									<div class="panel panel-default">

										<div class="panel-heading"></div>
										<!-- /.panel-heading -->
										<div class="panel-body">
											<form role="form" action="${pageContext.request.contextPath }/admin/insertEventDB.ad" method="post" enctype="multipart/form-data">
												
												<div class="form-row">
													
													<div class="form-group col-md-6">
														<label>제목</label> <input class="form-control"
															name='event_title' value = '<c:out value="${event.event_title}"/>' >
													</div>
													<div class="form-group col-md-6">
														<label>시리얼</label> <input class="form-control"
															name='event_serial' value = '<c:out value="${event.event_serial}"/>' >
													</div>
												</div>
												<div class="form-row">
													<div class="form-group col-md-6">
														<label>시작일</label> <input class="form-control"
															name='start_date' value = '<c:out value="${event.start_date}"/>' >
													</div>
													
													<div class="form-group col-md-6">
														<label>종료일</label> <input class="form-control"
															name='end_date' value = '<c:out value="${event.end_date}"/>' >
													</div>
												</div>
											
												<div class="form-group">
													<label>내용</label>
													<textarea class="form-control" rows="10" name='description' value='<c:out value= "${event.description}"/>' >${event.description}
													</textarea>
												</div>
												
												<div class="form-group">
													<label>이미지</label>
													<div>
														<span>메인 이미지 :</span> <input type="file" name="files" id="title" accept="image/jpeg,image/gif,image/png"  onchange="chk_file_type(this)">
													</div>
													<div style="margin-top: 15px;">
														<span>상세 이미지 :</span> <input type="file" name="files" id="detail" accept="image/jpeg,image/gif,image/png" onchange="chk_file_type(this)">
													</div>
												</div>
												<div style="margin-top: 15px;">
													<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/admin/eventlist.ad'">목록 가기</button>
													<button type="submit" class="btn btn-primary">등록</button>
													<button type="reset" class="btn btn-danger">초기화</button>
												</div>
											</form>																
					    			     </div>
										<!-- end panel-body -->
									</div>
									<!--  end panel-body -->
								</div>
								<!-- end panel -->
							</div>
							<!-- /.row -->
						</div>
					</div>
				</div>
			</main>
			<!-- firstHeader -->
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${contextPath }/resources/js/admin/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="${contextPath }/resources/assets/demo/chart-area-demo.js"></script>
	<script src="${contextPath }/resources/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
	<script src="${contextPath }/resources/assets/demo/datatables-demo.js"></script>
	
	<script>
	
	 // 이미지외 다른파일 업로드 금지하도록 함 
	 function chk_file_type(obj) {
		 
	        var file_kind = obj.value.lastIndexOf('.');
	        var file_name = obj.value.substring(file_kind + 1, obj.length);
	        var file_type = file_name.toLowerCase();

	        var check_file_type = ['jpg', 'gif', 'png', 'jpeg'];
	        var agent = navigator.userAgent.toLowerCase()

	        if (check_file_type.indexOf(file_type) == -1) {
	            alert('이미지 파일만 선택할 수 있습니다.');

	            if ( (navigator.appName == 'Netscape'
	                        && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
	                $(obj).replaceWith($(obj).clone(true));
	            }else{
	                $(obj).val("");
	            }
	        }
	    }

	
	</script>	
</body>
</html>
