<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
 <head>
    <meta charset="utf-8">
    <title>관리자 로그인 </title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous"/>
    <link rel="shortcut icon" type="image/x-icon" href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />
  </head>
  <body>  
        <div class="container">
        <form class="form-signin" method="post" action="${contextPath}/admin.ad">
        <h5 class="form-signin-heading">BKC 홈페이지 관리자 로그인 </h5>
        
        <!-- 로그인 실패시 에러메시지 여기다 나오게함.  -->
        <c:if test="${not empty errorMsg}">
        	<div style="color:#ff0000"> <h6> ${errorMsg}</h6> </div>
        </c:if>
        
        <!-- 로그아웃 한 경우 여기다 나오게함.  -->
        <c:if test="${not empty logoutMsg}">
        	<div style="color:#0000ff"> <h6> ${logoutMsg}</h6> </div>
        </c:if>
        
        <p>
          <label for="username" class="sr-only">관리자 아이디</label>
          <input type="text" id="username" name="username" class="form-control" placeholder="관리자 아이디" required autofocus>
        </p>
        <p>
          <label for="password" class="sr-only">관리자 비밀번호</label>
          <input type="password" id="password" name="password" class="form-control" placeholder="관리자 비밀번호" required>
        </p>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>        
		<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
      	</form>
</div>
</body>
</html>