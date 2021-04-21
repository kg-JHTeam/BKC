<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <!--font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	
	<!--fabicon-->
    <link rel="shortcut icon" type="image/x-icon" href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />
	
	<!-- menuInformdetail.css-->
    <link rel="stylesheet" href="${contextPath }/resources/css/include/main-gnb.css">
    <link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/subpages/menuInform/menuInformdetail.css">
    
    <!--slick & jQuery-->
    <link rel="stylesheet" href="${contextPath }/resources/slick/slick.css">
    <link rel="stylesheet" href="${contextPath }/resources/slick/slick-theme2.css">
    <script src="${contextPath }/resources/jquery/jquery-3.6.0.min.js"></script>
    <script src="${contextPath }/resources/slick/slick.js"></script>
    <script src="${contextPath }/resources/slick/slide2.js"></script>
	
	<!-- js -->
    <script src="${contextPath }/resources/js/subpages/menuInform/menuInformdetail.js"></script>
    <script src="${contextPath }/resources/js/include/main-gnb.js"></script>
	<title>메뉴 정보 상세</title>
</head>
<body>
<div class="menudetailWrap">
        <!-- header 들어갈 자리 -->
        <jsp:include page="../../include/header/main_desktop_header.jsp"/>
        <div style="height: 100px"></div>
         <div class="menudetaillocationWrap">
            <div class="menudetailcontainer">
                <div class="menudetailpage_navi">
                    <a href="${contextPath }/">
                        <span>HOME</span>
                    </a>
                    <a href="#" class="arrow">
                        <span>메뉴소개</span>
                    </a>
                    <a href="${contextPath}/menuInform/chickenMenu.do" class="arrow">
                        <span>치킨메뉴</span>
                    </a>
                    <a href="${contextPath}/menuInform/chickenmenudetail.do" class="arrow">
                        <span>바삭클</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="menudetailcontentsbox02">
            <div class="menudetailweb_container">
                <div class="intro_txt">
                    <strong class="tit">
                        <span>바삭클</span>
                    </strong>
                    <p class="subtxt">
                        <span>담백깔끔! 정직하게 튀겨낸 BHC 후라이드에 바삭함을 더한 옛날 통닭의 귀환</span>
                    </p>
                </div>

            </div>
        </div>
        <div class="menuInformdetail_subinfoWrap">
            <div class="web_container">
                <a href="${contextPath}/menuInform/chickenMenu.do" class="btn_back">
                    <span>메뉴 목록으로 돌아가기</span>
                </a>
                <a href="#" class="allergy">
                    <button type="button" class="allergy_btn">
                        <span>알레르기 정보</span>
                    </button>
                </a>
            </div>
        </div>
        <div class="menudetailcontents">
            <div class="web_container">
                <div class="txt_menudetailintro" style="display: none;">
                    <span></span>
                </div>
                <ul class="prd_submenu">
                    <li>
                        <div class="prd_img">
                            <span>
                                <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/chicken/basak.png">
                            </span>
                        </div>
                        <div class="cont">
                            <p class="tit">
                                <strong>바삭클</strong>
                            </p>
                            <p class="tit_content">
                                <span>담백깔끔! 정직하게 튀겨낸 BHC 후라이드에 바삭함을 더한 옛날 통닭의 귀환</span>
                            </p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="other_menuWrap">
            <div class="web_container">
                <div class="titbox">
                    <h3>치킨메뉴의 다른 메뉴</h3>
                    <div class="othermenu_slider">
                        <div class="slide">
                            <div class="slider prd_img responsive">
                                <a href="#" class="btn_detail">
                                    <span style="display: block;">
                                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/chicken/basak.png">
                                    <div class="cont">
                                        <p class="tit">
                                           <strong>바삭클</strong>
                                        </p>
                                    </div>                                   
                                </span>
                                </a>
                                <a href="#" class="btn_detail">
                                    <span style="display: block;">
                                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/chicken/basak.png">
                                    <div class="cont">
                                        <p class="tit">
                                            <strong>바삭클</strong>
                                        </p>
                                    </div>
                                </span>
                                </a>
                                <a href="#" class="btn_detail">
                                    <span style="display: block;">
                                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/chicken/basak.png">
                                    <div class="cont">
                                        <p class="tit">
                                            <strong>바삭클</strong>
                                        </p>
                                    </div>
                                </span>
                                </a>
                                <a href="#" class="btn_detail">
                                    <span style="display: block;">
                                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/chicken/basak.png">
                                    <div class="cont">
                                        <p class="tit">
                                            <strong>바삭클</strong>
                                        </p>
                                    </div>
                                </span>
                                </a>
                                <a href="#" class="btn_detail">
                                    <span style="display: block;">
                                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/chicken/basak.png">
                                    <div class="cont">
                                        <p class="tit">
                                            <strong>바삭클</strong>
                                        </p>
                                    </div>
                                </span>
                                </a>
                                <a href="#" class="btn_detail">
                                    <span style="display: block;">
                                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/chicken/basak.png">
                                    <div class="cont">
                                        <p class="tit">
                                            <strong>바삭클</strong>
                                        </p>
                                    </div>
                                </span>
                                </a>
                                <a href="#" class="btn_detail">
                                    <span style="display: block;">
                                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/chicken/basak.png">
                                    <div class="cont">
                                        <p class="tit">
                                            <strong>바삭클</strong>
                                        </p>
                                    </div>
                                </span>
                                </a>
                                <a href="#" class="btn_detail">
                                <span style="display: block;">
                                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/chicken/basak.png">
                                    <div class="cont">
                                        <p class="tit">
                                            <strong>바삭클</strong>
                                        </p>
                                    </div>
                                </span>
                                </a>
                                <a href="#" class="btn_detail">
                                    <span style="display: block;">
                                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/chicken/basak.png">
                                    <div class="cont">
                                        <p class="tit">
                                            <strong>바삭클</strong>
                                        </p>
                                    </div>
                                </span>
                                </a>                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer들어갈 자리 -->
    </div>
        <jsp:include page="../../include/footer/main_desktop_footer.jsp"/>

    <a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>