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
	<link rel="stylesheet" href="${contextPath}/resources/css/guest/guestOrder.css">
	
	<!-- js -->
    <script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/resources/js/guest/guestOrder.js"></script>
	
	<title>비회원 주문하기</title>
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
                        <a href="${contextPath}/guestOrder.do" class="gotomenu">
                            <span>주문하기</span>
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
            <div class="contentsBox02">
                <div class="web_container2">
                    <div class="subtitWrap">
                        <h2 class="page_tit">주문하기</h2>
                    </div>
                    <div class="container01 orderWrap">
                        <h2 class="tit01 tit_ico delivery">
                            <span>배달정보</span>
                        </h2>
                        <div class="container02 deli_info01">
                            <div class="addrWrap01">
                                <p class="txt_addr">
                                    <span>서울특별시 서초구 잠원로 117 (잠원동, 아크로리버뷰신반포)</span>
                                    <span></span>
                                </p>
                                <button type="button" class="btn04 h02">
                                    <span>변경</span>
                                </button>
                            </div>
                            <div class="info_list">
                                <dl>
                                    <dt>연락처</dt>
                                    <dd>
                                        <input type="text" maxlength="20">
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>매장</dt>
                                    <dd>
                                        <input type="text" readonly="readonly">
                                    </dd>
                                </dl>
                                <dl class="memo">
                                    <dt>요청사항</dt>
                                    <dd>
                                        <div class="inp_bytes">
                                            <div>
                                                <input type="text" placeholder="요청사항을 입력하세요" maxlength="50">
                                            </div>
                                        </div>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <div class="tit01 tit_ico chicken tit_ordermenu">
                            <h2>
                                <span>주문정보</span>
                            </h2>
                        </div>
                        <div class="container02 order_accWrap open">
                            <div class="acc_tit">
                                <p class="tit">
                                    <strong>
                                        <span>바삭클</span>
                                    </strong>
                                </p>
                            </div>
                            <ul class="cart_list01">
                                <li>
                                    <div class="cont">
                                        <div class="menu_titWrap">
                                            <div class="menu_name">
                                                <p class="tit">
                                                    <strong>
                                                    <span>바삭클</span>
                                                </strong>
                                                </p>
                                                <span class="price">
                                                <strong>
                                                    <span>15,000</span>
                                                </strong>
                                                </span>
                                            </div>
                                            <div class="prd_img">
                                                <span>
                                                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/colpop.png" alt="제품" style="display: inline; opacity: 1;">
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
                                        <dl class="discount">
                                            <dt>
                                            <em>쿠폰할인</em>
                                        </dt>
                                            <dd>
                                                <strong>
                                                <em>
                                                    -<span>0</span>
                                                    <span class="unit">원</span>
                                                </em>
                                            </strong>
                                            </dd>
                                        </dl>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <h2 class="tit01 tit_ico money">
                            <span>최종 결제금액</span>
                        </h2>
                        <div class="container02">
                            <div class="order_payment_list">
                                <dl class="tot">
                                    <dt>최종 결제금액</dt>
                                    <dd>
                                        <em>
                                            <span>15,000</span>
                                            <span class="unit">원</span>
                                        </em>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>제품금액</dt>
                                    <dd>
                                        <span>15,000</span>
                                        <span class="unit">원</span>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>할인금액</dt>
                                    <dd>
                                        <span>0</span>
                                        <span class="unit">원</span>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <div class="WEB tit01 titbox">
                            <h2 class="tit_ico payment">
                                <span>결제 수단 선택</span>
                            </h2>
                            <div class="tab01 rcen_btn">
                                <ul>
                                    <li class="on">
                                        <button type="button">
                                            <span>간편결제</span>
                                        </button>
                                    </li>
                                    <li>
                                        <button type="button">
                                            <span>카드결제</span>
                                        </button>
                                    </li>
                                    <li>
                                        <button type="button">
                                            <span>만나서 결제</span>
                                        </button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="payment_tabcont">
                            <h3 class="tit01 tit_ico payment">
                                <span>간편하게 결제</span>
                            </h3>
                            <div class="container02">
                                <ul class="easy_payment_list">
                                    <li class="naver">
                                        <label>
                                            <input type="radio" name="paymentType">
                                            <span>네이버페이</span>
                                        </label>
                                    </li>
                                    <li class="kakao">
                                        <label>
                                            <input type="radio" name="paymentType">
                                            <span>카카오페이</span>
                                        </label>
                                    </li>
                                </ul>
                                <ul class="txtlist03">
                                    <li>· 주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.</li>
                                    <li>· 네이버페이는 네이버ID로 별도 앱 설치 없이 신용카드 또는 은행계좌 정보를 등록하여 네이버페이 비밀번호로 결제할 수 있는 간편결제 서비스입니다.</li>
                                    <li>· 결제 가능한 신용카드: 신한, 삼성, 현대, BC, 국민, 하나, 롯데, NH농협, 씨티</li>
                                    <li>· 결제 가능한 은행: NH농협, 국민, 신한, 우리, 기업, SC제일, 부산, 경남, 수협, 우체국, 미래에셋대우, 광주, 대구, 전북, 새마을금고, 제주은행, 신협, 하나은행</li>
                                    <li>· 네이버페이 카드 간편결제는 네이버페이에서 제공하는 카드사별 무이자, 청구할인 혜책을 받을 수 있습니다.</li>
                                </ul>
                            </div>
                        </div>
                        <div class="payment_tabcont w_none">
                            <h3 class="tit01 tit_ico phone">
                                <span>카드결제</span>
                            </h3>
                            <div class="container02">
                                <div class="check_list01">
                                    <label>
                                        <input type="radio" name="paymentType">
                                        <span>신용카드 결제</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="payment_tabcont w_none">
                            <h3 class="tit01 tit_ico deliveryman">
                                <span>만나서 결제</span>
                            </h3>
                            <div class="container02">
                                <ul class="check_list01">
                                    <li>
                                        <label>
                                            <input type="radio" name="paymentType">
                                            <span>현장에서 신용카드 결제</span>
                                        </label>
                                    </li>
                                    <li>
                                        <label>
                                            <input type="radio" name="paymentType">
                                            <span>현장에서 현금 결제</span>
                                        </label>
                                        <ul>
                                            <li>
                                                <label>
                                                    <input type="checkbox">
                                                    <span>현금영수증</span>
                                                </label>
                                                <span>
                                                    <input type="tel" placeholder="현금영수증 발급정보 입력" maxlength="20">
                                                </span>
                                            </li>
                                            <li>
                                                <label>
                                                    <input type="checkbox" name="">
                                                    <span>5만원권</span>
                                                </label>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="totamountWrap">
                            <dl>
                                <dt>총 결제금액</dt>
                                <dd>
                                    <strong>&#8361;15,000</strong>
                                </dd>
                            </dl>
                            <div class="c_btn m_item2">
                                <a href="#" class="btn01">
                                    <span>취소</span>
                                </a>
                                <a href="${contextPath}/guestOrderComplete.do" class="btn01 orange">
                                    <span>결제하기</span>
                                </a>
                            </div>
                        </div>
                        <div class="WEB order_caution">
                            <div class="tit03">
                                <h4>유의사항</h4>
                            </div>
                            <ul class="txtlist01">
                                <li>매장별 주문금액이 상이하니, 반드시 최소금액을 확인하기 바랍니다.</li>
                                <li>배달 소요시간은 기상조건이나 매장 사정상 지연 또는 제한될 수 있습니다.</li>
                                <li>고객님과 수 차례 연락을 시도한 후 연락이 되지 않을 경우 배달음식이 변질되거나 부패될 우려로 식품위생법상 위반될 여지가 있어 별도로 보관하지 않으며, <strong>재배달 또는 환불처리가 어려울 수 있습니다.</strong></li>
                                <li>대량 주문의 경우 콜센터(1577-5577)주문으로만 가능합니다.</li>
                                <li>주문 완료 후 변경 및 취소는 콜센터(1577-557)에서만 가능합니다.</li>
                            </ul>
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