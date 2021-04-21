<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delivery_desktop_footer</title>
</head>
<body>
<!--footer-->

    <div class="footer ">
        <!--web_container -->
        <div class="web_container ">
            <div class="copyright ">
                <h2 class="logo ">
                    <img src="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/bkclogo_bw.png" alt="BKC Logo ">
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
            <div class="footer_menu ">
                <div class="c_btn_1 ">
                    <div class="c_btn_1_item ">
                        <a href="# ">이용약관</a>
                    </div>
                    <div class="c_btn_1_line ">|</div>
                    <div class="c_btn_1_item " id="c_btn_1_center ">
                        <a href="# ">개인정보취급방침</a>
                    </div>
                    <div class="c_btn_1_line ">|</div>
                    <div class="c_btn_1_item ">
                        <a href="# ">법적고지</a>
                    </div>
                </div>
                <div class="c_btn_2 ">
                    <div>
                        <a href="# ">인재채용</a>
                    </div>
                    <div>
                        <a href="# ">가맹점모집</a>
                    </div>
                </div>
            </div>
        </div>
        <!--end of web_container-->
    </div>
    <!-- end of footer-->
</body>
</html>