<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestdelivery_desktop_header</title>
</head>
<body>
	<!-- header -->
	<div class="headerWrap">
            <div class="head_menuWrap">
                <div class="web_container">
                    <h1 class="WEB logo">
                        <span>딜리버리</span>
                    </h1>
                    <div class="WEB utilWrap">
                        <a href="${contextPath}/">
                            <span>브랜드홈</span>
                        </a>
                        <a href="${contextPath}/login">
                            <span>로그인</span>
                        </a>
                        <a href="${contextPath}/customerService/notice.do">
                            <span>고객센터</span>
                        </a>
                    </div>
                    <div class="WEB on_cont join">
                        <a href="${contextPath}/join" class="btn_join">
                            <strong>회원가입</strong>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="WEB on_cont head_personalWrap">
            <div class="web_container">
                <div class="personal_logon">
                    <div class="web_container">
                        <div class="personal_logoff">
                            <p>Better & Happier Choice</p>
                            <a href="${contextPath}/join" class="btn_login">
                                <strong>회원가입하고 혜택받기</strong>
                            </a>
                            <div class="btn_area">
                                <a href="${contextPath}/login">
                                    <strong>로그인</strong>
                                </a>
                                <a href="${contextPath}/guestOrderList.do">
                                    <strong>비회원 주문내역</strong>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>