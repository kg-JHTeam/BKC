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
	<input type="button" id="naverPayBtn" value="네이버페이 결제 버튼">
	<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
	<script>
		var oPay = Naver.Pay.create({
			"mode" : "production", // development or production
			"clientId" : "u86j4ripEt8LRfPGzQ8" // clientId
		});

		//직접 만든 네이버페이 결제 버튼에 click 이벤트를 할당하세요.
		var elNaverPayBtn = document.getElementById("naverPayBtn");
		elNaverPayBtn.addEventListener("click", function() {

			oPay.open({
				"merchantUserKey" : "bkc",
				"merchantPayKey" : "001",
				"productName" : "뿌링클",
				"totalPayAmount" : "17000",
				"taxScopeAmount" : "17000",
				"taxExScopeAmount" : "0",
				"returnUrl" : "http://localhost:8080/bkc/pay/naverPaySuccess.do?"
			});
		});
	</script>
</body>
</html>
