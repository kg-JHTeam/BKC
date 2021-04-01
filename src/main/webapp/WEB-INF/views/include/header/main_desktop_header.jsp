<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <a href="${pageContext.request.contextPath }/">
                <img id="main-logo" src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/icon/apple-icon.png"
                    alt="bkc mainlogo" /></a>
        </div>
        <!--메뉴 -->
        <nav>
            <ul class="nav">
                <li class="menu-title"><a href="#">메뉴소개</a>
                    <ul class="sub-con">
                        <li><a href="${pageContext.request.contextPath }/menu/menu">치킨메뉴</a></li>
                        <li><a href="${pageContext.request.contextPath }/menu/menu">사이드메뉴</a></li>
                        <li><a href="${pageContext.request.contextPath }/menu/menu">비어존메뉴</a></li>
                    </ul>
                </li>
                <li class="menu-title"><a href="${pageContext.request.contextPath }/">매장소개</a>
                    <ul class="sub-con">
                        <li><a href="${pageContext.request.contextPath }/">매장찾기</a></li>
                    </ul>
                </li>
                <li class="menu-title"><a href="${pageContext.request.contextPath }/">이벤트</a>
                    <ul class="sub-con">
                        <li><a href="${pageContext.request.contextPath }/">이벤트</a></li>
                        <li><a href="${pageContext.request.contextPath }/">신규매장</a></li>
                    </ul>
                </li>
                <li class="menu-title"><a href="#">BRAND</a>
                    <ul class="sub-con">
                        <li><a href="${pageContext.request.contextPath }/brand/story">BKC 스토리</a></li>
                        <li><a href="${pageContext.request.contextPath }/brand/whybkc">WHY BKC</a></li>
                        <li><a href="${pageContext.request.contextPath }/brand/newsNewItem">BKC NEWS</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="full-cover"> </div>
        <!--딜리버리 로고-->
        <div class="images">
            <a href="${pageContext.request.contextPath }/delivery/">
                <img id="delivery-logo" src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/add/delevery.gif"
                    alt="bkc deliverylogo" />
            </a>
        </div>
    </div><!-- end of header-->
</body>
</html>