<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
             	<a href="#/home" class="arrow" > <span>HOME</span>&nbsp;>&nbsp;
					</a><a class="arrow"> <span>브랜드스토리 </span>&nbsp;>&nbsp;</a>
					<a class="arrow"><span> WHY NEWS </span></a>		
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
                <c:forEach var="RealchickenList" items="${RealchickenList }">
                <div class="realwhopper_title">
                    <img class="realChicken" src="${RealchickenList.path}">
                </div>
                <div class="realwhopper_text">
                    <p>
                    	${RealchickenList.content}
                    </p>
                </div>
                </c:forEach>
            </div>
        </div>
        <div class="tab_cont bg_w" id="freshtab" style="display: none;">
            <div class="material_intro01">
                <div class="why_web_container">
                    <h4 class="MOB m_subtit">신선한 재료 소개</h4>
                    <c:forEach var="MaterialList" items="${MaterialList }">
                    <dl class="beef">
                    	<img class="path_" src="${MaterialList.path_ }">
                        <dt>
                            <img src="${MaterialList.path }">
                        </dt>
                        <dd>${MaterialList.content }</dd>
                    </dl>
                    </c:forEach>
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
                                        	<c:forEach var="ContributionList" items="${ContributionList }">
                                            <div class="image">
                                                <img src="${ContributionList.path }">
                                            </div>
                                            <div class="text">
                                                <pre>
${ContributionList.content}</pre>
                                            </div>
                                            </c:forEach>
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