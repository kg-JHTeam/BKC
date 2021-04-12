<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<!-- font google web font-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
	
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/icon/apple-icon.png" />

<!-- css -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/include/delivery-gnb.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/delivery/join.css">

<!-- js -->
<script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
<script src="${contextPath}/resources/js/delivery/delivery.js"></script>
<title>회원가입</title>
</head>
<body>
	<div id="wrap">
		<!-- join desktop header -->
		<jsp:include page="../include/header/delivery_desktop_header.jsp" />
		<!-- desktop join page -->
		<!--navigation bar-->
		<nav class="locationWrap">
			<ul>
				<li><a href="${contextPath}/">HOME</a></li>&nbsp;&nbsp;
				<li><a href="${contextPath}/login">로그인</a></li>&nbsp;&nbsp;
				<li><a href="${contextPath}/join">회원가입</a></li>
			</ul>
		</nav>
		<div class="content">
			<div class="content_container">
				<!-- 회원가입 폼 -->
				<sf:form method="post" action="${pageContext.request.contextPath}/joinuser" modelAttribute="user">
					<table class="formtable">
						<tr>
							<td class="label">아이디:</td>
							<td><sf:input class="control" type="text" path="userid"/><br/>
								<sf:errors path="userid" class="error" /></td>
						</tr>
						<tr>
							<td class="label">이름:</td>
							<td>
								<sf:input class="control" type="text" path="name"/><br/>
								<sf:errors path="name" class="error"/>
							</td>
						</tr>
						<tr>
							<td class="label">비밀번호:</td>
							<td>
								<sf:password class="control" path="password"/><br/>
								<sf:errors path="password" class="error"/>
							</td>
						</tr>
						<tr>
							<td class="label">핸드폰 번호:</td>
							<td>
								<sf:input class="control" type="text" path="phone"/><br/>
								<sf:errors path="phone" class="error"/>
							</td>
						</tr>
						<tr>
							<td class="label">SMS 수신 동의:</td>
							<td>
								<sf:radiobutton path="sms_agree" value="true" label="동의" checked="checked"/>
								<sf:radiobutton path="sms_agree" value="false" label="비동의"/>
							</td>
						</tr>
						<tr>
							<td class="label">이메일 수신 동의:</td>
							<td>
								<sf:radiobutton path="email_agree" value="true" label="동의" checked="checked"/>
								<sf:radiobutton path="email_agree" value="false" label="비동의"/>
							</td>
							<sf:hidden path="enabled" value="1"/>
							<sf:hidden path="regist_type" value="1"/>
							<sf:hidden path="usergrade" value="3"/>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="회원가입" /></td>
						</tr>
					</table>
				</sf:form>
			</div>
		</div>
	</div>
	<!-- join-desktop-footer -->
	<jsp:include page="../include/footer/delivery_desktop_footer.jsp" />
	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>