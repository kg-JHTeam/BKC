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
	<link rel="stylesheet" href="${contextPath}/resources/css/delivery/mySet.css">
	
	<!-- js -->
    <script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/resources/js/delivery/mySet.js"></script>
	
	<title>마이세트</title>
</head>
<body>
	<div class="subWrap02">
	<!-- delivery desktop header -->
	<jsp:include page="../include/header/delivery_desktop_header2.jsp"/>
	<!-- desktop mySet page -->
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
                        <a href="${contextPath}/delivery/mySet.do" class="gotomenu">
                            <span>MY세트</span>
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
                        <h2 class="page_tit">MY세트</h2>
                    </div>
                    <div class="nodata st03" style="display: none;">
                        <p>등록된 MY세트가 없습니다</p>
                    </div>
                    <div class="container01">
                        <div class="myset_list">
                            <div>
                                <label class="option_chk">
                                    <input type="radio" name="chk" value="1">
                                    <span>기본메뉴</span>
                                </label>
                                <ul class="cart_list01">
                                    <li>
                                        <div class="cont">
                                            <div class="menu_titWrap">
                                                <div class="menu_name">
                                                    <span class="tit">
                                                        <strong>
                                                            <span>바삭클</span>
                                                    </strong>
                                                    </span>
                                                    <p class="set_info">
                                                        <span></span>
                                                    </p>
                                                    <span class="price">
                                                        <strong>
                                                            <span>15,000</span><span class="unit">원</span>
                                                    </strong>
                                                    </span>
                                                </div>
                                                <div class="prd_img">
                                                    <span>
                                                        <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/basak.png" alt="제품" style="display: inline; opacity: 1;">
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="setmenu_detail">
                                                <dl>
                                                    <dt>다른치킨메뉴</dt>
                                                    <dd>
                                                        <ul class="list">
                                                            <li>없음</li>
                                                        </ul>
                                                        <a href="#" type="button" class="btn04 h02 btn_edit">
                                                            <span>변경</span>
                                                        </a>
                                                    </dd>
                                                </dl>
                                                <dl>
                                                    <dt>다른사이드메뉴</dt>
                                                    <dd>
                                                        <ul class="list">
                                                            <li>없음</li>
                                                        </ul>
                                                        <a href="#" type="button" class="btn04 h02 btn_edit">
                                                            <span>변경</span>
                                                        </a>
                                                    </dd>
                                                </dl>
                                                <dl>
                                                    <dt>다른비어존메뉴</dt>
                                                    <dd>
                                                        <ul class="list">
                                                            <li>없음</li>
                                                        </ul>
                                                        <a href="#" type="button" class="btn04 h02 btn_edit">
                                                            <span>변경</span>
                                                        </a>
                                                    </dd>
                                                </dl>
                                                <dl class="sum">
                                                    <dt>합계금액</dt>
                                                    <dd>
                                                        <strong>
                                                            <span>15,000</span>
                                                            <span class="unit">원</span>
                                                        </strong>
                                                    </dd>
                                                </dl>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="info_command_UI">
                            <ul class="txtlist01">
                                <li>평소에 자주 드시는 메뉴를 등록하시면 보다 쉽고 빠르게 선택 하실 수 있어요.</li>
                            </ul>
                            <div class="c_btn m_mt02">
                                <a href="#" class="btn01 orange ico add bg_m_dark">
                                    <span>MY세트 추가</span>
                                </a>
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