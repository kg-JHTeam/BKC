<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/icon/apple-icon.png" />
    
    <!--slick & jQuery-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/slick/slick.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/slick/slick-theme.css">
    <script src="${pageContext.request.contextPath }/resources/jquery/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/slick/slick.js"></script>
    <script src="${pageContext.request.contextPath }/resources/slick/slide.js"></script>
    
    <!--css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/main-gnb.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/main.css">
    
    <!-- js -->
    <script src="${pageContext.request.contextPath }/resources/js/main/main-gnb.js"></script>
    
    <title>BKC</title>
</head>
	<!-- main-desktop-header -->
	<jsp:include page="../include/header/main_desktop_header.jsp"/>
	
    <!--desktop main page-->
    <div class="main-wrap">

        <!-- 이미지 슬라이드 -->
        <div class="imgslide-zone">
            <div class="slide">
                <ul class="slider autoplay">
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imageK/%EB%A9%94%EC%9D%B8+%EC%9D%B4%EB%B2%A4%ED%8A%B8_%EA%B8%B8%EA%B2%8C/img_main_banner_1.png">
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imageK/%EB%A9%94%EC%9D%B8+%EC%9D%B4%EB%B2%A4%ED%8A%B8_%EA%B8%B8%EA%B2%8C/img_main_banner_2.png">
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imageK/%EB%A9%94%EC%9D%B8+%EC%9D%B4%EB%B2%A4%ED%8A%B8_%EA%B8%B8%EA%B2%8C/img_main_banner_3.png">
                </ul>
            </div>
        </div>

        <!-- 유튜브 비디오 -->
        <div class="youtube-zone">
            <iframe id="youtube" src="https://www.youtube.com/embed/W4WsqeBC47E" title="YouTube video player"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen></iframe>
        </div>

        <!-- SNS zone -->
        <div class="sns-zone">
            <div class="sns">
                <div>
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imagesB/buggerking/1/sns/facebook_b.png"
                        alt="facebook">
                    <a href="https://instagram.com/bhc_chicken_official?igshid=16tcbhequ830e">
                        <span>FACEBOOK</span>
                    </a>
                </div>
                <div class="center">
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imagesB/buggerking/1/sns/youtube_b.png"
                        alt="youtube">
                    <a href="https://instagram.com/bhc_chicken_official?igshid=16tcbhequ830e">
                        <span>YOUTUBE</span>
                    </a>
                </div>
                <div>
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imagesB/buggerking/1/sns/instagram_b.png"
                        alt="instagram">
                    <a href="https://instagram.com/bhc_chicken_official?igshid=16tcbhequ830e">
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
                        <a href="#">
                            <span>매장 찾기</span>
                        </a>
                    </div>
                    <!--
                    <ul class="shop_categorylist">
                        <li class="categor_delivery">
                            <span>
                                "집에서 편안하게 "<br>
                                "받을 수 있는"
                            </span>
                            <em>딜리버리</em>
                        </li>
                        <li class="categor_king">
                            <span>
                                "집에서 편안하게 "<br>
                                "받을 수 있는"
                            </span>
                            <em>딜리버리</em>
                        </li>
                    </ul>
                    -->
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
                        <p><img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imagesB/buggerking/1/icon/call.png" />
                            1599-5577</p>
                    </div>
                </div>
            </div>
        </div>

        <!--footer menu-->
        <div class="footer-menu-zone">
            <div class="content-wrap">
                <div>
                    <a href=""><span>메뉴</span></a><br><br>
                    <a href="">치킨메뉴</a><br><br>
                    <a href="">사이드메뉴</a><br><br>
                    <a href="">비어존메뉴</a><br><br>
                </div>
                <div>
                    <a href=""><span>매장</span></a><br><br>
                    <a href="">매장찾기</a><br><br>
                </div>
                <div>
                    <a href=""><span>이벤트</span></a><br><br>
                    <a href="">이벤트</a><br><br>
                    <a href="">신규매장</a><br><br>
                </div>
                <div>
                    <a href=""><span>BRAND</span></a><br><br>
                    <a href="">BKC 스토리</a><br><br>
                    <a href="">CEO 인사말</a><br><br>
                    <a href="">연혁</a><br><br>
                    <a href="">WHY BKC</a><br><br>
                    <a href="">BKC NEWS</a><br><br>
                </div>
                <div class="last-div">
                    <a href=""><span>고객센터</span></a><br><br>
                    <a href="">공지사항</a><br><br>
                    <a href="">BKC앱이용안내</a><br><br>
                    <a href="">FAQ</a><br><br>
                    <a href="">문의</a><br><br>
                    <a href="">가맹점모집</a><br><br>
                    <a href="">인재채용</a><br><br>
                </div>
            </div>
        </div>
    </div>
    <!--end of main page-->
    
    <!-- main-desktop-footer -->
	<jsp:include page="../include/footer/main_desktop_footer.jsp"/>
	
	
	<!-- 모바일 -->
	<jsp:include page="../include/header/main_mobile_header.jsp"/>
    <!--mobile-main page-->
    <div class="m-main-wrap">
        
        <!-- 이미지 슬라이드 -->
        <div class="m-imgslide-zone">
            <div class="slide">
                <ul class="slider autoplay">
                <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/banner/potatoking_banner1.jpg">
                <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/banner/goldking_banner.jpg">
                <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/banner/wing_banner.jpg">
                </ul>
            </div>
        </div>
        <!-- 유튜브 비디오 -->
        <div class="m-youtube-zone">
            <div>
                <iframe id="youtube" src="https://www.youtube.com/embed/W4WsqeBC47E" title="YouTube video player"
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen></iframe>
            </div>
        </div>

        <!-- SNS zone -->
        <div class="m-sns-zone">
            <div class="sns">
                <div>
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imagesB/buggerking/1/sns/facebook_b.png"
                        alt="facebook">
                    <span>FACEBOOK</span>
                </div>
                <div class="center">
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imagesB/buggerking/1/sns/youtube_b.png"
                        alt="youtube">
                    <span>YOUTUBE</span>
                </div>
                <div>
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imagesB/buggerking/1/sns/instagram_b.png"
                        alt="instagram">
                    <span>INSTAGRAM</span>
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
                매장찾기
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
                        <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imagesB/buggerking/1/icon/call.png" />
                            1599-5577
                        </div>
                </div>
            </div>
        </div>
    </div>
    <!--end of m-main page-->

    <jsp:include page="../include/footer/main_mobile_footer.jsp"/>
</body>

</html>