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
    <link  rel="stylesheet" href="../resources/css/subpages/brand/whybkcview.css?v=<%=System.currentTimeMillis() %>" />
    
    <title>BrandStory</title>
</head>
<body>

   <!-- main-header -->
   <jsp:include page="../../include/header/main_desktop_header.jsp"/>
   <jsp:include page="../../include/header/main_mobile_header.jsp"/>
    <div class="contentsWrap">
    	<div class="locationWrap WEB">
          <div class="why_web_container">
             <div class="page_navi">
             	<a href="#/home">
             		<span>HOME</span>
             	</a>
             	<span>
             	브랜드스토리
             	</span>
             	<span>
             	WHY BKC
             	</span>
             </div>
          </div>
        </div>
        <div class="contentsBox01 bg_w">
            <div class="why_web_container">
                <div class="subtitWrap">
                    <h3 class="page_tit">브랜드 스토리</h3>
                    <div class="tab01 bdBot">
                        <ul>
                            <li>
                                <button type="button" onclick="location.href='${pageContext.request.contextPath }/brand/brandStory.do'">
                                    <span>BKC 스토리</span>
                                </button>
                            </li>
                            <li class="on">
                                <button type="button" onclick="location.href='${pageContext.request.contextPath }/brand/whybkc.do'">
                                    <span>WHY BKC</span>
                                </button>
                            </li>
                            <li>
                                <button type="button" onclick="location.href='${pageContext.request.contextPath }/brand/newsNewItem.do'">
                                    <span>BKC NEWS</span>
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="why_web_container">
                <div class="tab_cont">
                    <ul class="tab03 item5">
                        <li class="on">
                            <button type="button" id="realchicken">
                                <span>리얼 치킨</span>
                            </button>
                        </li>
                        <li>
                            <button type="button" id="freshmaterial">
                                <span>신선한 재료</span>
                            </button>
                        </li>
                        <li>
                            <button type="button" id="nature">
                                <span>환경/사회공헌</span>
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="tab_cont bg_w real" id="chickentab">
            <div class="why_web_container">
                <h4 class="MOB m_subtit">Real Whopper</h4>
                <div class="realwhopper_title">
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imageK/WhyBKC/real+chicken/reachicken_title.png">
                </div>
                <div class="realwhopper_text">
                    <p>
                        맛을 살리는 연구개발 시스템
                        맛의 모든 것을 연구한다
                        콜팝치킨과 요레요레, 뿌링클 등 소비자들의 열광하는 BKC 인기 메뉴를 탄생시킨 연구소입니다.
                        소비자의 기호와 시장 트렌드를 조사, 연구하여 소비자들의 입맛과 건강을 동시에 충족시키는 메뉴를 개발하고 품질을 개선시키고 있습니다.
                        매장운영의 비법 전수
                        BKC 창업, 경영, 메뉴조리, 서비스, 홍보 등 매장 운영의 하나부터 열까지를 교육하고 있습니다.
                        BKC 가맹점주는 매장 오픈 전 4박5일의 엄격한 합숙 교육을 이수해야 합니다.
                    </p>
                </div>
            </div>
        </div>
        <div class="tab_cont bg_w" id="freshtab" style="display: none;">
            <div class="material_intro01">
                <div class="why_web_container">
                    <h4 class="MOB m_subtit">신선한 재료 소개</h4>
                    <dl class="beef">
                        <dt>
                            <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imageK/WhyBKC/%EC%8B%A0%EC%84%A0%ED%95%9C+%EC%9E%AC%EB%A3%8C/high_oleic%20sunflower_oil.png" alt="100% OLIVE">
                        </dt>
                        <dd>깨끗한 치킨 BHC는 나쁜 콜레스테롤 수치를 저하시키고 혈액순환을 돕는 불포화지방산과 비타민E가 풍부한 고올레산 해바라기유를 튀김유로 사용하여 소비자들의 건강보호에 앞장서고 있습니다.</dd>
                    </dl>
                    <dl class="vegetable">
                        <dt class="WEB">
                            <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imageK/WhyBKC/%EC%8B%A0%EC%84%A0%ED%95%9C+%EC%9E%AC%EB%A3%8C/fresh_chicken.png" alt="FRESH CHICKEN">
                        </dt>
                        <dt class="MOB">
                            <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imageK/WhyBKC/%EC%8B%A0%EC%84%A0%ED%95%9C+%EC%9E%AC%EB%A3%8C/fresh_chicken.png" alt="FRESH CHICKEN">
                        </dt>
                        <dd>
                            BKC는 닭고기 중에서도 최상급인 Golden Zone 국내산 닭고기 (10호/무게 950g~1050g) 만을 사용합니다.
                            10호 닭은 육즙이 풍부하고, 부드러우면서도 쫄깃함 질감이 살아 있어 최상의 닭고기 맛을 느낄 수 있습니다.
                        </dd>
                    </dl>
                    <dl class="pickle">
                        <dt>
                            <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imageK/WhyBKC/%EC%8B%A0%EC%84%A0%ED%95%9C+%EC%9E%AC%EB%A3%8C/research_development.png">
                        </dt>
                        <dd>
                            맛의 모든 것을 연구한다
                            콜팝치킨과 요레요레, 뿌링클 등 소비자들의 열광하는 BKC 인기 메뉴를 탄생시킨 연구소입니다.
                            소비자의 기호와 시장 트렌드를 조사, 연구하여 소비자들의 입맛과 건강을 동시에 충족시키는 메뉴를 개발하고 품질을 개선시키고 있습니다.
                            매장운영의 비법 전수
                            BKC 창업, 경영, 메뉴조리, 서비스, 홍보 등 매장 운영의 하나부터 열까지를 교육하고 있습니다.
                            BKC 가맹점주는 매장 오픈 전 4박5일의 엄격한 합숙 교육을 이수해야 합니다.
                        </dd>
                    </dl>
                </div>
            </div>
            <div class="material_intro02">
                <div class="why_web_container">
                    <h4 class="tit">
                        <span>고객만족</span>
                        <span>을위한</span>
                        <span>BKC의</span>
                        <span>QCS관리</span>
                    </h4>
                    <dl class="quality">
                        <dt>
                            "QUALITY"
                        </dt>
                        <dd>
                            "Quality(품질), Cleanness(청결도), Service(서비스)를 총칭하는 말입니다. BKC는 고객에게 최상의 맛과 위생, 서비스를 제공하기 위해 꾸준한 QCS 교육과 점검, 관리를 실시하고 있습니다."
                        </dd>
                    </dl>
                    <dl class="service">
                        <dt>
                            "SERVICE"
                        </dt>
                        <dd>
                            "고객 만족을 위한 BHC만의 QCS 매뉴얼 구축 및 가맹점 교육 본사의 슈퍼바이저(S/V)가 정기적으로 가맹점 방문 후 QCS 점검·교육 QCS 미준수 시 가맹점주 원칙교육 재입소 등 사후 관리 및 경영 관리"
                        </dd>
                    </dl>
                    <dl class="clean">
                        <dt>
                            "CLEANILINESS"
                        </dt>
                        <dd>
                            "아무리 맛 좋은 음식이라도 비위생적이라면 고객에게 독과 같다는 것이 버거킹의 신념 중 하나입니다. 버거킹의 매니저들은 미국 NRA(National Restaurant Association)에서 실시하는 AFS(Applied Foodservice Sanitation) 과정을 수료하고 테스트에 합격하여 매장 내의 위생에 관한 개념이 철저합니다. 그리고 모든 직원들은 개인 위생은 물론, 제품 온도와 기계/소도구를 규정된 절차에 따라 관리함으로써 최상의 청결 및 위생상태를 유지하여 고객이 안심하고 드실 수 있도록 노력하고 있습니다."
                        </dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="tab_cont bg_w" id="naturetab" style="display: none;">
            <div class="why_web_container contribution">
                <h4 class="MOB m_subtit">화경/사회공헌 활동</h4>
                <div class="contribution_swipe">
                    <div class="slick-initialized slick-slider">
                        <div class="slick-list draggable">
                            <div class="slick-track" style="opacity: 1; width: 100%; transform: translate3d(0px, 0px, 0px);">
                                <div class="slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="flase">
                                    <div>
                                        <div class="cont" style="width: 100%; display: inline-block;">
                                            <div class="image">
                                                <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imageK/WhyBKC/%ED%99%98%EA%B2%BD%EC%82%AC%ED%9A%8C%EA%B3%B5%ED%97%8C/img_contribution.png">
                                            </div>
                                            <div class="text">
                                                <p>나눔과 상생의 정신 BSR</p>
                                                <p>bhc해바라기봉사단</p>
                                                <p>BKC 히어로</p>
                                                <p>그 외 사회공헌활동</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- js -->
    <script src="../resources/js/subpages/brand/menuitem.js"></script>
    
    <a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
    
   <!-- main-footer -->
   <jsp:include page="../../include/footer/main_desktop_footer.jsp"/>
   <jsp:include page="../../include/footer/main_mobile_footer.jsp"/>
</body>
</html>