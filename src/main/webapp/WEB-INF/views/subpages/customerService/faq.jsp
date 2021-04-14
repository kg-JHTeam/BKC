<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--css-->
<link rel="stylesheet" href="../resources/css/include/main-gnb.css">
<link rel="stylesheet"
	href="../resources/css/subpages/customerService/faq.css?v=<%=System.currentTimeMillis() %>" />
<link rel="stylesheet" type="text/css"
	href="slick-1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="slick-1.8.1/slick/slick-theme.css" />

<!--jQuery-->
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="slick-1.8.1/slick/slick.min.js"></script>

<!--js-->
<script src="../resources/js/include/main-gnb.js"></script>
<script src="../resources/js/subpages/customerService/cs.js"></script>

<!--font-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">

<!--logo-->
<link rel="shortcut icon" type="image/x-icon"
	href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/logo/mainlogo.png">
<title>Insert title here</title>
</head>
<body>
<div id="contents-wrap">
	<!-- main-header -->
	<jsp:include page="../../include/header/main_desktop_header.jsp" />
	<jsp:include page="../../include/header/main_mobile_header.jsp" />
                <div class="location-wrap">
                    <div class="web_container">
                        <div class="page_navi">
                            <a href="#/home">
                                <span>HOME</span>
                            </a>
                            <span>
                                고객센터
                            </span>
                            <span>FAQ</span>
                        </div>
                    </div>
                </div>
                <div class="contentsBox">
                    <div class="web_container">
                        <div class="subtitle-wrap">
                            <h3 class="page_title">고객센터</h3>
                            <div class="tabmenu">
                                <ul>
                                    <li>
                                        <button
                                            type="button"
                                            onclick="location.href='${pageContext.request.contextPath }/customerService/notice.do'">
                                            <span>공지사항</span></button>
                                    </li>
                                    <li>
                                        <button
                                            type="button"
                                            onclick="location.href='${pageContext.request.contextPath }/customerService/app.do'">
                                            <span>bkc앱 이용안내</span></button>
                                    </li>
                                    <li class="on">
                                        <button
                                            type="button"
                                            onclick="location.href='${pageContext.request.contextPath }/customerService/faq.do'">
                                            <span>FAQ</span></button>
                                    </li>
                                    <li>
                                        <button
                                            type="button"
                                            onclick="location.href='${pageContext.request.contextPath }/customerService/inquiry.do'">
                                            <span>문의</span></button>
                                    </li>
                                    <li>
                                        <button
                                            type="button"
                                            onclick="location.href='${pageContext.request.contextPath }/customerService/chain.do'">
                                            <span>가맹점모집</span></button>
                                    </li>
                                    <li>
                                        <button
                                            type="button"
                                            onclick="location.href='${pageContext.request.contextPath }/customerService/recruit.do'">
                                            <span>인재채용</span></button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="tab_content">
                            <div class="faq">
                                <div class="faq_category">
                                    <label class="btn_switch"><input type="radio" name="faqcategory" checked="checked">
                                        <span>전체</span>
                                    </label>
                                    <label class="btn_switch"><input type="radio" name="faqcategory">
                                        <span>제품/품질/서비스</span>
                                    </label>
                                    <label class="btn_switch"><input type="radio" name="faqcategory">
                                        <span>쿠폰 주문</span>
                                    </label>
                                    <label class="btn_switch"><input type="radio" name="faqcategory">
                                        <span>창업 FAQ</span>
                                    </label>
                                    <label class="btn_switch"><input type="radio" name="faqcategory">
                                        <span>버거킹카드</span>
                                    </label>
                                    <label class="btn_switch"><input type="radio" name="faqcategory">
                                        <span>기타</span>
                                    </label>
                                </div>
                                <div class="faq-wrap">
                                    <div class="on">
                                        <div class="faq1">
                                        <ul>
                                            <li class="faqlist">
                                                <div class="faq-title">
                                                    <p>쿠폰 주문</p>
                                                    <p>대량주문에 대한 제한이 있는지요?</p>
                                                    <button type="button" class="btn_faq"></button>
                                                </div>
                                                <div class="faqtxt">
                                                    <p>대량주문의 경우 매장 상황을 파악한 후 bkc 딜리버리 콜센터에서 확인전화를 드리며 확인 전화가 완료되어야 주문이 접수됩니다. 원재료 및
                                                        제품의 생산시간을 고려하여 가능 여부를 안내해드립니다.</p>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    </div>
                                    <div class="faq2">
                                        <ul>
                                            <li class="faqlist">
                                                <div class="faq-title">
                                                    <p>제품/품질/서비스</p>
                                                    <p>매장에서 판매하는 모든 메뉴를 배달하나요?</p>
                                                    <button type="button" class="btn_faq"></button>
                                                </div>
                                                <div class="faqtxt">
                                                    <p>배달이 어려운 일부 디저트 메뉴를 제외하고, 버거킹 매장에서 판매하고 있는 대부분의 제품을 배달해 드리고 있습니다. 메뉴 창에서 주문이 가능한 제품을 확인하실 수 있습니다.</p>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div></div>
                                    <div></div>
                                    <div></div>
                                    <div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>