<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
</head>
<body>
	<c:forEach var="products" items="${cart.products}">
	카카오페이 결제가 정상적으로 완료되었습니다. 
	<br />결제일시: [[${info.approved_at}]]
	<br /> 주문번호: [[${products.value.type_serial}]]
	<br /> 상품명: [[ ${products.value.product_name}]]
	<br /> 상품수량: [[${products.value.quantity}]]
	<br /> 결제금액: [[${products.value.price*products.value.count}]]
	<br /> 결제방법: [[${info.payment_method_type}]]
	<br />
</c:forEach>
	<h2>감사합니다</h2>
</body>
</html>