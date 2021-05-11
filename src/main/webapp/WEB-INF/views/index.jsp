<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
       
    <!--font google web font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon"
        href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />
    
    <!--slick & jQuery-->
    <link rel="stylesheet" href="resources/slick/slick.css">
    <link rel="stylesheet" href="resources/slick/slick-theme.css">
    <script src="resources/jquery/jquery-3.6.0.min.js"></script>
    <script src="resources/slick/slick.js"></script>
    <script src="resources/slick/slide.js"></script>
    
    <!--css-->
    <link rel="stylesheet" href="resources/css/include/main-gnb.css">
    <link rel="stylesheet" href="resources/css/main/main.css">
    
    <!-- js -->
    <script src="resources/js/include/main-gnb.js"></script>
    
    <title>BKC</title>
</head>
   <!-- main-desktop-header -->
   
   <jsp:include page="include/header/main_desktop_header.jsp"/>
   
    <!--desktop main page-->
    <div class="main-wrap">

        <!-- 이미지 슬라이드 -->
        <div class="imgslide-zone">
            <div class="slide">
                <ul class="slider autoplay">
                	<c:forEach var="banner" items="${banners}">
                		<img src="${banner.path}"/>
                	</c:forEach>
                </ul>
            </div>
        </div>

        <!-- 유튜브 비디오 -->
        <div class="youtube-zone">
            <iframe id="youtube" src="${youtube.path}" title="YouTube video player"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen>
              </iframe>
        </div>

        <!-- SNS zone -->
        <div class="sns-zone">
            <div class="sns">
                <div><a href="https://www.facebook.com/bhcchicken" target="_blank">
                    
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/icon/appicon/facebook_b.png"
                        alt="facebook">
                        <span>FACEBOOK</span>
                    </a>
                </div>
                <div class="center">
                    <a href="https://www.youtube.com/user/gnsbhc" target="_blank">
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/icon/appicon/youtube_b.png"
                        alt="youtube">
                        <span>YOUTUBE</span>
                    </a>
                </div>
                <div>
                    <a href="https://instagram.com/bhc_chicken_official?igshid=16tcbhequ830e" target="_blank">
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/icon/appicon/instagram_b.png"
                        alt="instagram">
                        <span>INSTAGRAM</span>
                    </a>
                </div>
            </div>
        </div>

        <!-- 딜리버리 / App이용-->
        <div class="app-delivery-zone">
            <div class="center-wrap">
                <div class="app"></div>
                <div class="delivery"></div>
            </div>
        </div>

        <!-- 매장 찾기 -->
        <div class="store-zone">
            <div class="center-wrap">
                <div class="content-wrap">
                    <h1>매장찾기</h1>
                    <h4>고객님 주변에 있는 BKC를 찾아보세요!</h4>
                    <br>
                    <div class="c_btn_1">
                        <a href="${contextPath}/map/store.do">
                            <span>매장 찾기</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!--배달 -->
        <div class="delivery-zone">
            <div class="center-wrap">
                <div class="content-wrap">
                    <div class="content-01">
                        <h1>집에서 만나는 BKC</h1><br>
                        <p>딜리버리 전화주문 안내 10:00–22:00 <br>
                        연중무휴 (매장별로 상이할 수 있습니다.)</p>
                    </div>
                    <div class="content-02">
                        <p>                        <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/icon/myking/call.png" />
                            1599-5577</p>
                    </div>
                </div>
            </div>
        </div>
    <!--end of main page-->
    
	    <!-- main-desktop-footer -->
	    <jsp:include page="include/footer/main_desktop_footer.jsp"/>
	    
    </div>
    
    <!-- 모바일 -->
    <jsp:include page="include/header/main_mobile_header.jsp"/>
    <!--mobile-main page-->
    <div class="m-main-wrap">
    
        <!-- 이미지 슬라이드 / 추가되어야함.-->
        <div class="m-imgslide-zone">
            <div class="slide">
                <ul class="slider autoplay">
                	<c:forEach var="banner" items="${banners}">
                		<img src="${banner.path}"/>
                	</c:forEach>
                </ul>
            </div>
        </div>
        <!-- 유튜브 비디오 -->
        <div class="m-youtube-zone">
            <div>
                <iframe id="youtube" src="https://www.youtube.com/embed/W4WsqeBC47E"${yt.url}  title="YouTube video player"
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen></iframe>
            </div>
        </div>

        <!-- SNS zone -->
        <div class="m-sns-zone">
            <div class="sns">
                <div>
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/icon/appicon/facebook_b.png"
                        alt="facebook">
                    <a href="https://www.facebook.com/bhcchicken" target="_blank">
                        <span>FACEBOOK</span>
                    </a>
                </div>
                <div class="center">
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/icon/appicon/youtube_b.png"
                        alt="youtube">
                    <a href="https://www.youtube.com/user/gnsbhc" target="_blank">
                        <span>YOUTUBE</span>
                    </a>
                </div>
                <div>
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/icon/appicon/instagram_b.png"
                        alt="instagram">
                    <a href="https://instagram.com/bhc_chicken_official?igshid=16tcbhequ830e" target="_blank">
                        <span>INSTAGRAM</span>
                    </a>
                </div>
            </div>
        </div>

        <!-- 딜리버리 / App이용-->
        <div class="m-app-delivery-zone">
            <div class="center-wrap">
                <div class="app"></div>
                <div class="delivery"></div>
            </div>
        </div>

        <!-- 매장 찾기 -->
        <div class="m-store-zone">
            <div class="center-wrap">
             <div class="content-wrap">
                    <h1>매장찾기</h1>
                    <h4>고객님 주변에 있는 BKC를 찾아보세요!</h4>
                    <br>
                    <div class="c_btn_1">
                        <a href="${contextPath}/map/store.do">
                            <span>매장 찾기</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!--배달 -->
        <div class="m-delivery-zone">
            <div class="center-wrap">
                <div class="content-wrap">
                    <h1>집에서 만나는 BKC</h1><br>
                        <p>딜리버리 전화주문 안내 10:00–22:00 <br>
                            연중무휴 (매장별로 상이할 수 있습니다.)</p>
                        <div>
                        <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/icon/myking/call.png" />
                            1599-5577
                        </div>
                </div>
            </div>
        </div>
    </div>
    <!--end of m-main page-->
    <jsp:include page="include/footer/main_mobile_footer.jsp"/>
</body>
</html>