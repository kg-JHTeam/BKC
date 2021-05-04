<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delivery_desktop_header</title>
</head>
<body>
	<!-- header -->
	<div class="headerWrap">
            <div class="head_menuWrap">
                <div class="web_container">
                    <h1 class="WEB logo">
                        <span>딜리버리</span>
                    </h1>
                    <div class="WEB utilWrap">
                        <a href="${contextPath}/">
                            <span>브랜드홈</span>
                        </a>
                        <a href="${contextPath}/logout">
                            <span>로그아웃</span>
                        </a>
                        <a href="${contextPath}/delivery/mybkc.do">
                            <span>MYBKC</span>
                        </a>
                        <a href="${contextPath}/customerService/notice.do">
                            <span>고객센터</span>
                        </a>
                    </div>
                    <div class="WEB on_cont user">
                        <p>
                            <span>${user.name }</span> 님 안녕하세요
                        </p>
                        <a href="${contextPath}/delivery/mybkc.do">
                            <strong>MYBKC 바로가기</strong>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="WEB on_cont head_personalWrap">
            <div class="web_container">
                <div class="personal_logon">
                    <a href="${contextPath}/delivery/orderList.do">
                        <div class="personal_order">
                            <dl>
                                <dt>
                                    <strong>딜리버리 주문내역</strong>
                                </dt>
                                <dd>
                                 <c:choose>
							         <c:when test ="${nowOrderStatus eq '주문내역이 없습니다.'}">
							        	 <span>${nowOrderStatus}</span>
							         </c:when>
							         <c:otherwise>
							        	<span style="color:#ffa423;">${nowOrderStatus}</span>
							         </c:otherwise>
							     </c:choose>
                                </dd>
                            </dl>
                        </div>
                    </a>
                    <a href="${contextPath}/delivery/cart.do">
                        <div class="personal_cart">
                            <dl>
                                <dt>
                                    <strong>카트</strong>
                                    <em class="count" style="display: none;">
                                        <span>${cart.productCount}</span>
                                    </em>
                                </dt>
                                <dd>
                                <c:choose>
							         <c:when test = "${cart.productCount <= 0}">
							        	 <span>카트에 담은 상품이 없습니다.</span>
							         </c:when>
							         <c:when test = "${cart.productCount == 1}">
							        	<span style="color:#ffa423;">${cart.productMainTitle}</span>
							         </c:when>
							         <c:otherwise>
							        	<span style="color:#ffa423;">${cart.productMainTitle} 외  ${cart.productCount-1}</span>
							         </c:otherwise>
							     </c:choose>
                                </dd>
                            </dl>
                        </div>
                    </a>
                </div>
            </div>
        </div>
</body>
</html>