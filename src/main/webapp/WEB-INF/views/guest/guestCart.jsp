<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
	<link rel="stylesheet" href="${contextPath}/resources/css/include/guestdelivery-gnb.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/guest/guestCart.css">
	
	<!-- js -->
    <script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/resources/js/guest/guestCart.js"></script>
	
	<title>비회원 카트</title>
</head>
<body>
	<div class="subWrap02">
	<!-- delivery desktop header -->
	<jsp:include page="../include/header/guestdelivery_desktop_header.jsp"/>
	 <!-- contents 부분 -->
        <div class="contentsWrap">
            <div class="locationWrap">
                <div class="web_container">
                    <div class="page_navi">
                        <a href="${contextPath}/guestdelivery.do">
                            <span>딜리버리</span>
                        </a>
                        <a href="${contextPath}/guestCart.do" class="gotomenu">
                            <span>카트</span>
                        </a>
                    </div>
                    <div class="location">
                        <span class="addr">
                        <span>서울특별시 서초구 잠원로 117 (잠원동, 아크로리버뷰신반포)(DB)</span>
                        </span>
                        <span class="shop">
                        <span>신논현역점(DB)</span>
                        </span>
                        <span class="btn">
                        <a href="#" class="addrchange">
                            <span>변경</span>
                        </a>
                        </span>
                    </div>
                </div>
            </div>
            <div class="contentsBox01">
                <div class="web_container2">
                    <div class="subtitWrap">
                        <h2 class="page_tit">딜리버리 카트</h2>
                    </div>
                    <div class="nodata" style="display: none;">
                        <span class="txt_c01">카트에 담긴 메뉴가 없습니다.</span>
                        <div class="c_btncart">
                            <button type="button" class="btn01 ico add">
                                <span>메뉴추가</span>
                            </button>
                        </div>
                    </div>
                    <div class="container02 cartWrap">
                        <ul class="cart_list01">
                            <li class="contWrap">
                                <div class="cont">
                                    <div class="menu_titWrap">
                                        <label class="menu_name">
                                            <span class="tit">
                                                <strong>
                                                    <span>바삭클</span>
                                                </strong>
                                            </span>
                                            <span class="price">
                                                <strong>
                                                    <span>15,000</span>
                                                    <span class="unit">원</span>
                                                </strong>
                                            </span>
                                        </label>
                                        <div class="prd_img">
                                            <span>
                                                <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/basak.png" alt="제품" style="display: inline; opacity: 1;">
                                            </span>
                                        </div>
                                    </div>
                                    <div class="quantity">
                                        <strong class="tit">수량</strong>
                                        <div class="num_set">
                                            <button type="button" class="btn_minus" onclick="fnCalCount('m', this);">
                                                <span>-</span>
                                            </button>
                                            <input type="number" class="first_menu" readonly="readonly" value="1">
                                            <button type="button" class="btn_plus" onclick="fnCalCount('p', this);">
                                                <span>+</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="sumWrap">
                                    <dl>
                                        <dt>합계금액</dt>
                                        <dd>
                                            <strong>
                                                <em>
                                                    <span>15,000</span>
                                                    <span class="unit">원</span>
                                                </em>
                                            </strong>
                                        </dd>
                                    </dl>
                                    <dl class="discount" style="display: none;">
                                        <dt>
                                            <em>쿠폰할인</em>
                                        </dt>
                                        <dd>
                                            <strong>
                                                <em>-
                                                    <span>0</span>
                                                    <span class="unit">원</span>
                                                </em>
                                            </strong>
                                        </dd>
                                    </dl>
                                </div>
                                <button type="button" class="btn_del02" onclick="deleteRow(this);">
                                    <span>Delete menu</span>
                                </button>
                            </li>
                            <li class="contWrap">
                                <div class="cont">
                                    <div class="menu_titWrap">
                                        <label class="menu_name">
                                            <span class="tit">
                                                <strong>
                                                    <span>콜팝치킨</span>
                                                </strong>
                                            </span>
                                            <span class="price">
                                                <strong>
                                                    <span>2,500</span>
                                                    <span class="unit">원</span>
                                                </strong>
                                            </span>
                                        </label>
                                        <div class="prd_img">
                                            <span>
                                                <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/colpop.png" alt="제품" style="display: inline; opacity: 1;">
                                            </span>
                                        </div>
                                    </div>
                                    <div class="quantity">
                                        <strong class="tit">수량</strong>
                                        <div class="num_set">
                                            <button type="button" class="btn_minus" onclick="fCalCount('m', this);">
                                                <span>-</span>
                                            </button>
                                            <input type="number" class="second_menu" readonly="readonly" value="1">
                                            <button type="button" class="btn_plus" onclick="fCalCount('p', this);">
                                                <span>+</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="sumWrap">
                                    <dl>
                                        <dt>합계금액</dt>
                                        <dd>
                                            <strong>
                                                <em>
                                                    <span>2,500</span>
                                                    <span class="unit">원</span>
                                                </em>
                                            </strong>
                                        </dd>
                                    </dl>
                                    <dl class="discount" style="display: none;">
                                        <dt>
                                            <em>쿠폰할인</em>
                                        </dt>
                                        <dd>
                                            <strong>
                                                <em>-
                                                    <span>0</span>
                                                    <span class="unit">원</span>
                                                </em>
                                            </strong>
                                        </dd>
                                    </dl>
                                </div>
                                <button type="button" class="btn_del02" onclick="deleteRow(this);">
                                    <span>Delete menu</span>
                                </button>
                            </li>
                        </ul>
                        <div class="sumWrap">
                            <dl>
                                <dt>총 주문금액</dt>
                                <dd>
                                    <strong>
                                        <em>
                                            <span>17,500</span>
                                            <span class="unit">원</span>
                                        </em>
                                    </strong>
                                </dd>
                            </dl>
                        </div>
                        <div class="cartinfo">
                            <div class="c_btncartinfo item2" style="width: 400px;">
                                <a href="${contextPath}/guest/guestdelivery.do" class="btn01 m ico add">
                                    <span>메뉴추가</span>
                                </a>
                                <a href="${contextPath}/guestOrder.do" class="btn01 m orange">
                                    <span>주문하기</span>
                                </a>
                            </div>
                            <ul class="txtlist01">
                                <li>
                                    주문서를 작성하기 전에 선택하신 상품명, 수량 및 가격이 정확한지 확인해주세요.
                                </li>
                            </ul>
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