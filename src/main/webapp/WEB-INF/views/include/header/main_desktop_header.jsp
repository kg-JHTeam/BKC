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
	
    <!--Desktop - header-->
    <div id="header-wrap">
        <!--메인 로고-->
        <div class="images">
            <a href="${contextPath }/">
                <img id="main-logo" src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/bkclogo.png"
                    alt="bkc mainlogo" /></a>
        </div>
        <!--메뉴 -->
        <nav>
            <ul class="nav">
                <li class="menu-title"><a href="#">메뉴소개</a>
                    <ul class="sub-con">
                      	 <li><a href="${contextPath}/menuInform/newMenu.do">new메뉴</a></li>
                        <li><a href="${contextPath}/menuInform/chickenMenu.do">치킨메뉴</a></li>
                        <li><a href="${contextPath}/menuInform/sideMenu.do">사이드메뉴</a></li>
                        <li><a href="${contextPath}/menuInform/beerZone.do">비어존메뉴</a></li>
                    </ul>
                </li>
                <li class="menu-title"><a href="#">매장소개</a>
                    <ul class="sub-con">
                        <li><a href="${contextPath}/map/store.do">매장찾기</a></li>
                    </ul>
                </li>
                <li class="menu-title"><a href="#">이벤트</a>
                    <ul class="sub-con">
                        <li><a href="${contextPath}/event/eventPageAll.do">이벤트</a></li>
                        <li><a href="${contextPath}/event/eventPageNew.do">신규매장</a></li>
                    </ul>
                </li>
                <li class="menu-title"><a href="#">BRAND</a>
                    <ul class="sub-con">
                        <li><a href="${contextPath}/brand/brandStory.do">BKC 스토리</a></li>
                        <li><a href="${contextPath}/brand/whybkc.do">WHY BKC</a></li>
                        <li><a href="${contextPath}/brand/newsNewItem.do">BKC NEWS</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="full-cover"> </div>
        <!--딜리버리 로고-->
        <div class="images">
            <a href="${contextPath}/delivery/delivery.do">
                <img id="delivery-logo" src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/icon/delivery/delivery_inf.png"
                    alt="bkc deliverylogo" />
            </a>
        </div>
    </div><!-- end of header-->
</body>
</html>