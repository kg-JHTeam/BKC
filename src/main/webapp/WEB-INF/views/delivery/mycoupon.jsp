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
	<link rel="stylesheet" href="${contextPath}/resources/css/delivery/mybkc.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/delivery/mycoupon.css">
	
	<!-- js -->
    <script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/resources/js/delivery/mybkc.js"></script>
	
	<title>쿠폰</title>
	<style>
	.info #dl1 {
    	width: 20%;
	}
	.info #dl2 {
    	width: 30%;
	}
	.info #dl3 {
    	width: 50%;
	}
	</style>
	<script>
	window.onload = function(){
		var count = "<c:out value='${realcouponcount}' />";
		var zero = document.getElementById("zerccoupon");
		if(count == 0){
			zero.style.display ='';
		} else{
			zero.style.display ='none';
		}
	}
	</script>
</head>
<body>
	<div class="subWrap02">
	<!-- delivery desktop header -->
	<jsp:include page="../include/header/delivery_desktop_header2.jsp"/>
	<!-- desktop mybkc page -->
	<!-- contents 부분 -->
        <div class="contentsWrap">
            <div class="locationWrap">
                <div class="web_container2">
                    <div class="page_navi">
                        <a href="${contextPath}/delivery/delivery.do">
                            <span>딜리버리</span>
                        </a>
                        <a href="${contextPath}/delivery/mybkc.do" class="gotomenu">
                            <span>MYBKC</span>
                        </a>
                        <a href="${contextPath}/delivery/mybkc.do" class="gotomenu">
                            <span>MY쿠폰</span>
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
            
           			<c:set var="count" value="${couponcount}" />
			        <div class="contentsBox01">
						<div class="web_container2">
							<div class="subtitWrap m_bg_basic">
								<h2 class="page_tit">딜리버리 쿠폰</h2>
								<div class="r_option txt01">
									<strong><em>${count}개</em></strong> 
									<span>의 쿠폰이 있습니다.</span>
								</div>
							</div>
							<c:forEach var="usercoupon" items="${usercoupons}">
	                          <div class="container02 pd02 order_list_sum">
	                              <div class="cont">
	                                  <div class="info">
	                                      <dl id="dl1">
	                                          <dt>쿠폰번호</dt>
	                                          <dd>
	                                              <strong>${usercoupon.coupon_number}</strong>
	                                          </dd>
	                                      </dl>
	                                      <dl id="dl2">
	                                          <dt>쿠폰종류</dt>
	                                          <dd>
	                                              <strong>${usercoupon.coupon_title}</strong>
	                                          </dd>
	                                      </dl>
	                                      <dl id="dl3">
	                                          <dt>쿠폰발행날짜</dt>
	                                          <dd>
	                                              <strong>${usercoupon.startdate}</strong>
	                                          </dd>
	                                      </dl>
	                                       <dl id="dl3">
	                                          <dt>사용여부 </dt>
	                                          <dd>
	                                              <strong>
	                                           	 	<c:choose>
														<c:when test="${usercoupon.use_status eq -1 }">
															사용완료
														</c:when>
														<c:otherwise>
															미사용
														</c:otherwise>
													</c:choose>  
	                                              </strong>
	                                          </dd>
	                                      </dl>
	                                  </div>
	                              </div>
	                          </div>
	                          </c:forEach>
							<div class="container03" style="display:none" id="zerccoupon">
								<div class="nodata1">
									<p>쿠폰목록이 없습니다.</p>
									<ul class="coupon_list1"></ul>
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