<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main_desktop_footer</title>
</head>
<body>
    <!--footer-->
     <!--footer menu-->
     <div class="footer-menu-zone">
            <div class="content-wrap">
                <div>
                    <a href="#"><span>메뉴</span></a><br><br>
                   <a href="${contextPath}/menuInform/newMenu.do">new메뉴</a><br><br>
                   <a href="${contextPath}/menuInform/chickenMenu.do">치킨메뉴</a><br><br>
                    <a href="${contextPath}/menuInform/sideMenu.do">사이드메뉴</a><br><br>
                   <a href="${contextPath}/menuInform/beerZone.do">비어존메뉴</a><br><br>
                </div>
                <div>
                    <a href="#"><span>매장</span></a><br><br>
                    <a href="${contextPath}/map/store.do">매장찾기</a><br><br>
                </div>
                <div>
                    <a href="#"><span>이벤트</span></a><br><br>
                    <a href="${contextPath}/event/eventPageAll.do">이벤트</a><br><br>
                    <a href="${contextPath}/event/eventPageNew.do">신규매장</a><br><br>
                </div>
                <div>
                    <a href="#"><span>BRAND</span></a><br><br>
                    <a href="${contextPath}/brand/brandStory.do">BKC 스토리</a><br><br>
                    <a href="${contextPath}/brand/whybkc.do">WHY BKC</a><br><br>
                    <a href="${contextPath}/brand/newsNewItem.do">BKC NEWS</a><br><br>
                </div>
                <div class="last-div">
                    <a href=""><span>고객센터</span></a><br><br>
                    <a href="${contextPath}/customerService/notice.do">공지사항</a><br><br>
                    <a href="${contextPath}/customerService/appguide.do">BKC앱이용안내</a><br><br>
                    <a href="${contextPath}/customerService/faq.do">FAQ</a><br><br>
                    <a href="${contextPath}/customerService/inquiry.do">문의</a><br><br>
                    <a href="${contextPath}/customerService/chain.do">가맹점모집</a><br><br>
                    <a href="${contextPath}/customerService/recruit.do">인재채용</a><br><br>
                </div>
            </div>
     </div>
    <div class="footer">
        <!--web_container -->
        <div class="web_container">
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
                        <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/icon/appicon/facebook_s.png"
                            alt="facebook">
                    </a>
                    <a href="https://www.instagram.com/bhc_chicken_official/?igshid=16tcbhequ830e" target="_blank" class="insta">
                        <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/icon/appicon/instagram_s.png"
                            alt="instagram">
                    </a>
                </div>
            </div>
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
        </div>
        <!--end of web_container-->
    </div>
    <!-- end of footer-->
</body>
</html>