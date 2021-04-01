<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    
    <!-- jquery -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/jquery/jquery-3.6.0.min.js"></script> 
    
    <!--css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/main-gnb.css">
    <link  rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/brand/newsNewItemview.css"/>
  
 	<!--font google web font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    
    <link rel="shortcut icon" type="image/x-icon"
        href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/icon/apple-icon.png" />
    
    <!-- js -->
    <script src="${pageContext.request.contextPath }/resources/js/brand/menuitem.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/main/main-gnb.js"></script>
    
    <title>BrandStory</title>
</head>
<body>
	<!-- main-header -->
	<jsp:include page="../include/header/main_desktop_header.jsp"/>
	<jsp:include page="../include/header/main_mobile_header.jsp"/>
	
    <section>
        <div class="contentsBox01 bg_w">
            <div class="web_container">
                <div class="subtitWrap">
                    <h3 class="page_tit">브랜드 스토리</h3>
                    <div class="tab01 bdBot">
                        <ul>
                            <li>
                                <button type="button" onclick="location.href='./story.html'">
                                    <span>버거킹 스토리</span>
                                </button>
                            </li>
                            <li>
                                <button type="button" onclick="location.href='./whybkc.html'">
                                    <span>WHY 버거킹</span>
                                </button>
                            </li>
                            <li class="on">
                                <button type="button" onclick="location.href='./newsNewItem.html'">
                                    <span>버거킹 NEWS</span>
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="web_container">
                <div class="tab_cont">
                    <ul class="tab_storyBtn m_shadow">
                        <li class="on">
                            <button type="button" id="realchicken">
                                <span>신제품</span>
                            </button>
                        </li>
                        <li>
                            <button type="button" id="nature">
                                <span>광고(TV/Digital)</span>
                            </button>
                        </li>
                    </ul>
                    <div class="tab_cont">
                        <div class="new_product">
                            <h4 class="MOB m_subtit">신제품 소개</h4>
                            <ul class="prdmenu_list">
                                <li>
                                    <div class="prd_img WEB">
                                        <span>
                                            <img src ="burger.png">
                                        </span>
                                    </div>
                                    <div class="prd_img MOB">
                                        <span>
                                            <img src ="burger.png">
                                        </span>
                                    </div>
                                    <div class="cont">
                                        <p class="tit">
                                            <strong>플랜트 바비큐 와퍼</strong>
                                        </p>
                                        <p class="txt_intro">불맛 가득한 식물성 패티와 진한 바비큐 소스의 조화</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="prd_img WEB">
                                        <span>
                                            <img src ="burger.png">
                                        </span>
                                    </div>
                                    <div class="prd_img MOB">
                                        <span>
                                            <img src ="burger.png">
                                        </span>
                                    </div>
                                    <div class="cont">
                                        <p class="tit">
                                            <strong>플랜트 바비큐 와퍼</strong>
                                        </p>
                                        <p class="txt_intro">불맛 가득한 식물성 패티와 진한 바비큐 소스의 조화</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="prd_img WEB">
                                        <span>
                                            <img src ="burger.png">
                                        </span>
                                    </div>
                                    <div class="prd_img MOB">
                                        <span>
                                            <img src ="burger.png">
                                        </span>
                                    </div>
                                    <div class="cont">
                                        <p class="tit">
                                            <strong>플랜트 바비큐 와퍼</strong>
                                        </p>
                                        <p class="txt_intro">불맛 가득한 식물성 패티와 진한 바비큐 소스의 조화</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="prd_img WEB">
                                        <span>
                                            <img src ="burger.png">
                                        </span>
                                    </div>
                                    <div class="prd_img MOB">
                                        <span>
                                            <img src ="burger.png">
                                        </span>
                                    </div>
                                    <div class="cont">
                                        <p class="tit">
                                            <strong>플랜트 바비큐 와퍼</strong>
                                        </p>
                                        <p class="txt_intro">불맛 가득한 식물성 패티와 진한 바비큐 소스의 조화</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="prd_img WEB">
                                        <span>
                                            <img src ="burger.png">
                                        </span>
                                    </div>
                                    <div class="prd_img MOB">
                                        <span>
                                            <img src ="burger.png">
                                        </span>
                                    </div>
                                    <div class="cont">
                                        <p class="tit">
                                            <strong>플랜트 바비큐 와퍼</strong>
                                        </p>
                                        <p class="txt_intro">불맛 가득한 식물성 패티와 진한 바비큐 소스의 조화</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
    
    <!-- main-desktop-footer -->
	<jsp:include page="../include/footer/main_desktop_footer.jsp"/>
	<jsp:include page="../include/footer/main_mobile_footer.jsp"/>
</body>
</html>