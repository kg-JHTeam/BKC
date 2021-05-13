<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
	<!--font-->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	<!--fabicon-->
	<link rel="shortcut icon" type="image/x-icon" href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />
	
	<!-- css -->
	<link rel="stylesheet" href="${contextPath}/resources/css/include/main-gnb.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/subpages/menuInform/menuInform.css">
	
	<!-- js -->
	<script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script> 
	<script src="${contextPath}/resources/js/include/main-gnb.js"></script>
	<script src="${contextPath}/resources/js/subpages/menuInform/menuInform.js"></script>
	
	<title>메뉴정보목록</title>
</head>
<body>
    <div class="menuWrap">
        <!-- header 들어갈 자리 -->
        <jsp:include page="../../include/header/main_desktop_header.jsp" />
        <div class="menuContentsWrap">
            <div class="WEB locationWrap">
                <div class="Web_container">
                    <div class="page_navi">
                        <a href="${contextPath }/">
                          <span>  HOME</span>
                        </a>>
                        <a href="${contextPath }/menuInform/beerZone.do">
                        	<span>메뉴소개</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="menu_contentsBox01 bg_w">
                <div class="menu_container">
                    <div class="menu_subtitWrap">
                        <h3 class="page_tit">메뉴소개</h3>
                        <div class="tab01">
                            <ul>
                               <li class="off">
                                    <button type="button">
                                        <a href="${contextPath}/menuInform/newMenu.do">new메뉴</a>
                                    </button>
                                </li>
                                <li class="off">
                                    <button type="button">
                                        <a href="${contextPath}/menuInform/chickenMenu.do">치킨메뉴</a>
                                    </button>
                                </li>
                                <li class="off">
                                    <button type="button">
                                        <a href="${contextPath}/menuInform/sideMenu.do">사이드 메뉴</a>
                                    </button>
                                </li>                               
                                <li class="on">
                                    <button type="button">
                                        <a href="${contextPath}/menuInform/beerZone.do">비어존 메뉴</a>
                                    </button>
                                </li>
                                
                            </ul>
                        </div>
                    </div>
                    <div class="tab_cont">
                        <ul class="menu_list">
                        <c:forEach var="beerzoneList" items="${beerzoneList}">
                            <li>
                                <div class="menu_list_img">
                                    <span>
                                        <img src="${beerzoneList.path}" class style="display: inline; opacity: 1;" >
                                    </span>
                                </div>
                                <div class="cont">
                                    <p class="tit">
                                        <strong>${beerzoneList.product_name}</strong>
                                    </p>
                                </div>
                                <a href="${contextPath}/menuInform/beerzonedetail.do?product_serial=${beerzoneList.product_serial}" class="btn_detail">
                           
                                    <span>Details</span>
                                </a>         
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer 들어갈 자리 -->
    </div>
	<jsp:include page="../../include/footer/main_desktop_footer.jsp"/>
    
    <a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>

</html>