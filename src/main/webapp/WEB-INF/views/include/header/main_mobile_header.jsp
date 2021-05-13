<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main_mobile_header</title>
</head>
<body>
    <!--반응형-mobile-Header-->
    <div id="m-header-wrap">
        <!--햄버거 버튼-->
        <div class="m-toggle-btn">
            <span class="bar long-bar"></span>
            <span class="bar short-bar"></span>
            <span class="bar"></span>
        </div>
        <!--햄버거 버튼 클릭하면 나오는 메뉴-->
        <div class="m-fix">
            <div class="m-fix-menu">
                <ul>
                    <li><a href="#">메뉴소개</a><span></span>
                        <ul>
                        <li><a href="${contextPath}/menuInform/newMenu.do">new메뉴</a></li>
                        <li><a href="${contextPath}/menuInform/chickenMenu.do">치킨메뉴</a></li>
                        <li><a href="${contextPath}/menuInform/sideMenu.do">사이드메뉴</a></li>
                        <li><a href="${contextPath}/menuInform/beerZone.do">비어존메뉴</a></li>
                        </ul>
                    </li>
                    <li><a href="#">매장소개</a><span></span>
                        <ul>
                            <li><a href="${contextPath}/map/store.do">매장찾기</a></li>
                        </ul>
                    </li>
                    <li><a href="#">이벤트</a><span></span>
                        <ul>
                            <li><a href="${contextPath}/event/eventPageAll.do">이벤트</a></li>
                            <li><a href="${contextPath}/event/eventPageNew.do">신규매장</a></li>
                        </ul>
                    </li>
                    <li><a href="#">BRAND</a><span></span>
                        <ul>
                          <li><a href="${contextPath}/brand/brandStory.do">BKC 스토리</a></li>
                          <li><a href="${contextPath}/brand/whybkc.do">WHY BKC</a></li>
                          <li><a href="${contextPath}/brand/newsNewItem.do">BKC NEWS</a></li>
                        </ul>
                    </li>
                    <li><a href="#">고객센터</a>
                        <ul>
                            <li><a href="${contextPath}/customerService/notice.do">공지사항</a></li>
                            <li><a href="#">BKC앱이용안내</a></li>
                            <li><a href="${contextPath}/customerService/faq.do">FAQ</a></li>
                            <li><a href="#">문의</a></li>
                            <li><a href="#">가맹점모집</a></li>
                            <li><a href="#">인재채용</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>

        <!--메인 로고-->
        <div class="m-images">
            <a href="${contextPath}/">
                <img id="m-main-logo" src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/bkclogo.png"
                    alt="bkc mainlogo" />
            </a>
        </div>

        <!--딜리버리 로고-->
        <div class="m-delivery-btn">
            <a href="${contextPath}/delivery/delivery.do">
                <img id="m-delivery-btn-img"
                    src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/icon/delivery/delivery_inf.png" />
            </a>
        </div>
    </div>
</body>
</html>