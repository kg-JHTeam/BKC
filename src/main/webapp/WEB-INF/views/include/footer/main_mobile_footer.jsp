<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main_mobile_footer</title>
</head>
<body>
   <!--m-footer-->
    <div class="m-footer-wrap">
        <!--m-web_container -->
        <div class="m-web_container">
            <div class="footer_menu">
                <div class="c_btn_1">
                    <div class="c_btn_1_item">
                        <a href="#">이용약관</a>
                    </div>
                    <div class="c_btn_1_line">|</div>
                    <div class="c_btn_1_item" id="c_btn_1_center">
                        <a href="#">개인정보취급방침</a>
                    </div>
                    <div class="c_btn_1_line">|</div>
                    <div class="c_btn_1_item">
                        <a href="#">법적고지</a>
                    </div>
                </div>
                <div class="c_btn_2">
                    <div>
                        <a href="#">인재채용</a>
                    </div>
                    <div>
                        <a href="#">가맹점모집</a>
                    </div>
                </div>
            </div>
            <div class="copyright">
                <h2 class="logo">
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/bkclogo_bw.png"
                        alt="BKC Logo">
                </h2>
                <p>서울 종로구 삼봉로 71 G 타워 2층 주식회사 비케이알 | 전화주문 1599-0505</p>
                <p>사업자 등록번호 101-86-76277 | (주)BKR 대표이사 문영주</p>
                <p>Copyright 2019 BKR Co., Ltd. All right Reserved</p>
                <div class="sns">
                    <a href="https://www.facebook.com/bhcchicken" target="_blank" class="facebook">
                        <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imagesB/buggerking/1/sns/facebook_s.png"
                            alt="facebook">
                    </a>
                    <a href="https://www.instagram.com/bhc_chicken_official/?igshid=16tcbhequ830e" target="_blank" class="insta">
                        <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/imagesB/buggerking/1/sns/instagram_s.png"
                            alt="instagram">
                    </a>
                </div>
            </div>
        </div>
        <!--end of m-web_container-->
    </div>
    <!-- end of m-footer-->
</body>
</html>