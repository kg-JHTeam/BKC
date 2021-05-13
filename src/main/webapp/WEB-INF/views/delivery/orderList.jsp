<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<link rel="stylesheet" href="${contextPath}/resources/css/delivery/orderList.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/delivery/cart.css">
	<!-- js -->
    <script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/resources/js/delivery/orderList.js"></script>
	
	<title>주문목록</title>
	<script>
	window.onload = function(){
		//아무것도 없는 경우
		var count = "<c:out value='${orders[0].productCount}'/>";
		var zero = document.getElementById("zeroorder");
		var notzero = document.getElementById("existorder");

		//아무것도없으면
		if(count <= 0){
			zero.style.display ='';
			notzero.style.display ='none';
		} 
		//있으면
		else{
			zero.style.display ='none';
			notzero.style.display ='';
		}
	}
	</script>
</head>
<body>
	<div class="subWrap02">
	<!-- delivery desktop header -->
	<jsp:include page="../include/header/delivery_desktop_header2.jsp"/>
	<!-- desktop orderList page -->
	 <!-- contents 부분 -->
        <div class="contentsWrap">
            <div class="locationWrap">
                <div class="web_container">
                    <div class="page_navi">
                        <a href="${contextPath}/delivery/delivery.do">
                            <span>딜리버리</span>
                        </a>
                        <a href="${contextPath}/delivery/mybkc.do" class="gotomenu">
                            <span>MYBKC</span>
                        </a>
                        <a href="${contextPath}/delivery/orderList.do" class="gotomenu">
                            <span>주문내역</span>
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
                        <h2 class="page_tit">주문내역</h2>
                        <div class="tab01">
                            <ul class="item2">
                                <li class="on">
                                    <button type="button" class="button">
                                        <span>딜리버리</span>
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="nodata" style="display: none;" id="zeroorder">
		                  <span class="txt_c01">주문내역이 없습니다.</span>
		            </div>
                    <div class="container01">
                        <div class="tab_cont">
                            <h3 class="hide">딜리버리</h3>
                            <ul class="order_list" id="existorder">
                            <c:forEach var="order" items="${orders}">
                                <li>
                                    <div class="prd_img">
                                        <span>
                                            <img src='${order.path}'" alt="주문상품" style="display: inline; opacity: 1;">
                                        </span>
                                    </div>
                                    <div class="cont">
                                        <p class="tit">
                                            <strong>
                                            	${order.product_name}<!-- 대표 메뉴 이름  -->
                                            		<c:choose>
														<c:when test="${order.productCount eq 1 }">
														<!-- 주문내역 메뉴 한건  -->
														</c:when>
														<c:otherwise>
														외 ${order.productCount-1}건
														</c:otherwise>
													</c:choose>
                                            		</strong>
                                            <em class="tag">
                                                <span>
                                                	<c:choose>
														<c:when test="${order.order_status eq 1 }">
															주문접수중
														</c:when>
														<c:when test="${order.order_status eq 2 }">
														          배달중
														</c:when>
														<c:when test="${order.order_status eq -1 }">
														          주문취소
														</c:when>
														<c:otherwise>
															주문완료 
														</c:otherwise>
													</c:choose>
                                                </span>
                                            </em>
                                        </p>
                                        <div class="info">
                                            <dl>
                                                <dt>주문번호</dt>
                                                <dd>
                                                    <span>${order.order_serial}</span>
                                                </dd>
                                            </dl>
                                            <dl>
                                                <dt>주문시간</dt>
                                                <dd>
                                                    <span>
                                                    <fmt:formatDate type="both" value="${order.order_date}"
													pattern="yyyy-MM-dd HH:mm:ss" />
                                                    </span>
                                                </dd>
                                            </dl>
                                        </div>
                                    </div>
                                    <a href="${contextPath}/delivery/orderDetail.do?order_serial=${order.order_serial}" class="btn_detail">
                                        <span>Details</span>
                                    </a>
                                </li>
                                </c:forEach>
                            </ul>
                            
                            <div class="c_btn">
                                <div>
                                    <a href="#" class="btn01 more" style="display: none;">
                                        <span>더보기</span>
                                    </a>
                                </div>
                            </div>
                        </div>
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