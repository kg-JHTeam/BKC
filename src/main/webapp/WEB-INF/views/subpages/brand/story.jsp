<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta charset="UTF-8">
  
 	<!--font google web font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon"
        href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/icon/apple-icon.png" />
        
    <!-- jQuery -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="../resources/jquery/jquery-3.6.0.min.js"></script> 
     
    <!-- js -->
    <script src="../resources/js/subpages/brand/menuitem.js"></script>
    <script src="../resources/js/include/main-gnb.js"></script>
    
    <!--css-->
    <link rel="stylesheet" href="../resources/css/include/main-gnb.css">
    <link rel="stylesheet" href="../resources/css/subpages/brand/storyview.css"/>
    
    <title>BrandStory</title>
</head>
<body>
	<!-- main-header -->
	<jsp:include page="../../include/header/main_desktop_header.jsp"/>
	<jsp:include page="../../include/header/main_mobile_header.jsp"/>

    <div class="contentsBox01 bg_w">
        <div class="web_container">
            <div class="subtitWrap">
                <h3 class="page_tit">브랜드 스토리</h3>
                <div class="tab01 bdBot">
                    <ul>
                        <li class='on'>
                            <button type="button" onclick="location.href='./story.html'">
                                <span>버거킹 스토리</span>
                            </button>
                        </li>
                        <li>
                            <button type="button" onclick="location.href='./whybkc.html'">
                                <span>WHY 버거킹</span>
                            </button>
                        </li>
                        <li>
                            <button type="button" onclick="location.href='./newsNewItem.html'">
                                <span>버거킹 NEWS</span>
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="tab_storyWrap">
            <ul class="web_container tab_storyBtn m_shadow">
                <li class="on">
                    <button type="button" id="about">ABOUT BKC</button>
                </li>
                <li>
                    <button type="button" id="history">HISTORY</button>
                </li>
            </ul>
            <div class="tab_aboutCon web_container" id="abo">
                <div class="about01">
                    <h3>CEO 인사</h3>
                    <p>
                        고객 여러분, 안녕하십니까.
                        항상 bkc에 많은 관심과 응원을 보내주시는 고객 여러분께 깊은 감사의 말씀을 드립니다.
                        저희 bkc는 투명경영, 상생경영을 바탕으로 고객에게 신뢰받는 브랜드로 성장하기 위해 끊임없이 노력하여 빛나는 성장을 기록하고 있습니다.
                        bkc는 더 맛있고! 더 깨끗한! 더 친절한! 브랜드로 모든 고객의 감성을 만족시켜 사랑받는 브랜드가 되기 위해 전국 bkc가맹점과 본사 임직원 모두가 최선을 다할 것입니다.
                        bkc만의 독보적인 신메뉴 개발에 집중하여 고객에게 폭발적인 인기를 얻는 치킨 업계의 새로운 패러다임을 주도하는 브랜드가 되겠습니다.
                        안전한 먹거리 제공으로 고객에게 신뢰받는 브랜드로 끊임없이 성장하여 업계 주도하는 브랜드로 우뚝 서겠습니다.
                        고객 응대와 서비스로 감성을 만족시켜 사랑받는 기업으로 기억될 수 있도록 노력하겠습니다.
                        또한, bkc는 사회공헌활동인 BSR(bkc+CSR)을 통해 다양하고 지속적인 나눔과 봉사활동을 진행하고 있으며, 앞으로도 기업의 사회적 책임을 다하는 bkc가 될 수 있도록 더욱 노력할 것입니다.
                        앞으로도 저희 bkc는 고객에게 신뢰받는 브랜드로 성장하기 위해 다양한 노력을 아끼지 않을 것입니다. 전국 bkc가맹점과의 상생을 기반으로 끊임없이 발전하는 bkc가 되도록 하겠습니다.
                        고객님들의 변함없는 사랑과 관심 부탁드립니다.
                        감사합니다.  -BKC 치킨 CEO 민경민
                    </p>
                </div>
                <div class="about02">
                    <h3>BKC KOREA</h3>
                    <p>
                        새로운 배달중심  레귤러 매장의 bi는 노란색을 메인 컬러로 사용하여 '희망과 행복, 즐거움'을 내포하고있습니다.
                        밝게 빛나는 태양의 색이기도 한 노란색은 고객 한분 한분께 밝고 행복한 기운을 전하고 싶은 bkc의 마음과 같습니다.
                        'Better & Happier Choice'라는 슬로건 아래 한상 건강하고 밝은 브랜드 이미지를 전달 하고자 노력하였습니다.
                    </p>
                </div>
            </div>
            <div class="tab_historyWrap" id="his" style="display: none;">
                <div class="tab_historyCon hisBg01">
                    <div class="history_bgBox">
                        <div class="history_area">
                            <h4>2020</h4>
                            <ul>
                                <li>골드킹 TV CF 온에어</li>
                                <li>신제품 ‘ 뿌링맵소킹’, ‘양념맵소킹‘ 출시</li>
                                <li>맵소킹 바이럴 광고 온에어</li>
                            </ul>
                        </div>
                        <div class="history_area">
                            <h4>2019</h4>
                            <ul>
                                <li>뿌링치즈볼, 뿌링소떡(빨간소떡), 뿌링감자, 소떡강정 출시</li>
                                <li>신제품 '마라칸' 출시</li>
                                <li>신제품 '블랙올리브' 출시</li>
                                <li>3블랙올리브 TV CF 온에어</li>
                                <li>신규 사이드메뉴 꿀호떡 출시</li>
                                <li>신제품 '골드킹' 출시</li>
                            </ul>
                        </div>
                        <div class="history_area">
                            <h4>2018</h4>
                            <ul>
                                <li>신제품 ‘소이바베큐’ 출시</li>
                                <li>신제품 '치하오' 출시</li>
                            </ul>
                        </div>
                        <div class="history_area">
                            <h4>2017</h4>
                            <ul>
                                <li>신제품 ‘치레카’ 출시</li>
                                <li>최고 인기모델 전지현 BHC 전속모델 재계약체결</li>
                                <li>신제품 '치바고' 출시</li>
                                <li>신제품 '붐바스틱'. '스윗텐더' 출시</li>
                                <li>신제품 ‘스윗츄’ 출시</li>
                                <li>신제품 ‘갈비레오’ 출시</li>
                            </ul>
                        </div>
                        <div class="history_area">
                            <h4>2016</h4>
                            <ul>
                                <li>최고 인기모델 전지현 BHC 전속모델 재계약체결</li>
                                <li>2016 대한민국 100대 프랜차이즈 브랜드 선정 (주관 : 매일경제)</li>
                            </ul>
                        </div>
                        <div class="history_area">
                            <h4>2015</h4>
                            <ul>
                                <li>최고매출 신기록 달성</li>
                                <li>최고 인기모델 전지현 BHC 전속모델 재계약체결</li>
                            </ul>
                        </div>
                        <div class="history_area">
                            <h4>2014</h4>
                            <ul>
                                <li>대한민국 치킨 전문점 부문 브랜드가치 8년 연속 1위 선정 (주관 : 브랜드스톡 )</li>
                                <li>최고 인기모델 전지현 BHC 전속모델 계약체결</li>
                                <li>최고매출 신기록 달성</li>
                            </ul>
                        </div>
                        <div class="history_area">
                            <h4>2013</h4>
                            <ul>
                                <li>매일경제 신문 100대 프랜차이즈 브랜드 2년 연속 선정</li>
                                <li>대한민국 치킨 전문점 부문 브랜드가치 7년 연속 1위 선정(주관: 브랜드스톡)</li>
                            </ul>
                        </div>
                        <div class="history_area">
                            <h4>2012</h4>
                            <ul>
                                <li>대한민국 치킨 전문점 부문 브랜드가치 6년 연속 1위 선정(주관: 브랜드스톡)</li>
                                <li>소상공진흥원 주관 “프랜차이즈 수준평가 최상의 등급 I등급”선정</li>
                                <li>소비자가 뽑은 치킨부문 ‘참좋은 브랜드 대상’ 선정</li>
                                <li>매일경제 신문 100대 프랜차이즈 브랜드 선정</li>
                                <li>머니투데이 올해의 히트 상품 선정</li>
                                <li>헤럴드 경제 고객만족 베스트 브랜드 대상</li>
                            </ul>
                        </div>
                        <div class="history_area">
                            <h4>2011</h4>
                            <ul>
                                <li>대한민국 치킨 전문점 부문 브랜드가치 5년 연속 1위 선정(주관: 브랜드스톡)</li>
                                <li>매일경제 신문 100대 프랜차이즈 브랜드 선정</li>
                                <li>최고매출 신 기록 갱신</li>
                            </ul>
                        </div>
                        <div class="history_area">
                            <h4>2010</h4>
                            <ul>
                                <li>2010 대한민국 치킨 전문점 부문 브랜드가치 4년 연속 1위 선정(주관: 브랜드스톡)</li>
                                <li>창사 이래 최대 매출 달성</li>
                            </ul>
                        </div>
                        <div class="history_area">
                            <h4>2009</h4>
                            <ul>
                                <li>대한민국 100대 브랜드 진입(1분기, 99위)</li>
                                <li>2009 대한민국 치킨 전문점 부문 브랜드가치 3년 연속 1위 선정(주관: 브랜드스톡)</li>
                                <li>BHC 백혈병 어린이 성금 모금행사 이벤트 실시</li>
                            </ul>
                        </div>
                        <div class="history_area">
                            <h4>2007</h4>
                            <ul>
                                <li>2007 대한민국 치킨 전문점 부문 브랜드가치 1위 선정(주관: 브랜드스톡)</li>
                                <li>한국 서비스품질 우수 기업 인증(외식서비스부문, 산업지원부장관)</li>
                                <li>2007 올해의 하이스트 브랜드 대상(주관: 브랜드스톡)</li>
                            </ul>
                        </div>
                        <div class="history_area">
                            <h4>2006</h4>
                            <ul>
                                <li>제 33회 상공의 날 산업지원부 장관 표창</li>
                                <li>제4회 대한민국 서비스 만족대상(한국일보)</li>
                                <li>제6회 여성사랑 베스트기업 대상(우먼타임스)</li>
                                <li>2006 올해의 하이스트 브랜드 대상(주관: 브랜드스톡)</li>
                                <li>2006 아시아 광고대상(아시아 경제 신문)</li>
                            </ul>
                        </div>
                        <div class="history_area">
                            <h4>2005</h4>
                            <ul>
                                <li>2005년 상반기 소비자 인기 대상(스포츠 투데이)</li>
                            </ul>
                        </div>
                        <div class="history_area">
                            <h4>2004</h4>
                            <ul>
                                <li>㈜ GNS BHC 설립(제너시스 그룹의 계열사)</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>

	<!-- main-footer -->
	<jsp:include page="../../include/footer/main_desktop_footer.jsp"/>
	<jsp:include page="../../include/footer/main_mobile_footer.jsp"/>
</body>
</html>