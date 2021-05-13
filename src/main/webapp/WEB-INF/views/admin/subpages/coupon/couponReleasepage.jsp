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
<style>
#insertButton {
	position: relative;
	margin-bottom: 0.5%;
	margin-left: 86%
}

#releaseButton {
	position: relative;
	margin-bottom: 0.5%;
	margin-left: 86%
}
</style>
<script>
	//coupon 제목값 이 쿠폰을 보내야됨. 
	var couponTitle = document.getElementById("coupon_release").value;
	function handleOnChange(e) {
		couponTitle = e.value;
	}
	
	//전체에 배포 
	function releaseAll(){
		if(couponTitle==""){
			alert("배포할 쿠폰을 선택하세요.");
			return;
		}
		
		var input = confirm( "'"+couponTitle +"'"+ " 쿠폰을 배포하시겠습니까?");
		if(input == true){
			  var objParams = {
                      "coupon_title"      : couponTitle, // 유저 저장
              };
			  
			  $.ajax({
                  url         :   "/bkc/admin/allreleaseCoupon.ad",
                  dataType    :   "json",
                  contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                  type        :   "post",
                  data        :   objParams,
                  success     :   function(retVal){
                      if(retVal.code == "OK") {
                          alert(retVal.message);
                      } else {
                          alert(retVal.message);
                      }
                  },
                  error       :   function(request, status, error){
                      alert("배포에 실패하였습니다.");
                  }
              });
		}
	}
	
	function releaseCheck(){
		if(couponTitle==null){
			alert("배포할 쿠폰을 선택하세요.");
			return;
		}
		var userArray = [];
        $('input[name="check"]:checked').each(function(i){//체크된 리스트 저장
      	  userArray.push($(this).val());
        });
        if(userArray.length == 0){
        	alert("배포할 회원을 선택하세요.");
        	return;
        }
        
		var input = confirm( "'"+couponTitle +"'"+ " 쿠폰을 배포하시겠습니까?");
		if(input == true){
			//check된 리스트 저장.
			  var objParams = {
                      "coupon_title"      : couponTitle, // 유저 저장
                      "userArray" 		  : userArray    // 유저리스트 저장
               };
			  
			  $.ajax({
                  url         :   "/bkc/admin/releaseCoupon.ad",
                  dataType    :   "json",
                  contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                  type        :   "post",
                  data        :   objParams,
                  success     :   function(retVal){
                      if(retVal.code == "OK") {
                          alert(retVal.message);
                      } else {
                          alert(retVal.message);
                      }
                  },
                  error       :   function(request, status, error){
                      alert("배포에 실패하였습니다.");
                  }
              });
		}
	}
	
	
	function checkSelectAll() {
		  // 전체 체크박스
		  const checkboxes = document.querySelectorAll('input[name="check"]');
		  
		  // 선택된 체크박스
		  const checked = document.querySelectorAll('input[name="check"]:checked');
		  
		  // select all 체크박스
		  const selectAll = document.querySelector('input[name="checkAll"]');

		  if (checkboxes.length === checked.length) {
		    selectAll.checked = true;
		  } else {
		    selectAll.checked = false;
		  }
		}
	
		//모든 곳 체크되게 
		function selectAll(selectAll) {
		  const checkboxes = document.getElementsByName("check");
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  });
		}

		function deleteRow(ths) {
		  var ths = $(ths);
		  ths.parents("tr").remove();
		}
		
		function showUserCoupon(userid){
			//user가 가지고 있는 쿠폰 출력
			 var contextpath = "<c:out value='${contextPath}'/>";
         	 window.location.href= contextpath+ "/admin/userHavingCouponDetail.ad?userid="+userid;
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
					<h1 class="mt-4">쿠폰 배포</h1>
					<!-- 회원 리스트  -->
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> 일반 회원 리스트
						</div>
						<div class="card-body">
							<div class="table-responsive">
									<div>
										<span>배포할 쿠폰 : </span>&nbsp;
										<select class="btn btn-secondary dropdown-toggle"
											id="coupon_release" name="coupon_title" style="width:400px;"
											style="width: 150px" onchange="handleOnChange(this)" required>
											<c:forEach var="coupon" items="${coupons}">
												<option value="${coupon.coupon_title}" id="${coupon.coupon_serial}">${coupon.coupon_title}</option>
											</c:forEach>
										</select>
									</div>
								<input class="btn btn-primary" type="button" value="체크된 회원 쿠폰 배포" onclick="javscript:releaseCheck()" id="releaseButton"> 
								<input class="btn btn-success" type="button" value="모든 회원에 쿠폰 배포" onclick="javscript:releaseAll()" id="insertButton">
								<table class="table table-bordered" id="dataTable" width="100%">
									<thead>
										<tr>
											<th><input type="checkbox"class="c-box" name="checkAll" id="checkAll" onclick="selectAll(this)"></th>
											<th>회원 아이디(클릭 하면 소지한 쿠폰을 확인 할 수 있습니다.)</th>
											<th>이름</th>
											<th>전화번호</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="user" items="${users}">
											<tr>
												<td><input type="checkbox" class="c-box" name="check" onclick="checkSelectAll()" value="${user.userid}"></td>
												<td><a href="javascript:showUserCoupon('${user.userid}');">${user.userid}</a></td>
												<td>${user.name}</td>
												<td>${user.phone}</td>
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
