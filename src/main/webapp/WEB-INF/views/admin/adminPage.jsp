<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="refresh" content="0;url=dist/index.html">
    <title>BKC 홈페이지 관리자 페이지</title>
    <script language="javascript"> 
    window.location.href = "${contextPath}/goAdminPage.ad" 
    </script>
</head>

<body>
    Go to <a href="${contextPath}/goAdminPage.ad">/dist/index.html</a>
</body>

</html>
