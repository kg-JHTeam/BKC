<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <!-- font google web font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <!-- favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/icon/apple-icon.png" />
    <!-- css -->
    <link rel="stylesheet" href="../resources/css/include/delivery-gnb.css">
    <link rel="stylesheet" href="../resources/css/delivery/join.css">
    <!-- js -->
    <script src="../resources/jquery/jquery-3.6.0.min.js"></script>
    <script src="../resources/js/delivery/delivery.js"></script>
	<title>회웡가입</title>
</head>
<body>
	<div id="wrap">
	<!-- join desktop header -->
	<jsp:include page="../include/header/delivery_desktop_header.jsp"/>
	<!-- desktop join page -->
	<!--navigation bar-->
	<nav class="locationWrap">
	    <ul>
	        <li><a href="${contextPath}/">HOME</a></li>&nbsp;&nbsp;
	        <li><a href="${contextPath}/delivery/delivery.do">로그인</a></li>&nbsp;&nbsp;
	        <li><a href="${contextPath}/delivery/join.do">회원가입</a></li>
	    </ul>
	</nav>
	<!--content login-->
        <div class="content">
            <div class="content_container">
                <div class="welcomebox">
                    <h3 class="page_tit">환영합니다!</h3>
                    <div class="txt_welcome">
                        <p>
                            <span class="br">
                                <strong>이메일 주소</strong>혹은 
                                <strong>SNS 계정</strong>으로
                            </span>간편하게
                            <strong>
                                <em>회원가입</em>
                            </strong>하세요!
                        </p>
                    </div>
                </div>
                <!-- email join -->
                <div class="login_container">
                    <div class="login">
                        <h3 class="defaultlogin_tit">이메일 회원가입
                        </h3>
                        <div class="c_btn">
                            <a href="#" class="btn02 st03">
                                <span>BKC 회원가입</span>
                            </a>
                        </div>
                    </div>
                    <!-- simple join -->
                    <div class="simple_login">
                        <h3 class="simplelogin_tit tit_ico lock">간편 회원가입
                        </h3>
                        <ul class="list">
                            <li class="naver">
                                <a href="#">
                                    <span>네이버</span>
                                </a>
                            </li>
                            <li class="kakao">
                                <a href="#">
                                    <span>카카오톡</span>
                                </a>
                            </li>
                            <li class="google">
                                <a href="#">
                                    <img src="../resources/delivery_img/login/google_ico.gif" alt="구글 로고">
                                    <span>Google 로 로그인</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="line" style="height: 176px;"></div>
    <!-- join-desktop-footer -->
	<jsp:include page="../include/footer/delivery_desktop_footer.jsp"/>
	<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>