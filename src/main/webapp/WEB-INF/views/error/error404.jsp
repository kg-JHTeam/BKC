<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <!--font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon"
        href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/icon/apple-icon.png" />
    
    <!--css-->
    <link rel="stylesheet" href="${contextPath}/resources/css/error/error.css">
    <title>404</title>
</head>
<body>
    <div class="error"> 
        <img class="error_code" src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/error/error404.png"/>
        <div class="error_text">요청한 페이지가 없습니다.</div>
        <div class="error_buttons">
            <a href="${contextPath}/" class="btn01 m">
                <span>홈페이지로</span>
            </a>
        </div>
    </div>
</body>
</html>