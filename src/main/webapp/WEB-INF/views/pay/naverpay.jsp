
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form role="form" action="${contextPath }/pay/naverpay.do" method="POST">
	<input type="button" id="naverPayBtn" value="네이버페이 결제 버튼"  >

	
	<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
	<script >
	var oPay = Naver.Pay.create({
		"mode" : "production", 
		"clientId" : "u86j4ripEt8LRfPGzQ8" // clientId
	});

	//직접 만드신 네이버페이 결제버튼에 click Event를 할당
	var elNaverPayBtn = document.getElementById("naverPayBtn");

	elNaverPayBtn.addEventListener("click", function() {
		oPay.open({
			"merchantUserKey" : "bkc",
			"merchantPayKey" : "001",
			"productName" : "뿌링클",
			"totalPayAmount" : "100",
			"taxScopeAmount" : "100",
			"taxExScopeAmount" : "0",
			"returnUrl" : ('https://test-pay.naver.com/payments/{결제 예약 ID}')
		});
	});

	</script>
	</form>
</body>
</html>