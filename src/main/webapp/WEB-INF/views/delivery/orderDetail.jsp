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
	<link rel="stylesheet" href="${contextPath}/resources/css/delivery/orderDetail.css">
	
	<!-- js -->
    <script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/resources/js/delivery/orderDetail.js"></script>
	
	<title>주문상세</title>
</head>
<body>
	<div class="subWrap02">
	<!-- delivery desktop header -->
	<jsp:include page="../include/header/delivery_desktop_header2.jsp"/>
	<!-- desktop orderDetail page -->
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
                        <a href="#" class="gotomenu">
                            <span>주문상세</span>
                        </a>
                    </div>
                    <div class="location">
                        <span class="addr">
                        <span>${location.addr} ${location.addr_detail}</span>
                        </span>
                        <span class="shop">
                        <span>신논현역점(DB)</span>
                        </span>
                        <span class="btn">
                        <a href="${contextPath}/delivery/mylocation.do" class="addrchange">
                            <span>변경</span>
                        </a>
                        </span>
                    </div>
                </div>
            </div>
            <div class="contentsBox01 bg_w">
                <div class="web_container">
                    <div class="container01">
                        <div class="orderstatusWrap">
                            <div class="resultBox delivery">
                                <span class="tit">
                                    <strong>${order.order_date}</strong>
                                </span>
                                <em class="txt_stat">&nbsp;
                                <span>
									<c:choose>
										<c:when test="${order.order_status eq 1 }">
										주문접수중
										</c:when>
										<c:when test="${order.order_status eq 2 }">
										배달중
										</c:when>
										<c:otherwise>
										주문완료 
										</c:otherwise>
									</c:choose>
								</span>
                                </em>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="contentsBox01">
                <div class="web_container">
                    <div class="container01">
                        <div class="titbox tit01">
                            <h3 class="tit_ico list">
                                <span>주문내역</span>
                            </h3>                            
                        </div>
                        <ul class="order_list">
                        	<c:forEach var="orderDetail" items="${orderDetails}">
                            <li>
                                <div class="prd_img">
                                    <span>
                                        <img src="${orderDetail.path}" alt="제품상세" style="display: inline; opacity: 1;">
                                    </span>
                                </div>
                                <div class="cont">
                                    <p class="tit">
                                        <strong>${orderDetail.product_name}</strong>
                                    </p>
                                    <p class="price">
                                        <strong>
                                            <span>${orderDetail.price}</span>
                                            <span class="unit">원</span>
                                        </strong>
                                    </p>
                                    <div class="menu_info">
                                        <span class="txt">${orderDetail.description}</span>
                                        <span class="order_count tag st03">
                                            <span>수량 ${orderDetail.quantity}개</span>
                                        </span>
                                    </div>
                                </div>
                            </li>
                            </c:forEach>
                            
                        </ul>
                        <h2 class="tit01 tit_ico chicken">
                            <span>주문정보</span>
                        </h2>
                        <div class="container02 pd02 order_list_sum">
                            <div class="titbox02">
                                <p class="tit">
                                    <strong>${order.address}</strong>
                                    <em class="tag_brown">
                                        <span>
                                        <c:choose>
											<c:when test="${order.order_status eq 1 }">
											주문접수중
											</c:when>
											<c:when test="${order.order_status eq 2 }">
											배달중
											</c:when>
											<c:otherwise>
											주문완료 
											</c:otherwise>
										</c:choose>
                                        </span>
                                    </em>
                                </p>
                            </div>
                            <div class="cont">
                                <div class="info">
                                    <dl>
                                        <dt>주문번호</dt>
                                        <dd>
                                            <strong>${order.order_serial}</strong>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>주문시간</dt>
                                        <dd>
                                            <strong>${order.order_date}</strong>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>연락처</dt>
                                        <dd>
                                            <strong>${order.phonenumber}</strong>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>매장</dt>
                                        <dd>
                                            <strong>${order.store_name}</strong>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>매장 전화번호</dt>
                                        <dd>
                                            <strong>매장번호</strong>
                                        </dd>
                                    </dl>
                                    <dl class="cancelInfo" style="display: none;">
                                        <dt>취소사유</dt>
                                        <dd>
                                            <span></span>
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                        <h2 class="tit01 tit_ico money">
                            <span>결제내역</span>
                        </h2>
                        <div class="container02 pd02">
                            <div class="order_payment_list w_st02">
                                <div>
                                    <dl>
                                        <dt>주문금액</dt>
                                        <dd>
                                            <span>
                                            <c:choose>
                                            <c:when test="${order.coupon_seq eq -1}">
												${order.total_price}
											</c:when>
											<c:otherwise>
												${order.total_price + usedUsercoupon.price}
											</c:otherwise>
											</c:choose>
											</span>
                                            <span class="unit">원</span>
                                        </dd>
                                    </dl>
                                    <dl class="group">
                                        <dt>쿠폰</dt>
                                        <dd>
                                            <span>
                                            <c:choose>
                                            <c:when test="${order.coupon_seq eq -1}">
												0
											</c:when>
											<c:otherwise>
												${usedUsercoupon.price}
											</c:otherwise>
											</c:choose>
                                            </span>
                                            <span class="unit">원</span>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>결제방법</dt>
                                        <dd>
                                            <span>
		                                        <c:choose>
													<c:when test="${order.payment_type eq '1' }">
													쿠폰결제 
													</c:when>
													<c:otherwise>
														${order.payment_type} 
													</c:otherwise>
												</c:choose>
                                            </span>
                                        </dd>
                                    </dl>
                                    <dl class="tot02">
                                        <dt>결제금액</dt>
                                        <dd>
                                            <em>
                                                <span>${order.total_price}</span>
                                                <span class="unit">원</span>
                                            </em>
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="c_btn m_itme2"></div>
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