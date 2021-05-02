<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var lastcost = $('#totalPayAmtNavi').text();
console.log(lastcost);
if(pay == "PAY_METHOD.PAYCOKAKAO"){
	IMP.init('imp80143812');
	IMP.request_pay({
	    pg : 'kakaopay',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : 'BKC 결제 시스템',
	    amount : 100,
	    buyer_email : '구매자 아이디',
	    buyer_name : '구매자 이름',
	    buyer_tel : '전화번호'
	},function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	       // msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
	var Iamport = require('iamport');
	var iamport = new Iamport({
	  impKey: '4983557948473507',
	  impSecret: '7Vz8VMlkK9IlGqg5hKQBhRo2SUkIIH5PDFXysjTdtBy92Ofkz5VQXjSQddzVVFLykI7N200vCyFEnUYW'
	});
</script>
</head>
<body>
	<h1>kakaoPay api</h1>

	<form role="form" action="${contextPath }/pay/kakaopay.do"
		method="POST">
		<button>카카오페이로 결제하기</button>
	</form>
</body>
</html>