<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
	<!-- font google web font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <!-- favicon -->
    <link rel="shortcut icon" type="image/x-icon"
    href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />
	<!-- css -->
	<link rel="stylesheet" href="${contextPath}/resources/css/include/delivery-gnb2.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/delivery/delivery2.css">
	
	<!-- js -->
    <script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/resources/js/delivery/delivery2.js"></script>
	
	<title>딜리버리</title>
	<style>
li {
	list-style: none;
}
</style>
<script>
window.onload = function(){
	$("#newMenu").show(); 
}
</script>
</head>
<body>
	<div class="subWrap02">
	<!-- delivery desktop header -->
	<jsp:include page="../include/header/delivery_desktop_header2.jsp"/>
	<!-- desktop delivery page -->
	<!-- contents 부분 -->
        <div class="contentsWrap">
            <div class="locationWrap">
                <div class="web_container">
                    <div class="page_navi">
                        <a href="${contextPath}/delivery/delivery.do">
                            <span>딜리버리</span>
                        </a>
                        <a href="${contextPath}/delivery/delivery.do" class="gotomenu">
                            <span>메뉴</span>
                        </a>
                    </div>
                    <div class="location">
                        <span class="addr">
                        <span>${location.addr} ${location.addr_detail}  ${location.addr_extra}</span>
                        </span>
                        <span class="shop">
                        <span>${location.store_name}</span>
                        </span>
                        <span class="btn">
                        <a href="${contextPath}/delivery/mylocation.do" class="addrchange">
                            <span>변경</span>
                        </a>
                        </span>
                    </div>
                </div>
            </div>
            <div class="contentsBox01">
                <div class="web_container">
                    <div class="subtitWrap">
                        <h3 class="page_tit">메뉴</h3>
                        <div class="tab01">
                            <ul class="item3">
                                <li class="on">
                                    <button type="button" class="button">
                                    <span>new메뉴</span>
                                </button>
                                </li>
                                <li class="">
                                    <button type="button" class="button">
                                    <span>치킨메뉴</span>
                                </button>
                                </li>
                                <li class="">
                                    <button type="button" class="button">
                                    <span>사이드메뉴</span>
                                </button>
                                </li>
                                <li class="">
                                    <button type="button" class="button">
                                    <span>비어존메뉴</span>
                                </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab_cont">
                        <ul class="prdmenu_list" id="newMenu">
                          <c:forEach var="newdv" items="${newdv}">
                            <li>
                                <div class="prd_img">
                                    <span>
                                    <img src="${newdv.path}" alt="신 메뉴" style="display: inline; opacity: 1;">
                                </span>
                                </div>
                                <div class="cont">
                                    <p class="tit">
                                        <strong>${newdv.product_name}</strong>
                                    </p>
                                    <p class="menu_info">
                                        <span>${newdv.description}</span>
                                    </p>
                                    <p class="price">
                                        <strong>
                                        <em>
                                            <span>&#8361;${newdv.price}</span>
                                        </em>
                                    </strong>
                                    </p>
                                </div>
                                <form name="myForm${newdv.product_serial}" action="${contextPath}/delivery/cart.do" method="POST">
									<input type="hidden" name="seq" value="${newdv.product_serial}" />
								</form>
                                <a href="#" onclick="javascript:document.myForm${newdv.product_serial}.submit();" class="btn_detail">
                                    <span>Details</span>
                                </a>
                            </li>
                      	 </c:forEach>
                        </ul>
                        
                        <ul class="prdmenu_list">
                           <c:forEach var="chickendv" items="${chickendv}">
                            <li>                           
                                <div class="prd_img">
                                    <span>
                                    <img src="${chickendv.path}" alt="치킨메뉴" style="display: inline; opacity: 1;">
                                </span>
                                </div>
                                <div class="cont">
                                    <p class="tit">
                                        <strong>${chickendv.product_name }</strong>
                                    </p>
                                    <p class="menu_info">
                                        <span>${chickendv.description}</span>
                                    </p>
                                    <p class="price">
                                        <strong>
                                        <em>
                                            <span>&#8361; ${chickendv.price}</span>
                                        </em>
                                    </strong>
                                    </p>
                                </div>
                                <form name="myForm${chickendv.product_serial}" action="${contextPath}/delivery/cart.do" method="POST">
									<input type="hidden" name="seq" value="${chickendv.product_serial}" />
								</form>
                                <a href="#" onclick="javascript:document.myForm${chickendv.product_serial}.submit();" class="btn_detail">
                                    <span>Details</span>
                                </a>
                                 
                            </li>
                             </c:forEach>
                        </ul>
                        <ul class="prdmenu_list">
                           <c:forEach var="sidedv" items="${sidedv}">
                                <li>
                                <div class="prd_img">
                                    <span>
                                    <img src="${sidedv.path}" alt="사이드메뉴" style="display: inline; opacity: 1;">
                                </span>
                                </div>
                                <div class="cont">
                                    <p class="tit">
                                        <strong>${sidedv.product_name}</strong>
                                    </p>
                                    <p class="menu_info">
                                        <span>${sidedv.description}</span>
                                    </p>
                                    <p class="price">
                                        <strong>
                                        <em><span>&#8361; ${sidedv.price}</span></em>
                                    </strong>
                                    </p>
                                </div>
                               	<form name="myForm${sidedv.product_serial}" action="${contextPath}/delivery/cart.do" method="POST">
									<input type="hidden" name="seq" value="${sidedv.product_serial}" />
								</form>
                                <a href="#" onclick="javascript:document.myForm${sidedv.product_serial}.submit();" class="btn_detail">
                                    <span>Details</span>
                                </a>
                            </li>
                            </c:forEach>
                        </ul>
                        <ul class="prdmenu_list">
                            <c:forEach var="beerdv" items="${beerdv}">
                            <li>
                                <div class="prd_img">
                                    <span>
                                    <img src="${beerdv.path}" alt="비어존메뉴" style="display: inline; opacity: 1;">
                                </span>
                                </div>
                                <div class="cont">
                                    <p class="tit">
                                        <strong>${beerdv.product_name}</strong>
                                    </p>
                                    <p class="menu_info">
                                        <span>${beerdv.description}</span>
                                    </p>
                                </div>
                                <a href="#" class="btn_detail">
                                    <span>Details</span>
                                </a>
                            </li>
                        </c:forEach>
                        </ul>
                    </div>
                    <div class="order_caution">
                        <div class="tit03">
                            <h4 class="WEB">유의사항</h4>
                        </div>
                        <ul class="WEB txtlist01">
                            <li>매장상황 및 거리에 따라 배달비가 발생할 수 있습니다.</li>
                            <li>온라인 주문은 15,000원 이상일때 가능합니다.</li>
                            <li>주문가능 수량은 최대 9개 입니다.</li>
                            <li>온라인 주문은 예약배달이 불가합니다.</li>
                            <li>제주지역 및 일부 매장은 판매 가격이 상이하여 추가금이 발생할 수 있습니다.</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="popWrap">
                <div class="popbox01">
                    <button type="button" class="btn_close" style="z-index: 100;"></button>
                    <div class="popcont pd02">
                        <dl class="addr_chk">
                            <dt>배달지 주소</dt>
                            <dd>
                                <strong style="word-break: break-all;">
                                    <span>${location.addr} ${location.addr_detail} ${location.addr_extra}</span>
                                </strong>
                            </dd>
                            <dd>
                                <strong class="nick"></strong>
                                <span class="txt"></span>
                            </dd>
                        </dl>
                        <p class="txt02">위 배달지로 주문하시겠습니까?</p>
                    </div>
                    <div class="pop_btn c_btn item2">
                        <a href="${contextPath}/delivery/mylocation.do" class="btn02 dark">
                            <span>배달지 변경</span>
                        </a>
                        <a href="#" class="btn02 orange">
                            <span>예</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <jsp:include page="../include/footer/delivery_desktop_footer.jsp"/>
    <a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>