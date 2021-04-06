<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <!-- jQuery -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="../resources/jquery/jquery-3.6.0.min.js"></script> 
     
    <!--css-->
    <link rel="stylesheet" href="../resources/css/include/main-gnb.css">
    <link rel="stylesheet" href="../resources/css/subpages/event/eventDetail.css">

    <!--font google web font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon"
        href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/icon/apple-icon.png" />
        
    <!-- js -->
    <script src="../resources/js/include/main-gnb.js"></script>

<title>이벤트</title>
</head>
<body>
	<!-- main-header -->
	<jsp:include page="../../include/header/main_desktop_header.jsp" />
	<jsp:include page="../../include/header/main_mobile_header.jsp" />
	
    <div class="contentsBox01 bg_w">
        <div class="web_container">
            <div class="subtitWrap">
                <!-- Title -->
                <h3 class="page_tit">이벤트</h3>
            <!-- 이벤트 제목, 이미지, 내용 -->
            <div class="ev_tit WEB">
                <h4>버거킹 딜러버리 17,000원 이상 구매 시 5,000원 할인</h4>
                <p>03/29(월) ~ 04/04(일)</p>
            </div>
            <div class="ev_con">
                <img class="img" src="image/event_Detail_1.PNG">
                <div class="ev_txt">
                    <h4 class="one">버거킹 딜러버리 17,000원 이상 구매 시 5,000원 할인</h4>
                    <p class="two">03/29(월) ~ 04/04(일)</p>
                    <p class="prewrap"><div class="ev_tit MOB">
<h4>버거킹 딜리버리 17,000원 이상 구매 시 5,000원 할인</h4><p>03/29(월) ~ 04/04(일)</p></div><p class="prewrap">1. 행사 명 : 버거킹 딜리버리 17,000원 이상 구매 시 5,000원 할인

2. 행사 기간 : 21년 3월 29일(월) ~ 4월 4일(일), 7일간

3. 행사 제품 : 딜리버리 전메뉴

4. 행사 시간 : 10 ~ 22시 (*매장별 딜리버리 운영 시간 내 적용으로 매장별 상이 합니다.)

5. 유의 사항 : 

*딜리버리 프로모션으로 매장 내 주문이 불가합니다.

*17,000원 이상 주문 시 할인 적용 됩니다.

*한 주문당 5,000원 할인 됩니다.

*해당 프로모션은 버거킹 APP, 홈페이지를 통해서만 진행 됩니다.

*프로모션 기간 중 딜리버리 세트/팩 메뉴 구매 시 스탬프가 적립됩니다.

*딜리버리 가능한 매장에서 진행됩니다. (매장별 딜리버리 운영 시간 상이)

*일부 매장은 행사에서 제외 될 수 있습니다.

6. 제외 매장 : 경남사천점,경북상주점,경북영주가흥점,경산사동점,광양중동점,광양LF스퀘어점,광주봉선점,광주일곡점,광주상무점,광주첨단2지구점,구미인의점,김천혁신도시점,김포현대아울렛,나주빛가람점,당진읍내점,대구율하점,대구죽전네거리DT,대명비발디점,대전관평점,대전시청점,대전현대아울렛점,부산안락DT점,삼성라이온즈파크점,숭례문점,여수웅천점,오산궐동점,오션월드점,의정부HP점,인천공항1점,인천공항교통센터1점,인천연수HP점,진주경상대점,해운대비치점
</p></div>


                <img class="qr" src="image/link1.PNG">
                <img class="ad" src="image/appDownload.PNG">
                </div>
            </div>
            <!-- 목록보기 -->
            <div class="c_btn">
                <div class="eventBox">
                    <li class="moreview">
                        <span><img src="image\list.PNG" onclick="location.href='../event_Main/event_page1.html'" ></span>
                    </li>
                </div>
            </div>
        </div>
    </div>
    
<!-- 맨 위로 가기 -->
<a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
	
	<!-- js -->
    <script src="../resources/js/subpages/event/event.js"></script>
    
	<!-- main-footer -->
   <jsp:include page="../../include/footer/main_desktop_footer.jsp"/>
   <jsp:include page="../../include/footer/main_mobile_footer.jsp"/>
</body>
</html>