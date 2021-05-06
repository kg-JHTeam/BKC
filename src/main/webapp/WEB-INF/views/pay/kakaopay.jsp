<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h1>kakaoPay api</h1>

	<form role="form" action="${contextPath }/pay/kakaopay.do"
		method="POST">
		<button>카카오페이로 결제하기</button>
	</form>
</body>
</html>