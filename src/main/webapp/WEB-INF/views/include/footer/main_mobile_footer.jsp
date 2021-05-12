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
                        <a href="${contextPath}/terms.do">이용약관</a>
                    </div>
                    <div class="c_btn_1_line">|</div>
                    <div class="c_btn_1_item" id="c_btn_1_center">
                      <a href="${contextPath}/termsPrivacy.do">개인정보취급방침</a>
                    </div>
                    <div class="c_btn_1_line">|</div>
                    <div class="c_btn_1_item">
                         <a href="${contextPath}/termsEmail.do">이메일약관</a>
                    </div>
                </div>
                <div class="c_btn_2">
                    <div>
                        <a href="${contextPath}/customerService/recruit.do">인재채용</a>
                    </div>
                    <div>
                        <a href="${contextPath}/customerService/chain.do">가맹점모집</a>
                    </div>
                </div>
            </div>
            <div class="copyright">
                <h2 class="logo">
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/bkclogo_bw.png"
                        alt="BKC Logo">
                </h2>
                <p>${bi.address} | 전화주문 ${bi.tel}</p>
                <p>사업자 등록번호 ${bi.business_num} | (주)BKC 대표이사  ${bi.ceo_name}</p>
                <p>Copyright ${bi.copyright}</p>
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