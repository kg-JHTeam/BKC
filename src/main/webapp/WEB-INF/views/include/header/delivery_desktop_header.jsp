<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main_desktop_header</title>
</head>
<body>
  <!--header-->
        <header class="head-menu">
            <div class="head-container">
                <div>
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/bkclogo.png" alt="logo">
                    <span>BKC</span>
                </div>
            </div>

            <div class="head-util">
                <div>
                    <div><a href="${contextPath}/"><span>브랜드홈</span></a></div>
                    <div class="top_login"><a href="${contextPath}/delivery/delivery.do"><span>로그인</span></a></div>
                    <div><a href="${contextPath}/customerService/notice.do"><span>고객센터</span></a></div>
                </div>
                <div class="signup">
                    <img class="button_black" src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/delivery_img/button/btn-black.png" alt="button-black">
                    <a href="${contextPath}/join"><span>회원가입</span></a>
                    <img class="rightarrow" src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/delivery_img/button/rightarrow.png" alt="rightarrow">
                </div>
            </div>
        </header>
</body>
</html>